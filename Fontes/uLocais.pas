unit uLocais;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, ComCtrls, Buttons, DBSBtn,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfrmLocais = class(TForm)
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
    grdLocais: TDBGrid;
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
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    JLabel4: TJLabel;
    LocalizaonoMapa1: TMenuItem;
    N2: TMenuItem;
    JLabel5: TJLabel;
    VerTodososLocais1: TMenuItem;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
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
    procedure grdLocaisTitleClick(Column: TColumn);
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
    procedure JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel4Click(Sender: TObject);
    procedure JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JLabel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocais: TfrmLocais;

implementation

uses uModule, uPrincipal, uMapa;

{$R *.dfm}

procedure TfrmLocais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if dtmPrincipal.tblLocais.State in [dsEdit, dsInsert] then
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

procedure TfrmLocais.FormShow(Sender: TObject);
begin
    Self.ClientHeight := 520;
    Self.ClientWidth := 783;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    frmPrincipal.AplicaFiltro(0,frmLocais,grdLocais,'');
    frmPrincipal.LeGrid(0,frmLocais,grdLocais);
end;

procedure TfrmLocais.JLabel1Click(Sender: TObject);
begin
    frmPrincipal.SalvaGrid(0,frmLocais,grdLocais);
    close;
end;

procedure TfrmLocais.JLabel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel1 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLocais.JLabel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel2 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLocais.JLabel3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     with JLabel3 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLocais.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmLocais.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmLocais.grdLocaisTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdLocais, Column, frmLocais);
end;

procedure TfrmLocais.btnProcurarClick(Sender: TObject);
begin
    frmPrincipal.PesqGrid(0,grdLocais,frmLocais);
end;

procedure TfrmLocais.btnExportarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuExportar.Popup (Pt.x, Pt.y);
end;

procedure TfrmLocais.ExportarparaExcell1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(0, frmLocais, grdLocais);
end;

procedure TfrmLocais.ExportarparaXML1Click(Sender: TObject);
begin
    frmPrincipal.Exportar(1, frmLocais, grdLocais);
    MessageDlg('Dados exportados', mtInformation, [mbOK], 0);
end;

procedure TfrmLocais.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmLocais.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,frmLocais,grdLocais);
end;

procedure TfrmLocais.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,frmLocais);
    Close;
end;

procedure TfrmLocais.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if dtmPrincipal.tblLocais.State in [dsEdit, dsInsert] then
    begin
        MessageDlg('Existe um trabalho pendente.', mtWarning, [mbOK], 0);
        AllowChange := False;
    end;

    if PageControl1.ActivePage.Caption = 'Consulta' then
    begin
        Consulta1.Enabled := False;
        Cadastro1.Enabled := True;
        JLabel4.Enabled := False;
        LocalizaonoMapa1.Enabled := False;
        JLabel5.Enabled := False;
        VerTodososLocais1.Enabled := False;
    end
    else
    begin
        Consulta1.Enabled := True;
        Cadastro1.Enabled := False;
        JLabel4.Enabled := True;
        LocalizaonoMapa1.Enabled := True;
        JLabel5.Enabled := True;
        VerTodososLocais1.Enabled := True;
    end;
end;

procedure TfrmLocais.btnFiltroClick(Sender: TObject);
begin
    frmPrincipal.Filtro(0,frmLocais,grdLocais);
    frmPrincipal.AplicaFiltro(0,frmLocais,grdLocais,'');
end;

procedure TfrmLocais.btnRelatoriosClick(Sender: TObject);
begin
    frmPrincipal.MostraReport(0,frmLocais);
end;

procedure TfrmLocais.Primeiro1Click(Sender: TObject);
begin
    btnFirst.Click;
end;

procedure TfrmLocais.Anterior1Click(Sender: TObject);
begin
    btnAnterior.Click;
end;

procedure TfrmLocais.Prximo1Click(Sender: TObject);
begin
    btnProximo.Click;
end;

procedure TfrmLocais.ltimo1Click(Sender: TObject);
begin
    btnUltimo.Click;
end;

procedure TfrmLocais.Atualizar1Click(Sender: TObject);
begin
    btnRefresh.Click;
end;

procedure TfrmLocais.btnFirstEnabledChanged(Sender: TObject);
begin
    Primeiro1.Enabled := btnFirst.Enabled;
end;

