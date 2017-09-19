unit uLigacoes;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmLigacoes = class(TForm)
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
    grdLigacoes: TDBGrid;
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
    JLabel5: TJLabel;
    ConstrutordeLayouts1: TMenuItem;
    N2: TMenuItem;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBSpeedButton4: TDBSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBSpeedButton5: TDBSpeedButton;
    DBSpeedButton6: TDBSpeedButton;
    JLabel4: TJLabel;
    VerTodasasLigaes1: TMenuItem;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    dbSBtnNew: TDBSpeedButton;
    dbSBtnDelete: TDBSpeedButton;
    dbSBtnEdit: TDBSpeedButton;
    dbSBtnSave: TDBSpeedButton;
    dbSBtnCancel: TDBSpeedButton;
    dbSBtnRefresh: TDBSpeedButton;
    DBGrid1: TDBGrid;
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
    procedure grdLigacoesTitleClick(Column: TColumn);
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
    procedure JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel5Click(Sender: TObject);
    procedure DBSpeedButton4Click(Sender: TObject);
    procedure DBSpeedButton6Click(Sender: TObject);
    procedure JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLigacoes: TfrmLigacoes;

implementation

uses uModule, uPrincipal, uPermissoes, uLocais, uTiposCaminho, uMapa;

{$R *.dfm}

procedure TfrmLigacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if dtmPrincipal.tblLigacoes.State in [dsEdit, dsInsert] then
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

procedure TfrmLigacoes.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmLigacoes,grdLigacoes,'');
    frmPrincipal.LeGrid(0,frmLigacoes,grdLigacoes);
end;

procedure TfrmLigacoes.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmLigacoes,grdLigacoes);
    close;
end;

procedure TfrmLigacoes.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLigacoes.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLigacoes.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLigacoes.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmLigacoes.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmLigacoes.grdLigacoesTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdLigacoes, Column, frmLigacoes);
end;

procedure TfrmLigacoes.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdLigacoes,frmLigacoes);
end;

procedure TfrmLigacoes.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmLigacoes.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmLigacoes, grdLigacoes);
end;

procedure TfrmLigacoes.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmLigacoes, grdLigacoes);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmLigacoes.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmLigacoes.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmLigacoes,grdLigacoes);
end;

procedure TfrmLigacoes.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmLigacoes);
    Close;
end;

procedure TfrmLigacoes.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblLigacoes.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        AllowChange := False;
    end;

    if PageControl1.ActivePage.Caption = 'Consulta' then
    begin
        Consulta1.Enabled := False;
        Cadastro1.Enabled := True;
        JLabel5.Enabled := False;
        ConstrutordeLayouts1.Enabled := False;
        VerTodasasLigaes1.Enabled := False;
        JLabel4.Enabled := False;
    end
    else
    begin
        Consulta1.Enabled := True;
        Cadastro1.Enabled := False;
        JLabel5.Enabled := True;
        ConstrutordeLayouts1.Enabled := True;
        VerTodasasLigaes1.Enabled := True;
        JLabel4.Enabled := True;
    end;
end;

procedure TfrmLigacoes.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmLigacoes,grdLigacoes);
    frmPrincipal.AplicaFiltro(0,frmLigacoes,grdLigacoes,'');
end;

procedure TfrmLigacoes.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmLigacoes);
end;

procedure TfrmLigacoes.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmLigacoes.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmLigacoes.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmLigacoes.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmLigacoes.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmLigacoes.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmLigacoes.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmLigacoes.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmLigacoes.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmLigacoes.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmLigacoes.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmLigacoes.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmLigacoes.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmLigacoes.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmLigacoes.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmLigacoes.Inserir1Click(Sender: TObject);
begin
    btnInserir.Click;
end;

procedure TfrmLigacoes.Excluir1Click(Sender: TObject);
begin
    btnExcluir.Click;
end;

procedure TfrmLigacoes.Alterar1Click(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmLigacoes.Confirmar1Click(Sender: TObject);
begin
    btnConfirmar.Click;
end;

procedure TfrmLigacoes.Cancelar1Click(Sender: TObject);
begin
    btnCancelar.Click;
end;

procedure TfrmLigacoes.Atualizar2Click(Sender: TObject);
begin
    btnAtualizar.Click;
end;

procedure TfrmLigacoes.btnInserirEnabledChanged(Sender: TObject);
begin
    Inserir1.Enabled := btnInserir.Enabled;
end;

procedure TfrmLigacoes.btnExcluirEnabledChanged(Sender: TObject);
begin
    Excluir1.Enabled := btnExcluir.Enabled;
end;

procedure TfrmLigacoes.btnAlterarEnabledChanged(Sender: TObject);
begin
    Alterar1.Enabled := btnAlterar.Enabled;
end;

procedure TfrmLigacoes.btnConfirmarEnabledChanged(Sender: TObject);
begin
    Confirmar1.Enabled := btnConfirmar.Enabled;
end;

procedure TfrmLigacoes.btnCancelarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmLigacoes.btnAtualizarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmLigacoes.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmLigacoes') = False then ActionIsDone := True;
end;

procedure TfrmLigacoes.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmLigacoes') = False then ActionIsDone := True;
end;

procedure TfrmLigacoes.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmLigacoes') = False then ActionIsDone := True;
end;

procedure TfrmLigacoes.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmLigacoes.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmLigacoes.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmLigacoes.DBSpeedButton2Click(Sender: TObject);
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

procedure TfrmLigacoes.DBSpeedButton1Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmLigacoes,DBLookupComboBox1, '');
end;

procedure TfrmLigacoes.DBSpeedButton3Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmLigacoes,DBLookupComboBox2, '');
end;

procedure TfrmLigacoes.JLabel5MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel5 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLigacoes.JLabel5Click(Sender: TObject);
begin
    if dtmPrincipal.tblLocais.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 1;
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
        MessageDlg('Não existe nenhum registro selecionado.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmLigacoes.DBSpeedButton4Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmLigacoes,DBLookupComboBox3, '');
end;

procedure TfrmLigacoes.DBSpeedButton6Click(Sender: TObject);
begin
    if frmTiposCaminho = nil then
    begin
        if VerificaPermissao('L','frmTiposCaminho') = False then Exit;
        frmTiposCaminho := TfrmTiposCaminho.Create(Self);
        frmTiposCaminho.ShowModal;
        FreeAndNil(frmTiposCaminho);
        if ControleTabelas(0,'tblTiposCaminho','Close') = True then dtmPrincipal.tblTiposCaminho.Close;
        if ControleTabelas(0,'tblTiposCaminho','Open') = True then dtmPrincipal.tblTiposCaminho.Open;
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos tipos de caminho já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmLigacoes.JLabel4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLigacoes.JLabel4Click(Sender: TObject);
begin
    if dtmPrincipal.tblLocais.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 3;
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

end.
