unit JLabel;

{ Original code From Dolf van den Berg South-Africa  EMail Edusof@Icon.co.za }

{ Modified to be able to use ONCLICK EVENT}
{ Plus Added Style Properties and}
{ foreground and backgroup coloring}
{   BY: Jay O'Donnell Oct/97}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TJLabel = class(TLabel)
  private
   onMoveBKGRDColor : TColor;
   offMoveBKGRDColor : TColor;
   onMoveFontColor : TColor;
   offMoveFontColor : TColor;
   onLabelFontStyle : TfontStyles;
   offLabelFontStyle : TfontStyles;
   JActive,FDown,FEnabled,MouseIn: Boolean;

  protected
   Procedure WMMouseMove(var msg: TWMMouseMove);Message WM_MOUSEMOVE;

  public
   Procedure SetOnMoveBKGRDColor(Value : Tcolor);
   Procedure SetOffMoveBKGRDColor(Value : Tcolor);
   Procedure SetOnMoveFontColor(Value : Tcolor);
   Procedure SetOffMoveFontColor(Value : Tcolor);
   Procedure SetBoldOn(Value: TfontStyles);
   Procedure SetBoldOff(Value: TfontStyles);
   Procedure EnableLabel(Value: Boolean);

  published
   Property OnMoveBColor  : TColor Read onMoveBKGRDColor Write SetOnMoveBKGRDColor Stored true;
   Property OffMoveBColor : TColor Read offMoveBKGRDColor Write SetOffMoveBKGRDColor Stored true;
   Property OnMoveFColor  : TColor Read onMoveFontColor Write SetOnMoveFontColor Stored true;
   Property OffMoveFColor : TColor Read offMoveFontColor Write SetOffMoveFontColor Stored true;
   Property OnStyles      : TFontStyles READ onLabelFontStyle write SetBoldOn stored true;
   Property OffStyles     : TFontStyles READ offLabelFontStyle write SetBoldOff stored true;
   Property OnEnabled     : Boolean READ JActive write EnableLabel stored true;
  end;

procedure Register;

implementation

Procedure TJLabel.SetBoldOn(Value: TFontStyles);
begin
 onLabelFontStyle := value;
end;

Procedure TJLabel.SetBoldOff(Value: TFontStyles);
begin
 offLabelFontStyle := value;
end;

Procedure TJLabel.EnableLabel(Value: Boolean);
begin
 JActive := value;
end;

Procedure TJLabel.SetOnMoveBKGRDColor(Value : Tcolor);
Begin
 If onMoveBKGRDColor <> Value Then
  Begin
   onMoveBKGRDColor := Value;
  End;
End;

Procedure TJLabel.SetOffMoveBKGRDColor(Value : Tcolor);
Begin
 If offMoveBKGRDColor <> Value Then
  Begin
   offMoveBKGRDColor := Value;
  End;
End;

Procedure TJLabel.SetOnMoveFontColor(Value : Tcolor);
Begin
 If onMoveFontColor <> Value Then
  Begin
   onMoveFontColor := Value;
  End;
End;

Procedure TJLabel.SetOffMoveFontColor(Value : Tcolor);
Begin
 If offMoveFontColor <> Value Then
  Begin
   offMoveFontColor := Value;
  End;
End;

Procedure TJLabel.WMMouseMove(Var msg: TWMMouseMove);
Begin

    if jactive then
    begin
      If not MouseCapture Then
      Begin
        SetCaptureControl(Self);
         If Enabled and Visible and getParentForm(Self).Active Then
         Begin
           Color := onMoveBKGRDColor;
           Font.Color := onMoveFontColor;
           font.style := onLabelFontStyle;
         End;

       End
       else
       begin
            MouseIn := False;
            Color := offMoveBKGRDColor;
            Font.Color := offMoveFontColor;
            font.style := offLabelFontStyle;
            SetCaptureControl(Nil);
       end;

       If MouseCapture and ((msg.xpos < 0) or (msg.ypos < 0) or (msg.xPos >
          Width) or (msg.Ypos > Height)) and mousein Then
       Begin
            MouseIn := False;
            Color := offMoveBKGRDColor;
            Font.Color := offMoveFontColor;
            font.style := offLabelFontStyle;
            SetCaptureControl(Nil);
       End;

       If MouseCapture and ((msg.xpos >= 0) and (msg.ypos >= 0) and (msg.xPos <=
          Width) and (msg.Ypos <= Height)) and not MouseIn Then
       Begin
            MouseIn := True;
            if not FDown and FEnabled Then
            begin
                font.style := offLabelFontStyle;
                Color := offMoveBKGRDColor;
                Font.Color := offMoveFontColor;
            end;
       End;
    end;   
End;

procedure Register;
begin
  RegisterComponents('Labels', [TJLabel]);
end;

end.
