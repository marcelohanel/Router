unit uPrincipal;

interface

uses
  DBCtrls, ComObj, ADODB, DBGrids, IniFiles, Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, ExtCtrls, Menus, XPMenu;

function VerificaPrograma(Tipo: Integer; Formulario: string) : String;
function EnDecryptString(StrValue : String) : String;
function SerialNum(FDrive:String) :String;
function tbGetShortStr(const S: string; const Sep: Char): string;
function tbGetLongStr(const S: string; const Sep: Char): string;
function VerificaPermissao(Operacao, Formulario: string): boolean;
function Confirma(Mensagem: string): boolean;
function ControleTabelas(Tipo: integer; Tabela, Operacao: string): boolean;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    sBar: TStatusBar;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    N1: TMenuItem;
    EncerrarAplicao1: TMenuItem;
    Ajuda1: TMenuItem;
    AjudadoSistema1: TMenuItem;
    SobreoSistema1: TMenuItem;
    UsuriosdoSistema1: TMenuItem;
    ChavedeAtivao1: TMenuItem;
    GerarChave1: TMenuItem;
    InformaesSobraaChave1: TMenuItem;
    ContraSenha1: TMenuItem;
    Memo1: TMemo;
    Memo2: TMemo;
    LogsdoSistema1: TMenuItem;
    RelatriosdoSistema1: TMenuItem;
    ProgramasdoSistema1: TMenuItem;
    Locais1: TMenuItem;
    iposdeCaminho1: TMenuItem;
    Ligaes1: TMenuItem;
    Entregas1: TMenuItem;
    Veculos1: TMenuItem;
    MatrizdeGanhos1: TMenuItem;
    Cargas1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    SpeedButton12: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Panel4: TPanel;
    btnEncerrar: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Routeirizao1: TMenuItem;
    ParmetrosdoSistema1: TMenuItem;
    TabSheet3: TTabSheet;
    ControledePneus1: TMenuItem;
    Panel5: TPanel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Veculos2: TMenuItem;
    Pneus1: TMenuItem;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    Fornecedores1: TMenuItem;
    Depsitos1: TMenuItem;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MostraSobre;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure GerarChave1Click(Sender: TObject);
    procedure ContraSenha1Click(Sender: TObject);
    procedure VerificaChave;
    procedure InformaesSobraaChave1Click(Sender: TObject);
    procedure LeGrid(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
    procedure AbreForm(Formulario: TForm);
    procedure OrdenaGrid(Tipo: Integer; Grid: TDBGrid; Coluna: TColumn; Formulario: TForm);
    procedure SalvaGrid(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
    procedure PesqGrid(Tipo: Integer; Grid: TDBGrid; Formulario: TForm);
    procedure Exportar(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
    procedure PersonalizaGrid(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
    procedure RestauraGrid(Tipo: Integer; Formulario: TForm);
    procedure GeraLogs(Formulario, Acao, Status: string; Tipo: integer);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Filtro(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
    procedure AplicaFiltro(Tipo: Integer; Formulario: TForm; Grid: TDBGrid; Original: string);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Find(Tipo: Integer; Formulario: TForm; Combo: TDBLookupComboBox; Filtro: String);
    procedure Report(Tipo: Integer; Layout: string);
    procedure SpeedButton6Click(Sender: TObject);
    procedure MostraReport(Tipo: Integer; Formulario: TForm);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sConexao : string;
    sUsuario : string;
    sNomeUsuario : string;
    sVersao : string;
    sParametro : string;
    sChave_Arquivo : string;
    sChave_Tipo : string;
    sChave_Forma : string;
    sChave_Valor : string;
    sChave_Contra : string;
    sChave_Versao : string;
    sChave_ID : string;
    sChave_CRC : string;
    vAntes : string;
    vDepois : string;
    vGeraLog : Integer;
    vModulo1 : integer;
    vModulo2 : integer;
    vModulo3 : integer;
  end;

var
  frmPrincipal: TfrmPrincipal;
  vTabelas: array of string;
  vQuantidade: array of integer;
  vIndice : integer;

implementation

uses uModule, uLogin, uUsuarios, uSobre, uGeraChave, uPesquisa,
  uPersonaliza, uLogs, uFiltro, uRelatorios, uFind, uReport, uProgramas,
  uMostraReport, uParametros, uLocais, uTiposCaminho, uLigacoes, uEntregas,
  uVeiculos, uGanhos, uCargas, uPneus;

{$R *.dfm}

function Confirma(Mensagem: string): boolean;
begin
    if MessageDlg(Mensagem, mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        Result := True;
    end
    else
    begin
        Result := False;
    end;
end;

function tbGetShortStr(const S: string; const Sep: Char): string;
var
  I: Integer;
begin
  I := AnsiPos(Sep, S);
  if I = 0 then
  Result := S
  else
  Result := Copy(S, 1, I - 1);
end;

function tbGetLongStr(const S: string; const Sep: Char): string;
var
  I: Integer;
begin
  I := AnsiPos(Sep, S);
  if I = 0 then
  Result := ''
  else
  Result := Copy(S, I + 1, High(integer));
end;

function EnDecryptString(StrValue : String) : String;
var
   I: Integer;
   OutValue : String;
   Chave : word;
begin
    Chave := 4570;
    
    OutValue := '';

    for I := 1 to Length(StrValue) do
    begin
        OutValue := OutValue + char(Not(ord(StrValue[I])-Chave));
    end;

    Result := OutValue;
end;

function VerificaPermissao(Operacao, Formulario: string): boolean;
var
    aux : integer;
begin
    { OPERACOES
      =========
      L - Ler
      I - Incluir
      A - Alterar
      E - Excluir
    }

    aux := 0;
    if frmPrincipal.GerarChave1.Visible = False then
    begin
        if dtmPrincipal.tblPermissoesUsuario.Locate('ID_Programa;ID_Usuario',VarArrayOf([Formulario,frmPrincipal.sUsuario]),[loPartialKey]) then
        begin
            if Operacao = 'L' then if dtmPrincipal.tblPermissoesUsuarioLer.AsString     = 'S' then aux := 1;
            if Operacao = 'I' then if dtmPrincipal.tblPermissoesUsuarioIncluir.AsString = 'S' then aux := 1;
            if Operacao = 'A' then if dtmPrincipal.tblPermissoesUsuarioAlterar.AsString = 'S' then aux := 1;
            if Operacao = 'E' then if dtmPrincipal.tblPermissoesUsuarioExcluir.AsString = 'S' then aux := 1;
        end
        else
        begin
        end;
    end
    else
    begin
        aux := 1;
    end;

    if aux = 1 then
    begin
        if Operacao = 'L' then frmPrincipal.GeraLogs(Formulario,'Abrir','S',0);
        if Operacao = 'I' then frmPrincipal.GeraLogs(Formulario,'Incluir','S',0);
        if Operacao = 'A' then frmPrincipal.GeraLogs(Formulario,'Alterar','S',0);
        if Operacao = 'E' then frmPrincipal.GeraLogs(Formulario,'Excluir','S',0);

        Result := True;
    end
    else
    begin
        if Operacao = 'L' then frmPrincipal.GeraLogs(Formulario,'Abrir','N',0);
        if Operacao = 'I' then frmPrincipal.GeraLogs(Formulario,'Incluir','N',0);
        if Operacao = 'A' then frmPrincipal.GeraLogs(Formulario,'Alterar','N',0);
        if Operacao = 'E' then frmPrincipal.GeraLogs(Formulario,'Excluir','N',0);

        Result := False;
        MessageDlg('Você não tem permissao para executar esta operação.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.VerificaChave;
var
    F : TextFile;
    aux, aux1, aux2, vNome, vTitulo, vVersao : string;
    i,a : integer;
begin
    try
        if not FileExists(ExtractFilePath(Application.ExeName) + 'Chave.sec') then
        begin
            MessageDlg('Não foi possível localizar o arquivo da chave de ativação.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        Memo1.Clear;

        AssignFile(F,ExtractFilePath(Application.ExeName) + 'Chave.sec');
        Reset(F);
        while not Eof(F) do
        begin
            ReadLn(F,aux);
            Memo1.Lines.Add(aux);
        end;
        CloseFile(F);

        Memo2.Clear;
        for i := 0 to Memo1.Lines.Count - 2 do
        begin
            Memo2.Lines.Add(EnDecryptString(Memo1.Lines.Strings[i]));
        end;

        a := StrToInt(tbGetLongStr(Memo2.Lines.Strings[6],'-')) * Length(Memo2.Lines.Text);

        i := a * StrToInt(Copy(Memo2.Lines.Strings[7],1,2));
        i := i + (a * StrToInt(Copy(Memo2.Lines.Strings[7],4,2)));
        i := i + (a * StrToInt(Copy(Memo2.Lines.Strings[7],7,4)));
        i := Round(i * a / 100);

        sChave_Versao := Memo2.Lines.Strings[0];
        sChave_Arquivo := Memo2.Lines.Strings[1];
        sChave_Tipo := Memo2.Lines.Strings[2];
        sChave_Forma := Memo2.Lines.Strings[3];
        sChave_Contra := Memo2.Lines.Strings[4];
        sChave_Valor := Memo2.Lines.Strings[5];
        sChave_ID := Memo2.Lines.Strings[6];
        sChave_CRC := IntToStr(i);
        if Memo2.Lines.Strings[8] = 'True' then vModulo1 := 0 else vModulo1 := 1;
        if Memo2.Lines.Strings[9] = 'True' then vModulo2 := 0 else vModulo2 := 1;
        if Memo2.Lines.Strings[10] = 'True' then vModulo3 := 0 else vModulo3 := 1;

        if i <> StrToInt(EnDecryptString(Memo1.Lines.Strings[Memo1.Lines.Count - 1])) then
        begin
            MessageDlg('O CRC da chave de ativação não é válido.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        aux := '1';
        if Memo2.Lines.Strings[0] = sVersao then aux := '0';
        if aux = '1' then
        begin
            MessageDlg('A versão da chave não confere com a versão do sistema.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        aux := '1';
        if Memo2.Lines.Strings[2] = 'Demonstração' then aux := '0';
        if Memo2.Lines.Strings[2] = 'Comercial'    then aux := '0';
        if aux = '1' then
        begin
            MessageDlg('A chave de ativação não é válida.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        aux := '1';
        if Memo2.Lines.Strings[3] = 'Sem restrições'     then aux := '0';
        if Memo2.Lines.Strings[3] = 'Data fixa'          then aux := '0';
        if Memo2.Lines.Strings[3] = 'Número de locais'   then aux := '0';
        if aux = '1' then
        begin
            MessageDlg('A chave de ativação não é válida.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        if Memo2.Lines.Strings[3] = 'Data fixa' then
        begin
            StrToDate(Memo2.Lines.Strings[5]);
        end;

        if Memo2.Lines.Strings[3] = 'Número de locais' then
        begin
            StrToInt(Memo2.Lines.Strings[5]);
        end;

        if Memo2.Lines.Strings[11] <> '[Inicio da listagem de programas]' then
        begin
            MessageDlg('A chave de ativação não é válida.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        aux := '1';
        for i := 0 to Memo2.Lines.Count - 1 do
        begin
            if Memo2.Lines.Strings[i] = '[Final da listagem de programas]' then aux := '0';
        end;
        if aux = '1' then
        begin
            MessageDlg('A chave de ativação não é válida.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
            Application.Terminate;
        end;

        aux := '1';

        for i := 0 to Memo2.Lines.Count - 1 do
        begin
            if Memo2.Lines.Strings[i] = '[Inicio da listagem de programas]' then aux := '0';
            if Memo2.Lines.Strings[i] = '[Final da listagem de programas]' then aux := '1';

            if aux = '0' then
            begin
                if Memo2.Lines.Strings[i] <> '[Inicio da listagem de programas]' then
                begin
                    if dtmPrincipal.tblProgramas.Locate('ID_Programa',tbGetShortStr(Memo2.Lines.Strings[i],'#'),[loPartialKey]) then
                    begin
                        dtmPrincipal.tblProgramas.Edit;
                    end
                    else
                    begin
                        dtmPrincipal.tblProgramas.Insert;
                    end;

                    dtmPrincipal.tblProgramasID_Programa.Value := tbGetShortStr(Memo2.Lines.Strings[i],'#');

                    aux2 := '0';
                    aux1 := '';
                    vNome := '';
                    vTitulo := '';
                    vVersao := '';
                    for a := 0 to Length(Memo2.Lines.Strings[i]) do
                    begin
                        if Copy(Memo2.Lines.Strings[i],a,1) = '#' then
                        begin
                            if aux2 = '0' then aux2 := '1' else
                            if aux2 = '1' then aux2 := '2' else
                            if aux2 = '2' then aux2 := '3';
                        end;

                        if Copy(Memo2.Lines.Strings[i],a,1) <> '#' then
                        begin
                            if aux2 = '1' then vNome := vNome + Copy(Memo2.Lines.Strings[i],a,1)     else
                            if aux2 = '2' then vTitulo := vTitulo + Copy(Memo2.Lines.Strings[i],a,1) else
                            if aux2 = '3' then vVersao := vVersao + Copy(Memo2.Lines.Strings[i],a,1);
                        end;

                    end;

                    dtmPrincipal.tblProgramasNome.Value := vNome;
                    dtmPrincipal.tblProgramasTitulo.Value := vTitulo;
                    dtmPrincipal.tblProgramasVersao.Value := vVersao;
                    dtmPrincipal.tblProgramas.Post;
                end;
            end;
        end;

        aux := '';
        if Memo2.Lines.Strings[2] = 'Comercial' then
        begin
            aux := Copy(ExtractFilePath(Application.ExeName),1,1);
            if SerialNum(aux) <> Memo2.Lines.Strings[4] then
            begin
                MessageDlg('A contra senha do sistema não é válida.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
                Application.Terminate;
            end;
        end;

    except
         MessageDlg('A chave de ativação não é válida.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
         Application.Terminate;
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    sVersao := '1.01';

    if ControleTabelas(0,'tblProgramas','Open') = True then dtmPrincipal.tblProgramas.Open;
    if ControleTabelas(0,'tblParametros','Open') = True then dtmPrincipal.tblParametros.Open;
    if ControleTabelas(0,'tblPermissoesUsuario','Open') = True then dtmPrincipal.tblPermissoesUsuario.Open;
    if ControleTabelas(0,'tblLogs','Open') = True then dtmPrincipal.tblLogs.Open;

    sParametro := dtmPrincipal.tblParametrosID_Parametro.Value;

    if frmLogin = nil then
    begin
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.ShowModal;
        FreeAndNil(frmLogin);
    end
    else
    begin
        MessageDlg('O formulário de login já está em uso.', mtWarning, [mbOK], 0);
    end;

    if sUsuario = 'Encerrar Aplicação' then
    begin
        Application.Terminate;
    end;

    if frmPrincipal.GerarChave1.Visible = False then
    begin
        VerificaChave;

        if vModulo1 = 1 then
        begin
            TabSheet1.Free;
            Sistema1.Free;
        end;

        if vModulo2 = 1 then
        begin
            TabSheet2.Free;
            Routeirizao1.Free;
        end;

        if vModulo3 = 1 then
        begin
            TabSheet3.Free;
            ControledePneus1.Free;
        end;

    end;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    dtmPrincipal.tblParametros.Locate('ID_Parametro',sParametro,[loPartialKey]);

    sBar.Panels[2].Text := 'Parâmetro: ' + sParametro;
    sBar.Panels[3].Text := 'Usuário: ' + sUsuario + ' - ' + sNomeUsuario;

    GeraLogs(Self.Name,'Abrir','S',0);
end;

procedure TfrmPrincipal.AbreForm(Formulario: TForm);
begin
    if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Temp')) then
    begin
        CreateDir(ExtractFilePath(Application.ExeName) + 'Temp');
    end;

    if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Imagens')) then
    begin
        CreateDir(ExtractFilePath(Application.ExeName) + 'Imagens');
    end;

    if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Relatorios')) then
    begin
        CreateDir(ExtractFilePath(Application.ExeName) + 'Relatorios');
    end;

    if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Parametros')) then
    begin
        CreateDir(ExtractFilePath(Application.ExeName) + 'Parametros');
    end;

    if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario)) then
    begin
        CreateDir(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario);
    end;

    if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\'+ Formulario.Name)) then
    begin
        CreateDir(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\'+ Formulario.Name);
    end;
end;

procedure TfrmPrincipal.OrdenaGrid(Tipo: Integer; Grid: TDBGrid; Coluna: TColumn; Formulario: TForm);
var
    i : integer;
begin
    AbreForm(Formulario);

    if Tipo = 0 then //clique no grid
    begin
        try
            TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).IndexFieldNames := Coluna.FieldName;

            for i := 0 to TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Count - 1 do
            begin
                if TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].Title.Caption = Coluna.Title.Caption then
                begin
                    TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].Title.Font.Color := clRed;
                end
                else
                begin
                    TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].Title.Font.Color := clWindowText;
                end;
            end;
        except
           MessageDlg('Esta coluna não pode ser ordenada.', mtInformation, [mbOK], 0);
        end;
    end;
end;

procedure TfrmPrincipal.SalvaGrid(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
begin
    AbreForm(Formulario);

    if Tipo = 0 then //Salva o arquivo de parametos
    begin
        if Grid.Name = 'grdFind' then
        begin
            Grid.Columns.SaveToFile(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\' + Formulario.Name + '\' + frmFind.Combo.Name + '.txt');
        end
        else
        begin
            Grid.Columns.SaveToFile(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\' + Formulario.Name + '\' + Grid.Name + '.txt');
        end;
    end;
end;

procedure TfrmPrincipal.PesqGrid(Tipo: Integer; Grid: TDBGrid; Formulario: TForm);
var
    i, aux : integer;
    Campo : string;
    MostraCampo : string;
begin
     AbreForm(Formulario);
     
     if tipo = 0 then // Formulário de pesquisa no Grid pelo campo ordenado
     begin
         aux := 0;
         for i := 0 to TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Count - 1 do
         begin
             if TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].Title.Font.Color = clRed then
             begin
                 aux := 1;
                 Campo := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].FieldName;
                 MostraCampo := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].Title.Caption;
             end;
         end;

         if aux = 0 then
         begin
             MessageDlg('Para pesquisar é necessário a ordenação de pelo menos um campo.', mtWarning, [mbOK], 0);
             Exit;
         end;

         if frmPesquisa = nil then
         begin
             if VerificaPermissao('L','frmPesquisa') = False then Exit;
             frmPesquisa := TfrmPesquisa.Create(Self);

             frmPesquisa.Tipo        := Tipo;
             frmPesquisa.Grid        := Grid;
             frmPesquisa.Formulario  := Formulario;
             frmPesquisa.Campo       := Campo;
             frmPesquisa.MostraCampo := MostraCampo;

             frmPesquisa.ShowModal;
             FreeAndNil(frmPesquisa);
         end
         else
         begin
             MessageDlg('O formulário de pesquisa já está em uso.', mtInformation, [mbOK], 0);
         end;
     end;
end;

procedure TfrmPrincipal.MostraReport(Tipo: Integer; Formulario: TForm);
begin
    if frmMostraReport = nil then
    begin
        if VerificaPermissao('L','frmMostraReport') = False then Exit;
        frmMostraReport := TfrmMostraReport.Create(Self);

        if ControleTabelas(0,'tblRelatorios','Open') = True then dtmPrincipal.tblRelatorios.Open;

        frmMostraReport.Tipo        := Tipo;
        frmMostraReport.Formulario  := Formulario;

        frmMostraReport.ShowModal;

        if ControleTabelas(0,'tblRelatorios','Close') = True then dtmPrincipal.tblRelatorios.Close;

        FreeAndNil(frmMostraReport);
    end
    else
    begin
        MessageDlg('O formulário de relatórios já está em uso.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.Exportar(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
var
     Excel, Planilha : OleVariant;
     i,a,j : integer;
     DS : TDataSource;
     DT : TDataSet;
     aux : integer;
begin
    try
        AbreForm(Formulario);
        if Tipo = 0 then // Exportar para Excell
        begin
            DS := Grid.DataSource;
            DT := DS.DataSet;

            Excel := CreateOleObject('Excel.Application');
            Excel.Visible := True;Excel.Workbooks.Add;
            Planilha := Excel.Workbooks[1].Sheets[1];

            for i:=0 to Grid.Columns.Count - 1 do
            begin
                Planilha.Cells.Item[1,i+1] := Grid.Columns[i].Title.Caption;
            end;

            DT.First;
            a:=2;
            while not DT.Eof do
            begin
                 for i:=0 to DT.FieldCount-1 do
                 begin
                     aux := 0;
                     for j:=0 to Grid.Columns.Count - 1 do
                     begin
                         if DT.Fields[i].FieldName = Grid.Columns[j].FieldName then
                         begin
                             aux := 1;
                             break;
                         end
                         else
                         begin
                             aux := 0;
                         end;
                     end;

                     if aux = 1 then
                     begin
                         Planilha.Cells.Item[a,j+1] := DT.Fields[i].AsString;
                     end;
                 end;
                 a:=a+1;
                 DT.Next;
            end;
        end;

        if Tipo = 1 then // Exportar para XML
        begin
            TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).SaveToFile(ExtractFilePath(Application.ExeName) + 'Temp\' + Grid.Name + '.xml',pfXML);
        end;

    except
        MessageDlg('Ocorreu um erro ao tentar exportar os dados.', mtError, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.LeGrid(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
var
    i : integer;
begin
    AbreForm(Formulario);

    if Tipo = 0 then //Le do arquivo de parametros
    begin
        if Grid.Name = 'grdFind' then
        begin
            try
                Grid.Columns.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\' + Formulario.Name + '\' + frmFind.Combo.Name + '.txt');
            except
            end;

            for i := 0 to TDBGrid(frmFind.FindComponent(Grid.Name)).Columns.Count - 1 do
            begin
                if TDBGrid(frmFind.FindComponent(Grid.Name)).Columns[i].Title.Font.Color = clRed then
                begin
                    try
                       TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).IndexFieldNames := TDBGrid(frmFind.FindComponent(Grid.Name)).Columns[i].FieldName;
                    except
                    end;
                end;
            end;
        end
        else
        begin
            try
                Grid.Columns.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\' + Formulario.Name + '\' + Grid.Name + '.txt');
            except
            end;

            for i := 0 to TDBGrid(Formulario.FindComponent(Grid.Name)).Columns.Count - 1 do
            begin
                if TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].Title.Font.Color = clRed then
                begin
                    try
                       TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).IndexFieldNames := TDBGrid(Formulario.FindComponent(Grid.Name)).Columns[i].FieldName;
                    except
                    end;
                end;
            end;
        end;
    end;
end;

procedure TfrmPrincipal.btnEncerrarClick(Sender: TObject);
begin
    close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if MessageDlg('Deseja realmente sair da aplicação', mtWarning, [mbYes,mbNo], 0) = mrYes then
    begin
        frmPrincipal.GeraLogs('frmPrincipal','Fechar','S',0);
        if ControleTabelas(0,'tblLogs','Close') = True then dtmPrincipal.tblLogs.Close;
        if ControleTabelas(0,'tblPermissoesUsuario','Close') = True then dtmPrincipal.tblPermissoesUsuario.Close;
        if ControleTabelas(0,'tblParametros','Close') = True then dtmPrincipal.tblParametros.Close;
        if ControleTabelas(0,'tblProgramas','Close') = True then dtmPrincipal.tblProgramas.Close;
        Action := caFree;
    end
    else
    begin
        Action := caNone;
    end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    sBar.Panels[1].Text := TimeToStr(Time);
end;

procedure TfrmPrincipal.FormPaint(Sender: TObject);
begin
    sBar.Panels[0].Text := DateToStr(Date);
end;

procedure TfrmPrincipal.GeraLogs(Formulario, Acao, Status: string; Tipo: integer);
begin
    if Tipo = 0 then
    begin
        if vGeraLog = 1 then
        begin
            dtmPrincipal.tblLogs.Insert;
            dtmPrincipal.tblLogsLocal.Value := Formulario;
            dtmPrincipal.tblLogsID_Usuario.Value := sUsuario;
            dtmPrincipal.tblLogsDt_Log.Value := Date;
            dtmPrincipal.tblLogsHr_Log.Value := Time;
            dtmPrincipal.tblLogsAcao.Value := Acao;
            dtmPrincipal.tblLogsAutorizado.Value := Status;
            dtmPrincipal.tblLogs.Post;
        end;
    end;

    if Tipo = 1 then
    begin
        if vGeraLog = 1 then
        begin
            dtmPrincipal.tblLogs.Insert;
            dtmPrincipal.tblLogsLocal.Value := Formulario;
            dtmPrincipal.tblLogsID_Usuario.Value := sUsuario;
            dtmPrincipal.tblLogsDt_Log.Value := Date;
            dtmPrincipal.tblLogsHr_Log.Value := Time;
            dtmPrincipal.tblLogsAcao.Value := Acao;
            dtmPrincipal.tblLogsAutorizado.Value := Status;
            dtmPrincipal.tblLogsAntes.Value := vAntes;
            dtmPrincipal.tblLogsDepois.Value := vDepois;
            dtmPrincipal.tblLogs.Post;
        end;
    end;
end;

procedure TfrmPrincipal.RestauraGrid(Tipo: Integer; Formulario: TForm);
var
    i : integer;
    SR: TSearchRec;
begin
    AbreForm(Formulario);
    if Tipo = 0 then //Restaurar as configuracoes originais
    begin
        I := FindFirst(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\' + Formulario.Name + '\*.*', faAnyFile, SR);

        while I = 0 do
        begin
            if (SR.Attr and faDirectory) <> faDirectory then DeleteFile(ExtractFilePath(Application.ExeName) + 'Parametros\' + sUsuario + '\' + Formulario.Name + '\' + SR.Name);
            I := FindNext(SR);
       end;
    end;
end;

procedure TfrmPrincipal.Report(Tipo: Integer; Layout: string);
begin
    if Tipo = 0 then
    begin
        if frmReport = nil then
        begin
            if VerificaPermissao('L','frmReport') = False then Exit;
            frmReport := TfrmReport.Create(Application);

            frmReport.ppReport1.Reset;
            frmReport.ppReport1.Template.FileName := Layout;
            frmReport.ppReport1.Template.LoadFromFile;
            frmReport.ppDesigner1.ShowModal;

            FreeAndNil(frmReport);
        end
        else
        begin
            MessageDlg('O formulário para designers de relatórios já está em uso.', mtInformation, [mbOK], 0);
        end;
     end;

    if Tipo = 1 then
    begin
        if frmReport = nil then
        begin
            if VerificaPermissao('L','frmReport') = False then Exit;
            frmReport := TfrmReport.Create(Application);

            frmReport.ppReport1.Reset;
            frmReport.ppReport1.Template.FileName := '';
            frmReport.ppDesigner1.ShowModal;

            FreeAndNil(frmReport);
        end
        else
        begin
            MessageDlg('O formulário para designers de relatórios já está em uso.', mtInformation, [mbOK], 0);
        end;
     end;

    if Tipo = 2 then
    begin
        if frmReport = nil then
        begin
            if VerificaPermissao('L','frmReport') = False then Exit;
            frmReport := TfrmReport.Create(Application);

            frmReport.ppReport1.Reset;
            frmReport.ppReport1.Template.FileName := Layout;
            frmReport.ppReport1.Template.LoadFromFile;
            frmReport.ppReport1.Print;

            FreeAndNil(frmReport);
        end
        else
        begin
            MessageDlg('O formulário para designers de relatórios já está em uso.', mtInformation, [mbOK], 0);
        end;
     end;
end;

procedure TfrmPrincipal.PersonalizaGrid(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
begin
    if Tipo = 0 then // Personalizar o Grid
    begin
        if frmPersonaliza = nil then
        begin
            if VerificaPermissao('L','frmPersonaliza') = False then Exit;
            frmPersonaliza := TfrmPersonaliza.Create(Application);

            frmPersonaliza.Tipo       := Tipo;
            frmPersonaliza.Grid       := Grid;
            frmPersonaliza.Formulario := Formulario;

            frmPersonaliza.ShowModal;
            FreeAndNil(frmPersonaliza);
        end;
     end
     else
     begin
         MessageDlg('O formulário para personalização de grids já está em uso.', mtInformation, [mbOK], 0);
     end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
    DelphiIni : TIniFile;
begin
    ShortDateFormat := 'dd/mm/yyyy';
    ShortTimeFormat := 'hh:mm:ss';

    if FileExists(ExtractFilePath(Application.ExeName)+'Router.ini') then
    begin
         DelphiIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Router.ini');

         if DelphiIni.ReadString('Gerais','Caminho da Base','ERROR') <> '' then
         begin
             sConexao := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DelphiIni.ReadString('Gerais','Caminho da Base','ERROR') + 'Dados.mdb;Persist Security Info=False';
         end
         else
         begin
             sConexao := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + ExtractFilePath(Application.ExeName) + 'Dados\Dados.mdb;Persist Security Info=False';
         end;

         if DelphiIni.ReadString('Gerais','GeraLog','ERROR') = 'TRUE' then vGeraLog := 1 else vGeraLog := 0;

         DelphiIni.Free;
    end
    else
    begin
        MessageDlg('O arquivo de inicialização do sistema não foi encontrado.'+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
        Application.Terminate;
    end;

    try
       dtmPrincipal := TdtmPrincipal.Create(Self);
       dtmPrincipal.bdDados.ConnectionString := frmPrincipal.sConexao;
       dtmPrincipal.bdDados.Connected := True;
       
       vIndice := 1;
       SetLength(vTabelas, vIndice);
       SetLength(vQuantidade, vIndice);
    except
       on E: Exception do
       begin
           MessageDlg(E.Message+#13+#10+'A aplicação será encerrada.', mtError, [mbOK], 0);
           Application.Terminate;
       end;
    end;
end;

procedure TfrmPrincipal.MostraSobre;
begin
    if frmSobre = nil then
    begin
        if VerificaPermissao('L','frmSobre') = False then Exit;
        frmSobre := TfrmSobre.Create(Self);
        frmSobre.ShowModal;
        FreeAndNil(frmSobre);
    end
    else
    begin
        MessageDlg('O formulário com informações sobre o sistema já está em uso.', mtWarning, [mbOK], 0);
    end;
end;

function VerificaPrograma(Tipo: Integer; Formulario: string) : String;
var
    aux : string;
begin
    if dtmPrincipal.tblProgramas.Locate('ID_Programa',Formulario,[loPartialKey]) then
    begin
        if Tipo = 0 then
        begin
            aux := dtmPrincipal.tblProgramasID_Programa.AsString + ' - ' +
                   dtmPrincipal.tblProgramasNome.AsString + ' - ' +
                   frmPrincipal.sVersao + '.' + dtmPrincipal.tblProgramasVersao.AsString;
        end;

        if Tipo = 1 then
        begin
            aux := dtmPrincipal.tblProgramasTitulo.AsString;
        end;

        if Tipo = 2 then
        begin
            aux := frmPrincipal.sVersao;
        end;

        Result := aux;
    end
    else
    begin
        Result := 'Programa não encontrado';
    end;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
    if frmUsuarios = nil then
    begin
        if VerificaPermissao('L','frmUsuarios') = False then Exit;
        frmUsuarios := TfrmUsuarios.Create(Self);
        if ControleTabelas(0,'tblUsuarios','Open') = True then dtmPrincipal.tblUsuarios.Open;
        frmUsuarios.ShowModal;
        if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
        FreeAndNil(frmUsuarios);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos usuários do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
    MostraSobre;
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmPrincipal.GerarChave1Click(Sender: TObject);
begin
    if frmGeraChave = nil then
    begin
        if VerificaPermissao('L','frmGeraChave') = False then Exit;
        frmGeraChave := TfrmGeraChave.Create(Self);
        frmGeraChave.ShowModal;
        FreeAndNil(frmGeraChave);
    end
    else
    begin
        MessageDlg('O formulário para geração da chave de ativação já está em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.ContraSenha1Click(Sender: TObject);
var
    F : TextFile;
    unidade : string;
begin
    unidade := Copy(ExtractFilePath(Application.ExeName),1,1);
    AssignFile(F,ExtractFilePath(Application.ExeName) + 'Contra.sec');
    Rewrite(F);
    WriteLn(F,EnDecryptString(SerialNum(unidade)));
    CloseFile(F);
    ShowMessage('Contra Senha gerada com sucesso no arquivo' + #10 + ExtractFilePath(Application.ExeName) + 'Contra.sec');
end;

Function SerialNum(FDrive:String) :String;
Var
   Serial:DWord;
   DirLen,Flags: DWord;
   DLabel : Array[0..11] of Char;
begin
    Try
       GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
       Result := IntToHex(Serial,8);
    Except
       Result :='';
    end;
end;

procedure TfrmPrincipal.InformaesSobraaChave1Click(Sender: TObject);
var
   aux1, aux2, aux3 : string;
begin
    if vModulo1 = 0 then aux1 := 'Ativo' else aux1 := 'Desativado';
    if vModulo2 = 0 then aux2 := 'Ativo' else aux2 := 'Desativado';
    if vModulo3 = 0 then aux3 := 'Ativo' else aux3 := 'Desativado';

    MessageDlg('CHAVE DE ATIVAÇÃO'+#13+#10+
               '================='+#13+#10+
               'Arquivo da Chave: ' + sChave_Arquivo +#13+#10+
               'Tipo de Chave: ' + sChave_Tipo +#13+#10+
               'Forma de Proteção: ' + sChave_Forma +#13+#10+
               'Valor da Proteção: ' + sChave_Valor +#13+#10+
               'Contra Senha: ' + sChave_Contra +#13+#10+
               'Versão da Chave: ' + sChave_Versao +#13+#10+
               'ID da Chave: ' + sChave_ID +#13+#10+
               'CRC da Chave: ' + sChave_CRC +#13+#10+ 
               '' +#13+#10+
               'Módulo Ativos' +#13+#10+
               '=============' +#13+#10+
               'Módulo Geral: ' + aux1 +#13+#10+
               'Roteirização e Programação de Veículos de Carga: ' + aux2 +#13+#10+
               'Controle e Gerenciamento de Pneus: ' + aux3,
               mtInformation, [mbOK], 0);
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
    if frmLogs = nil then
    begin
        if VerificaPermissao('L','frmLogs') = False then Exit;
        frmLogs := TfrmLogs.Create(Self);
        frmLogs.ShowModal;
        FreeAndNil(frmLogs);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos logs do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.AplicaFiltro(Tipo: Integer; Formulario: TForm; Grid: TDBGrid; Original: string);
var
    F : TextFile;
    i,a : integer;
    aux : string;
    filtro : string;
begin
    AbreForm(Formulario);

    if FileExists(ExtractFilePath(Application.ExeName) + 'Parametros\' + frmPrincipal.sUsuario + '\' + Formulario.Name + '\' + 'Filtro.txt') then
    begin
        AssignFile(F,ExtractFilePath(Application.ExeName) + 'Parametros\' + frmPrincipal.sUsuario + '\' + Formulario.Name + '\' + 'Filtro.txt');
        Reset(F);

        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
        end;

        aux := '';
        filtro := '';
        ReadLn(F,aux);
        a := StrToInt(aux);
        for i := 0 to a do
        begin
            ReadLn(F,aux);
            filtro := filtro + ' ' + aux;
        end;

        try
           TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filtered := False;
           if TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filter <> '' then
           begin
               if Filtro <> '' then
               begin
                   TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filter := TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filter + ' AND ' + filtro;
               end
               else
               begin
                   TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filter := Original;
               end;
           end
           else
           begin
               TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filter := filtro;
           end;
           TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Filtered := True;
        except
        end;

        CloseFile(F);
    end;
end;

procedure TfrmPrincipal.Filtro(Tipo: Integer; Formulario: TForm; Grid: TDBGrid);
begin
    if frmFiltro = nil then
    begin
        if VerificaPermissao('L','frmFiltro') = False then Exit;
        frmFiltro := TfrmFiltro.Create(Self);

        frmFiltro.Tipo        := Tipo;
        frmFiltro.Grid        := Grid;
        frmFiltro.Formulario  := Formulario;

        frmFiltro.ShowModal;
        FreeAndNil(frmFiltro);
    end
    else
    begin
        MessageDlg('O formulário de filtros do sistema já está em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
    if frmRelatorios = nil then
    begin
        if VerificaPermissao('L','frmRelatorios') = False then Exit;
        frmRelatorios := TfrmRelatorios.Create(Self);

        if ControleTabelas(0,'tblRelatorios','Open') = True then dtmPrincipal.tblRelatorios.Open;
        if ControleTabelas(0,'tblUsuarios','Open') = True then dtmPrincipal.tblUsuarios.Open;

        frmRelatorios.ShowModal;

        if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
        if ControleTabelas(0,'tblRelatorios','Close') = True then dtmPrincipal.tblRelatorios.Close;

        FreeAndNil(frmRelatorios);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos relatórios do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.Find(Tipo: Integer; Formulario: TForm; Combo: TDBLookupComboBox; Filtro: String);
begin
    if Tipo = 0 then // Inicializar formulário de localização
    begin
        if frmFind = nil then
        begin
            frmFind := TfrmFind.Create(Application);

            frmFind.Tipo := Tipo;
            frmFind.Formulario := Formulario;
            frmFind.Combo := Combo;
            frmFind.Filtro := Filtro;

            frmFind.ShowModal;

            FreeAndNil(frmFind);
        end
        else
        begin
            MessageDlg('O formulário de localização já está em uso.', mtInformation, [mbOK], 0);
        end;
    end;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
    if frmProgramas = nil then
    begin
        if VerificaPermissao('L','frmProgramas') = False then Exit;
        frmProgramas := TfrmProgramas.Create(Self);
        frmProgramas.ShowModal;
        FreeAndNil(frmProgramas);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos programas do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

function ControleTabelas(Tipo: integer; Tabela, Operacao: string): boolean;
var
    i : integer;
    po : integer;
    aux : integer;
begin
    aux := 1;
    po := -1;

    if Operacao = 'Open' then
    begin
        for i := 0 to vIndice - 1 do
        begin
            if vTabelas[i] = Tabela then
            begin
                po := i;
            end;
        end;

        if po <> -1 then
        begin
            if vQuantidade[po] > 0 then
            begin
                vQuantidade[po] := vQuantidade[po] + 1;
                aux := 0;
            end
            else
            begin
                vQuantidade[po] := 1;
                aux := 1;
            end;
        end
        else
        begin
            vQuantidade[vIndice - 1] := 1;
            vTabelas[vIndice - 1] := Tabela;

            vIndice := vIndice + 1;

            SetLength(vTabelas, vIndice);
            SetLength(vQuantidade, vIndice);

            aux := 1;
        end;
    end;

    if Operacao = 'Close' then
    begin
        for i := 0 to vIndice - 1 do
        begin
            if vTabelas[i] = Tabela then
            begin
                po := i;
            end;
        end;

        if po <> -1 then
        begin
            if vQuantidade[po] > 1 then
            begin
                vQuantidade[po] := vQuantidade[po] - 1;
                aux := 0;
            end
            else
            begin
                vQuantidade[po] := 0;
                aux := 1;
            end;
        end
        else
        begin
            aux := 1;
        end;
    end;

    if aux = 0 then
    begin
        Result := False;
    end
    else
    begin
        Result := True;
    end;
end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
    if frmParametros = nil then
    begin
        if VerificaPermissao('L','frmParametros') = False then Exit;
        frmParametros := TfrmParametros.Create(Self);
        frmParametros.ShowModal;
        FreeAndNil(frmParametros);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos parâmetros do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton8Click(Sender: TObject);
begin
    if frmLocais = nil then
    begin
        if VerificaPermissao('L','frmLocais') = False then Exit;
        frmLocais := TfrmLocais.Create(Self);

        if ControleTabelas(0,'tblVeiculos','Open') = True then dtmPrincipal.tblVeiculos.Open;
        if ControleTabelas(0,'tblLocais','Open') = True then dtmPrincipal.tblLocais.Open;
        if ControleTabelas(0,'tblParadasVeiculo','Open') = True then dtmPrincipal.tblParadasVeiculo.Open;

        frmLocais.ShowModal;

        if ControleTabelas(0,'tblParadasVeiculo','Close') = True then dtmPrincipal.tblParadasVeiculo.Close;
        if ControleTabelas(0,'tblLocais','Close') = True then dtmPrincipal.tblLocais.Close;
        if ControleTabelas(0,'tblVeiculos','Close') = True then dtmPrincipal.tblVeiculos.Close;

        FreeAndNil(frmLocais);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos locais já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton9Click(Sender: TObject);
begin
    if frmTiposCaminho = nil then
    begin
        if VerificaPermissao('L','frmTiposCaminho') = False then Exit;
        frmTiposCaminho := TfrmTiposCaminho.Create(Self);
        if ControleTabelas(0,'tblTiposCaminho','Open') = True then dtmPrincipal.tblTiposCaminho.Open;
        frmTiposCaminho.ShowModal;
        if ControleTabelas(0,'tblTiposCaminho','Close') = True then dtmPrincipal.tblTiposCaminho.Close;
        FreeAndNil(frmTiposCaminho);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos tipos de caminho já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton10Click(Sender: TObject);
begin
    if frmLigacoes = nil then
    begin
        if VerificaPermissao('L','frmLigacoes') = False then Exit;
        frmLigacoes := TfrmLigacoes.Create(Self);

        if ControleTabelas(0,'tblLocais','Open') = True then dtmPrincipal.tblLocais.Open;
        if ControleTabelas(0,'tblTiposCaminho','Open') = True then dtmPrincipal.tblTiposCaminho.Open;
        if ControleTabelas(0,'tblLigacoes','Open') = True then dtmPrincipal.tblLigacoes.Open;
        if ControleTabelas(0,'tblLigacoesVeiculo','Open') = True then dtmPrincipal.tblLigacoesVeiculo.Open;

        frmLigacoes.ShowModal;

                if ControleTabelas(0,'tblLigacoesVeiculo','Close') = True then dtmPrincipal.tblLigacoesVeiculo.Close;
        if ControleTabelas(0,'tblLigacoes','Close') = True then dtmPrincipal.tblLigacoes.Close;
        if ControleTabelas(0,'tblTiposCaminho','Close') = True then dtmPrincipal.tblTiposCaminho.Close;
        if ControleTabelas(0,'tblLocais','Close') = True then dtmPrincipal.tblLocais.Close;

        FreeAndNil(frmLigacoes);
    end
    else
    begin
        MessageDlg('O formulário para manutenção das ligações entre locais já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton11Click(Sender: TObject);
begin
    if frmEntregas = nil then
    begin
        if VerificaPermissao('L','frmEntregas') = False then Exit;
        frmEntregas := TfrmEntregas.Create(Self);
        if ControleTabelas(0,'tblLocais','Open') = True then dtmPrincipal.tblLocais.Open;
        if ControleTabelas(0,'tblEntregas','Open') = True then dtmPrincipal.tblEntregas.Open;
        if ControleTabelas(0,'tblCargas','Open') = True then dtmPrincipal.tblCargas.Open;
        frmEntregas.ShowModal;
        if ControleTabelas(0,'tblLocais','Close') = True then dtmPrincipal.tblLocais.Close;
        if ControleTabelas(0,'tblEntregas','Close') = True then dtmPrincipal.tblEntregas.Close;
        if ControleTabelas(0,'tblCargas','Close') = True then dtmPrincipal.tblCargas.Close;
        FreeAndNil(frmEntregas);
    end
    else
    begin
        MessageDlg('O formulário para manutenção das entregas já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton12Click(Sender: TObject);
begin
    if frmVeiculos = nil then
    begin
        if VerificaPermissao('L','frmVeiculos') = False then Exit;
        frmVeiculos := TfrmVeiculos.Create(Self);
        if ControleTabelas(0,'tblVeiculos','Open') = True then dtmPrincipal.tblVeiculos.Open;
        frmVeiculos.ShowModal;
        if ControleTabelas(0,'tblVeiculos','Close') = True then dtmPrincipal.tblVeiculos.Close;
        FreeAndNil(frmVeiculos);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos veículos já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton13Click(Sender: TObject);
begin
    if frmGanhos = nil then
    begin
        if VerificaPermissao('L','frmGanhos') = False then Exit;
        frmGanhos := TfrmGanhos.Create(Self);
        if ControleTabelas(0,'tblLocais','Open') = True then dtmPrincipal.tblLocais.Open;
        if ControleTabelas(0,'tblParadasVeiculo','Open') = True then dtmPrincipal.tblParadasVeiculo.Open;
        if ControleTabelas(0,'tblVeiculos','Open') = True then dtmPrincipal.tblVeiculos.Open;
        if ControleTabelas(0,'tblGanhos','Open') = True then dtmPrincipal.tblGanhos.Open;
        if ControleTabelas(0,'tblLigacoes','Open') = True then dtmPrincipal.tblLigacoes.Open;
        if ControleTabelas(0,'tblLigacoesVeiculo','Open') = True then dtmPrincipal.tblLigacoesVeiculo.Open;
        if ControleTabelas(0,'tblRotasGanhoDistancia','Open') = True then dtmPrincipal.tblRotasGanhoDistancia.Open;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMinima','Open') = True then dtmPrincipal.tblRotasGanhoVelocidadeMinima.Open;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMaxima','Open') = True then dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Open;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMedia','Open') = True then dtmPrincipal.tblRotasGanhoVelocidadeMedia.Open;
        if ControleTabelas(0,'tblRotasGanhoCustoMinimo','Open') = True then dtmPrincipal.tblRotasGanhoCustoMinimo.Open;
        if ControleTabelas(0,'tblRotasGanhoCustoMaximo','Open') = True then dtmPrincipal.tblRotasGanhoCustoMaximo.Open;
        if ControleTabelas(0,'tblRotasGanhoCustoMedio','Open') = True then dtmPrincipal.tblRotasGanhoCustoMedio.Open;
        if ControleTabelas(0,'tblOtimizacoes','Open') = True then dtmPrincipal.tblOtimizacoes.Open;
        frmGanhos.ShowModal;
        if ControleTabelas(0,'tblOtimizacoes','Close') = True then dtmPrincipal.tblOtimizacoes.Close;
        if ControleTabelas(0,'tblRotasGanhoDistancia','Close') = True then dtmPrincipal.tblRotasGanhoDistancia.Close;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMinima','Close') = True then dtmPrincipal.tblRotasGanhoVelocidadeMinima.Close;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMaxima','Close') = True then dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Close;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMedia','Close') = True then dtmPrincipal.tblRotasGanhoVelocidadeMedia.Close;
        if ControleTabelas(0,'tblRotasGanhoCustoMinimo','Close') = True then dtmPrincipal.tblRotasGanhoCustoMinimo.Close;
        if ControleTabelas(0,'tblRotasGanhoCustoMaximo','Close') = True then dtmPrincipal.tblRotasGanhoCustoMaximo.Close;
        if ControleTabelas(0,'tblRotasGanhoCustoMedio','Close') = True then dtmPrincipal.tblRotasGanhoCustoMedio.Close;
        if ControleTabelas(0,'tblLigacoesVeiculo','Close') = True then dtmPrincipal.tblLigacoesVeiculo.Close;
        if ControleTabelas(0,'tblLigacoes','Close') = True then dtmPrincipal.tblLigacoes.Close;
        if ControleTabelas(0,'tblGanhos','Close') = True then dtmPrincipal.tblGanhos.Close;
        if ControleTabelas(0,'tblVeiculos','Close') = True then dtmPrincipal.tblVeiculos.Close;
        if ControleTabelas(0,'tblParadasVeiculo','Close') = True then dtmPrincipal.tblParadasVeiculo.Close;
        if ControleTabelas(0,'tblLocais','Close') = True then dtmPrincipal.tblLocais.Close;
        FreeAndNil(frmGanhos);
    end
    else
    begin
        MessageDlg('O formulário para manutenção da matriz de ganhos já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton14Click(Sender: TObject);
begin
    if frmCargas = nil then
    begin
        if VerificaPermissao('L','frmCargas') = False then Exit;
        frmCargas := TfrmCargas.Create(Self);

        if ControleTabelas(0,'tblCargas','Open') = True then dtmPrincipal.tblCargas.Open;
        if ControleTabelas(0,'tblVeiculos','Open') = True then dtmPrincipal.tblVeiculos.Open;
        if ControleTabelas(0,'tblLocais','Open') = True then dtmPrincipal.tblLocais.Open;
        if ControleTabelas(0,'tblEntregas','Open') = True then dtmPrincipal.tblEntregas.Open;
        if ControleTabelas(0,'tblGanhos','Open') = True then dtmPrincipal.tblGanhos.Open;
        if ControleTabelas(0,'tblLigacoes','Open') = True then dtmPrincipal.tblLigacoes.Open;
        if ControleTabelas(0,'tblLigacoesVeiculo','Open') = True then dtmPrincipal.tblLigacoesVeiculo.Open;
        if ControleTabelas(0,'tblCargasPontos','Open') = True then dtmPrincipal.tblCargasPontos.Open;

        if ControleTabelas(0,'tblRotasGanhoDistancia','Open') = True then dtmPrincipal.tblRotasGanhoDistancia.Open;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMinima','Open') = True then dtmPrincipal.tblRotasGanhoVelocidadeMinima.Open;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMaxima','Open') = True then dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Open;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMedia','Open') = True then dtmPrincipal.tblRotasGanhoVelocidadeMedia.Open;
        if ControleTabelas(0,'tblRotasGanhoCustoMinimo','Open') = True then dtmPrincipal.tblRotasGanhoCustoMinimo.Open;
        if ControleTabelas(0,'tblRotasGanhoCustoMaximo','Open') = True then dtmPrincipal.tblRotasGanhoCustoMaximo.Open;
        if ControleTabelas(0,'tblRotasGanhoCustoMedio','Open') = True then dtmPrincipal.tblRotasGanhoCustoMedio.Open;
        if ControleTabelas(0,'tblOtimizacoes','Open') = True then dtmPrincipal.tblOtimizacoes.Open;

        frmCargas.ShowModal;

        if ControleTabelas(0,'tblOtimizacoes','Close') = True then dtmPrincipal.tblOtimizacoes.Close;
        if ControleTabelas(0,'tblRotasGanhoDistancia','Close') = True then dtmPrincipal.tblRotasGanhoDistancia.Close;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMinima','Close') = True then dtmPrincipal.tblRotasGanhoVelocidadeMinima.Close;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMaxima','Close') = True then dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Close;
        if ControleTabelas(0,'tblRotasGanhoVelocidadeMedia','Close') = True then dtmPrincipal.tblRotasGanhoVelocidadeMedia.Close;
        if ControleTabelas(0,'tblRotasGanhoCustoMinimo','Close') = True then dtmPrincipal.tblRotasGanhoCustoMinimo.Close;
        if ControleTabelas(0,'tblRotasGanhoCustoMaximo','Close') = True then dtmPrincipal.tblRotasGanhoCustoMaximo.Close;
        if ControleTabelas(0,'tblRotasGanhoCustoMedio','Close') = True then dtmPrincipal.tblRotasGanhoCustoMedio.Close;

        if ControleTabelas(0,'tblCargasPontos','Close') = True then dtmPrincipal.tblCargasPontos.Close;
        if ControleTabelas(0,'tblGanhos','Close') = True then dtmPrincipal.tblGanhos.Close;
        if ControleTabelas(0,'tblLigacoes','Close') = True then dtmPrincipal.tblLigacoes.Close;
        if ControleTabelas(0,'tblLigacoesVeiculo','Close') = True then dtmPrincipal.tblLigacoesVeiculo.Close;
        if ControleTabelas(0,'tblEntregas','Close') = True then dtmPrincipal.tblEntregas.Close;
        if ControleTabelas(0,'tblCargas','Close') = True then dtmPrincipal.tblCargas.Close;
        if ControleTabelas(0,'tblVeiculos','Close') = True then dtmPrincipal.tblVeiculos.Close;
        if ControleTabelas(0,'tblLocais','Close') = True then dtmPrincipal.tblLocais.Close;

        FreeAndNil(frmCargas);
    end
    else
    begin
        MessageDlg('O formulário para manutenção das cargas já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.SpeedButton16Click(Sender: TObject);
begin
    if frmPneus = nil then
    begin
        if VerificaPermissao('L','frmPneus') = False then Exit;
        frmPneus := TfrmPneus.Create(Self);
        if ControleTabelas(0,'tblPneus','Open') = True then dtmPrincipal.tblPneus.Open;
        frmPneus.ShowModal;
        if ControleTabelas(0,'tblPneus','Close') = True then dtmPrincipal.tblPneus.Close;
        FreeAndNil(frmPneus);
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos pneus já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

end.
