unit uMostraReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TfrmMostraReport = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Formulario : TForm;
    Tipo : Integer;
  end;

var
  frmMostraReport: TfrmMostraReport;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmMostraReport.FormShow(Sender: TObject);
var
    aux : integer;
begin
    aux := 1;

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    ListBox1.Items.Clear;
    ListBox2.Items.Clear;
    dtmPrincipal.tblRelatorios.First;
    while not dtmPrincipal.tblRelatorios.Eof do
    begin
        if dtmPrincipal.tblRelatoriosParticular.Value = 'S' then
        begin
            if frmPrincipal.sUsuario = dtmPrincipal.tblRelatoriosID_Usuario.Value then
            begin
                aux := 1;
            end
            else
            begin
                aux := 0;
            end;
        end
        else
        begin
            aux := 1;
        end;

        if aux = 1 then
        begin
            if dtmPrincipal.tblRelatoriosGenerico.Value = 'S' then
            begin
                if Formulario.Name = dtmPrincipal.tblRelatoriosID_Programa.Value then
                begin
                    aux := 1;
                end
                else
                begin
                    aux := 0;
                end;
            end
            else
            begin
                aux := 1;
            end;
        end;

        if aux = 1 then
        begin
            ListBox1.Items.Add(dtmPrincipal.tblRelatoriosNome.AsString);
            ListBox2.Items.Add(dtmPrincipal.tblRelatoriosLayout.AsString);
        end;

        dtmPrincipal.tblRelatorios.Next;
    end;
end;

procedure TfrmMostraReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmMostraReport.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmMostraReport.ListBox1DblClick(Sender: TObject);
begin
    if ListBox1.Items.Count >= 0 then
       frmPrincipal.Report(2,ListBox2.Items.Strings[ListBox1.ItemIndex]);
end;

end.
