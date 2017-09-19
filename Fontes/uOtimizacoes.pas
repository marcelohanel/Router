unit uOtimizacoes;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmOtimizacoes = class(TForm)
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
    grdOtimizacoes: TDBGrid;
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
    VerMapa1: TMenuItem;
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
    procedure grdOtimizacoesTitleClick(Column: TColumn);
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
  frmOtimizacoes: TfrmOtimizacoes;
  FiltroOriginal : string;

implementation

uses uModule, uPrincipal, uPermissoes, uMostra, uLogs, uMapa;

{$R *.dfm}

procedure TfrmOtimizacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmOtimizacoes.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    FiltroOriginal := dtmPrincipal.tblOtimizacoes.Filter;
    
    frmPrincipal.AplicaFiltro(0,frmOtimizacoes,grdOtimizacoes,FiltroOriginal);
    frmPrincipal.LeGrid(0,frmOtimizacoes,grdOtimizacoes);
end;

procedure TfrmOtimizacoes.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmOtimizacoes,grdOtimizacoes);
    close;
end;

procedure TfrmOtimizacoes.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmOtimizacoes.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmOtimizacoes.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmOtimizacoes.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmOtimizacoes.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmOtimizacoes.grdOtimizacoesTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdOtimizacoes, Column, frmOtimizacoes);
end;

procedure TfrmOtimizacoes.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdOtimizacoes,frmOtimizacoes);
end;

procedure TfrmOtimizacoes.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmOtimizacoes.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmOtimizacoes, grdOtimizacoes);
end;

procedure TfrmOtimizacoes.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmOtimizacoes, grdOtimizacoes);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmOtimizacoes.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmOtimizacoes.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmOtimizacoes,grdOtimizacoes);
end;

procedure TfrmOtimizacoes.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmOtimizacoes);
    Close;
end;

procedure TfrmOtimizacoes.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblOtimizacoes.State in [dsEdit, dsInsert] then
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

procedure TfrmOtimizacoes.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmOtimizacoes,grdOtimizacoes);
    frmPrincipal.AplicaFiltro(0,frmOtimizacoes,grdOtimizacoes,FiltroOriginal);
end;

procedure TfrmOtimizacoes.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmOtimizacoes);
end;

procedure TfrmOtimizacoes.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmOtimizacoes.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmOtimizacoes.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmOtimizacoes.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmOtimizacoes.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmOtimizacoes.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmOtimizacoes.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmOtimizacoes.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmOtimizacoes.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmOtimizacoes.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmOtimizacoes.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmOtimizacoes.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmOtimizacoes.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmOtimizacoes.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmOtimizacoes.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmOtimizacoes.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmOtimizacoes') = False then ActionIsDone := True;
end;

procedure TfrmOtimizacoes.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmOtimizacoes') = False then ActionIsDone := True;
end;

procedure TfrmOtimizacoes.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmOtimizacoes') = False then ActionIsDone := True;
end;

procedure TfrmOtimizacoes.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmOtimizacoes.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmOtimizacoes.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmOtimizacoes.JLabel4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmOtimizacoes.JLabel4Click(Sender: TObject);
begin
    if dtmPrincipal.tblOtimizacoes.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 14;
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
