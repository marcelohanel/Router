unit uCargas;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls, ADODB;

type
  TfrmCargas = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
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
    grdCargas: TDBGrid;
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
    JLabel4: TJLabel;
    N2: TMenuItem;
    AssistentedeCargas1: TMenuItem;
    JLabel5: TJLabel;
    ExcluirCargas1: TMenuItem;
    JLabel6: TJLabel;
    RoteirodaCarga1: TMenuItem;
    JLabel7: TJLabel;
    FinalizarCarga1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure grdCargasTitleClick(Column: TColumn);
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
    procedure JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel4Click(Sender: TObject);
    procedure JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel5Click(Sender: TObject);
    procedure JLabel6Click(Sender: TObject);
    procedure JLabel6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargas: TfrmCargas;

implementation

uses uModule, uPrincipal, uPermissoes, uMostra, uWizardCargas, uMapa,
  uFinalizaCarga;

{$R *.dfm}

procedure TfrmCargas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmCargas.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmCargas,grdCargas,'');
    frmPrincipal.LeGrid(0,frmCargas,grdCargas);
end;

procedure TfrmCargas.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmCargas,grdCargas);
    close;
end;

procedure TfrmCargas.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmCargas.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmCargas.grdCargasTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdCargas, Column, frmCargas);
end;

procedure TfrmCargas.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdCargas,frmCargas);
end;

procedure TfrmCargas.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmCargas.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmCargas, grdCargas);
end;

procedure TfrmCargas.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmCargas, grdCargas);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmCargas.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmCargas.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmCargas,grdCargas);
end;

procedure TfrmCargas.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmCargas);
    Close;
end;

procedure TfrmCargas.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblCargas.State in [dsEdit, dsInsert] then
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

procedure TfrmCargas.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmCargas,grdCargas);
    frmPrincipal.AplicaFiltro(0,frmCargas,grdCargas,'');
end;

procedure TfrmCargas.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmCargas);
end;

procedure TfrmCargas.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmCargas.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmCargas.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmCargas.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmCargas.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmCargas.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmCargas.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmCargas.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmCargas.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmCargas.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmCargas.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmCargas.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmCargas.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmCargas.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmCargas.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmCargas.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmCargas') = False then ActionIsDone := True;
end;

procedure TfrmCargas.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmCargas') = False then ActionIsDone := True;
end;

procedure TfrmCargas.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmCargas') = False then ActionIsDone := True;
end;

procedure TfrmCargas.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmCargas.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmCargas.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmCargas.JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel4Click(Sender: TObject);
begin
    if frmWizardCargas = nil then
    begin
        if VerificaPermissao('L','frmWizardCargas') = False then Exit;
        frmWizardCargas := TfrmWizardCargas.Create(Self);

        if ControleTabelas(0,'tblOtimizacoes','Open') = True then dtmPrincipal.tblOtimizacoes.Open;
        if ControleTabelas(0,'tblAux_Entregas','Open') = True then dtmPrincipal.tblAux_Entregas.Open;
        if ControleTabelas(0,'tblAux_Orimizacoes','Open') = True then dtmPrincipal.tblAux_Otimizacoes.Open;
        if ControleTabelas(0,'tblGanhos','Open') = True then dtmPrincipal.tblGanhos.Open;
        if ControleTabelas(0,'tblParadasVeiculo','Open') = True then dtmPrincipal.tblParadasVeiculo.Open;
        if ControleTabelas(0,'tblLigacoes','Open') = True then dtmPrincipal.tblLigacoes.Open;

        frmWizardCargas.ShowModal;

        if ControleTabelas(0,'tblLigacoes','Close') = True then dtmPrincipal.tblLigacoes.Close;
        if ControleTabelas(0,'tblParadasVeiculo','Close') = True then dtmPrincipal.tblParadasVeiculo.Close;
        if ControleTabelas(0,'tblGanhos','Close') = True then dtmPrincipal.tblGanhos.Close;
        if ControleTabelas(0,'tblAux_Entregas','Close') = True then dtmPrincipal.tblAux_Entregas.Close;
        if ControleTabelas(0,'tblAux_Orimizacoes','Close') = True then dtmPrincipal.tblAux_Otimizacoes.Close;
        if ControleTabelas(0,'tblOtimizacoes','Close') = True then dtmPrincipal.tblOtimizacoes.Close;

        FreeAndNil(frmWizardCargas);
    end
    else
    begin
        MessageDlg('O formulário de assistente de geração de cargas já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmCargas.JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel5 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel5Click(Sender: TObject);
begin
    if dtmPrincipal.tblCargas.RecordCount > 0 then
    begin
        dtmPrincipal.tblCargas.Delete;
    end
    else
    begin
        MessageDlg('Selecione uma carga.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmCargas.JLabel6Click(Sender: TObject);
begin
    if dtmPrincipal.tblCargas.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);

            dtmPrincipal.tblEntregas.Filtered := False;
            dtmPrincipal.tblEntregas.Filter := 'ID_Carga = ' + #39 + dtmPrincipal.tblCargasID_Carga.Value + #39;
            dtmPrincipal.tblEntregas.Filtered := True;

            dtmPrincipal.tblEntregas.IndexFieldNames := 'Sequencia';

            frmMapa.Tipo := 15;
            frmMapa.ShowModal;
            FreeAndNil(frmMapa);

            dtmPrincipal.tblEntregas.Filtered := False;
            dtmPrincipal.tblEntregas.Filter := '';
            dtmPrincipal.tblEntregas.IndexFieldNames := '';
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

procedure TfrmCargas.JLabel6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel6 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel7 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmCargas.JLabel7Click(Sender: TObject);
begin
    if dtmPrincipal.tblCargas.RecordCount > 0 then
    begin
        if frmFinalizaCarga = nil then
        begin
            if VerificaPermissao('L','frmFinalizaCarga') = False then Exit;
            frmFinalizaCarga := TfrmFinalizaCarga.Create(Self);

            dtmPrincipal.tblCargasPontos.IndexFieldNames := 'Sequencia';

            frmFinalizaCarga.ShowModal;

            dtmPrincipal.tblCargasPontos.IndexFieldNames := '';

            FreeAndNil(frmFinalizaCarga);
        end
        else
        begin
            MessageDlg('O formulário para finalização das cargas já se encontra em uso.', mtInformation, [mbOK], 0);
        end;
    end
    else
    begin
        MessageDlg('Não existe nenhum registro disponível.', mtInformation, [mbOK], 0);
    end;
end;

end.
