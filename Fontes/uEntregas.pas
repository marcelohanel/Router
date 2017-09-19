unit uEntregas;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmEntregas = class(TForm)
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
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    btnAnterior: TDBSpeedButton;
    btnProximo: TDBSpeedButton;
    btnRefresh: TDBSpeedButton;
    btnFirst: TDBSpeedButton;
    btnUltimo: TDBSpeedButton;
    ScrollBox2: TScrollBox;
    Panel4: TPanel;
    grdEntregas: TDBGrid;
    btnAlterar: TDBSpeedButton;
    btnConfirmar: TDBSpeedButton;
    btnCancelar: TDBSpeedButton;
    btnAtualizar: TDBSpeedButton;
    btnInserir: TDBSpeedButton;
    btnExcluir: TDBSpeedButton;
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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btnFiltro: TDBSpeedButton;
    Consulta1: TMenuItem;
    Cadastro1: TMenuItem;
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
    Inserir1: TMenuItem;
    Excluir1: TMenuItem;
    Alterar1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    Atualizar2: TMenuItem;
    DBSpeedButton1: TDBSpeedButton;
    DBSpeedButton2: TDBSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBSpeedButton3: TDBSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBSpeedButton5: TDBSpeedButton;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    JLabel4: TJLabel;
    N2: TMenuItem;
    ImportarEntregas1: TMenuItem;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBSpeedButton4: TDBSpeedButton;
    DBSpeedButton6: TDBSpeedButton;
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
    procedure grdEntregasTitleClick(Column: TColumn);
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
    procedure Inserir1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Confirmar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure Atualizar2Click(Sender: TObject);
    procedure btnInserirEnabledChanged(Sender: TObject);
    procedure btnExcluirEnabledChanged(Sender: TObject);
    procedure btnAlterarEnabledChanged(Sender: TObject);
    procedure btnConfirmarEnabledChanged(Sender: TObject);
    procedure btnCancelarEnabledChanged(Sender: TObject);
    procedure btnAtualizarEnabledChanged(Sender: TObject);
    procedure btnInserirBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure btnExcluirBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure btnAlterarBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure DBSpeedButton2Click(Sender: TObject);
    procedure DBSpeedButton1Click(Sender: TObject);
    procedure DBSpeedButton3Click(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel4Click(Sender: TObject);
    procedure DBSpeedButton4Click(Sender: TObject);
    procedure DBSpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntregas: TfrmEntregas;

implementation

uses uModule, uPrincipal, uPermissoes, uLocais, uTiposCaminho, uMapa,
  uLigacoes, uImporta, uMostra, uCargas;

{$R *.dfm}

procedure TfrmEntregas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if dtmPrincipal.tblEntregas.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        Action := caNone;
    end
    else
    begin
        frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
        Action := caFree;
    end;
end;

procedure TfrmEntregas.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmEntregas,grdEntregas,'');
    frmPrincipal.LeGrid(0,frmEntregas,grdEntregas);
end;

procedure TfrmEntregas.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmEntregas,grdEntregas);
    close;
end;

procedure TfrmEntregas.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmEntregas.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmEntregas.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmEntregas.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmEntregas.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmEntregas.grdEntregasTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdEntregas, Column, frmEntregas);
end;

procedure TfrmEntregas.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdEntregas,frmEntregas);
end;

procedure TfrmEntregas.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmEntregas.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmEntregas, grdEntregas);
end;

procedure TfrmEntregas.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmEntregas, grdEntregas);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmEntregas.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmEntregas.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmEntregas,grdEntregas);
end;

procedure TfrmEntregas.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmEntregas);
    Close;
end;

procedure TfrmEntregas.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblEntregas.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        AllowChange := False;
    end;

    if PageControl1.ActivePage.Caption = 'Consulta' then
    begin
        Consulta1.Enabled := False;
        Cadastro1.Enabled := True;
        ImportarEntregas1.Enabled := False;
        JLabel4.Enabled := False;
    end
    else
    begin
        Consulta1.Enabled := True;
        Cadastro1.Enabled := False;
        ImportarEntregas1.Enabled := True;
        JLabel4.Enabled := True;
    end;
end;

procedure TfrmEntregas.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmEntregas,grdEntregas);
    frmPrincipal.AplicaFiltro(0,frmEntregas,grdEntregas,'');
end;

procedure TfrmEntregas.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmEntregas);
end;

