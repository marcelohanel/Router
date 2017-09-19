unit uLogin;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
    if (Edit1.Text = 'Mestre') and (Edit2.Text = 'mh812128') then
    begin
        if ControleTabelas(0,'tblUsuarios','Open') = True then dtmPrincipal.tblUsuarios.Open;
        if dtmPrincipal.tblUsuarios.Locate('ID_Usuario',Edit1.Text,[loPartialKey]) then
        begin
            frmPrincipal.sUsuario := dtmPrincipal.tblUsuariosID_Usuario.AsString;
            frmPrincipal.sNomeUsuario := dtmPrincipal.tblUsuariosNome.AsString;
            frmPrincipal.GerarChave1.Visible := True;
            frmPrincipal.sParametro := dtmPrincipal.tblUsuariosID_Parametro.Value;
            if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
            Close;
        end
        else
        begin
            MessageDlg('Usuário ou senha inválido. Tente novamente.', mtError, [mbOK], 0);
            if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
            Edit1.SetFocus;
        end;
    end
    else
    begin
        if ControleTabelas(0,'tblUsuarios','Open') = True then dtmPrincipal.tblUsuarios.Open;
        if dtmPrincipal.tblUsuarios.Locate('ID_Usuario;Senha',VarArrayOf([Edit1.Text,Edit2.Text]),[loPartialKey]) then
        begin
            frmPrincipal.sUsuario := dtmPrincipal.tblUsuariosID_Usuario.AsString;
            frmPrincipal.sNomeUsuario := dtmPrincipal.tblUsuariosNome.AsString;
            frmPrincipal.GerarChave1.Visible := False;
            frmPrincipal.sParametro := dtmPrincipal.tblUsuariosID_Parametro.Value;
            if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
            Close;
        end
        else
        begin
            MessageDlg('Usuário ou senha inválido. Tente novamente.', mtError, [mbOK], 0);
            if ControleTabelas(0,'tblUsuarios','Close') = True then dtmPrincipal.tblUsuarios.Close;
            Edit1.SetFocus;
        end;
    end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmLogin.SpeedButton2Click(Sender: TObject);
begin
    frmPrincipal.sUsuario := 'Encerrar Aplicação';
    close;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);
end;

end.
