unit uFind;

interface

uses
  DB, ADODB, DBCtrls, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Menus, DBSBtn;

type
  TfrmFind = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    Image2: TImage;
    edtPesq: TEdit;
    grdFind: TDBGrid;
    btnPersonalizar: TDBSpeedButton;
    mnuPersonalizar: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnPersonalizarClick(Sender: TObject);
    procedure grdFindDblClick(Sender: TObject);
    procedure grdFindTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : integer;
    Formulario : TForm;
    Combo : TDBLookupComboBox;
    Filtro : String;
  end;

var
  frmFind: TfrmFind;
  Campo : string;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmFind.SpeedButton1Click(Sender: TObject);
var
    i : integer;
    Campo : integer;
begin
    frmPrincipal.SalvaGrid(0,Formulario,grdFind);

    Campo := 0;
    for i := 0 to grdFind.Columns.Count - 1 do
    begin
        if Formulario.Name = 'frmLigacoes' then
        begin
            if grdFind.Columns[i].FieldName = 'ID_Local' then
            begin
                Campo := i;
            end;
        end
        else
        begin
            if grdFind.Columns[i].FieldName = Combo.DataField then
            begin
                Campo := i;
            end;
        end;
    end;

    TADOTable(dtmPrincipal.FindComponent(Combo.DataSource.DataSet.Name)).FieldByName(Combo.DataField).AsString := grdFind.Fields[Campo].AsString;
    close;
end;

procedure TfrmFind.FormShow(Sender: TObject);
var
    i : integer;
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    grdFind.DataSource := TDBLookupComboBox(Formulario.FindComponent(Combo.Name)).ListSource;

    if Filtro <> '' then
    begin
        TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Filtered := False;
        TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Filter := Filtro;
        TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Filtered := True;
    end;

    for i := 0 to grdFind.Columns.Count - 1 do
    begin
        if copy(grdFind.Columns.Items[i].Title.Caption,1,1) = '#' then
        begin
            grdFind.Columns.Items[i].Visible := False;
        end;
    end;

    frmPrincipal.LeGrid(0,Formulario,grdFind);
end;

procedure TfrmFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Filtro <> '' then
     begin
         TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Filtered := False;
         TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Filter := '';
         TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Filtered := False;
     end;

    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmFind.edtPesqKeyPress(Sender: TObject; var Key: Char);
var
    aux : integer;
    i : integer;
begin
     aux := 0;
     for i := 0 to grdFind.Columns.Count - 1 do
     begin
         if grdFind.Columns[i].Title.Font.Color = clRed then
         begin
             aux := 1;
             Campo := grdFind.Columns[i].FieldName;
         end;
     end;

     if aux = 0 then
     begin
         MessageDlg('Para pesquisar é necessário a ordenação de pelo menos um campo.', mtWarning, [mbOK], 0);
         Exit;
     end;

     TADOTable(dtmPrincipal.FindComponent(grdFind.DataSource.DataSet.Name)).Locate(Campo,edtPesq.Text,[loPartialKey]);
end;

procedure TfrmFind.MenuItem1Click(Sender: TObject);
begin
    frmPrincipal.PersonalizaGrid(0,Formulario,grdFind);
end;

procedure TfrmFind.MenuItem2Click(Sender: TObject);
begin
    frmPrincipal.RestauraGrid(0,Formulario);
    Close;
end;

procedure TfrmFind.btnPersonalizarClick(Sender: TObject);
var
    Pt: TPoint;
begin
   GetCursorPos (Pt);
   mnuPersonalizar.Popup (Pt.x, Pt.y);
end;

procedure TfrmFind.grdFindDblClick(Sender: TObject);
var
    i : integer;
    Campo : integer;
begin
    frmPrincipal.SalvaGrid(0,Formulario,grdFind);

    Campo := 0;
    for i := 0 to grdFind.Columns.Count - 1 do
    begin
        if Formulario.Name = 'frmLigacoes' then
        begin
            if grdFind.Columns[i].FieldName = 'ID_Local' then
            begin
                Campo := i;
            end;
        end
        else
        begin
            if grdFind.Columns[i].FieldName = Combo.DataField then
            begin
                Campo := i;
            end;
        end;
    end;

    TADOTable(dtmPrincipal.FindComponent(Combo.DataSource.DataSet.Name)).FieldByName(Combo.DataField).AsString := grdFind.Fields[Campo].AsString;
//    TADOTable(dtmPrincipal.FindComponent(Combo.DataSource.DataSet.Name)).FieldByName(grdFind.Fields[Campo].FieldName).AsString := grdFind.Fields[Campo].AsString;

    close;
end;

procedure TfrmFind.grdFindTitleClick(Column: TColumn);
begin
    frmPrincipal.OrdenaGrid(0, grdFind, Column, frmFind);
end;

end.