procedure TfrmEntregas.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmEntregas.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmEntregas.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmEntregas.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmEntregas.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmEntregas.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmEntregas.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmEntregas.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmEntregas.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmEntregas.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmEntregas.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmEntregas.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmEntregas.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmEntregas.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmEntregas.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmEntregas.Inserir1Click(Sender: TObject);
begin
    btnInserir.Click;
end;

procedure TfrmEntregas.Excluir1Click(Sender: TObject);
begin
    btnExcluir.Click;
end;

procedure TfrmEntregas.Alterar1Click(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmEntregas.Confirmar1Click(Sender: TObject);
begin
    btnConfirmar.Click;
end;

procedure TfrmEntregas.Cancelar1Click(Sender: TObject);
begin
    btnCancelar.Click;
end;

procedure TfrmEntregas.Atualizar2Click(Sender: TObject);
begin
    btnAtualizar.Click;
end;

procedure TfrmEntregas.btnInserirEnabledChanged(Sender: TObject);
begin
    Inserir1.Enabled := btnInserir.Enabled;
end;

procedure TfrmEntregas.btnExcluirEnabledChanged(Sender: TObject);
begin
    Excluir1.Enabled := btnExcluir.Enabled;
end;

procedure TfrmEntregas.btnAlterarEnabledChanged(Sender: TObject);
begin
    Alterar1.Enabled := btnAlterar.Enabled;
end;

procedure TfrmEntregas.btnConfirmarEnabledChanged(Sender: TObject);
begin
    Confirmar1.Enabled := btnConfirmar.Enabled;
end;

procedure TfrmEntregas.btnCancelarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmEntregas.btnAtualizarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmEntregas.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmEntregas') = False then ActionIsDone := True;
end;

procedure TfrmEntregas.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmEntregas') = False then ActionIsDone := True;
end;

procedure TfrmEntregas.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmEntregas') = False then ActionIsDone := True;
end;

procedure TfrmEntregas.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmEntregas.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmEntregas.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmEntregas.DBSpeedButton2Click(Sender: TObject);
begin
    if frmLocais = nil then
    begin
        if VerificaPermissao('L','frmLocais') = False then Exit;
        frmLocais := TfrmLocais.Create(Self);
        frmLocais.ShowModal;
        FreeAndNil(frmLocais);
        if ControleTabelas(0,'tblLocais','Close') = True then dtmPrincipal.tblLocais.Close;
        if ControleTabelas(0,'tblLocais','Open') = True then dtmPrincipal.tblLocais.Open;
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos locais já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmEntregas.DBSpeedButton1Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmEntregas,DBLookupComboBox1,'Deposito = ' + #39 + 'S' + #39);
end;

procedure TfrmEntregas.DBSpeedButton3Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmEntregas,DBLookupComboBox2, '');
end;

procedure TfrmEntregas.DBEdit1Enter(Sender: TObject);
begin
    dtmPrincipal.tblLocais.Filtered := False;
    dtmPrincipal.tblLocais.Filter := 'Deposito = ' + #39 + 'S' + #39;
    dtmPrincipal.tblLocais.Filtered := True;
end;

procedure TfrmEntregas.DBEdit1Exit(Sender: TObject);
begin
    dtmPrincipal.tblLocais.Filtered := False;
    dtmPrincipal.tblLocais.Filter := '';
    dtmPrincipal.tblLocais.Filtered := False;
end;

procedure TfrmEntregas.JLabel4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmEntregas.JLabel4Click(Sender: TObject);
begin
    if frmImporta = nil then
    begin
        if VerificaPermissao('L','frmImporta') = False then Exit;
        frmImporta := TfrmImporta.Create(Self);
        frmImporta.ShowModal;
        FreeAndNil(frmImporta);
    end
    else
    begin
        MessageDlg('O formulário para importação de cargas já está em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmEntregas.DBSpeedButton4Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmEntregas,DBLookupComboBox3, '');
end;

procedure TfrmEntregas.DBSpeedButton6Click(Sender: TObject);
begin
    if frmCargas = nil then
    begin
        if VerificaPermissao('L','frmCargas') = False then Exit;
        frmCargas := TfrmCargas.Create(Self);
        frmCargas.ShowModal;
        FreeAndNil(frmCargas);
        if ControleTabelas(0,'tblCargas','Close') = True then dtmPrincipal.tblCargas.Close;
        if ControleTabelas(0,'tblCargas','Open') = True then dtmPrincipal.tblCargas.Open;
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos locais já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

end.
