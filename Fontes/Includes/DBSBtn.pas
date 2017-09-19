unit DBSBtn;

{$DEFINE DBSpeedButton}

{ TDBSpeedButton: a data-aware TSpeedButton
  Delphi 1 - 3
  Version 1.4 Jun-04-1997
  (C) 1997 Christoph R. Kirchner

Disclaimer:

  Users of this component must accept this disclaimer of warranty:
    "This unit is supplied as is. The author disclaims all warranties,
    expressed or implied, including, without limitation, the warranties
    of merchantability and of fitness for any purpose.
    The author assumes no liability for damages, direct or
    consequential, which may result from the use of this component."

  This component is donated to the public as public domain.

  This component can be freely used and distributed in commercial and
  private environments.

  The source code may be freely distributed and used. The author
  accepts no responsibility for its use or misuse.

  If you do find this component handy and you feel guilty for using
  such a great product without paying someone - sorry :)

  Please forward any comments or suggestions to Christoph Kirchner at:
  ckirchner@geocities.com

PS:

  Maybe you can find an update of this component at
  'The Delphi Component Building Site':
  http://www.geocities.com/SiliconValley/Heights/7874/delphi.htm

  Thanks to Frank Emser for:
   - A bug-report with corrected source
   - Making the Delphi 3 - version.
  Thanks to Jair Roberto Nunes da Silva for the MenuItem-property.
}

interface

uses
  WinTypes, WinProcs, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Messages, StdCtrls, ExtCtrls, Buttons, dbconsts, DB, Menus
{$IFDEF WIN32}
  {$IFDEF Ver90} { Delphi = 2.x: }
    , Libconst;
  {$ELSE DEF Ver90} { Delphi >= 3.0: }
    ;
  {$ENDIF DEF Ver90}
{$ELSE DEF WIN32} { Delphi = 1.x: }
  , Libconst;
{$ENDIF DEF WIN32}

type

  TDBSpeedButtonDataLink = class;

  TDBSpeedButtonType = (
    nbCustom,
    nbFirst, nbPrior, nbNext, nbLast,
    nbInsert, nbDelete,
    nbEdit,
    nbPost, nbCancel,
    nbRefresh);

  TBeforeActionEvent =
    procedure (Sender: TObject; var ActionIsDone: Boolean) of object;

  TDBSBDisableReason = (
    drBOF, drEOF, drReadonly,
    drNotEditing, drEditing, drEmpty);
  TDBSBDisableReasons = set of TDBSBDisableReason;


{ TDBSpeedButton }

{$IFDEF DBSpeedButton}
  TDBSpeedButton = class(TSpeedButton)
{$ELSE DEF DBSpeedButton}
  TDBSpeedButton = class(TBitBtn)
{$ENDIF DEF DBSpeedButton}
  private
    FDisableReasons: TDBSBDisableReasons;
    FDataLink: TDBSpeedButtonDataLink;
    FMenuItem: TMenuItem;
    FOnMenuItemClick: TNotifyEvent;
    FConfirmDelete: Boolean;
    FButtonEnabled: Boolean;
    FDBSpeedButtonType: TDBSpeedButtonType;
    FOnBeforeAction: TBeforeActionEvent;
    FOldOnGlyphChanged: TNotifyEvent;
    FOnEnabledChanged: TNotifyEvent;
    FRepeatTimer: TTimer;
    FCustomGlyph: Boolean;
    procedure TimerExpired(Sender: TObject);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    procedure SetDBSpeedButtonType(Value: TDBSpeedButtonType);
    procedure SetMenuItem(Value: TMenuItem);
    procedure MenuItemClick(Sender: TObject);
    procedure ReadButtonEnabled(Reader: TReader);
    procedure WriteButtonEnabled(Writer: TWriter);
    function NumberOfStandardComponentName: Integer;
    function HasStandardComponentName: Boolean;
    function CalculateComponentName(NewButtonType: TDBSpeedButtonType;
      var NewName: TComponentName): Boolean;
    procedure LoadGlyph;
    function StoreGlyph: Boolean;
    procedure GlyphChanged(Sender: TObject);
    procedure CalcDisableReasons;
    function StandardComponentName: TComponentName;
    procedure CMEnabledChanged(var Message: TMessage);
      message CM_ENABLEDCHANGED;
  {$IFNDEF DBSpeedButton}
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
  {$ENDIF NDEF DBSpeedButton}
  protected
  {$IFDEF DBSpeedButton}
    procedure Paint; override;
  {$ENDIF DEF DBSpeedButton}
    procedure Loaded; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

