unit uGanhos;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls, ADODB;

type
  TfrmGanhos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Usurios1: TMenuItem;
    FecharFormulrio1: TMenuItem;
    Panel3: TPanel;
    JLabel1: TJLabel;
    JLabel2: TJLabel;
    JLabel3: TJLabel;
    Ajuda1: TMenuItem;
    AjudadoSistema1: TMenuItem;
    SobreoSistema1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    btnAnterior: TDBSpeedButton;
    btnProximo: TDBSpeedButton;
    btnRefresh: TDBSpeedButton;
    btnFirst: TDBSpeedButton;
    btnUltimo: TDBSpeedButton;
    grdGanhos: TDBGrid;
    btnRelatorios: TDBSpeedButton;
    btnProcurar: TDBSpeedButton;
    btnExportar: TDBSpeedButton;
    mnuExportar: TPopupMenu;
    ExportarparaExcell1: TMenuItem;
    ExportarparaXML1: TMenuItem;
    btnPersonalizar: TDBSpeedButton;
    mnuPersonalizar: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    btnFiltro: TDBSpeedButton;
    Consulta1: TMenuItem;
    Procurar1: TMenuItem;
    Filtrar1: TMenuItem;
    Personalizar1: TMenuItem;
    PersonalizaroGrid1: TMenuItem;
    RestauraroGrid1: TMenuItem;
    Exportar1: TMenuItem;
    ExportarparaoExcell1: TMenuItem;
    ExportarparaXML2: TMenuItem;
    Relatrios1: TMenuItem;
    N1: TMenuItem;
    Primeiro1: TMenuItem;
    Anterior1: TMenuItem;
    Prximo1: TMenuItem;
    ltimo1: TMenuItem;
    Atualizar1: TMenuItem;
    N2: TMenuItem;
    JLabel5: TJLabel;
    CalcularGanhos1: TMenuItem;
    ADOTable1: TADOTable;
    qryAux: TADOQuery;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    btnInserir: TDBSpeedButton;
    btnExcluir: TDBSpeedButton;
    btnAlterar: TDBSpeedButton;
    btnConfirmar: TDBSpeedButton;
    btnCancelar: TDBSpeedButton;
    btnAtualizar: TDBSpeedButton;
    JLabel6: TJLabel;
    qryRotas: TADOQuery;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    DBGrid2: TDBGrid;
    dbSBtnNew: TDBSpeedButton;
    dbSBtnDelete: TDBSpeedButton;
    dbSBtnEdit: TDBSpeedButton;
    dbSBtnRefresh: TDBSpeedButton;
    dbSBtnCancel: TDBSpeedButton;
    dbSBtnSave: TDBSpeedButton;
    JLabel7: TJLabel;
    DBGrid3: TDBGrid;
    dbSBtnNew1: TDBSpeedButton;
    dbSBtnDelete1: TDBSpeedButton;
    dbSBtnEdit1: TDBSpeedButton;
    dbSBtnRefresh1: TDBSpeedButton;
    dbSBtnCancel1: TDBSpeedButton;
    dbSBtnSave1: TDBSpeedButton;
    JLabel8: TJLabel;
    DBGrid4: TDBGrid;
    dbSBtnNew2: TDBSpeedButton;
    dbSBtnDelete2: TDBSpeedButton;
    dbSBtnEdit2: TDBSpeedButton;
    dbSBtnRefresh2: TDBSpeedButton;
    dbSBtnCancel2: TDBSpeedButton;
    dbSBtnSave2: TDBSpeedButton;
    JLabel9: TJLabel;
    DBGrid8: TDBGrid;
    dbSBtnNew6: TDBSpeedButton;
    dbSBtnDelete6: TDBSpeedButton;
    dbSBtnEdit6: TDBSpeedButton;
    dbSBtnRefresh6: TDBSpeedButton;
    dbSBtnCancel6: TDBSpeedButton;
    dbSBtnSave6: TDBSpeedButton;
    JLabel13: TJLabel;
    DBGrid9: TDBGrid;
    dbSBtnNew7: TDBSpeedButton;
    dbSBtnDelete7: TDBSpeedButton;
    dbSBtnEdit7: TDBSpeedButton;
    dbSBtnRefresh7: TDBSpeedButton;
    dbSBtnCancel7: TDBSpeedButton;
    dbSBtnSave7: TDBSpeedButton;
    JLabel14: TJLabel;
    DBGrid10: TDBGrid;
    dbSBtnNew8: TDBSpeedButton;
    dbSBtnDelete8: TDBSpeedButton;
    dbSBtnEdit8: TDBSpeedButton;
    dbSBtnRefresh8: TDBSpeedButton;
    dbSBtnCancel8: TDBSpeedButton;
    dbSBtnSave8: TDBSpeedButton;
    JLabel15: TJLabel;
    ADOTable2: TADOTable;
    JLabel16: TJLabel;
    RotasOtimizadas1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GanhosDistancia;
    procedure FormShow(Sender: TObject);
    procedure JLabel1Click(Sender: TObject);
    procedure JLabel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel3Click(Sender: TObject);
    procedure JLabel2Click(Sender: TObject);
    procedure grdGanhosTitleClick(Column: TColumn);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure ExportarparaExcell1Click(Sender: TObject);
    procedure ExportarparaXML1Click(Sender: TObject);
    procedure btnPersonalizarClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure Primeiro1Click(Sender: TObject);
    procedure GanhosCustoMinimo;
    procedure GanhosCustoMaximo;
    procedure GanhosCustoMedio;
    procedure GanhosVelocidadeMinima;
    procedure GanhosVelocidadeMaxima;
    procedure GanhosVelocidadeMedia;
    procedure RotasOtimizadas;
    procedure Anterior1Click(Sender: TObject);
    procedure Prximo1Click(Sender: TObject);
    procedure ltimo1Click(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure btnFirstEnabledChanged(Sender: TObject);
    procedure btnProcurarEnabledChanged(Sender: TObject);
    procedure btnFiltroEnabledChanged(Sender: TObject);
    procedure btnPersonalizarEnabledChanged(Sender: TObject);
    procedure btnExportarEnabledChanged(Sender: TObject);
    procedure btnRelatoriosEnabledChanged(Sender: TObject);
    procedure btnAnteriorEnabledChanged(Sender: TObject);
    procedure btnProximoEnabledChanged(Sender: TObject);
    procedure btnUltimoEnabledChanged(Sender: TObject);
    procedure btnRefreshEnabledChanged(Sender: TObject);
    procedure btnInserirBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure btnExcluirBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure btnAlterarBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel5Click(Sender: TObject);
    procedure JLabel6Click(Sender: TObject);
    procedure JLabel6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel7Click(Sender: TObject);
    procedure JLabel7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel8Click(Sender: TObject);
    procedure JLabel8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel9Click(Sender: TObject);
    procedure JLabel9MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel13Click(Sender: TObject);
    procedure JLabel13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel14Click(Sender: TObject);
    procedure JLabel14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel15Click(Sender: TObject);
    procedure JLabel15MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel16MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGanhos: TfrmGanhos;
  vGeraLog_ant : integer;
  vV : array of string;
  vV1 : array of double;
  vV2 : array of string;
  vF : array of string;
  vF1 : array of double;
  vF2 : array of string;

  vR : array of string;

  vF_aux : array of string;
  vF1_aux : array of double;
  vF2_aux : array of string;

  vD : array of string;
  vD1 : array of integer;

implementation

uses uModule, uPrincipal, uPermissoes, uMostra, uMapa, uLocais,
  uCalcGanhos, uOtimizacoes;

{$R *.dfm}

procedure TfrmGanhos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmGanhos.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmGanhos,grdGanhos,'');
    frmPrincipal.LeGrid(0,frmGanhos,grdGanhos);

    dtmPrincipal.tblGanhos.First;
