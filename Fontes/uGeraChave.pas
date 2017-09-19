unit uGeraChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JLabel, Menus, StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls;

type
  TfrmGeraChave = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Usurios1: TMenuItem;
    FecharFormulrio1: TMenuItem;
    Ajuda1: TMenuItem;
    AjudadoSistema1: TMenuItem;
    SobreoSistema1: TMenuItem;
    Panel3: TPanel;
    JLabel1: TJLabel;
    JLabel2: TJLabel;
    JLabel3: TJLabel;
    JLabel4: TJLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    RadioGroup2: TRadioGroup;
    GroupBox2: TGroupBox;
    MaskEdit1: TMaskEdit;
    GroupBox3: TGroupBox;
    edtArquivo: TEdit;
    GroupBox4: TGroupBox;
    MaskEdit2: TMaskEdit;
    GroupBox5: TGroupBox;
    MaskEdit3: TMaskEdit;
    GroupBox6: TGroupBox;
    Edit2: TEdit;
    GroupBox7: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JLabel1Click(Sender: TObject);
    procedure JLabel2Click(Sender: TObject);
    procedure JLabel3Click(Sender: TObject);
    procedure JLabel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RadioGroup2Click(Sender: TObject);
    procedure JLabel4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure LeChave;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraChave: TfrmGeraChave;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmGeraChave.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmGeraChave.JLabel1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmGeraChave.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmGeraChave.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmGeraChave.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGeraChave.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGeraChave.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGeraChave.LeChave;
var
    F : TextFile;
    aux : string;
    i : integer;
