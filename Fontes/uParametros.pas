unit uParametros;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmParametros = class(TForm)
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
    grdParametros: TDBGrid;
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
    OpenDialog1: TOpenDialog;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBSpeedButton5: TDBSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit6: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    Label25: TLabel;
    DBEdit22: TDBEdit;
    TabSheet5: TTabSheet;
    GroupBox3: TGroupBox;
    Label31: TLabel;
    DBRadioGroup4: TDBRadioGroup;
    Label26: TLabel;
    DBRadioGroup5: TDBRadioGroup;
    Label27: TLabel;
    DBEdit23: TDBEdit;
    Label28: TLabel;
    DBRadioGroup6: TDBRadioGroup;
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
    procedure grdParametrosTitleClick(Column: TColumn);
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
    procedure DBSpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametros: TfrmParametros;

implementation

uses uModule, uPrincipal;

{$R *.dfm}

procedure TfrmParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if dtmPrincipal.tblParametros.State in [dsEdit, dsInsert] then
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

procedure TfrmParametros.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmParametros,grdParametros,'');
    frmPrincipal.LeGrid(0,frmParametros,grdParametros);
end;

procedure TfrmParametros.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmParametros,grdParametros);
    close;
end;

procedure TfrmParametros.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmParametros.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmParametros.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmParametros.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmParametros.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmParametros.grdParametrosTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdParametros, Column, frmParametros);
end;

procedure TfrmParametros.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdParametros,frmParametros);
end;

procedure TfrmParametros.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmParametros.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmParametros, grdParametros);
end;

procedure TfrmParametros.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmParametros, grdParametros);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmParametros.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmParametros.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmParametros,grdParametros);
end;

procedure TfrmParametros.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmParametros);
    Close;
end;

procedure TfrmParametros.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblParametros.State in [dsEdit, dsInsert] then
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

procedure TfrmParametros.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmParametros,grdParametros);
    frmPrincipal.AplicaFiltro(0,frmParametros,grdParametros,'');
end;

procedure TfrmParametros.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmParametros);
end;

procedure TfrmParametros.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmParametros.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmParametros.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmParametros.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmParametros.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmParametros.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmParametros.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmParametros.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmParametros.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmParametros.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmParametros.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmParametros.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmParametros.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmParametros.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmParametros.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmParametros.Inserir1Click(Sender: TObject);
begin
    btnInserir.Click;
end;

procedure TfrmParametros.Excluir1Click(Sender: TObject);
begin
    btnExcluir.Click;
end;

procedure TfrmParametros.Alterar1Click(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmParametros.Confirmar1Click(Sender: TObject);
begin
    btnConfirmar.Click;
end;

procedure TfrmParametros.Cancelar1Click(Sender: TObject);
begin
    btnCancelar.Click;
end;

procedure TfrmParametros.Atualizar2Click(Sender: TObject);
begin
    btnAtualizar.Click;
end;

procedure TfrmParametros.btnInserirEnabledChanged(Sender: TObject);
begin
    Inserir1.Enabled := btnInserir.Enabled;
end;

procedure TfrmParametros.btnExcluirEnabledChanged(Sender: TObject);
begin
    Excluir1.Enabled := btnExcluir.Enabled;
end;

procedure TfrmParametros.btnAlterarEnabledChanged(Sender: TObject);
begin
    Alterar1.Enabled := btnAlterar.Enabled;
end;

procedure TfrmParametros.btnConfirmarEnabledChanged(Sender: TObject);
begin
    Confirmar1.Enabled := btnConfirmar.Enabled;
end;

procedure TfrmParametros.btnCancelarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmParametros.btnAtualizarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmParametros.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmParametros') = False then ActionIsDone := True;
end;

procedure TfrmParametros.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmParametros') = False then ActionIsDone := True;
end;

procedure TfrmParametros.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmParametros') = False then ActionIsDone := True;
end;

procedure TfrmParametros.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmParametros.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmParametros.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmParametros.DBSpeedButton5Click(Sender: TObject);
begin
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'Imagens';
    if OpenDialog1.Execute then dtmPrincipal.tblParametrosMapa_imagem.Value := OpenDialog1.FileName;
end;

end.
