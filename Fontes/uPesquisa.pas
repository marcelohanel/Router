unit uPesquisa;

interface

uses
  DB, ADODB, DBGrids, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, JLabel, Mask, Buttons;

type
  TfrmPesquisa = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label3: TLabel;
    edtPesq: TMaskEdit;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JLabel1Click(Sender: TObject);
    procedure JLabel2Click(Sender: TObject);
    procedure JLabel3Click(Sender: TObject);
    procedure edtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Formulario : TForm;
    Tipo : Integer;
    Grid : TDBGrid;
    Campo : string;
    MostraCampo : string;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);
    Label3.Caption := 'Entre com o(a) ' + MostraCampo + ' a ser encontrado(a)';
end;

procedure TfrmPesquisa.JLabel1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmPesquisa.JLabel2Click(Sender: TObject);
begin
    Application.HelpContext(10);
end;

procedure TfrmPesquisa.JLabel3Click(Sender: TObject);
begin
    frmPrincipal.MostraSobre;
end;

procedure TfrmPesquisa.edtPesqKeyPress(Sender: TObject; var Key: Char);
begin
    TADOTable(dtmPrincipal.FindComponent(Grid.DataSource.DataSet.Name)).Locate(Campo,edtPesq.Text,[loPartialKey]);
end;

procedure TfrmPesquisa.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.