end;

procedure TfrmGanhos.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmGanhos,grdGanhos);
    close;
end;

procedure TfrmGanhos.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmGanhos.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmGanhos.grdGanhosTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdGanhos, Column, frmGanhos);
end;

procedure TfrmGanhos.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdGanhos,frmGanhos);
end;

procedure TfrmGanhos.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmGanhos.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmGanhos, grdGanhos);
end;

procedure TfrmGanhos.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmGanhos, grdGanhos);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmGanhos.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmGanhos.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmGanhos,grdGanhos);
end;

procedure TfrmGanhos.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmGanhos);
    Close;
end;

procedure TfrmGanhos.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblGanhos.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        AllowChange := False;
    end;

    if PageControl1.ActivePage.Caption = 'Consulta' then
    begin
        Consulta1.Enabled := False;
    end
    else
    begin
        Consulta1.Enabled := True;
    end;
end;

procedure TfrmGanhos.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmGanhos,grdGanhos);
    frmPrincipal.AplicaFiltro(0,frmGanhos,grdGanhos,'');
end;

procedure TfrmGanhos.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmGanhos);
end;

procedure TfrmGanhos.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmGanhos.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmGanhos.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmGanhos.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmGanhos.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmGanhos.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmGanhos.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmGanhos.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmGanhos.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmGanhos.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmGanhos.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmGanhos.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmGanhos.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmGanhos.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmGanhos.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmGanhos.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmGanhos') = False then ActionIsDone := True;
end;

procedure TfrmGanhos.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmGanhos') = False then ActionIsDone := True;
end;

procedure TfrmGanhos.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmGanhos') = False then ActionIsDone := True;
end;

