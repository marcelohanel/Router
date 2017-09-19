unit uFinalizaCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmFinalizaCarga = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizaCarga: TfrmFinalizaCarga;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmFinalizaCarga.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmFinalizaCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmFinalizaCarga.FormShow(Sender: TObject);
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    if (dtmPrincipal.tblCargasStatus.Value = 'E') or (dtmPrincipal.tblCargasStatus.Value = 'F') then
    begin
        DBGrid1.Enabled := False;
        SpeedButton2.Enabled := False;
    end;
end;

procedure TfrmFinalizaCarga.SpeedButton2Click(Sender: TObject);
begin
    if MessageDlg('Confirma a execução deste processo.', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        dtmPrincipal.tblEntregas.Filtered := False;
        dtmPrincipal.tblEntregas.Filter := 'ID_Carga = ' + #39 + dtmPrincipal.tblCargasID_Carga.Value + #39;
        dtmPrincipal.tblEntregas.Filtered := True;

        dtmPrincipal.tblEntregas.First;
        while not dtmPrincipal.tblEntregas.Eof do
        begin
            dtmPrincipal.iPermiteEntrega := 1;
            dtmPrincipal.tblEntregas.Edit;
            dtmPrincipal.tblEntregasSituacao.Value := 'E';
            dtmPrincipal.tblEntregas.Post;
            dtmPrincipal.tblEntregas.Next;
            dtmPrincipal.iPermiteEntrega := 0;
        end;

        dtmPrincipal.tblEntregas.Filtered := False;
        dtmPrincipal.tblEntregas.Filter := '';

        dtmPrincipal.tblCargas.Edit;
        dtmPrincipal.tblCargasStatus.Value := 'E';
        dtmPrincipal.tblCargas.Post;

        MessageDlg('Carga finalizada com sucesso.', mtInformation, [mbOK], 0);

        DBGrid1.Enabled := False;
        SpeedButton2.Enabled := False;
    end;
end;

end.
