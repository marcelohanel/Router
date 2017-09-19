unit uRelatorios;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmRelatorios = class(TForm)
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
    grdRelatorios: TDBGrid;
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
    Label5: TLabel;
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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBSpeedButton3: TDBSpeedButton;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBSpeedButton5: TDBSpeedButton;
    OpenDialog1: TOpenDialog;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBSpeedButton4: TDBSpeedButton;
    JLabel4: TJLabel;
    VisualizarRelatrio1: TMenuItem;
    JLabel5: TJLabel;
    ConstrutordeLayouts1: TMenuItem;
    N2: TMenuItem;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
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
    procedure grdRelatoriosTitleClick(Column: TColumn);
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
    procedure DBSpeedButton2Click(Sender: TObject);
    procedure DBSpeedButton1Click(Sender: TObject);
    procedure DBSpeedButton3Click(Sender: TObject);
    procedure DBSpeedButton4Click(Sender: TObject);
    procedure JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel4Click(Sender: TObject);
    procedure JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel5Click(Sender: TObject);
    procedure DBSpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses uModule, uPrincipal, uPermissoes, uUsuarios, uReport, uProgramas;

{$R *.dfm}

procedure TfrmRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if dtmPrincipal.tblRelatorios.State in [dsEdit, dsInsert] then
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

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmRelatorios,grdRelatorios,'');
    frmPrincipal.LeGrid(0,frmRelatorios,grdRelatorios);
end;

procedure TfrmRelatorios.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmRelatorios,grdRelatorios);
    close;
end;

procedure TfrmRelatorios.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmRelatorios.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmRelatorios.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmRelatorios.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmRelatorios.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmRelatorios.grdRelatoriosTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdRelatorios, Column, frmRelatorios);
end;

procedure TfrmRelatorios.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdRelatorios,frmRelatorios);
end;

procedure TfrmRelatorios.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmRelatorios.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmRelatorios, grdRelatorios);
end;

procedure TfrmRelatorios.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmRelatorios, grdRelatorios);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmRelatorios.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmRelatorios.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmRelatorios,grdRelatorios);
end;

procedure TfrmRelatorios.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmRelatorios);
    Close;
end;

procedure TfrmRelatorios.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblRelatorios.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        AllowChange := False;
    end;

    if PageControl1.ActivePage.Caption = 'Consulta' then
    begin
        Consulta1.Enabled := False;
        Cadastro1.Enabled := True;
        JLabel4.Enabled := False;
        VisualizarRelatrio1.Enabled := False;
        JLabel5.Enabled := False;
        ConstrutordeLayouts1.Enabled := False;
    end
    else
    begin
        Consulta1.Enabled := True;
        Cadastro1.Enabled := False;
        JLabel4.Enabled := True;
        VisualizarRelatrio1.Enabled := True;
        JLabel5.Enabled := True;
        ConstrutordeLayouts1.Enabled := True;
    end;
end;

procedure TfrmRelatorios.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmRelatorios,grdRelatorios);
    frmPrincipal.AplicaFiltro(0,frmRelatorios,grdRelatorios,'');
end;

procedure TfrmRelatorios.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmRelatorios);
end;

procedure TfrmRelatorios.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmRelatorios.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmRelatorios.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmRelatorios.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmRelatorios.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmRelatorios.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmRelatorios.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmRelatorios.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmRelatorios.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmRelatorios.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmRelatorios.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmRelatorios.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmRelatorios.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmRelatorios.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmRelatorios.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmRelatorios.Inserir1Click(Sender: TObject);
begin
    btnInserir.Click;
end;

procedure TfrmRelatorios.Excluir1Click(Sender: TObject);
begin
    btnExcluir.Click;
end;

