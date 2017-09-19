unit uMostra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmMostra = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mensagem : string;
  end;

var
  frmMostra: TfrmMostra;

implementation

uses uPrincipal;

{$R *.DFM}

procedure TfrmMostra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmMostra.FormShow(Sender: TObject);
begin
    Label2.Caption := Mensagem;
end;

end.
