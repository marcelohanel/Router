unit uImporta;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DBSBtn, ADODB;

type
  TfrmImporta = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    DBSpeedButton5: TDBSpeedButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Label2: TLabel;
    DBSpeedButton1: TDBSpeedButton;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBSpeedButton5Click(Sender: TObject);
    procedure DBSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImporta: TfrmImporta;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmImporta.SpeedButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmImporta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmImporta.FormShow(Sender: TObject);
begin
    dtmPrincipal.tblParametros.Locate('ID_Parametro',frmPrincipal.sParametro,[loPartialKey]);

    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);
end;

procedure TfrmImporta.DBSpeedButton5Click(Sender: TObject);
begin
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'Temp';
    if OpenDialog1.Execute then Edit1.Text := OpenDialog1.FileName;
end;

procedure TfrmImporta.DBSpeedButton1Click(Sender: TObject);
var
    F : TextFile;
    aux, aux1 : string;
    iLinha : integer;
    iIni, iFim : integer;
    sID, sOrigem, sDestino, sComposicao, sDestinatario : string;
    sSolicitacao : TDateTime;
    sPeso : Double;
begin
    Memo1.Clear;
    iLinha := 0;
    if FileExists(Edit1.Text) then
    begin
        Memo1.Lines.Add(TimeToStr(Time) + ' - Início da Importação');

        AssignFile(F,Edit1.Text);
        Reset(F);

        while not Eof(F) do
        begin
            aux1 := '';
            ReadLn(F,aux);
            iLinha := iLinha + 1;
            Memo1.Lines.Add(TimeToStr(Time) + ' - Importando Linha ' + IntToStr(iLinha) + ' - ' + aux);

            iIni := dtmPrincipal.tblParametrosEDI_A_ID_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_ID_Fim.Value;
            sID := Trim(Copy(aux,iIni,(iFim - iIni + 1)));
            ADOTable1.Open;
            if ADOTable1.Locate('ID_Entrega',sID,[loPartialKey]) then
            begin
                Memo1.Lines.Add(TimeToStr(Time) + ' - A entrega com o ID ' + sID + ' já existe');
                aux1 := '1';
            end;
            ADOTable1.Close;

            iIni := dtmPrincipal.tblParametrosEDI_A_Origem_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Origem_Fim.Value;
            sOrigem := Trim(Copy(aux,iIni,(iFim - iIni + 1)));
            ADOTable2.Open;
            if ADOTable2.Locate('ID_Local',sOrigem,[loPartialKey]) = false then
            begin
                Memo1.Lines.Add(TimeToStr(Time) + ' - O local de origem ' + sOrigem + ' não existe');
                aux1 := '1';
            end
            else
            begin
                if ADOTable2.FieldByName('Deposito').Value <> 'S' then
                begin
                    Memo1.Lines.Add(TimeToStr(Time) + ' - O local de origem ' + sOrigem + ' não é um depósito');
                    aux1 := '1';
                end;
            end;
            ADOTable2.Close;

            iIni := dtmPrincipal.tblParametrosEDI_A_Destino_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Destino_Fim.Value;
            sDestino := Trim(Copy(aux,iIni,(iFim - iIni + 1)));
            ADOTable2.Open;
            if ADOTable2.Locate('ID_Local',sDestino,[loPartialKey]) = false then
            begin
                Memo1.Lines.Add(TimeToStr(Time) + ' - O local de destino ' + sDestino + ' não existe');
                aux1 := '1';
            end;
            ADOTable2.Close;

            if aux1 = '' then
            begin
                if sOrigem = sDestino then
                begin
                    Memo1.Lines.Add(TimeToStr(Time) + ' - O local de origem e destino são iguais');
                    aux1 := '1';
                end;
            end;

            iIni := dtmPrincipal.tblParametrosEDI_A_Solicitacao_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Solicitacao_Fim.Value;
            sSolicitacao := StrToDate(Copy(aux,iIni,(iFim - iIni + 1)));

            iIni := dtmPrincipal.tblParametrosEDI_A_Entrega_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Entrega_Fim.Value;

            if sSolicitacao > Date then
            begin
                Memo1.Lines.Add(TimeToStr(Time) + ' - A data de solicitação é maior que a data atual');
                aux1 := '1';
            end;

            iIni := dtmPrincipal.tblParametrosEDI_A_Peso_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Peso_Fim.Value;
            sPeso := StrToFloat(Trim(Copy(aux,iIni,(iFim - iIni + 1))));

            if sPeso < 0 then
            begin
                Memo1.Lines.Add(TimeToStr(Time) + ' - O peso é menor que zero');
                aux1 := '1';
            end;

            iIni := dtmPrincipal.tblParametrosEDI_A_Composicao_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Composicao_Fim.Value;
            sComposicao := Copy(aux,iIni,(iFim - iIni + 1));

            iIni := dtmPrincipal.tblParametrosEDI_A_Destinatario_Inicio.Value;
            iFim := dtmPrincipal.tblParametrosEDI_A_Destinatario_Fim.Value;
            sDestinatario := Copy(aux,iIni,(iFim - iIni + 1));

            if aux1 = '' then
            begin
                dtmPrincipal.tblEntregas.Insert;
                dtmPrincipal.tblEntregasID_Entrega.Value      := sID;
                dtmPrincipal.tblEntregasID_LocalOrigem.Value  := sOrigem;
                dtmPrincipal.tblEntregasID_LocalDestino.Value := sDestino;
                dtmPrincipal.tblEntregasDt_Solicitacao.Value  := sSolicitacao;
                dtmPrincipal.tblEntregasPeso.Value            := sPeso;
                dtmPrincipal.tblEntregasComposicao.Value      := sComposicao;
                dtmPrincipal.tblEntregasDestinatario.Value    := sDestinatario;
                dtmPrincipal.tblEntregasSituacao.Value        := 'P';
                dtmPrincipal.tblEntregas.Post;
            end;

        end;
        CloseFile(F);

        Memo1.Lines.Add(TimeToStr(Time) + ' - Final da Importação');
    end
    else
    begin
        MessageDlg('Não foi possível localizar o arquivo especificado.', mtWarning, [mbOK], 0);
    end;

    MessageDlg('Importação Concluída.', mtInformation, [mbOK], 0);

end;

end.
