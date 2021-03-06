unit uTiposCaminho;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmTiposCaminho = class(TForm)
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
    grdTiposCaminho: TDBGrid;
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
    Label4: TLabel;
    DBEdit5: TDBEdit;
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
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
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
    procedure grdTiposCaminhoTitleClick(Column: TColumn);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiposCaminho: TfrmTiposCaminho;

implementation

uses uModule, uPrincipal;

{$R *.dfm}

procedure TfrmTiposCaminho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if dtmPrincipal.tblTiposCaminho.State in [dsEdit, dsInsert] then
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

procedure TfrmTiposCaminho.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmTiposCaminho,grdTiposCaminho,'');
    frmPrincipal.LeGrid(0,frmTiposCaminho,grdTiposCaminho);
end;

procedure TfrmTiposCaminho.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmTiposCaminho,grdTiposCaminho);
    close;
end;

procedure TfrmTiposCaminho.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmTiposCaminho.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmTiposCaminho.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmTiposCaminho.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmTiposCaminho.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmTiposCaminho.grdTiposCaminhoTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdTiposCaminho, Column, frmTiposCaminho);
end;

procedure TfrmTiposCaminho.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdTiposCaminho,frmTiposCaminho);
end;

procedure TfrmTiposCaminho.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmTiposCaminho.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmTiposCaminho, grdTiposCaminho);
end;

procedure TfrmTiposCaminho.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmTiposCaminho, grdTiposCaminho);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmTiposCaminho.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmTiposCaminho.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmTiposCaminho,grdTiposCaminho);
end;

procedure TfrmTiposCaminho.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmTiposCaminho);
    Close;
end;

procedure TfrmTiposCaminho.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblTiposCaminho.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        AllowChange := False;
    end;

    if PageControl1.ActivePage.Caption = 'Consulta' then
    begin
        Consulta1.Enabled := False;
        Cadastro1.Enabled := True;
    end
    else
    begin
        Consulta1.Enabled := True;
        Cadastro1.Enabled := False;
    end;
end;

procedure TfrmTiposCaminho.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmTiposCaminho,grdTiposCaminho);
    frmPrincipal.AplicaFiltro(0,frmTiposCaminho,grdTiposCaminho,'');
end;

procedure TfrmTiposCaminho.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmTiposCaminho);
end;

procedure TfrmTiposCaminho.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmTiposCaminho.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmTiposCaminho.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmTiposCaminho.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmTiposCaminho.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmTiposCaminho.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmTiposCaminho.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmTiposCaminho.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmTiposCaminho.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmTiposCaminho.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmTiposCaminho.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmTiposCaminho.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmTiposCaminho.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmTiposCaminho.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmTiposCaminho.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmTiposCaminho.Inserir1Click(Sender: TObject);
begin
    btnInserir.Click;
end;

procedure TfrmTiposCaminho.Excluir1Click(Sender: TObject);
begin
    btnExcluir.Click;
end;

procedure TfrmTiposCaminho.Alterar1Click(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmTiposCaminho.Confirmar1Click(Sender: TObject);
begin
    btnConfirmar.Click;
end;

procedure TfrmTiposCaminho.Cancelar1Click(Sender: TObject);
begin
    btnCancelar.Click;
end;

procedure TfrmTiposCaminho.Atualizar2Click(Sender: TObject);
begin
    btnAtualizar.Click;
end;

procedure TfrmTiposCaminho.btnInserirEnabledChanged(Sender: TObject);
begin
    Inserir1.Enabled := btnInserir.Enabled;
end;

procedure TfrmTiposCaminho.btnExcluirEnabledChanged(Sender: TObject);
begin
    Excluir1.Enabled := btnExcluir.Enabled;
end;

procedure TfrmTiposCaminho.btnAlterarEnabledChanged(Sender: TObject);
begin
    Alterar1.Enabled := btnAlterar.Enabled;
end;

procedure TfrmTiposCaminho.btnConfirmarEnabledChanged(Sender: TObject);
begin
    Confirmar1.Enabled := btnConfirmar.Enabled;
end;

procedure TfrmTiposCaminho.btnCancelarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmTiposCaminho.btnAtualizarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmTiposCaminho.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmTiposCaminho') = False then ActionIsDone := True;
end;

procedure TfrmTiposCaminho.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmTiposCaminho') = False then ActionIsDone := True;
end;

procedure TfrmTiposCaminho.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmTiposCaminho') = False then ActionIsDone := True;
end;

procedure TfrmTiposCaminho.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmTiposCaminho.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmTiposCaminho.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

end.