procedure TfrmGanhos.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmGanhos.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmGanhos.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmGanhos.JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel5 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.GanhosDistancia;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 8 de 15 - Calculando os ganhos em função da distância.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    // Ganhos por Distancia
    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;

        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, Distancia FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, Distancia FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não te solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorDistancia.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorDistancia.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoDistancia.Insert;
                        dtmPrincipal.tblRotasGanhoDistanciaID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoDistanciaSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoDistancia.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            qryAux.SQL.Clear;
                            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, Distancia FROM Ligacoes');
                            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                            qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            qryAux.SQL.Clear;
                            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, Distancia FROM Ligacoes');
                            qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.GanhosCustoMinimo;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 9 de 15 - Calculando os ganhos em função do custo mínimo.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;
        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end;
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end;
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não tem solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorCustoMinimo.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorCustoMinimo.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoCustoMinimo.Insert;
                        dtmPrincipal.tblRotasGanhoCustoMinimoID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoCustoMinimoSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoCustoMinimo.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end;
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMinimo, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end;
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.GanhosCustoMaximo;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 10 de 15 - Calculando os ganhos em função do custo máximo.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;
        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end;
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end;
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não tem solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorCustoMaximo.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorCustoMaximo.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoCustoMaximo.Insert;
                        dtmPrincipal.tblRotasGanhoCustoMaximoID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoCustoMaximoSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoCustoMaximo.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end;
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMaximo, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end;
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.GanhosCustoMedio;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 11 de 15 - Calculando os ganhos em função do custo médio.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;
        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end;
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end;
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não tem solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorCustoMedio.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorCustoMedio.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoCustoMedio.Insert;
                        dtmPrincipal.tblRotasGanhoCustoMedioID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoCustoMedioSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoCustoMedio.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end;
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, CustoMedio, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end;
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.GanhosVelocidadeMinima;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 12 de 15 - Calculando os ganhos em função da velocidade mínima.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;
        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end;
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end;
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não tem solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorVelocidadeMinima.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorVelocidadeMinima.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoVelocidadeMinima.Insert;
                        dtmPrincipal.tblRotasGanhoVelocidadeMinimaID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoVelocidadeMinimaSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoVelocidadeMinima.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end;
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMinima, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end;
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.GanhosVelocidadeMaxima;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 13 de 15 - Calculando os ganhos em função da velocidade máxima.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;
        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end;
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end;
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não tem solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Insert;
                        dtmPrincipal.tblRotasGanhoVelocidadeMaximaID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoVelocidadeMaximaSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end;
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMaxima, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end;
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.GanhosVelocidadeMedia;
var
    i,b,a,c,d,aux,iProx,iFim,iPara,iColoca,iCont : integer;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 14 de 15 - Calculando os ganhos em função da velocidade média.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    // Incialização dos vetores
    SetLength(vV,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vV2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vR,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF1_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vF2_aux,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD,dtmPrincipal.tblLocais.RecordCount);
    SetLength(vD1,dtmPrincipal.tblLocais.RecordCount);

    dtmPrincipal.tblGanhos.First;
    while not dtmPrincipal.tblGanhos.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        iCont := 0;
        if iCont = 0 then
        begin
            // Inicialização dos vetor com valores nulos;
            for i := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
            begin
                vV[i]  := '';
                vV1[i] := -1;
                vV2[i] := '';
                vR[i]  := '';
                vF[i]  := '';
                vF1[i] := -1;
                vF2[i] := '';

                vF_aux[i] := '';
                vF1_aux[i] := -1;
                vF2_aux[i] := '';

                vD[i]  := '';
                vD1[i] := -1;
            end;

            // Inicializando o vetor de visitados
            vV[0] := dtmPrincipal.tblGanhosID_LocalOrigem.Value;
            vV1[0] := 0;
            vV2[0] := '0';

            // Inicializado o vetor de candidados
            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
            end;
            qryAux.Open;
            i := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[1].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia FROM Ligacoes');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end
            else
            begin
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia, ID_Veiculo FROM LigacoesVeiculo');
                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[0] + #39);
                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            end;
            qryAux.Open;
            qryAux.First;
            while not qryAux.Eof do
            begin
                vF[i] := qryAux.Fields[0].Value;
                vF1[i] := qryAux.Fields[3].Value;
                vF2[i] := vV[0];
                i := i + 1;
                qryAux.Next;
            end;
            qryAux.Close;

            // Inicializado o vetor de não visitados
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_Local FROM Locais');
            qryAux.Open;
            a := 0;
            qryAux.First;
            while not qryAux.Eof do
            begin
                aux := 0;

                if vV[0] <> qryAux.Fields[0].Value then
                begin
                    for b := 0 to i - 1 do
                    begin
                        if vF[b] = qryAux.Fields[0].Value then
                        begin
                            aux := 1;
                        end;
                    end;

                    if aux = 0 then
                    begin
                        vD[a] := qryAux.Fields[0].Value;
                        a := a + 1;
                    end;
                end;

                qryAux.Next;
            end;
            qryAux.Close;

            iFim := 0;
            while iFim <> 1 do
            begin
            // laco de repeticao do algoritmo
            // para quando o nó destino cheque ao vetor V ou
            // quando não há mais nodos no conjunto F

                aux := 0;
                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                begin
                    if vF[a] <> '' then
                    begin
                        aux := 1;
                    end;
                end;

                // Não tem solução
                if aux = 0 then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorVelocidadeMedia.Value := 0;
                    dtmPrincipal.tblGanhos.Post;

                    iFim := 1;
                end;

                //Escolha do próximo a ser visitado
                iProx := -1;
                i := 0;
                while vF1[i] <> -1 do
                begin
                    if iProx = -1 then
                    begin
                        iProx := i;
                    end
                    else
                    begin
                        if vF1[i] <= vF1[iProx] then
                        begin
                            iProx := i;
                        end;
                    end;
                    i := i + 1;
                end;

                i := 1;
                c := 0;
                if vF[iProx] = dtmPrincipal.tblGanhosID_LocalDestino.Value then
                begin
                    dtmPrincipal.tblGanhos.Edit;
                    dtmPrincipal.tblGanhosValorVelocidadeMedia.Value := vF1[iProx];
                    dtmPrincipal.tblGanhos.Post;

                    vR[c] := vF[iProx];
                    c := c + 1;
                    i := i + 1;

                    while vF2[iProx] <> '0' do
                    begin
                        for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                        begin
                            if vV[a] = vF2[iProx] then
                            begin
                                vR[c] := vV[a];
                                c := c + 1;
                                i := i + 1;
                                vF2[iProx] := vV2[a];
                            end;
                        end;
                    end;

                    i := i - 1;

                    for b := 0 to c - 1 do
                    begin
                        dtmPrincipal.tblRotasGanhoVelocidadeMedia.Insert;
                        dtmPrincipal.tblRotasGanhoVelocidadeMediaID_Local.Value := vR[b];
                        dtmPrincipal.tblRotasGanhoVelocidadeMediaSequencia.Value := i;
                        dtmPrincipal.tblRotasGanhoVelocidadeMedia.Post;
                        i := i - 1;
                    end;

                    iFim := 1;
                end;

                // ajustar vetores
                if iFim <> 1 then
                begin
                    i := 0;
                    iPara := 0;
                    while iPara <> 1 do
                    begin
                        if vV[i] = '' then
                        begin
                            vV[i] := vF[iProx];
                            vV1[i] := vF1[iProx];
                            vV2[i] := vF2[iProx];

                            vF[iProx] := '';
                            vF1[iProx] := -1;
                            vF2[iProx] := '';

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vF_aux[a] := '';
                                vF1_aux[a] := -1;
                                vF2_aux[a] := '';
                            end;

                            b := 0;
                            aux := 0;
                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                aux := 0;
                                if vF[a] <> '' then
                                begin
                                    vF_aux[b] := vF[a];
                                    aux := 1;
                                end;

                                if vF1[a] <> -1 then
                                begin
                                    vF1_aux[b] := vF1[a];
                                    aux := 1;
                                end;

                                if vF2[a] <> '' then
                                begin
                                    vF2_aux[b] := vF2[a];
                                    aux := 1;
                                end;

                                if aux = 1 then
                                begin
                                    b := b + 1;
                                end;
                            end;

                            for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                 vF[a]  := vF_aux[a];
                                 vF1[a] := vF1_aux[a];
                                 vF2[a] := vF2_aux[a];
                            end;

                            iPara := 1;

                            // Inicializado o vetor de candidados
                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
                            end;
                            qryAux.Open;

                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[1].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[1].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[1].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            if dtmPrincipal.tblGanhosID_Veiculo.Value = 'Sistema' then
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia FROM Ligacoes');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end
                            else
                            begin
                                qryAux.SQL.Clear;
                                qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido, VelocidadeMedia, ID_Veiculo FROM LigacoesVeiculo');
                                qryAux.SQL.Add('WHERE ID_LocalDestino = ' + #39 + vV[i] + #39);
                                qryAux.SQL.Add('AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39);
                                qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
                                qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
                            end;
                            qryAux.Open;
                            a := -1;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vF[b] = '' then
                                begin
                                    if a = -1 then
                                    begin
                                        a := b;
                                    end
                                    else
                                    begin
                                        if a > b then
                                        begin
                                            a := b;
                                        end;
                                    end;
                                end;
                            end;

                            qryAux.First;
                            while not qryAux.Eof do
                            begin
                                iColoca := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vV[b] = qryAux.Fields[0].Value then
                                    begin
                                        iColoca := 1;
                                    end;
                                    if vF[b] = qryAux.Fields[0].Value then
                                    begin
                                        if vF1[b] <= (qryAux.Fields[3].Value + vV1[i]) then
                                        begin
                                            iColoca := 1;
                                        end;
                                    end;
                                end;

                                if iColoca = 0 then
                                begin
                                    vF[a] := qryAux.Fields[0].Value;
                                    vF1[a] := qryAux.Fields[3].Value + vV1[i];
                                    vF2[a] := vV[i];
                                    a := a + 1;
                                end;

                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF_aux[b] := '';
                                    vF1_aux[b] := -1;
                                    vF2_aux[b] := '';
                                end;

                                d := 0;
                                for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    aux := 0;
                                    if vF[b] <> '' then
                                    begin
                                        for c := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                        begin
                                            if vF[b] = vF_aux[c] then
                                            begin
                                                if vF1_aux[c] > vF1[b] then
                                                begin
                                                    vF_aux[c] := vF[b];
                                                    vF1_aux[c] := vF1[b];
                                                    vF2_aux[c] := vF2[b];
                                                    aux := 1;
                                                end;
                                            end;
                                        end;

                                        if aux = 0 then
                                        begin
                                            vF_aux[d] := vF[b];
                                            vF1_aux[d] := vF1[b];
                                            vF2_aux[d] := vF2[b];
                                            d := d + 1;
                                        end;
                                    end;
                                end;

                                for d := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    vF[d]  := vF_aux[d];
                                    vF1[d] := vF1_aux[d];
                                    vF2[d] := vF2_aux[d];
                                end;

                                qryAux.Next;
                            end;
                            qryAux.Close;

                            // Ajustando o vetor D de não visitados
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                for a := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                                begin
                                    if vD[b] = vF[a] then
                                    begin
                                        vD[b] := '';
                                    end;
                                end;
                            end;

                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD[b] <> '' then
                                begin
                                    vD1[b] := b;
                                end;
                            end;

                            a := 0;
                            for b := 0 to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                if vD1[b] <> -1 then
                                begin
                                    vD[a] := vD[vD1[b]];
                                    a := a + 1;
                                end;
                            end;

                            for b := a to dtmPrincipal.tblLocais.RecordCount - 1 do
                            begin
                                vD[b] := '';
                            end;
                        end;

                        i := i + 1;
                    end;
                end;
            end; // Final do algorítmo
        end;
        dtmPrincipal.tblGanhos.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.JLabel5Click(Sender: TObject);
var
    iTempoIni : TTime;
    iTempoFim : TTime;
    vVelocidade : double;
begin
    if MessageDlg('ATENÇÃO... Este processo atualizará todas as informações sobre '+#13+#10+'a matriz de ganhos.'+#13+#10+'Deseja realmente continuar', mtWarning, [mbYes,mbNo], 0) = mrYes then
    begin
        if frmLocais = nil then
        begin
            if VerificaPermissao('L','frmCalcGanhos') = False then Exit;
            frmCalcGanhos := TfrmCalcGanhos.Create(Self);
            frmCalcGanhos.ShowModal;
        end
        else
        begin
            MessageDlg('O formulário para manutenção dos cálculos de ganhos já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
            exit;
        end;

        iTempoIni := Time;

        dtmPrincipal.cDelete := False;
        PageControl1.Visible := False;

         if frmCalcGanhos.CheckBox6.Checked = False then
        begin
            vGeraLog_ant := frmPrincipal.vGeraLog;
            frmPrincipal.vGeraLog := 0;
        end;

        if frmCalcGanhos.CheckBox7.Checked = true then
        begin
            if ControleTabelas(0,'tblCargas','Open') = True then dtmPrincipal.tblCargas.Open;
            if ControleTabelas(0,'tblEntregas','Open') = True then dtmPrincipal.tblEntregas.Open;
            if ControleTabelas(0,'tblCargasPontos','Open') = True then dtmPrincipal.tblCargasPontos.Open;

            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 1 de 15 - Atualizando informações das cargas já entregues.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblCargas.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            dtmPrincipal.tblCargas.First;
            while not dtmPrincipal.tblCargas.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

                if dtmPrincipal.tblCargasStatus.Value = 'E' then
                begin
                    dtmPrincipal.tblCargasPontos.First;
                    while not dtmPrincipal.tblCargasPontos.Eof do
                    begin
                        if dtmPrincipal.tblCargasPontosParadaOrigem.Value <> 0 then
                        begin
                            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblCargasPontosID_LocalOrigem.Value,[loPartialKey]) then
                            begin
                                dtmPrincipal.tblLocais.Edit;

                                if dtmPrincipal.tblLocaisTempoMinimoParada.Value > dtmPrincipal.tblCargasPontosParadaOrigem.Value then
                                begin
                                    dtmPrincipal.tblLocaisTempoMinimoParada.Value := dtmPrincipal.tblCargasPontosParadaOrigem.Value;
                                end;
                                if dtmPrincipal.tblLocaisTempoMaximoParada.Value < dtmPrincipal.tblCargasPontosParadaOrigem.Value then
                                begin
                                    dtmPrincipal.tblLocaisTempoMaximoParada.Value := dtmPrincipal.tblCargasPontosParadaOrigem.Value;
                                end;
                                dtmPrincipal.tblLocaisTempoMedioParada.Value := (dtmPrincipal.tblLocaisTempoMedioParada.Value + dtmPrincipal.tblCargasPontosParadaOrigem.Value) / 2;

                                dtmPrincipal.tblLocais.Post;
                            end;

                            if dtmPrincipal.tblParadasVeiculo.Locate('ID_Local;ID_Veiculo',VarArrayOf([dtmPrincipal.tblCargasPontosID_LocalOrigem.Value,dtmPrincipal.tblCargasID_Veiculo.Value]),[loPartialKey]) then
                            begin
                                dtmPrincipal.tblParadasVeiculo.Edit;

                                if dtmPrincipal.tblParadasVeiculoTempoMinimoParada.Value > dtmPrincipal.tblCargasPontosParadaOrigem.Value then
                                begin
                                    dtmPrincipal.tblParadasVeiculoTempoMinimoParada.Value := dtmPrincipal.tblCargasPontosParadaOrigem.Value;
                                end;
                                if dtmPrincipal.tblParadasVeiculoTempoMaximoParada.Value < dtmPrincipal.tblCargasPontosParadaOrigem.Value then
                                begin
                                    dtmPrincipal.tblParadasVeiculoTempoMaximoParada.Value := dtmPrincipal.tblCargasPontosParadaOrigem.Value;
                                end;
                                dtmPrincipal.tblParadasVeiculoTempoMedioParada.Value := (dtmPrincipal.tblParadasVeiculoTempoMedioParada.Value + dtmPrincipal.tblCargasPontosParadaOrigem.Value) / 2;

                                dtmPrincipal.tblParadasVeiculo.Post;
                            end;
                        end;

                        if dtmPrincipal.tblCargasPontosCusto.Value <> 0 then
                        begin
                            if dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem;ID_LocalDestino',VarArrayOf([dtmPrincipal.tblCargasPontosID_LocalOrigem.Value,dtmPrincipal.tblCargasPontosID_LocalDestino.Value]),[loPartialKey]) then
                            begin
                                dtmPrincipal.tblLigacoes.Edit;

                                if dtmPrincipal.tblLigacoesCustoMinimo.Value > dtmPrincipal.tblCargasPontosCusto.Value then
                                begin
                                    dtmPrincipal.tblLigacoesCustoMinimo.Value := dtmPrincipal.tblCargasPontosCusto.Value;
                                end;
                                if dtmPrincipal.tblLigacoesCustoMaximo.Value < dtmPrincipal.tblCargasPontosCusto.Value then
                                begin
                                    dtmPrincipal.tblLigacoesCustoMaximo.Value := dtmPrincipal.tblCargasPontosCusto.Value;
                                end;
                                dtmPrincipal.tblLigacoesCustoMedio.Value := (dtmPrincipal.tblLigacoesCustoMedio.Value + dtmPrincipal.tblCargasPontosCusto.Value) / 2;

                                dtmPrincipal.tblLigacoes.Post;
                            end;

                            if dtmPrincipal.tblLigacoesVeiculo.Locate('ID_LocalOrigem;ID_LocalDestino;ID_Veiculo',VarArrayOf([dtmPrincipal.tblCargasPontosID_LocalOrigem.Value,dtmPrincipal.tblCargasPontosID_LocalDestino.Value,dtmPrincipal.tblCargasID_Veiculo.Value]),[loPartialKey]) then
                            begin
                                dtmPrincipal.tblLigacoesVeiculo.Edit;

                                if dtmPrincipal.tblLigacoesVeiculoCustoMinimo.Value > dtmPrincipal.tblCargasPontosCusto.Value then
                                begin
                                    dtmPrincipal.tblLigacoesVeiculoCustoMinimo.Value := dtmPrincipal.tblCargasPontosCusto.Value;
                                end;
                                if dtmPrincipal.tblLigacoesVeiculoCustoMaximo.Value < dtmPrincipal.tblCargasPontosCusto.Value then
                                begin
                                    dtmPrincipal.tblLigacoesVeiculoCustoMaximo.Value := dtmPrincipal.tblCargasPontosCusto.Value;
                                end;
                                dtmPrincipal.tblLigacoesVeiculoCustoMedio.Value := (dtmPrincipal.tblLigacoesVeiculoCustoMedio.Value + dtmPrincipal.tblCargasPontosCusto.Value) / 2;

                                dtmPrincipal.tblLigacoesVeiculo.Post;
                            end;
                        end;

                        if (dtmPrincipal.tblCargasPontosTempo.Value <> 0) and (dtmPrincipal.tblCargasPontosDistancia.Value <> 0) then
                        begin
                            vVelocidade := dtmPrincipal.tblCargasPontosDistancia.Value / dtmPrincipal.tblCargasPontosTempo.Value;

                            if dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem;ID_LocalDestino',VarArrayOf([dtmPrincipal.tblCargasPontosID_LocalOrigem.Value,dtmPrincipal.tblCargasPontosID_LocalDestino.Value]),[loPartialKey]) then
                            begin
                                dtmPrincipal.tblLigacoes.Edit;

                                if dtmPrincipal.tblLigacoesVelocidadeMinima.Value > vVelocidade then
                                begin
                                    dtmPrincipal.tblLigacoesVelocidadeMinima.Value := vVelocidade;
                                end;
                                if dtmPrincipal.tblLigacoesVelocidadeMaxima.Value < vVelocidade then
                                begin
                                    dtmPrincipal.tblLigacoesVelocidadeMaxima.Value := vVelocidade;
                                end;
                                dtmPrincipal.tblLigacoesVelocidadeMedia.Value := (dtmPrincipal.tblLigacoesVelocidadeMedia.Value + vVelocidade) / 2;

                                dtmPrincipal.tblLigacoes.Post;
                            end;

                            if dtmPrincipal.tblLigacoesVeiculo.Locate('ID_LocalOrigem;ID_LocalDestino;ID_Veiculo',VarArrayOf([dtmPrincipal.tblCargasPontosID_LocalOrigem.Value,dtmPrincipal.tblCargasPontosID_LocalDestino.Value,dtmPrincipal.tblCargasID_Veiculo.Value]),[loPartialKey]) then
                            begin
                                dtmPrincipal.tblLigacoesVeiculo.Edit;

                                if dtmPrincipal.tblLigacoesVeiculoVelocidadeMinima.Value > vVelocidade then
                                begin
                                    dtmPrincipal.tblLigacoesVeiculoVelocidadeMinima.Value := vVelocidade;
                                end;
                                if dtmPrincipal.tblLigacoesVeiculoVelocidadeMaxima.Value < vVelocidade then
                                begin
                                    dtmPrincipal.tblLigacoesVeiculoVelocidadeMaxima.Value := vVelocidade;
                                end;
                                dtmPrincipal.tblLigacoesVeiculoVelocidadeMedia.Value := (dtmPrincipal.tblLigacoesVeiculoVelocidadeMedia.Value + vVelocidade) / 2;

                                dtmPrincipal.tblLigacoesVeiculo.Post;
                            end;
                        end;

                        if dtmPrincipal.tblCargasPontosParadaOrigem.Value <> 0 then
                        begin
                            if dtmPrincipal.tblVeiculos.Locate('ID_Veiculo',dtmPrincipal.tblCargasID_Veiculo.Value,[loPartialKey]) then
                            begin
                                dtmPrincipal.tblVeiculos.Edit;

                                if dtmPrincipal.tblVeiculosTempoMinimoParada.Value > dtmPrincipal.tblCargasPontosParadaOrigem.Value then
                                begin
                                    dtmPrincipal.tblVeiculosTempoMinimoParada.Value := dtmPrincipal.tblCargasPontosParadaOrigem.Value;
                                end;
                                if dtmPrincipal.tblVeiculosTempoMaximoParada.Value < dtmPrincipal.tblCargasPontosParadaOrigem.Value then
                                begin
                                    dtmPrincipal.tblVeiculosTempoMaximoParada.Value := dtmPrincipal.tblCargasPontosParadaOrigem.Value;
                                end;
                                dtmPrincipal.tblVeiculosTempoMedioParada.Value := (dtmPrincipal.tblVeiculosTempoMedioParada.Value + dtmPrincipal.tblCargasPontosParadaOrigem.Value) / 2;

                                dtmPrincipal.tblVeiculos.Post;
                            end;
                        end;

                        if dtmPrincipal.tblCargasPontosParadaDestino.Value <> 0 then
                        begin
                            if dtmPrincipal.tblVeiculos.Locate('ID_Veiculo',dtmPrincipal.tblCargasID_Veiculo.Value,[loPartialKey]) then
                            begin
                                dtmPrincipal.tblVeiculos.Edit;

                                if dtmPrincipal.tblVeiculosTempoMinimoParada.Value > dtmPrincipal.tblCargasPontosParadaDestino.Value then
                                begin
                                    dtmPrincipal.tblVeiculosTempoMinimoParada.Value := dtmPrincipal.tblCargasPontosParadaDestino.Value;
                                end;
                                if dtmPrincipal.tblVeiculosTempoMaximoParada.Value < dtmPrincipal.tblCargasPontosParadaDestino.Value then
                                begin
                                    dtmPrincipal.tblVeiculosTempoMaximoParada.Value := dtmPrincipal.tblCargasPontosParadaDestino.Value;
                                end;
                                dtmPrincipal.tblVeiculosTempoMedioParada.Value := (dtmPrincipal.tblVeiculosTempoMedioParada.Value + dtmPrincipal.tblCargasPontosParadaDestino.Value) / 2;

                                dtmPrincipal.tblVeiculos.Post;
                            end;
                        end;

                        if dtmPrincipal.tblCargasPontosCusto.Value <> 0 then
                        begin
                            if dtmPrincipal.tblVeiculos.Locate('ID_Veiculo',dtmPrincipal.tblCargasID_Veiculo.Value,[loPartialKey]) then
                            begin
                                dtmPrincipal.tblVeiculos.Edit;

                                if dtmPrincipal.tblVeiculosCustoMinimo.Value > dtmPrincipal.tblCargasPontosCusto.Value then
                                begin
                                    dtmPrincipal.tblVeiculosCustoMinimo.Value := dtmPrincipal.tblCargasPontosCusto.Value;
                                end;
                                if dtmPrincipal.tblVeiculosCustoMaximo.Value < dtmPrincipal.tblCargasPontosCusto.Value then
                                begin
                                    dtmPrincipal.tblVeiculosCustoMaximo.Value := dtmPrincipal.tblCargasPontosCusto.Value;
                                end;
                                dtmPrincipal.tblVeiculosCustoMedio.Value := (dtmPrincipal.tblVeiculosCustoMedio.Value + dtmPrincipal.tblCargasPontosCusto.Value) / 2;

                                dtmPrincipal.tblVeiculos.Post;
                            end;
                        end;

                        if (dtmPrincipal.tblCargasPontosTempo.Value <> 0) and (dtmPrincipal.tblCargasPontosDistancia.Value <> 0) then
                        begin
                            vVelocidade := dtmPrincipal.tblCargasPontosDistancia.Value / dtmPrincipal.tblCargasPontosTempo.Value;

                            if dtmPrincipal.tblVeiculos.Locate('ID_Veiculo',dtmPrincipal.tblCargasID_Veiculo.Value,[loPartialKey]) then
                            begin
                                dtmPrincipal.tblVeiculos.Edit;

                                if dtmPrincipal.tblVeiculosVelocidadeMinima.Value > vVelocidade then
                                begin
                                    dtmPrincipal.tblVeiculosVelocidadeMinima.Value := vVelocidade;
                                end;
                                if dtmPrincipal.tblVeiculosVelocidadeMaxima.Value < vVelocidade then
                                begin
                                    dtmPrincipal.tblVeiculosVelocidadeMaxima.Value := vVelocidade;
                                end;
                                dtmPrincipal.tblVeiculosVelocidadeMedia.Value := (dtmPrincipal.tblVeiculosVelocidadeMedia.Value + vVelocidade) / 2;

                                dtmPrincipal.tblVeiculos.Post;
                            end;
                        end;



                        dtmPrincipal.tblCargasPontos.Next;
                    end;

                    dtmPrincipal.tblCargas.Edit;
                    dtmPrincipal.tblCargasStatus.Value := 'F';
                    dtmPrincipal.tblCargas.Post;
                end;

                dtmPrincipal.tblCargas.Next;
            end;

            if ControleTabelas(0,'tblCargas','Close') = True then dtmPrincipal.tblCargas.close;
            if ControleTabelas(0,'tblEntregas','Close') = True then dtmPrincipal.tblEntregas.Close;
            if ControleTabelas(0,'tblCargasPontos','Close') = True then dtmPrincipal.tblCargasPontos.Close;

            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox12.Checked = true then
        begin
            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 2 de 15 - Excluindo os registros antigos da matriz de otimizações.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblOtimizacoes.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            while not dtmPrincipal.tblOtimizacoes.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;
                dtmPrincipal.tblOtimizacoes.Delete;
            end;
            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox13.Checked = true then
        begin
            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 3 de 15 - Excluindo os registros antigos da matriz de ganhos.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblGanhos.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            while not dtmPrincipal.tblGanhos.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;
                dtmPrincipal.tblGanhos.Delete;
            end;
            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox1.Checked = true then
        begin
            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 4 de 15 - Atualizando informações das ligações para os veículos.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblLigacoes.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            dtmPrincipal.tblLigacoes.First;
            while not dtmPrincipal.tblLigacoes.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

                dtmPrincipal.tblVeiculos.First;
                while not dtmPrincipal.tblVeiculos.Eof do
                begin
                    if dtmPrincipal.tblVeiculosID_Veiculo.Value <> 'Sistema' then
                    begin
                        if dtmPrincipal.tblLigacoesVeiculo.Locate('ID_LocalOrigem;ID_LocalDestino;ID_Veiculo',
                                                               VarArrayOf([dtmPrincipal.tblLigacoesID_LocalOrigem.Value,
                                                                           dtmPrincipal.tblLigacoesID_LocalDestino.Value,
                                                                           dtmPrincipal.tblVeiculosID_Veiculo.Value]),[loPartialKey]) = False then
                        begin
                            dtmPrincipal.tblLigacoesVeiculo.Insert;
                            dtmPrincipal.tblLigacoesVeiculoID_Veiculo.Value := dtmPrincipal.tblVeiculosID_Veiculo.Value;
                            dtmPrincipal.tblLigacoesVeiculoCustoMinimo.Value := 0;
                            dtmPrincipal.tblLigacoesVeiculoCustoMaximo.Value := 0;
                            dtmPrincipal.tblLigacoesVeiculoCustoMedio.Value := 0;
                            dtmPrincipal.tblLigacoesVeiculoVelocidadeMinima.Value := 0;
                            dtmPrincipal.tblLigacoesVeiculoVelocidadeMaxima.Value := 0;
                            dtmPrincipal.tblLigacoesVeiculoVelocidadeMedia.Value := 0;
                            dtmPrincipal.tblLigacoesVeiculo.Post;
                        end;
                    end;

                    dtmPrincipal.tblVeiculos.Next;
                end;

                dtmPrincipal.tblLigacoes.Next;
            end;
            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox1.Checked = true then
        begin
            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 5 de 15 - Atualizando informações dos locais para os veículos.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblLocais.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            dtmPrincipal.tblLocais.First;
            while not dtmPrincipal.tblLocais.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

                dtmPrincipal.tblVeiculos.First;
                while not dtmPrincipal.tblVeiculos.Eof do
                begin
                    if dtmPrincipal.tblVeiculosID_Veiculo.Value <> 'Sistema' then
                    begin
                        if dtmPrincipal.tblParadasVeiculo.Locate('ID_Local;ID_Veiculo',
                                                               VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,
                                                                           dtmPrincipal.tblVeiculosID_Veiculo.Value]),[loPartialKey]) = False then
                        begin
                            dtmPrincipal.tblParadasVeiculo.Insert;
                            dtmPrincipal.tblParadasVeiculoID_Veiculo.Value := dtmPrincipal.tblVeiculosID_Veiculo.Value;
                            dtmPrincipal.tblParadasVeiculoTempoMinimoParada.Value := 0;
                            dtmPrincipal.tblParadasVeiculoTempoMaximoParada.Value := 0;
                            dtmPrincipal.tblParadasVeiculoTempoMedioParada.Value := 0;
                            dtmPrincipal.tblParadasVeiculo.Post;
                        end;
                    end;

                    dtmPrincipal.tblVeiculos.Next;
                end;

                dtmPrincipal.tblLocais.Next;
            end;
            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox12.Checked = true then
        begin
            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 6 de 15 - Criando a matriz de otimizações.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblLocais.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            ADOTable1.Open;
            ADOTable2.Open;
            dtmPrincipal.tblLocais.First;
            while not dtmPrincipal.tblLocais.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

                if dtmPrincipal.tblLocaisDeposito.Value = 'S' then
                begin
                    ADOTable1.First;
                    while not ADOTable1.Eof do
                    begin
                        if ADOTable1.FieldByName('ID_Local').Value <> dtmPrincipal.tblLocaisID_Local.Value then
                        begin
                            ADOTable2.First;
                            while not ADOTable2.Eof do
                            begin
                                if (ADOTable1.FieldByName('ID_Local').Value <> ADOTable2.FieldByName('ID_Local').Value) and
                                   (ADOTable2.FieldByName('ID_Local').Value <> dtmPrincipal.tblLocaisID_Local.Value)    then
                                begin
                                    dtmPrincipal.tblOtimizacoes.Insert;
                                    dtmPrincipal.tblOtimizacoesID_LocalOrigem.Value := dtmPrincipal.tblLocaisID_Local.Value;
                                    dtmPrincipal.tblOtimizacoesID_Local_1.Value := ADOTable1.FieldByName('ID_Local').Value;
                                    dtmPrincipal.tblOtimizacoesID_Local_2.Value := ADOTable2.FieldByName('ID_Local').Value;
                                    dtmPrincipal.tblOtimizacoesID_Veiculo.Value := 'Sistema';
                                    dtmPrincipal.tblOtimizacoesValorCustoMinimo.Value := 0;
                                    dtmPrincipal.tblOtimizacoesValorCustoMaximo.Value := 0;
                                    dtmPrincipal.tblOtimizacoesValorCustoMedio.Value := 0;
                                    dtmPrincipal.tblOtimizacoesValorDistancia.Value := 0;
                                    dtmPrincipal.tblOtimizacoesValorVelocidadeMinima.Value := 0;
                                    dtmPrincipal.tblOtimizacoesValorVelocidadeMaxima.Value := 0;
                                    dtmPrincipal.tblOtimizacoesValorVelocidadeMedia.Value := 0;
                                    dtmPrincipal.tblOtimizacoes.Post;

                                    if frmCalcGanhos.CheckBox1.Checked = true then
                                    begin
                                        dtmPrincipal.tblVeiculos.First;
                                        while not dtmPrincipal.tblVeiculos.Eof do
                                        begin
                                            if dtmPrincipal.tblVeiculosID_Veiculo.Value <> 'Sistema' then
                                            begin
                                                dtmPrincipal.tblOtimizacoes.Insert;
                                                dtmPrincipal.tblOtimizacoesID_LocalOrigem.Value := dtmPrincipal.tblLocaisID_Local.Value;
                                                dtmPrincipal.tblOtimizacoesID_Local_1.Value := ADOTable1.FieldByName('ID_Local').Value;
                                                dtmPrincipal.tblOtimizacoesID_Local_2.Value := ADOTable2.FieldByName('ID_Local').Value;
                                                dtmPrincipal.tblOtimizacoesID_Veiculo.Value := dtmPrincipal.tblVeiculosID_Veiculo.Value;
                                                dtmPrincipal.tblOtimizacoesValorCustoMinimo.Value := 0;
                                                dtmPrincipal.tblOtimizacoesValorCustoMaximo.Value := 0;
                                                dtmPrincipal.tblOtimizacoesValorCustoMedio.Value := 0;
                                                dtmPrincipal.tblOtimizacoesValorDistancia.Value := 0;
                                                dtmPrincipal.tblOtimizacoesValorVelocidadeMinima.Value := 0;
                                                dtmPrincipal.tblOtimizacoesValorVelocidadeMaxima.Value := 0;
                                                dtmPrincipal.tblOtimizacoesValorVelocidadeMedia.Value := 0;
                                                dtmPrincipal.tblOtimizacoes.Post;
                                            end;
                                            dtmPrincipal.tblVeiculos.Next;
                                        end;
                                    end;
                                end;
                                ADOTable2.Next;
                            end;
                        end;
                        ADOTable1.Next;
                    end;
                end;

                dtmPrincipal.tblLocais.Next;
            end;

            ADOTable1.Close;
            ADOTable2.Close;
            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox13.Checked = true then
        begin
            frmMostra := TfrmMostra.Create(Self);
            frmMostra.Mensagem := 'Passo 7 de 15 - Criando a matriz de ganhos.';
            frmMostra.ProgressBar1.Max := dtmPrincipal.tblLocais.RecordCount;
            frmMostra.Show;
            frmMostra.Repaint;

            ADOTable1.Open;
            dtmPrincipal.tblLocais.First;
            while not dtmPrincipal.tblLocais.Eof do
            begin
                frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

                ADOTable1.First;
                while not ADOTable1.Eof do
                begin
                    if ADOTable1.FieldByName('ID_Local').Value <> dtmPrincipal.tblLocaisID_Local.Value then
                    begin
                        dtmPrincipal.tblGanhos.Insert;
                        dtmPrincipal.tblGanhosID_LocalOrigem.Value := dtmPrincipal.tblLocaisID_Local.Value;
                        dtmPrincipal.tblGanhosID_LocalDestino.Value := ADOTable1.FieldByName('ID_Local').Value;
                        dtmPrincipal.tblGanhosValorCustoMinimo.Value := 0;
                        dtmPrincipal.tblGanhosValorCustoMaximo.Value := 0;
                        dtmPrincipal.tblGanhosValorCustoMedio.Value := 0;
                        dtmPrincipal.tblGanhosValorDistancia.Value := 0;
                        dtmPrincipal.tblGanhosValorVelocidadeMinima.Value := 0;
                        dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value := 0;
                        dtmPrincipal.tblGanhosValorVelocidadeMedia.Value := 0;
                        dtmPrincipal.tblGanhosID_Veiculo.Value := 'Sistema';
                        dtmPrincipal.tblGanhos.Post;

                        if frmCalcGanhos.CheckBox1.Checked = true then
                        begin
                            dtmPrincipal.tblVeiculos.First;
                            while not dtmPrincipal.tblVeiculos.Eof do
                            begin
                                if dtmPrincipal.tblVeiculosID_Veiculo.Value <> 'Sistema' then
                                begin
                                    dtmPrincipal.tblGanhos.Insert;
                                    dtmPrincipal.tblGanhosID_LocalOrigem.Value := dtmPrincipal.tblLocaisID_Local.Value;
                                    dtmPrincipal.tblGanhosID_LocalDestino.Value := ADOTable1.FieldByName('ID_Local').Value;
                                    dtmPrincipal.tblGanhosValorCustoMinimo.Value := 0;
                                    dtmPrincipal.tblGanhosValorCustoMaximo.Value := 0;
                                    dtmPrincipal.tblGanhosValorCustoMedio.Value := 0;
                                    dtmPrincipal.tblGanhosValorDistancia.Value := 0;
                                    dtmPrincipal.tblGanhosValorVelocidadeMinima.Value := 0;
                                    dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value := 0;
                                    dtmPrincipal.tblGanhosValorVelocidadeMedia.Value := 0;
                                    dtmPrincipal.tblGanhosID_Veiculo.Value := dtmPrincipal.tblVeiculosID_Veiculo.Value;
                                    dtmPrincipal.tblGanhos.Post;
                                end;

                                dtmPrincipal.tblVeiculos.Next;
                            end;
                        end;
                    end;
                    ADOTable1.Next;
                end;
                dtmPrincipal.tblLocais.Next;
            end;
            ADOTable1.Close;
            FreeAndNil(frmMostra);
        end;

        if frmCalcGanhos.CheckBox2.Checked = true then GanhosDistancia; // 7

        if frmCalcGanhos.CheckBox3.Checked = true then GanhosCustoMinimo; // 8
        if frmCalcGanhos.CheckBox4.Checked = true then GanhosCustoMaximo; // 9
        if frmCalcGanhos.CheckBox5.Checked = true then GanhosCustoMedio; // 10

        if frmCalcGanhos.CheckBox9.Checked = true then GanhosVelocidadeMinima; // 11
        if frmCalcGanhos.CheckBox10.Checked = true then GanhosVelocidadeMaxima; // 12
        if frmCalcGanhos.CheckBox11.Checked = true then GanhosVelocidadeMedia; // 13

        if frmCalcGanhos.CheckBox12.Checked = true then RotasOtimizadas; // 14

        if frmLocais <> nil then
        begin
            FreeAndNil(frmCalcGanhos);
        end;

        dtmPrincipal.tblParametros.Locate('ID_Parametro',frmPrincipal.sParametro,[loPartialKey]);
        dtmPrincipal.tblParametros.Edit;
        dtmPrincipal.tblParametrosDt_atualizacao.Value := Date;
        if frmCalcGanhos.CheckBox1.Checked = true then
        begin
            dtmPrincipal.tblParametrosAtualiza_veiculo.Value := 'S';
        end
        else
        begin
            dtmPrincipal.tblParametrosAtualiza_veiculo.Value := 'N';
        end;
        dtmPrincipal.tblParametros.Post;

        if frmCalcGanhos.CheckBox6.Checked = False then
        begin
            frmPrincipal.vGeraLog := vGeraLog_ant;
        end;

        iTempoFim := Time;

        MessageDlg('Processo de cálculo realizado.'+#13+#10+'Tempo total decorrido: ' + TimeToStr(iTempoFim - iTempoIni), mtWarning, [mbOK], 0);

        PageControl1.Visible := True;
        dtmPrincipal.cDelete := True;
    end;
end;

procedure TfrmGanhos.RotasOtimizadas;
var
    di1, dj1, ij1 : double;
    di2, dj2, ij2 : double;
    di3, dj3, ij3 : double;
    di4, dj4, ij4 : double;
    di5, dj5, ij5 : double;
    di6, dj6, ij6 : double;
    di7, dj7, ij7 : double;
    di8, dj8, ij8 : double;
    di9, dj9, ij9 : double;
    di10, dj10, ij10 : double;

    origem, destino, veiculo : string;
begin
    frmMostra := TfrmMostra.Create(Self);
    frmMostra.Mensagem := 'Passo 15 de 15 - Calculando as otimizações de rotas.';
    frmMostra.ProgressBar1.Max := dtmPrincipal.tblOtimizacoes.RecordCount;
    frmMostra.Show;
    frmMostra.Repaint;

    dtmPrincipal.tblOtimizacoes.First;
    while not dtmPrincipal.tblOtimizacoes.Eof do
    begin
        frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;

        di1 := 0; dj1 := 0; ij1 := 0;
        di2 := 0; dj2 := 0; ij2 := 0;
        di3 := 0; dj3 := 0; ij3 := 0;
        di4 := 0; dj4 := 0; ij4 := 0;
        di5 := 0; dj5 := 0; ij5 := 0;
        di6 := 0; dj6 := 0; ij6 := 0;
        di7 := 0; dj7 := 0; ij7 := 0;
        di8 := 0; dj8 := 0; ij8 := 0;
        di9 := 0; dj9 := 0; ij9 := 0;
        di10:= 0; dj10:= 0; ij10:= 0;

        origem := '';
        destino := '';
        veiculo := '';

        origem := dtmPrincipal.tblOtimizacoesID_LocalOrigem.Value;
        destino := dtmPrincipal.tblOtimizacoesID_Local_1.Value;
        veiculo := dtmPrincipal.tblOtimizacoesID_Veiculo.Value;
        if dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([origem,destino,veiculo]),[loPartialKey]) then
        begin
            di1 := dtmPrincipal.tblGanhosValorDistancia.Value;
            di2 := dtmPrincipal.tblGanhosValorCustoMinimo.Value;
            di3 := dtmPrincipal.tblGanhosValorCustoMaximo.Value;
            di4 := dtmPrincipal.tblGanhosValorCustoMedio.Value;
            di8 := dtmPrincipal.tblGanhosValorVelocidadeMinima.Value;
            di9 := dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value;
            di10:= dtmPrincipal.tblGanhosValorVelocidadeMedia.Value;
        end;
        origem := dtmPrincipal.tblOtimizacoesID_LocalOrigem.Value;
        destino := dtmPrincipal.tblOtimizacoesID_Local_2.Value;
        veiculo := dtmPrincipal.tblOtimizacoesID_Veiculo.Value;
        if dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([origem,destino,veiculo]),[loPartialKey]) then
        begin
            dj1 := dtmPrincipal.tblGanhosValorDistancia.Value;
            dj2 := dtmPrincipal.tblGanhosValorCustoMinimo.Value;
            dj3 := dtmPrincipal.tblGanhosValorCustoMaximo.Value;
            dj4 := dtmPrincipal.tblGanhosValorCustoMedio.Value;
            dj8 := dtmPrincipal.tblGanhosValorVelocidadeMinima.Value;
            dj9 := dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value;
            dj10:= dtmPrincipal.tblGanhosValorVelocidadeMedia.Value;
        end;
        origem := dtmPrincipal.tblOtimizacoesID_Local_1.Value;
        destino := dtmPrincipal.tblOtimizacoesID_Local_2.Value;
        veiculo := dtmPrincipal.tblOtimizacoesID_Veiculo.Value;
        if dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([origem,destino,veiculo]),[loPartialKey]) then
        begin
            ij1 := dtmPrincipal.tblGanhosValorDistancia.Value;
            ij2 := dtmPrincipal.tblGanhosValorCustoMinimo.Value;
            ij3 := dtmPrincipal.tblGanhosValorCustoMaximo.Value;
            ij4 := dtmPrincipal.tblGanhosValorCustoMedio.Value;
            ij8 := dtmPrincipal.tblGanhosValorVelocidadeMinima.Value;
            ij9 := dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value;
            ij10:= dtmPrincipal.tblGanhosValorVelocidadeMedia.Value;
        end;

        dtmPrincipal.tblOtimizacoes.Edit;
        dtmPrincipal.tblOtimizacoesValorDistancia.Value        := di1  + dj1  - ij1;
        dtmPrincipal.tblOtimizacoesValorCustoMinimo.Value      := di2  + dj2  - ij2;
        dtmPrincipal.tblOtimizacoesValorCustoMaximo.Value      := di3  + dj3  - ij3;
        dtmPrincipal.tblOtimizacoesValorCustoMedio.Value       := di4  + dj4  - ij4;
        dtmPrincipal.tblOtimizacoesValorVelocidadeMinima.Value := di8  + dj8  - ij8;
        dtmPrincipal.tblOtimizacoesValorVelocidadeMaxima.Value := di9  + dj9  - ij9;
        dtmPrincipal.tblOtimizacoesValorVelocidadeMedia.Value  := di10 + dj10 - ij10;

        dtmPrincipal.tblOtimizacoes.Post;

        dtmPrincipal.tblOtimizacoes.Next;
    end;
    FreeAndNil(frmMostra);
