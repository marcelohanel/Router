unit uPersonaliza;

interface

uses
  ADODB, DBGrids, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, CheckLst, ComCtrls, JLabel, Menus;

type
  TfrmPersonaliza = class(TForm)
    ListBox1: TListBox;
    CheckListBox1: TCheckListBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    GroupBox3: TGroupBox;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    GroupBox4: TGroupBox;
    ColorBox3: TColorBox;
    GroupBox5: TGroupBox;
    ColorBox4: TColorBox;
    GroupBox6: TGroupBox;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    GroupBox7: TGroupBox;
    ColorBox1: TColorBox;
    GroupBox2: TGroupBox;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Panel3: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MontaCampos;
    procedure CheckListBox1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Formulario : TForm;
    Tipo : Integer;
    Grid : TDBGrid;
  end;

var
  frmPersonaliza: TfrmPersonaliza;
  v1 : integer;
  v2 : integer;
  v3 : integer;
  v4 : integer;
  v5 : integer;
  v6 : integer;
  v7 : integer;
  v8 : integer;
  v9 : integer;

implementation

uses uPesquisa, uPrincipal, uModule, uFind;

{$R *.dfm}

procedure TfrmPersonaliza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmPersonaliza.FormShow(Sender: TObject);
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    if Grid.Name = 'grdFind' then Formulario := frmFind;

    MontaCampos;
    CheckListBox1.ItemIndex := 0;
end;

procedure TfrmPersonaliza.MontaCampos;
var
    i, a : integer;
begin
    for i := 0 to TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).FieldCount - 1 do
    begin
        if Copy(TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Fields[i].DisplayLabel,1,1) <> '#' then
        begin
            CheckListBox1.Items.Add(TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Fields[i].DisplayLabel);
            ListBox1.Items.Add(TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Fields[i].FieldName);
        end;
    end;

    for i := 0 to Grid.Columns.Count - 1 do
    begin
        for a := 0 to CheckListBox1.Items.Count - 1 do
        begin
            if Grid.Columns.Items[i].Title.Caption = CheckListBox1.Items.Strings[a] then
            begin
                CheckListBox1.Checked[a] := True;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.CheckListBox1Click(Sender: TObject);
var
    i,a : integer;
    status : string;
begin
    a := 0;
    for i := 0 to CheckListBox1.Items.Count - 1 do
    begin
        if CheckListBox1.State[i] = cbChecked then
        begin
            a := a + 1;
        end;
    end;

    if a = 0 then
    begin
        MessageDlg('O grid precisa conter pelo menos um campo.', mtWarning, [mbOK], 0);
        CheckListBox1.Checked[CheckListBox1.ItemIndex] := True;
    end;

    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbUnchecked then
    begin
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Grid.Columns.Delete(a);
                Exit;
            end;
        end;
    end;

    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
            end;
        end;

        if Status = '0' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Add.FieldName := ListBox1.Items.Strings[CheckListBox1.ItemIndex];
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton5Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Alignment := taLeftJustify;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton7Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Alignment := taCenter;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton6Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Alignment := taRightJustify;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton8Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Alignment := taLeftJustify;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton11Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            if v1 = 1 then
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style + [fsBold];
                v1 := 0;
            end
            else
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style - [fsBold];
                v1 := 1;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton13Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            if v2 = 1 then
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style + [fsItalic];
                v2 := 0;
            end
            else
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style - [fsItalic];
                v2 := 1;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton12Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            if v3 = 1 then
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style + [fsUnderline];
                v3 := 0;
            end
            else
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Font.Style - [fsUnderline];
                v3 := 1;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.ColorBox3Change(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Title.Color := ColorBox3.Selected;
        end;
    end;
end;

procedure TfrmPersonaliza.ColorBox4Change(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Color := ColorBox4.Selected;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton10Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Alignment := taCenter;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton9Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Alignment := taRightJustify;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton14Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            if v4 = 1 then
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style + [fsBold];
                v4 := 0;
            end
            else
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style - [fsBold];
                v4 := 1;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton16Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            if v5 = 1 then
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style + [fsItalic];
                v5 := 0;
            end
            else
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style - [fsItalic];
                v5 := 1;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton15Click(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            if v3 = 1 then
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style + [fsUnderline];
                v6 := 0;
            end
            else
            begin
                TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Font.Style - [fsUnderline];
                v6 := 1;
            end;
        end;
    end;
end;

procedure TfrmPersonaliza.ColorBox1Change(Sender: TObject);
var
    status : string;
    b,a : integer;
begin
    b := 0;
    if CheckListBox1.State[CheckListBox1.ItemIndex] = cbChecked then
    begin
        Status := '0';
        for a := 0 to Grid.Columns.Count - 1 do
        begin
            if Grid.Columns.Items[a].Title.Caption = CheckListBox1.Items.Strings[CheckListBox1.ItemIndex] then
            begin
                Status := '1';
                b := a;
            end;
        end;

        if Status = '1' then
        begin
            TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Items[b].Color := ColorBox1.Selected;
        end;
    end;
end;

procedure TfrmPersonaliza.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.
