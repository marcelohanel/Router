unit uPermissoes;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, CheckLst;

type
  TfrmPermissoes = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ScrollBox1: TScrollBox;
    ListBox1: TListBox;
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    CheckListBox3: TCheckListBox;
    CheckListBox4: TCheckListBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermissoes: TfrmPermissoes;

implementation

uses uModule, uPrincipal;

{$R *.dfm}

procedure TfrmPermissoes.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmPermissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i : integer;
begin
    for i := 0 to ListBox1.Items.Count - 1 do
    begin
        if dtmPrincipal.tblPermissoesUsuario.Locate('ID_Programa;ID_Usuario',VarArrayOf([ListBox1.Items.Strings[i],dtmPrincipal.tblUsuariosID_Usuario.AsString]),[loPartialKey]) then
        begin
            dtmPrincipal.tblPermissoesUsuario.Edit;
        end
        else
        begin
            dtmPrincipal.tblPermissoesUsuario.Insert;
        end;

        dtmPrincipal.tblPermissoesUsuarioID_Usuario.Value := dtmPrincipal.tblUsuariosID_Usuario.Value;
        dtmPrincipal.tblPermissoesUsuarioID_Programa.Value := ListBox1.Items.Strings[i];

        if CheckListBox1.Checked[i] = True then dtmPrincipal.tblPermissoesUsuarioLer.AsString := 'S' else dtmPrincipal.tblPermissoesUsuarioLer.AsString := 'N';
        if CheckListBox2.Checked[i] = True then dtmPrincipal.tblPermissoesUsuarioIncluir.AsString := 'S' else dtmPrincipal.tblPermissoesUsuarioIncluir.AsString := 'N';
        if CheckListBox3.Checked[i] = True then dtmPrincipal.tblPermissoesUsuarioAlterar.AsString := 'S' else dtmPrincipal.tblPermissoesUsuarioAlterar.AsString := 'N';
        if CheckListBox4.Checked[i] = True then dtmPrincipal.tblPermissoesUsuarioExcluir.AsString := 'S' else dtmPrincipal.tblPermissoesUsuarioExcluir.AsString := 'N';

        dtmPrincipal.tblPermissoesUsuario.Post;
    end;
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmPermissoes.FormShow(Sender: TObject);
var
    i : integer;
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    ListBox1.Clear;
    CheckListBox1.Clear;
    CheckListBox2.Clear;
    CheckListBox3.Clear;
    CheckListBox4.Clear;
    dtmPrincipal.tblProgramas.IndexFieldNames := 'ID_Programa';
    dtmPrincipal.tblProgramas.First;
    while not dtmPrincipal.tblProgramas.Eof do
    begin
        ListBox1.Items.Add(dtmPrincipal.tblProgramasID_Programa.AsString);
        CheckListBox1.Items.Add(' ');
        CheckListBox2.Items.Add(' ');
        CheckListBox3.Items.Add(' ');
        CheckListBox4.Items.Add(' ');

        dtmPrincipal.tblProgramas.Next;
    end;
    dtmPrincipal.tblProgramas.IndexFieldNames := '';

    for i := 0 to ListBox1.Items.Count - 1 do
    begin
        if dtmPrincipal.tblPermissoesUsuario.Locate('ID_Programa;ID_Usuario',VarArrayOf([ListBox1.Items.Strings[i],dtmPrincipal.tblUsuariosID_Usuario.AsString]),[loPartialKey]) then
        begin
            if dtmPrincipal.tblPermissoesUsuarioLer.AsString = 'N' then CheckListBox1.Checked[i] := False else CheckListBox1.Checked[i] := True;
            if dtmPrincipal.tblPermissoesUsuarioIncluir.AsString = 'N' then CheckListBox2.Checked[i] := False else CheckListBox2.Checked[i] := True;
            if dtmPrincipal.tblPermissoesUsuarioAlterar.AsString = 'N' then CheckListBox3.Checked[i] := False else CheckListBox3.Checked[i] := True;
            if dtmPrincipal.tblPermissoesUsuarioExcluir.AsString = 'N' then CheckListBox4.Checked[i] := False else CheckListBox4.Checked[i] := True;
        end
        else
        begin
            CheckListBox1.Checked[i] := False;
            CheckListBox2.Checked[i] := False;
            CheckListBox3.Checked[i] := False;
            CheckListBox4.Checked[i] := False;
        end;

    end;
end;

end.