end;

procedure TfrmGanhos.JLabel6Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoDistancia.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 4;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel6 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel7Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoCustoMinimo.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 5;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel7 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel8Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoCustoMaximo.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 6;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel8 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel9Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoCustoMedio.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 7;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel9MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel9 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel13Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoVelocidadeMinima.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 11;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel13 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel14Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoVelocidadeMaxima.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 12;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel14MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel14 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel15Click(Sender: TObject);
begin
    if dtmPrincipal.tblRotasGanhoVelocidadeMedia.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 13;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);
        end
        else
        begin
            MessageDlg('O formulário dos mapas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmGanhos.JLabel15MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel13 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel16MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel16 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmGanhos.JLabel16Click(Sender: TObject);
begin
    if frmOtimizacoes = nil then
    begin
        if VerificaPermissao('L','frmOtimizacoes') = False then Exit;
        frmOtimizacoes := TfrmOtimizacoes.Create(Self);

        dtmPrincipal.tblOtimizacoes.Filtered := False;
        dtmPrincipal.tblOtimizacoes.Filter := 'ID_LocalOrigem = ' + #39 + dtmPrincipal.tblGanhosID_LocalOrigem.Value + #39 +
                                              'AND ID_Veiculo = ' + #39 + dtmPrincipal.tblGanhosID_Veiculo.Value + #39; 
        dtmPrincipal.tblOtimizacoes.Filtered := True;

        frmOtimizacoes.ShowModal;

        dtmPrincipal.tblOtimizacoes.Filtered := False;
        dtmPrincipal.tblOtimizacoes.Filter := '';

        FreeAndNil(frmOtimizacoes);
    end
    else
    begin
        MessageDlg('O formulário para consulta das rotas otimizadas já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
        exit;
    end;
end;

end.