begin
    edtArquivo.Text := ExtractFilePath(Application.ExeName) + 'Chave.sec';

    Memo1.Clear;
    if FileExists(edtArquivo.Text) then
    begin
        AssignFile(F,edtArquivo.Text);
        Reset(F);
        while not Eof(F) do
        begin
            ReadLn(F,aux);
            Memo1.Lines.Add(aux);
        end;
        CloseFile(F);

        Memo2.Clear;
        for i := 0 to Memo1.Lines.Count - 1 do
        begin
            Memo2.Lines.Add(EnDecryptString(Memo1.Lines.Strings[i]));
        end;

        if Memo2.Lines.Strings[2] = 'Demonstração' then RadioGroup1.ItemIndex := 0 else
        if Memo2.Lines.Strings[2] = 'Comercial'    then RadioGroup1.ItemIndex := 1;

        if Memo2.Lines.Strings[3] = 'Sem restrições'     then RadioGroup2.ItemIndex := 0 else
        if Memo2.Lines.Strings[3] = 'Data fixa'          then RadioGroup2.ItemIndex := 1 else
        if Memo2.Lines.Strings[3] = 'Número de locais'   then RadioGroup2.ItemIndex := 2;

        Edit1.Text := Memo2.Lines.Strings[4];
        Edit2.Text := Memo2.Lines.Strings[0];
        MaskEdit1.Text := Memo2.Lines.Strings[5];
        MaskEdit2.Text := Memo2.Lines.Strings[6];

        CheckBox1.Checked := True;
        if Memo2.Lines.Strings[9]  = 'True' then CheckBox2.Checked := True else CheckBox2.Checked := False;
        if Memo2.Lines.Strings[10] = 'True' then CheckBox3.Checked := True else CheckBox3.Checked := False;

        MaskEdit3.Text := Memo2.Lines.Strings[Memo2.Lines.Count - 1];
    end
    else
    begin
        MessageDlg('Não foi possível encontrar o arquivo da chave de ativação.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmGeraChave.FormShow(Sender: TObject);
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    Edit2.Text := frmPrincipal.sVersao;

    LeChave;
end;

procedure TfrmGeraChave.JLabel4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGeraChave.RadioGroup2Click(Sender: TObject);
begin
    if RadioGroup2.ItemIndex = 0 then
    begin
        Maskedit1.Enabled := False;
        MaskEdit1.Text := '';
    end
    else
    begin
       Maskedit1.Enabled := True;
   end;
end;

procedure TfrmGeraChave.JLabel4Click(Sender: TObject);
var
    F : TextFile;
    i,a : integer;
    aux : string;
begin
    Memo1.Clear;

    if edtArquivo.Text = '' then
    begin
        MessageDlg('O nome do arquivo da chave é obrigatório.', mtWarning, [mbOK], 0);
        Exit;
    end;

    if edtArquivo.Text = '' then
    begin
        MessageDlg('O nome do arquivo da chave é obrigatório.', mtWarning, [mbOK], 0);
        Exit;
    end;

    if RadioGroup1.ItemIndex = 1 then
    begin
        if Edit1.Text = '' then
        begin
            MessageDlg('A contra senha é obrigatória para licenças do tipo comercial.', mtWarning, [mbOK], 0);
            Exit;
        end;
    end;

    if RadioGroup2.ItemIndex <> 0 then
    begin
        if RadioGroup2.ItemIndex = 1 then
        begin
            try
               if StrToDate(MaskEdit1.Text) <= Date then
               begin
                   MessageDlg('A data de proteção não pode ser menor ou igual a data atual.', mtWarning, [mbOK], 0);
                   Exit;
               end;
            except
              MessageDlg('O valor de proteção não é válido.', mtWarning, [mbOK], 0);
              Exit;
            end;
        end;

        if RadioGroup2.ItemIndex = 2 then
        begin
            try
               if StrToInt(MaskEdit1.Text) <= 0 then
               begin
                   MessageDlg('O valor de proteção não pode ser menor ou igual a zero.', mtWarning, [mbOK], 0);
                   Exit;
               end;
            except
              MessageDlg('O valor de proteção não é válido.', mtWarning, [mbOK], 0);
              Exit;
            end;
        end;

        if MaskEdit1.Text = '' then
        begin
            MessageDlg('O valor de proteção é obrigatório.', mtWarning, [mbOK], 0);
            Exit;
        end;
    end;

    Memo1.Lines.Add(Edit2.Text);
    Memo1.Lines.Add('Chave.sec');

    if RadioGroup1.ItemIndex = 0 then Memo1.Lines.Add('Demonstração');
    if RadioGroup1.ItemIndex = 1 then Memo1.Lines.Add('Comercial');

    if RadioGroup2.ItemIndex = 0 then Memo1.Lines.Add('Sem restrições');
    if RadioGroup2.ItemIndex = 1 then Memo1.Lines.Add('Data fixa');
    if RadioGroup2.ItemIndex = 2 then Memo1.Lines.Add('Número de locais');

    Memo1.Lines.Add(Edit1.Text);
    Memo1.Lines.Add(MaskEdit1.Text);
    Randomize;

    aux := '';
    for i := 0 to 2 do
    begin
        a := Random(8);
        if a = 0 then aux := aux + 'M' else
        if a = 1 then aux := aux + 'A' else
        if a = 2 then aux := aux + 'R' else
        if a = 3 then aux := aux + 'C' else
        if a = 4 then aux := aux + 'E' else
        if a = 5 then aux := aux + 'L' else
        if a = 6 then aux := aux + 'O' else
        if a = 7 then aux := aux + 'H' else
        if a = 8 then aux := aux + 'N';
    end;

    Memo1.Lines.Add(aux + '-' + IntToStr(Random(29000)));
    Memo1.Lines.Add(DateToStr(Date));

    if CheckBox1.Checked = True then Memo1.Lines.Add('True') else Memo1.Lines.Add('False');
    if CheckBox2.Checked = True then Memo1.Lines.Add('True') else Memo1.Lines.Add('False');
    if CheckBox3.Checked = True then Memo1.Lines.Add('True') else Memo1.Lines.Add('False');

    dtmPrincipal.tblProgramas.First;
    Memo1.Lines.Add('[Inicio da listagem de programas]');
    while not dtmPrincipal.tblProgramas.Eof do
    begin
        Memo1.Lines.Add(dtmPrincipal.tblProgramasID_Programa.AsString + '#' +
                        dtmPrincipal.tblProgramasNome.AsString        + '#' +
                        dtmPrincipal.tblProgramasTitulo.AsString      + '#' +
                        dtmPrincipal.tblProgramasVersao.AsString);

        dtmPrincipal.tblProgramas.Next
    end;
    Memo1.Lines.Add('[Final da listagem de programas]');

    a := StrToInt(tbGetLongStr(Memo1.Lines.Strings[6],'-')) * Length(Memo1.Lines.Text);

    i := a * StrToInt(Copy(Memo1.Lines.Strings[7],1,2));
    i := i + (a * StrToInt(Copy(Memo1.Lines.Strings[7],4,2)));
    i := i + (a * StrToInt(Copy(Memo1.Lines.Strings[7],7,4)));
    i := Round(i * a / 100);

    Memo1.Lines.Add(IntToStr(i));

    Memo2.Clear;
    for i := 0 to Memo1.Lines.Count - 1 do
    begin
        Memo2.Lines.Add(EnDecryptString(Memo1.Lines.Strings[i]));
    end;

    AssignFile(F,edtArquivo.Text);
    Rewrite(F);

    for i := 0 to Memo2.Lines.Count - 1 do
    begin
        WriteLn(F,Memo2.Lines.Strings[i]);
    end;

    CloseFile(F);

    ShowMessage('Chave gerada com sucesso.');
    LeChave;
end;

procedure TfrmGeraChave.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then
    begin
        SpeedButton1.Enabled := False;
        Edit1.Text := '';
    end
    else
    begin
        SpeedButton1.Enabled := True;
    end;
end;

procedure TfrmGeraChave.SpeedButton1Click(Sender: TObject);
var
    F : TextFile;
    aux : string;
begin
    if FileExists(ExtractFilePath(Application.ExeName) + 'Contra.sec') then
    begin
        AssignFile(F,ExtractFilePath(Application.ExeName) + 'Contra.sec');
        Reset(F);
        ReadLn(F,aux);
        CloseFile(F);
        Edit1.Text := EnDecryptString(aux);
    end
    else
    begin
        MessageDlg('O arquivo de contra senha não foi encontrado.', mtWarning, [mbOK], 0);
    end;
end;

end.