{   Calculates property Enabled: }
    procedure UpdateEnabled; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;

{   DoAction Calls the OnBeforeAction event.
    Then it performs the standard-action if DataButtonType <> nbCustom.
    Same as Click, but it does not call the OnClick event: }
    procedure DoAction; virtual;
  published
    property ConfirmDelete: Boolean
      read FConfirmDelete write FConfirmDelete default True;
    property DataButtonType: TDBSpeedButtonType
      read FDBSpeedButtonType write SetDBSpeedButtonType;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Glyph stored StoreGlyph;

    property MenuItem: TMenuItem read FMenuItem write SetMenuItem;

{   Use BeforeAction instead of the Click-event if you want to be able to
    cancel the default-action by setting ActionIsDone to true.
    The Click-event is called before the DoAction-event. }
    property OnBeforeAction: TBeforeActionEvent
      read FOnBeforeAction write FOnBeforeAction;

{   Use DisableReasons to say on what case the button has to be disabled.
    It is set automatic if you set DataButtonType <> nbCustom.
    DisableReason  | Disable if Dataset is...
    ---------------+-------------------------
      drBOF        | EOF
      drEOF        | BOF
      drReadonly   | Readonly
      drNotEditing | Not in insert or edit-mode
      drEditing    | In insert or edit-mode
      drEmpty      | Both BOF and EOF }
    property DisableReasons: TDBSBDisableReasons
      read FDisableReasons write FDisableReasons;

{   Called after Enabled has changed: }
    property OnEnabledChanged: TNotifyEvent
      read FOnEnabledChanged write FOnEnabledChanged;
  end;


{ TDBSpeedButtonDataLink }

  TDBSpeedButtonDataLink = class(TDataLink)
  private
    FDBSpeedButton: TDBSpeedButton;
  protected
    procedure EditingChanged; override;
    procedure DataSetChanged; override;
    procedure ActiveChanged; override;
  public
    constructor Create(aDBSpeedButton: TDBSpeedButton);
    destructor Destroy; override;
  end;



procedure Register;

implementation

{ $R DBCTRLS} { uses DBCTRLS.RES, but that is already linked by DB.PAS }

{$IFDEF WIN32}
  {$R DBSBtn.d32} { 32-bit-DBSBtn.dcr is renamed to d32 }
{$ELSE DEF WIN32}
  {$R DBSBtn.d16}
{$ENDIF DEF WIN32}

{$IFDEF WIN32}
  {$IFNDEF Ver90} { Delphi >= 3.0: }

