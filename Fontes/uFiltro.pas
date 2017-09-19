unit uFiltro;

interface

uses
  DBGrids, ADOdb, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TfrmFiltro = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    ListBox3: TListBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox4: TListBox;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    SpeedButton6: TSpeedButton;
    lValor: TListBox;
    lOperador: TListBox;
    lCondicao: TListBox;
    lCampo: TListBox;
    lPosicao: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MontaCampos;
    procedure SpeedButton3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Formulario : TForm;
    Tipo : Integer;
    Grid : TDBGrid;
  end;

var
  frmFiltro: TfrmFiltro;

implementation

uses uPrincipal, uModule;

{$R *.dfm}
procedure TfrmFiltro.MontaCampos;
var
    i : integer;
begin
    for i := 0 to TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).FieldCount - 1 do
    begin
        if Copy(TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Fields[i].DisplayLabel,1,1) <> '#' then
        begin
            ListBox1.Items.Add(TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Fields[i].DisplayLabel);
            ListBox2.Items.Add(TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Fields[i].FieldName);
        end;
    end;
end;

procedure TfrmFiltro.FormShow(Sender: TObject);
var
    F : TextFile;
    i,a : integer;
    aux : string;
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    MontaCampos;

    frmPrincipal.AbreForm(Formulario);

    if FileExists(ExtractFilePath(Application.ExeName) + 'Parametros\' + frmPrincipal.sUsuario + '\' + Formulario.Name + '\' + 'Filtro.txt') then
    begin
        AssignFile(F,ExtractFilePath(Application.ExeName) + 'Parametros\' + frmPrincipal.sUsuario + '\' + Formulario.Name + '\' + 'Filtro.txt');
        Reset(F);

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            ListBox3.Items.Add(aux);
        end;

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            ListBox4.Items.Add(aux);
        end;

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            lValor.Items.Add(aux);
        end;

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            lOperador.Items.Add(aux);
        end;

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            lCondicao.Items.Add(aux);
        end;

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            lCampo.Items.Add(aux);
        end;

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            lPosicao.Items.Add(aux);
        end;

        CloseFile(F);
    end;

    ListBox1.ItemIndex := 0;

{    if ListBox3.Items.Count >= 0 then
    begin
        ListBox3.ItemIndex := 0;
        //ListBox3.OnClick(Self);
    end;}
end;

procedure TfrmFiltro.FormClose(Sender: TObject; var Action: TCloseAction);
var
    F : TextFile;
    i : integer;
begin
    frmPrincipal.AbreForm(Formulario);

    AssignFile(F,ExtractFilePath(Application.ExeName) + 'Parametros\' + frmPrincipal.sUsuario + '\' + Formulario.Name + '\' + 'Filtro.txt');
    Rewrite(F);

    WriteLn(F,IntToStr(ListBox3.Items.Count - 1));
    for i := 0 to ListBox3.Items.Count - 1 do
    begin
        WriteLn(F,ListBox3.Items.Strings[i]);
    end;

    WriteLn(F,IntToStr(ListBox4.Items.Count - 1));
    for i := 0 to ListBox4.Items.Count - 1 do
    begin
        WriteLn(F,ListBox4.Items.Strings[i]);
    end;

    WriteLn(F,IntToStr(lValor.Items.Count - 1));
    for i := 0 to lValor.Items.Count - 1 do
    begin
        WriteLn(F,lValor.Items.Strings[i]);
    end;

    WriteLn(F,IntToStr(lOperador.Items.Count - 1));
    for i := 0 to lOperador.Items.Count - 1 do
    begin
        WriteLn(F,lOperador.Items.Strings[i]);
    end;

    WriteLn(F,IntToStr(lCondicao.Items.Count - 1));
    for i := 0 to lCondicao.Items.Count - 1 do
    begin
        WriteLn(F,lCondicao.Items.Strings[i]);
    end;

    WriteLn(F,IntToStr(lCampo.Items.Count - 1));
    for i := 0 to lCampo.Items.Count - 1 do
    begin
        WriteLn(F,lCampo.Items.Strings[i]);
    end;

    WriteLn(F,IntToStr(lPosicao.Items.Count - 1));
    for i := 0 to lPosicao.Items.Count - 1 do
    begin
        WriteLn(F,lPosicao.Items.Strings[i]);
    end;

    CloseFile(F);

    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmFiltro.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmFiltro.SpeedButton3Click(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
        MessageDlg('Informe um valor para o filtro.', mtWarning, [mbOK], 0);
        Edit1.SetFocus;
        Exit;
    end;

    if ListBox3.Items.Count > 0 then
    begin
        ListBox3.Items.Add(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex] + ' ' +ListBox1.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text);
        if RadioGroup1.Items.Strings[RadioGroup1.ItemIndex] = 'E' then
           ListBox4.Items.Add('AND ' + ListBox2.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text)
        else
           ListBox4.Items.Add('OR ' + ListBox2.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text);
    end
    else
    begin
        ListBox3.Items.Add(ListBox1.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text);
        ListBox4.Items.Add(ListBox2.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text);
    end;

    lValor.Items.Add(Edit1.Text);
    lOperador.Items.Add(IntToStr(RadioGroup2.ItemIndex));
    lCondicao.Items.Add(IntToStr(RadioGroup1.ItemIndex));
    lCampo.Items.Add(ListBox2.Items.Strings[ListBox1.ItemIndex]);
    lPosicao.Items.Add(IntToStr(ListBox1.ItemIndex));

    ListBox3.ItemIndex := ListBox3.Items.Count - 1;
end;

procedure TfrmFiltro.ListBox3Click(Sender: TObject);
begin
    ListBox1.ItemIndex := StrToInt(lPosicao.Items.Strings[ListBox3.ItemIndex]);
    Edit1.Text := lValor.Items.Strings[ListBox3.ItemIndex];
    RadioGroup2.ItemIndex := StrToInt(lOperador.Items.Strings[ListBox3.ItemIndex]);
    RadioGroup1.ItemIndex := StrToInt(lCondicao.Items.Strings[ListBox3.ItemIndex]);
end;

procedure TfrmFiltro.SpeedButton2Click(Sender: TObject);
var
    i : integer;
begin
    if ListBox3.ItemIndex >= 0 then
    begin
        i := ListBox3.ItemIndex;

        ListBox3.Items.Delete(i);
        ListBox4.Items.Delete(i);
        lValor.Items.Delete(i);
        lOperador.Items.Delete(i);
        lCondicao.Items.Delete(i);
        lCampo.Items.Delete(i);
        lPosicao.Items.Delete(i);

        if i < ListBox3.Items.Count - 1 then
        begin
            ListBox3.ItemIndex := i;
        end
        else
        begin
            ListBox3.ItemIndex := ListBox3.Items.Count - 1;
        end;

        if ListBox3.ItemIndex = 0 then
        begin
            if Copy(ListBox3.Items.Strings[0],1,1) = 'E' then
            begin
                ListBox3.Items.Strings[0] := Copy(ListBox3.Items.Strings[0],3,Length(ListBox3.Items.Strings[0]) - 2);
                ListBox4.Items.Strings[0] := Copy(ListBox4.Items.Strings[0],5,Length(ListBox4.Items.Strings[0]) - 5);
            end;

            if Copy(ListBox3.Items.Strings[0],1,2) = 'OU' then
            begin
                ListBox3.Items.Strings[0] := Copy(ListBox3.Items.Strings[0],4,Length(ListBox3.Items.Strings[0]) - 3);
                ListBox4.Items.Strings[0] := Copy(ListBox4.Items.Strings[0],4,Length(ListBox4.Items.Strings[0]) - 3);
            end;
        end;

        if ListBox3.Items.Count > 0 then ListBox3.OnClick(Self);
    end;
end;

procedure TfrmFiltro.SpeedButton6Click(Sender: TObject);
begin
    if ListBox3.Items.Count > 0 then
    begin
        if Edit1.Text = '' then
        begin
            MessageDlg('Informe um valor para o filtro.', mtWarning, [mbOK], 0);
            Edit1.SetFocus;
            Exit;
        end;

        if ListBox3.ItemIndex > 0 then
        begin
            ListBox3.Items.Strings[ListBox3.ItemIndex] := RadioGroup1.Items.Strings[RadioGroup1.ItemIndex] + ' ' +ListBox1.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text;
            if RadioGroup1.Items.Strings[RadioGroup1.ItemIndex] = 'E' then
               ListBox4.Items.Strings[ListBox3.ItemIndex] := 'AND ' + ListBox2.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text
            else
               ListBox4.Items.Strings[ListBox3.ItemIndex] := 'OR ' + ListBox2.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text;
        end
        else
        begin
            ListBox3.Items.Strings[ListBox3.ItemIndex] := ListBox1.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text;
            ListBox4.Items.Strings[ListBox3.ItemIndex] := ListBox2.Items.Strings[ListBox1.ItemIndex] + ' ' + RadioGroup2.Items.Strings[RadioGroup2.ItemIndex] + ' ' + Edit1.Text;
        end;

        lValor.Items.Strings[ListBox3.ItemIndex] := Edit1.Text;
        lOperador.Items.Strings[ListBox3.ItemIndex] := IntToStr(RadioGroup2.ItemIndex);
        lCondicao.Items.Strings[ListBox3.ItemIndex] := IntToStr(RadioGroup1.ItemIndex);
        lCampo.Items.Strings[ListBox3.ItemIndex] := ListBox2.Items.Strings[ListBox1.ItemIndex];
        lPosicao.Items.Strings[ListBox3.ItemIndex] := IntToStr(ListBox1.ItemIndex);
    end;
end;

end.