procedure TfrmRelatorios.Alterar1Click(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmRelatorios.Confirmar1Click(Sender: TObject);
begin
    btnConfirmar.Click;
end;

procedure TfrmRelatorios.Cancelar1Click(Sender: TObject);
begin
    btnCancelar.Click;
end;

procedure TfrmRelatorios.Atualizar2Click(Sender: TObject);
begin
    btnAtualizar.Click;
end;

procedure TfrmRelatorios.btnInserirEnabledChanged(Sender: TObject);
begin
    Inserir1.Enabled := btnInserir.Enabled;
end;

procedure TfrmRelatorios.btnExcluirEnabledChanged(Sender: TObject);
begin
    Excluir1.Enabled := btnExcluir.Enabled;
end;

procedure TfrmRelatorios.btnAlterarEnabledChanged(Sender: TObject);
begin
    Alterar1.Enabled := btnAlterar.Enabled;
end;

procedure TfrmRelatorios.btnConfirmarEnabledChanged(Sender: TObject);
begin
    Confirmar1.Enabled := btnConfirmar.Enabled;
end;

procedure TfrmRelatorios.btnCancelarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmRelatorios.btnAtualizarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmRelatorios.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmRelatorios') = False then ActionIsDone := True;
end;

procedure TfrmRelatorios.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmRelatorios') = False then ActionIsDone := True;
end;

procedure TfrmRelatorios.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmRelatorios') = False then ActionIsDone := True;
end;

procedure TfrmRelatorios.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmRelatorios.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmRelatorios.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmRelatorios.DBSpeedButton5Click(Sender: TObject);
begin
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'Relatorios';
    if OpenDialog1.Execute then dtmPrincipal.tblRelatoriosLayout.Value := OpenDialog1.FileName;
end;

procedure TfrmRelatorios.DBSpeedButton2Click(Sender: TObject);
begin
    if frmUsuarios = nil then
    begin
        if VerificaPermissao('L','frmUsuarios') = False then Exit;
        frmUsuarios := TfrmUsuarios.Create(Self);
        frmUsuarios.ShowModal;
        FreeAndNil(frmUsuarios);
        if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
        if ControleTabelas(0,'tblUsuarios','Open') = True then dtmPrincipal.tblUsuarios.Open;
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos usuários do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmRelatorios.DBSpeedButton1Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmRelatorios,DBLookupComboBox1, '');
end;

procedure TfrmRelatorios.DBSpeedButton3Click(Sender: TObject);
begin
    frmPrincipal.Find(0,frmRelatorios,DBLookupComboBox2, '');
end;

procedure TfrmRelatorios.DBSpeedButton4Click(Sender: TObject);
begin
    frmPrincipal.Report(0,dtmPrincipal.tblRelatoriosLayout.AsString);
end;

procedure TfrmRelatorios.JLabel4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmRelatorios.JLabel4Click(Sender: TObject);
begin
    if dtmPrincipal.tblRelatorios.RecordCount > 0 then
    begin
        frmPrincipal.Report(2,dtmPrincipal.tblRelatoriosLayout.AsString);
    end;
end;

procedure TfrmRelatorios.JLabel5MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel5 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmRelatorios.JLabel5Click(Sender: TObject);
begin
    frmPrincipal.Report(1,'');
end;

procedure TfrmRelatorios.DBSpeedButton6Click(Sender: TObject);
begin
    if frmProgramas = nil then
    begin
        if VerificaPermissao('L','frmProgramas') = False then Exit;
        frmProgramas := TfrmProgramas.Create(Self);
        frmProgramas.ShowModal;
        FreeAndNil(frmProgramas);
        if ControleTabelas(0,'tblProgramas','Close') = True then dtmPrincipal.tblProgramas.Close;
        if ControleTabelas(0,'tblProgramas','Open') = True then dtmPrincipal.tblProgramas.Open;
    end
    else
    begin
        MessageDlg('O formulário para manutenção dos programas do sistema já está '+#13+#10+'em uso.', mtWarning, [mbOK], 0);
    end;
end;

end.