procedure TfrmLocais.btnProcurarEnabledChanged(Sender: TObject);
begin
    Procurar1.Enabled := btnProcurar.Enabled;
end;

procedure TfrmLocais.btnFiltroEnabledChanged(Sender: TObject);
begin
    Filtrar1.Enabled := btnFiltro.Enabled;
end;

procedure TfrmLocais.btnPersonalizarEnabledChanged(Sender: TObject);
begin
    Personalizar1.Enabled := btnPersonalizar.Enabled;
end;

procedure TfrmLocais.btnExportarEnabledChanged(Sender: TObject);
begin
    Exportar1.Enabled := btnExportar.Enabled;
end;

procedure TfrmLocais.btnRelatoriosEnabledChanged(Sender: TObject);
begin
    Relatrios1.Enabled := btnRelatorios.Enabled;
end;

procedure TfrmLocais.btnAnteriorEnabledChanged(Sender: TObject);
begin
    Anterior1.Enabled := btnAnterior.Enabled;
end;

procedure TfrmLocais.btnProximoEnabledChanged(Sender: TObject);
begin
    Prximo1.Enabled := btnProximo.Enabled;
end;

procedure TfrmLocais.btnUltimoEnabledChanged(Sender: TObject);
begin
    Ltimo1.Enabled := btnUltimo.Enabled;
end;

procedure TfrmLocais.btnRefreshEnabledChanged(Sender: TObject);
begin
    Atualizar1.Enabled := btnRefresh.Enabled;
end;

procedure TfrmLocais.Inserir1Click(Sender: TObject);
begin
    btnInserir.Click;
end;

procedure TfrmLocais.Excluir1Click(Sender: TObject);
begin
    btnExcluir.Click;
end;

procedure TfrmLocais.Alterar1Click(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmLocais.Confirmar1Click(Sender: TObject);
begin
    btnConfirmar.Click;
end;

procedure TfrmLocais.Cancelar1Click(Sender: TObject);
begin
    btnCancelar.Click;
end;

procedure TfrmLocais.Atualizar2Click(Sender: TObject);
begin
    btnAtualizar.Click;
end;

procedure TfrmLocais.btnInserirEnabledChanged(Sender: TObject);
begin
    Inserir1.Enabled := btnInserir.Enabled;
end;

procedure TfrmLocais.btnExcluirEnabledChanged(Sender: TObject);
begin
    Excluir1.Enabled := btnExcluir.Enabled;
end;

procedure TfrmLocais.btnAlterarEnabledChanged(Sender: TObject);
begin
    Alterar1.Enabled := btnAlterar.Enabled;
end;

procedure TfrmLocais.btnConfirmarEnabledChanged(Sender: TObject);
begin
    Confirmar1.Enabled := btnConfirmar.Enabled;
end;

procedure TfrmLocais.btnCancelarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmLocais.btnAtualizarEnabledChanged(Sender: TObject);
begin
    Cancelar1.Enabled := btnCancelar.Enabled;
end;

procedure TfrmLocais.btnInserirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('I','frmLocais') = False then ActionIsDone := True;
end;

procedure TfrmLocais.btnExcluirBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('E','frmLocais') = False then ActionIsDone := True;
end;

procedure TfrmLocais.btnAlterarBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
    if VerificaPermissao('A','frmLocais') = False then ActionIsDone := True;
end;

procedure TfrmLocais.btnConfirmarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Confirmar','S',0);
end;

procedure TfrmLocais.btnCancelarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Cancelar','S',0);
end;

procedure TfrmLocais.btnAtualizarClick(Sender: TObject);
begin
    frmPrincipal.GeraLogs(Self.Name,'Atualizar','S',0);
end;

procedure TfrmLocais.JLabel4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel4 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLocais.JLabel4Click(Sender: TObject);
begin
    if dtmPrincipal.tblLocais.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 0;
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

procedure TfrmLocais.JLabel5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     with JLabel5 do
     begin
          Font.Color := OffMoveFColor;
          Font.Style := OffStyles;
     end;
end;

procedure TfrmLocais.JLabel5Click(Sender: TObject);
begin
    if dtmPrincipal.tblLocais.RecordCount > 0 then
    begin
        if frmMapa = nil then
        begin
            if VerificaPermissao('L','frmMapa') = False then Exit;
            frmMapa := TfrmMapa.Create(Self);
            frmMapa.Tipo := 2;
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

end.