const
{ RegisterPanel = 'Datensteuerung'; { german }
  RegisterPanel = 'Data Controls';

  {$ENDIF NDEF Ver90}
{$ENDIF DEF WIN32}

const
  TimerInitRepeatPause = 400;  { pause before repeat timer (ms) }
  TimerRepeatPause     = 100;  { interval (ms)}

const
  CtrlNamePrefix = 'dbSBtn';

const
  BtnTypeName: array[TDBSpeedButtonType] of PChar =
    ('', 'FIRST', 'PRIOR', 'NEXT', 'LAST', 'INSERT', 'DELETE',
     'EDIT', 'POST', 'CANCEL', 'REFRESH');
  BtnName: array[TDBSpeedButtonType] of string =
    ('', 'First', 'Prior', 'Next', 'Last', 'New', 'Delete',
     'Edit', 'Save', 'Cancel', 'Refresh');
  BtnNeedsTimer: array[TDBSpeedButtonType] of Boolean =
    (false, false, true, true, false, false, false,
     false, false, false, false);


{ TDBSpeedButtonDataLink }

constructor TDBSpeedButtonDataLink.Create(
  aDBSpeedButton: TDBSpeedButton);
begin
  inherited Create;
  FDBSpeedButton := aDBSpeedButton;
end;

destructor TDBSpeedButtonDataLink.Destroy;
begin
  FDBSpeedButton := nil;
  inherited Destroy;
end;

procedure TDBSpeedButtonDataLink.EditingChanged;
begin
  if FDBSpeedButton <> nil then FDBSpeedButton.UpdateEnabled;
end;

procedure TDBSpeedButtonDataLink.DataSetChanged;
begin
  if FDBSpeedButton <> nil then FDBSpeedButton.UpdateEnabled;
end;

procedure TDBSpeedButtonDataLink.ActiveChanged;
begin
  if FDBSpeedButton <> nil then FDBSpeedButton.UpdateEnabled;
end;



{ TDBSpeedButton }

constructor TDBSpeedButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  FDataLink := TDBSpeedButtonDataLink.Create(Self);
  DataButtonType := nbCustom;
  FConfirmDelete := True;
  FButtonEnabled := True;
  FCustomGlyph := false;
  FOldOnGlyphChanged := Glyph.OnChange;
  Glyph.OnChange := GlyphChanged;
  FDisableReasons := [];
  FRepeatTimer := nil;
  FMenuItem:= nil;
end;

destructor TDBSpeedButton.Destroy;
begin
  if (FRepeatTimer <> nil) then
    FRepeatTimer.Free;
  FDataLink.Free;
  FDataLink := nil;
  MenuItem:= nil;
  inherited Destroy;
end;

procedure TDBSpeedButton.GlyphChanged(Sender: TObject);
begin
  FCustomGlyph := true;
  if Assigned(FOldOnGlyphChanged) then FOldOnGlyphChanged(Sender);
end;

function TDBSpeedButton.StoreGlyph: Boolean;
begin { store only user-defined glyph: }
  result := (FDBSpeedButtonType = nbCustom) or FCustomGlyph;
end;

procedure TDBSpeedButton.LoadGlyph;
var
{$IFDEF WIN32}
{$IFNDEF Ver90} { Delphi >= 3.0: }
  TargetInstance: LongInt;
  NavigatorDLL: String;
{$ENDIF NDEF Ver90}
{$ELSE DEF WIN32}
  Buffer: array[0..79] of Char;
{$ENDIF DEF WIN32}
  ResName: string;
begin
  if (FDBSpeedButtonType = nbCustom) then
    exit;
  try
  { Load the Bitmap that DBNavigator would load: }
    FmtStr(ResName, 'dbn_%s', [BtnTypeName[FDBSpeedButtonType]]);
  {$IFDEF WIN32}
    {$IFDEF Ver90} { Delphi = 2.x: }
      Glyph.Handle := LoadBitmap(HInstance, PChar(ResName));
    {$ELSE DEF Ver90} { Delphi >= 3.0: }
(*****************************************************************************)
(* Changed by Frank Emser on Juni, 1st, 1997.                                *)
(* This change is due to Delphi 3.                                           *)
(* The original version will not show any Glyphs in Delphi 3.                *)
(*  This is true for design time,                                            *)
(*  this is true for runtime (when being built with runtime packages)        *)
(*  this is false only for runtime when NOT being built with runtime packages*)
(*                                                                           *)
(* Reason:                                                                   *)
(* * Delphi 3 works with packages.                                           *)
(*   These are some (very special) kind of Windows-DLLs.                     *)
(*   The component palette is created out of packages (-->DLLs)              *)
(*   This unit refers to resources of the TDBNavigator-Unit                  *)
(*   which - at design time                                                  *)
(*           and at runtime (when being built with rt-packages)-             *)
(*   is located in another package (another DLL) and therefore in these      *)
(*   cases is accessible only with another Instance handle                   *)
(*     (Exactly the one of the DLL (package)  )                              *)
(*****************************************************************************)
   // 1. Search for Run time DLL containing "dbctrls"
   // This is applicable at design time
   // OR
   // (     when the program is running stand-alone
   //   AND it is built using runtime packages.
   // )
   NavigatorDLL := 'VCLDB30.DPL';
   TargetInstance := GetModuleHandle (PChar (NavigatorDLL));
   if TargetInstance = 0
   then begin
     // 2. Use original instance
     // This is applicable, when the program is running stand-alone
     // AND it is built without runtime packages.
     TargetInstance := HInstance;
    end;
    Glyph.Handle := LoadBitmap(TargetInstance, PChar(ResName));
    {$ENDIF DEF Ver90}
  {$ELSE DEF WIN32}
  { Glyph.Assign(nil); { clear }
    Glyph.Handle := LoadBitmap(HInstance, StrPCopy(Buffer, ResName));
  {$ENDIF DEF WIN32}
    NumGlyphs := 2;
    FCustomGlyph := false;
  except
  { error: do nothing }
  end;
end;

procedure TDBSpeedButton.CalcDisableReasons;
begin
  case FDBSpeedButtonType of
    nbPrior: FDisableReasons := [drBOF, drEditing, drEmpty];
    nbNext: FDisableReasons := [drEOF, drEditing, drEmpty];
    nbFirst: FDisableReasons := [drBOF, drEditing, drEmpty];
    nbLast: FDisableReasons := [drEOF, drEditing, drEmpty];
    nbInsert: FDisableReasons := [drReadonly, drEditing];
    nbEdit: FDisableReasons := [drReadonly, drEditing, drEmpty];
    nbCancel: FDisableReasons := [drNotEditing];
    nbPost: FDisableReasons := [drNotEditing];
    nbRefresh: FDisableReasons := [drEditing];
    nbDelete: FDisableReasons := [drReadonly, drEditing, drEmpty];
  end;
end;

function TDBSpeedButton.StandardComponentName: TComponentName;
begin
{ returns the classname without 'T' at begin, functions with decendants too: }
  result := ClassName; { 'TDBSpeedButton' }
  if (Upcase(result[1]) = 'T') then
    System.Delete(result, 1, 1); { 'DBSpeedButton' }
end;

function TDBSpeedButton.NumberOfStandardComponentName: Integer;
function NumberOfName(const TestName: TComponentName): Integer;
begin
  if (Length(Name) > Length(TestName)) and
     (Copy(Name, 1, Length(TestName)) = TestName) then
  begin
    try
      result := StrToInt(Copy(Name, Length(TestName) + 1, 255));
    except
      result := 0;
    end;
  end
  else
    result := 0;
end; { function NumberOfName }
begin { TDBSpeedButton.NumberOfStandardComponentName }
  result := NumberOfName(StandardComponentName);
  if (result = 0) then
    result := NumberOfName(CtrlNamePrefix + BtnName[FDBSpeedButtonType]);
end;

function HasName(const Name, TestName: TComponentName): Boolean;
begin
  if (Length(Name) > Length(TestName)) and
     (Copy(Name, 1, Length(TestName)) = TestName) then
  begin
    try
      result := (StrToInt(Copy(Name, Length(TestName) + 1, 255)) > 0);
    except
      result := false;
    end;
  end
  else
    result := (Name = TestName);
end;

function TDBSpeedButton.HasStandardComponentName: Boolean;
begin
  result :=
    HasName(Name, StandardComponentName) or
    HasName(Name, CtrlNamePrefix + BtnName[FDBSpeedButtonType]);
end;

function TDBSpeedButton.CalculateComponentName(
  NewButtonType: TDBSpeedButtonType;
  var NewName: TComponentName): Boolean;
const
  TooMuch_SomethingIsWrong = 66;
var
  Number: Integer;
begin
  result := false;
  try { ... to find new name for the component: }
    if HasStandardComponentName then
    begin
      if (NewButtonType = nbCustom) then
        NewName := StandardComponentName + '1'
      else
        NewName := CtrlNamePrefix + BtnName[NewButtonType];
      if (Owner <> nil) and (Owner.FindComponent(NewName) <> nil) then
      begin
        Number := NumberOfStandardComponentName;
        if (Number = 0) then
          Number := 1;
        repeat
          if (NewButtonType = nbCustom) then
            NewName := StandardComponentName + IntToStr(Number)
          else
            NewName := CtrlNamePrefix + BtnName[NewButtonType] +
                       IntToStr(Number);
          Inc(Number);
        until (Owner.FindComponent(NewName) = nil) or
              (Number = TooMuch_SomethingIsWrong);
        { Number = TooMuch_SomethingIsWrong should never happen, but I
          don't want to risk an endless loop in design-mode. }
        result := (Number <> TooMuch_SomethingIsWrong) and (NewName <> Name);
      end
      else
        result := (NewName <> Name);
    end;
  except
  { don't change name if error occured, no warning }
  end;
end;

procedure TDBSpeedButton.SetDBSpeedButtonType(
  Value: TDBSpeedButtonType);
var
  NewName: TComponentName;
begin
  if (Value = FDBSpeedButtonType) then
    exit;
  if (csDesigning in ComponentState) and
     CalculateComponentName(Value, NewName) then
    Name := NewName;
  if (csReading in ComponentState) or (csLoading in ComponentState) then
  begin
    FDBSpeedButtonType := Value;
    CalcDisableReasons;
    exit;
  end;
  Enabled := True;
{ Spacing := -1; }
  if (Value = nbCustom) then
    FCustomGlyph := true
  else
    if (FDBSpeedButtonType = nbCustom) or
       (Caption = BtnName[FDBSpeedButtonType]) then
    { Change caption if it was created by us automatically: }
      Caption := BtnName[Value];
  Enabled := False;
  Enabled := True;
  FDBSpeedButtonType := Value;
  LoadGlyph;
  CalcDisableReasons;
end;

procedure TDBSpeedButton.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
     (AComponent = DataSource) then DataSource := nil;
  if (Operation = opRemove) and (AComponent = FMenuItem) then
    MenuItem:= nil;
end;

procedure TDBSpeedButton.DoAction;
var
  Cancel: Boolean;
begin
  if (not (csDesigning in ComponentState)) and
     Assigned(FOnBeforeAction) then
  begin
    Cancel := (FDBSpeedButtonType = nbCustom);
    FOnBeforeAction(self, Cancel);
    if Cancel then
      exit;
  end;
  if (DataSource <> nil) and (DataSource.State <> dsInactive) then
  begin
    with DataSource.DataSet do
    begin
      case FDBSpeedButtonType of
        nbPrior: Prior;
        nbNext: Next;
        nbFirst: First;
        nbLast: Last;
        nbInsert: Insert;
        nbEdit: Edit;
        nbCancel: Cancel;
        nbPost: Post;
        nbRefresh: Refresh;
        nbDelete:
          if not FConfirmDelete or
             (MessageDlg(
            {$IFDEF WIN32}
              {$IFDEF Ver90} { Delphi = 2.x: }
                LoadStr(SDeleteRecordQuestion),
              {$ELSE DEF Ver90} { Delphi >= 3.0: }
                SDeleteRecordQuestion,
              {$ENDIF DEF Ver90}
            {$ELSE DEF WIN32} { Delphi = 1.x: }
              LoadStr(SDeleteRecordQuestion),
            {$ENDIF DEF WIN32}
              mtConfirmation,
              mbOKCancel, 0) <> idCancel) then
            Delete;
      end;
    end;
  end;
end;

procedure TDBSpeedButton.Click;
begin
  inherited Click;
  DoAction;
end;

procedure TDBSpeedButton.UpdateEnabled;
var
  PossibleDisableReasons: TDBSBDisableReasons;
  WasEnabled: Boolean;
begin
  if (csDesigning in ComponentState) then
    exit;
  if (csDestroying in ComponentState) then
    exit;
  if not FButtonEnabled then
    exit;
  if FDataLink.Active then
  begin
    PossibleDisableReasons := [];
    if FDataLink.DataSet.BOF then
      Include(PossibleDisableReasons, drBOF);
    if FDataLink.DataSet.EOF then
      Include(PossibleDisableReasons, drEOF);
    if not FDataLink.DataSet.CanModify then
      Include(PossibleDisableReasons, drReadonly);
    if FDataLink.DataSet.BOF and FDataLink.DataSet.EOF then
      Include(PossibleDisableReasons, drEmpty);
    if FDataLink.Editing then
      Include(PossibleDisableReasons, drEditing)
    else
      Include(PossibleDisableReasons, drNotEditing);
  end
  else
    PossibleDisableReasons := [drBOF, drEOF, drReadonly, drNotEditing, drEmpty];
  WasEnabled := Enabled;
  Enabled := (FDisableReasons * PossibleDisableReasons = []);
  FButtonEnabled := true;
  if FMenuItem <> nil then
    FMenuItem.Enabled:= Enabled;
  if (WasEnabled <> Enabled) and Assigned(FOnEnabledChanged) then
    FOnEnabledChanged(self);
end;

procedure TDBSpeedButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if (not (csLoading in ComponentState)) and
     (not (csDestroying in ComponentState)) then
  begin
    FButtonEnabled := Enabled;
    UpdateEnabled;
  end;
end;

procedure TDBSpeedButton.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if not (csLoading in ComponentState) then
    UpdateEnabled;
{$IFDEF WIN32}
  if Value <> nil then Value.FreeNotification(Self);
{$ENDIF DEF WIN32}
end;

function TDBSpeedButton.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBSpeedButton.ReadButtonEnabled(Reader: TReader);
begin
  FButtonEnabled := Reader.ReadBoolean;
end;

procedure TDBSpeedButton.WriteButtonEnabled(Writer: TWriter);
begin
  Writer.WriteBoolean(FButtonEnabled);
end;

procedure TDBSpeedButton.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('RuntimeEnabled', ReadButtonEnabled, WriteButtonEnabled,
                       true);
end;

procedure TDBSpeedButton.Loaded;
begin
  inherited Loaded;
  if Glyph.Empty then { no user-defined glyph: }
    LoadGlyph; { load standard glyph }
  Enabled := FButtonEnabled; {}
  UpdateEnabled;
end;

procedure TDBSpeedButton.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) then
  begin
    if (FRepeatTimer = nil) and BtnNeedsTimer[FDBSpeedButtonType] then
    begin
      FRepeatTimer := TTimer.Create(Self);
      FRepeatTimer.OnTimer := TimerExpired;
      FRepeatTimer.Interval := TimerInitRepeatPause;
      FRepeatTimer.Enabled := true;
    end;
  end;
end;

procedure TDBSpeedButton.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (FRepeatTimer <> nil) then
  begin
    FRepeatTimer.Free;
    FRepeatTimer := nil;
  end;
end;

{$IFDEF DBSpeedButton}
procedure TDBSpeedButton.Paint;
begin
  if (FRepeatTimer <> nil) then
    FRepeatTimer.Enabled := Down;
  inherited Paint;
end;
{$ELSE DEF DBSpeedButton}
procedure TDBSpeedButton.CNDrawItem(var Message: TWMDrawItem);
begin
  if (FRepeatTimer <> nil) then
    FRepeatTimer.Enabled :=
      (Message.DrawItemStruct^.itemState and ODS_SELECTED <> 0);
  inherited;
end;
{$ENDIF DEF DBSpeedButton}

procedure TDBSpeedButton.TimerExpired(Sender: TObject);
begin
  FRepeatTimer.Interval := TimerRepeatPause;
  try
    Click;
  except
    FRepeatTimer.Free;
    FRepeatTimer := nil;
    raise;
  end;
end;

procedure TDBSpeedButton.SetMenuItem(Value: TMenuItem);
begin
  if (Value <> FMenuItem) then
  begin
    if not (csDesigning in ComponentState) then
    begin
      if Assigned(FMenuItem) and
         not (csDestroying in FMenuItem.ComponentState) then
        FMenuItem.OnClick := FOnMenuItemClick;
      if Assigned(Value) then
      begin
        FOnMenuItemClick := Value.OnClick;
        Value.OnClick := MenuItemClick;
      end
      else
        FOnMenuItemClick := nil;
    end;
    FMenuItem := Value;
  end;
end;

procedure TDBSpeedButton.MenuItemClick(Sender: TObject);
begin
  Click;
  if Assigned(FOnMenuItemClick) then
    FOnMenuItemClick(Sender);
end;


{ Register ------------------------------------------------------------------ }


procedure Register;
begin
{$IFDEF WIN32}
  {$IFDEF Ver90} { Delphi = 2.x: }
    RegisterComponents(LoadStr(srDControls), [TDBSpeedButton]);
  {$ELSE DEF Ver90} { Delphi >= 3.0: }
    RegisterComponents(RegisterPanel, [TDBSpeedButton]);
  {$ENDIF DEF Ver90}
{$ELSE DEF WIN32} { Delphi = 1.x: }
  RegisterComponents(LoadStr(srDControls), [TDBSpeedButton]);
{$ENDIF DEF WIN32}
end;

end.
