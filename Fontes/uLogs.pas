unit uLogs;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmLogs = class(TForm)
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
    grdLogs: TDBGrid;
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
    LimparLogs1: TMenuItem;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
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
    procedure grdLogsTitleClick(Column: TColumn);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogs: TfrmLogs;

implementation

uses uModule, uPrincipal, uPermissoes, uMostra;

{$R *.dfm}

procedure TfrmLogs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmLogs.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmLogs,grdLogs, '');
    frmPrincipal.LeGrid(0,frmLogs,grdLogs);
end;

procedure TfrmLogs.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmLogs,grdLogs);
    close;
end;

procedure TfrmLogs.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLogs.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLogs.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLogs.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmLogs.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmLogs.grdLogsTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdLogs, Column, frmLogs);
end;

procedure TfrmLogs.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdLogs,frmLogs);
end;

procedure TfrmLogs.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmLogs.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmLogs, grdLogs);
end;

procedure TfrmLogs.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmLogs, grdLogs);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmLogs.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmLogs.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmLogs,grdLogs);
end;

procedure TfrmLogs.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmLogs);
    Close;
end;

procedure TfrmLogs.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblLogs.State in [dsEdit, dsInsert] then
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

procedure TfrmLogs.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmLogs,grdLogs);
    frmPrincipal.AplicaFiltro(0,frmLogs,grdLogs, '');
end;

procedure TfrmLogs.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmLogs);
end;

procedure TfrmLogs.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmLogs.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmLogs.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmLogs.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmLogs.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmLogs.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmLogs.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmLogs.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmLogs.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmLogs.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmLogs.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmLogs.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmLogs.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmLogs.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmLogs.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmLogs.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmLogs') = False then ActionIsDone := True;
end;

procedure TfrmLogs.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmLogs') = False then ActionIsDone := True;
end;

procedure TfrmLogs.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmLogs') = False then ActionIsDone := True;
end;

procedure TfrmLogs.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmLogs.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmLogs.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmLogs.JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLogs.JLabel4Click(Sender: TObject);
begin
    if VerificaPermissao('E','frmLogs') = False then Exit;

    if MessageDlg('ATENÇÃO... Este processo excluirá todas as informações do '+#13+#10+'arquivo de logs.'+#13+#10+'Deseja realmente continuar', mtWarning, [mbYes,mbNo], 0) = mrYes then
    begin
        frmMostra := TfrmMostra.Create(Self);
        frmMostra.Mensagem := 'AGUARDE! Excluindo o arquivo de logs do sistema.';
        frmMostra.ProgressBar1.Max := dtmPrincipal.tblLogs.RecordCount;
        frmMostra.Show;
        frmMostra.Repaint;

        frmMostra.ProgressBar1.Position := 0;
        while not dtmPrincipal.tblLogs.Eof do
        begin
            frmMostra.ProgressBar1.Position := frmMostra.ProgressBar1.Position + 1;
            dtmPrincipal.cDelete := False;
            dtmPrincipal.tblLogs.Delete;
            dtmPrincipal.cDelete := True;
        end;

        FreeAndNil(frmMostra);
    end;
end;

end.
