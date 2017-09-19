unit uWizardCargas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, Mask;

type
  TfrmWizardCargas = class(TForm)
    Panel1: TPanel;
    lblTitulo2: TLabel;
    lblTitulo1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    lstOrigem: TListBox;
    lstOrigemSel: TListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    priOrigem: TListBox;
    priOrigemSel: TListBox;
    lstDestino: TListBox;
    priDestino: TListBox;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    lstDestinoSel: TListBox;
    priDestinoSel: TListBox;
    lstVeiculos: TListBox;
    priVeiculos: TListBox;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    lstVeiculosSel: TListBox;
    priVeiculosSel: TListBox;
    lstEntregas: TListBox;
    priEntregas: TListBox;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    lstEntregasSel: TListBox;
    priEntregasSel: TListBox;
    GroupBox1: TGroupBox;
    rgpTipo: TRadioGroup;
    edtPeso: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    rgpParada: TRadioGroup;
    edtParada: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    rgpVelocidade: TRadioGroup;
    edtVelocidade: TEdit;
    rgpGanho: TRadioGroup;
    TabSheet6: TTabSheet;
    SpeedButton18: TSpeedButton;
    ADOQuery1: TADOQuery;
    rgpTipoGanho: TRadioGroup;
    rgpTempo: TRadioGroup;
    rgpTipoVelocidade: TRadioGroup;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    rgpCiclo: TRadioGroup;
    edtCiclo: TEdit;
    lstEntregasRealizadas: TListBox;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    qryAux: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure CalcEntrega;
    procedure ExcluirRegistros;
    procedure CalcGanho;
    procedure EntregaUnica;
    procedure InicializaVariaveis;
    procedure PageControl1Change(Sender: TObject);
    procedure rgpTipoClick(Sender: TObject);
    procedure edtPesoKeyPress(Sender: TObject; var Key: Char);
    procedure rgpParadaClick(Sender: TObject);
    procedure rgpVelocidadeClick(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure rgpCicloClick(Sender: TObject);
    procedure MontaPontos;
    procedure RotasDistancia;
    procedure RotasCustoMinimo;
    procedure RotasCustoMaximo;
    procedure RotasCustoMedio;
    procedure RotasVelocidadeMedia;
    procedure RotasVelocidadeMinima;
    procedure RotasVelocidadeMaxima;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWizardCargas: TfrmWizardCargas;
  Mudou : boolean;
  iVeiculo, iLocal, iLocal1, iLocal2 : string;
  iValor1, iValor2, iPeso : double;
  iDistancia1, iDistancia2 : double;
  iParada : double;
  iVelocidade1, iVelocidade2 : double;
  iCiclo, iTempoCiclo : double;
  iSeq : integer;

implementation

uses uPrincipal, uModule, uMostra, uMapa;

{$R *.dfm}

procedure TfrmWizardCargas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmWizardCargas.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmWizardCargas.FormShow(Sender: TObject);
begin
    Self.Caption := VerificaPrograma(0,Self.Name);
    Self.lblTitulo1.Caption := VerificaPrograma(1,Self.Name);
    Self.lblTitulo2.Caption := VerificaPrograma(1,Self.Name);

    Mudou := True;

    MaskEdit1.Text := DateToStr(Date);

    lstOrigem.Clear;
    priOrigem.Clear;
    lstOrigemSel.Clear;
    priOrigemSel.Clear;

    lstDestino.Clear;
    priDestino.Clear;
    lstDestinoSel.Clear;
    priDestinoSel.Clear;

    lstVeiculos.Clear;
    priVeiculos.Clear;
    lstVeiculosSel.Clear;
    priVeiculosSel.Clear;

    dtmPrincipal.tblLocais.First;
    while not dtmPrincipal.tblLocais.Eof do
    begin
        if dtmPrincipal.tblLocaisDeposito.Value = 'S' then
        begin
            lstOrigem.Items.Add(dtmPrincipal.tblLocaisID_Local.Value + ' - ' + dtmPrincipal.tblLocaisNome.Value);
            priOrigem.Items.Add(dtmPrincipal.tblLocaisID_Local.Value);
        end;

        lstDestino.Items.Add(dtmPrincipal.tblLocaisID_Local.Value + ' - ' + dtmPrincipal.tblLocaisNome.Value);
        priDestino.Items.Add(dtmPrincipal.tblLocaisID_Local.Value);

        dtmPrincipal.tblLocais.Next;
    end;

    dtmPrincipal.tblVeiculos.First;
    while not dtmPrincipal.tblVeiculos.Eof do
    begin
        if dtmPrincipal.tblVeiculosID_Veiculo.Value <> 'Sistema' then
        begin
            lstVeiculos.Items.Add(dtmPrincipal.tblVeiculosID_Veiculo.Value + ' - ' + dtmPrincipal.tblVeiculosNome.Value);
            priVeiculos.Items.Add(dtmPrincipal.tblVeiculosID_Veiculo.Value);
        end;

        dtmPrincipal.tblVeiculos.Next;
    end;
end;

procedure TfrmWizardCargas.SpeedButton2Click(Sender: TObject);
begin
    if lstOrigem.ItemIndex <> -1 then
    begin
        Mudou := True;

        lstOrigemSel.Items.Add(lstOrigem.Items.Strings[lstOrigem.ItemIndex]);
        priOrigemSel.Items.Add(priOrigem.Items.Strings[lstOrigem.ItemIndex]);

        priOrigem.Items.Delete(lstOrigem.ItemIndex);
        lstOrigem.Items.Delete(lstOrigem.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton4Click(Sender: TObject);
begin
    if lstOrigemSel.ItemIndex <> -1 then
    begin
        Mudou := True;
        
        lstOrigem.Items.Add(lstOrigemSel.Items.Strings[lstOrigemSel.ItemIndex]);
        priOrigem.Items.Add(priOrigemSel.Items.Strings[lstOrigemSel.ItemIndex]);

        priOrigemSel.Items.Delete(lstOrigemSel.ItemIndex);
        lstOrigemSel.Items.Delete(lstOrigemSel.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton3Click(Sender: TObject);
begin
    if lstOrigem.Items.Count > 0 then
    begin
        Mudou := True;
        
        while 0 <= lstOrigem.Items.Count - 1 do
        begin
            lstOrigemSel.Items.Add(lstOrigem.Items.Strings[0]);
            priOrigemSel.Items.Add(priOrigem.Items.Strings[0]);

            priOrigem.Items.Delete(0);
            lstOrigem.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton5Click(Sender: TObject);
begin
    if lstOrigemSel.Items.Count > 0 then
    begin
        Mudou := True;
        
        while 0 <= lstOrigemSel.Items.Count - 1 do
        begin
            lstOrigem.Items.Add(lstOrigemSel.Items.Strings[0]);
            priOrigem.Items.Add(priOrigemSel.Items.Strings[0]);

            priOrigemSel.Items.Delete(0);
            lstOrigemSel.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton6Click(Sender: TObject);
begin
    if lstDestino.ItemIndex <> -1 then
    begin
        Mudou := True;
        
        lstDestinoSel.Items.Add(lstDestino.Items.Strings[lstDestino.ItemIndex]);
        priDestinoSel.Items.Add(priDestino.Items.Strings[lstDestino.ItemIndex]);

        priDestino.Items.Delete(lstDestino.ItemIndex);
        lstDestino.Items.Delete(lstDestino.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton7Click(Sender: TObject);
begin
    if lstDestino.Items.Count > 0 then
    begin
        Mudou := True;
        
        while 0 <= lstDestino.Items.Count - 1 do
        begin
            lstDestinoSel.Items.Add(lstDestino.Items.Strings[0]);
            priDestinoSel.Items.Add(priDestino.Items.Strings[0]);

            priDestino.Items.Delete(0);
            lstDestino.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton8Click(Sender: TObject);
begin
    if lstDestinoSel.ItemIndex <> -1 then
    begin
        Mudou := True;
        
        lstDestino.Items.Add(lstDestinoSel.Items.Strings[lstDestinoSel.ItemIndex]);
        priDestino.Items.Add(priDestinoSel.Items.Strings[lstDestinoSel.ItemIndex]);

        priDestinoSel.Items.Delete(lstDestinoSel.ItemIndex);
        lstDestinoSel.Items.Delete(lstDestinoSel.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton9Click(Sender: TObject);
begin
    if lstDestinoSel.Items.Count > 0 then
    begin
        Mudou := True;
        
        while 0 <= lstDestinoSel.Items.Count - 1 do
        begin
            lstDestino.Items.Add(lstDestinoSel.Items.Strings[0]);
            priDestino.Items.Add(priDestinoSel.Items.Strings[0]);

            priDestinoSel.Items.Delete(0);
            lstDestinoSel.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton10Click(Sender: TObject);
begin
    if lstVeiculos.ItemIndex <> -1 then
    begin
        lstVeiculosSel.Items.Add(lstVeiculos.Items.Strings[lstVeiculos.ItemIndex]);
        priVeiculosSel.Items.Add(priVeiculos.Items.Strings[lstVeiculos.ItemIndex]);

        priVeiculos.Items.Delete(lstVeiculos.ItemIndex);
        lstVeiculos.Items.Delete(lstVeiculos.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton11Click(Sender: TObject);
begin
    if lstVeiculos.Items.Count > 0 then
    begin
        while 0 <= lstVeiculos.Items.Count - 1 do
        begin
            lstVeiculosSel.Items.Add(lstVeiculos.Items.Strings[0]);
            priVeiculosSel.Items.Add(priVeiculos.Items.Strings[0]);

            priVeiculos.Items.Delete(0);
            lstVeiculos.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton12Click(Sender: TObject);
begin
    if lstVeiculosSel.ItemIndex <> -1 then
    begin
        lstVeiculos.Items.Add(lstVeiculosSel.Items.Strings[lstVeiculosSel.ItemIndex]);
        priVeiculos.Items.Add(priVeiculosSel.Items.Strings[lstVeiculosSel.ItemIndex]);

        priVeiculosSel.Items.Delete(lstVeiculosSel.ItemIndex);
        lstVeiculosSel.Items.Delete(lstVeiculosSel.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton13Click(Sender: TObject);
begin
    if lstVeiculosSel.Items.Count > 0 then
    begin
        while 0 <= lstVeiculosSel.Items.Count - 1 do
        begin
            lstVeiculos.Items.Add(lstVeiculosSel.Items.Strings[0]);
            priVeiculos.Items.Add(priVeiculosSel.Items.Strings[0]);

            priVeiculosSel.Items.Delete(0);
            lstVeiculosSel.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton14Click(Sender: TObject);
begin
    if lstEntregas.ItemIndex <> -1 then
    begin
        lstEntregasSel.Items.Add(lstEntregas.Items.Strings[lstEntregas.ItemIndex]);
        priEntregasSel.Items.Add(priEntregas.Items.Strings[lstEntregas.ItemIndex]);

        priEntregas.Items.Delete(lstEntregas.ItemIndex);
        lstEntregas.Items.Delete(lstEntregas.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton15Click(Sender: TObject);
begin
    if lstEntregas.Items.Count > 0 then
    begin
        while 0 <= lstEntregas.Items.Count - 1 do
        begin
            lstEntregasSel.Items.Add(lstEntregas.Items.Strings[0]);
            priEntregasSel.Items.Add(priEntregas.Items.Strings[0]);

            priEntregas.Items.Delete(0);
            lstEntregas.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton16Click(Sender: TObject);
begin
    if lstEntregasSel.ItemIndex <> -1 then
    begin
        lstEntregas.Items.Add(lstEntregasSel.Items.Strings[lstEntregasSel.ItemIndex]);
        priEntregas.Items.Add(priEntregasSel.Items.Strings[lstEntregasSel.ItemIndex]);

        priEntregasSel.Items.Delete(lstEntregasSel.ItemIndex);
        lstEntregasSel.Items.Delete(lstEntregasSel.ItemIndex);
    end;
end;

procedure TfrmWizardCargas.SpeedButton17Click(Sender: TObject);
begin
    if lstEntregasSel.Items.Count > 0 then
    begin
        while 0 <= lstEntregasSel.Items.Count - 1 do
        begin
            lstEntregas.Items.Add(lstEntregasSel.Items.Strings[0]);
            priEntregas.Items.Add(priEntregasSel.Items.Strings[0]);

            priEntregasSel.Items.Delete(0);
            lstEntregasSel.Items.Delete(0);
        end;
    end;
end;

procedure TfrmWizardCargas.PageControl1Change(Sender: TObject);
var
    i : integer;
    a,b : integer;
begin
    if PageControl1.ActivePage.Caption = 'Entregas' then
    begin
        if Mudou = True then
        begin
            lstEntregas.Clear;
            priEntregas.Clear;
            lstEntregasSel.Clear;
            priEntregasSel.Clear;

            dtmPrincipal.tblEntregas.First;
            while not dtmPrincipal.tblEntregas.Eof do
            begin
                if dtmPrincipal.tblEntregasSituacao.Value = 'P' then
                begin
                    if (priOrigemSel.Items.Count = 0) and (priDestinoSel.Items.Count = 0) then
                    begin
                        lstEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value + ' - ' + dtmPrincipal.tblEntregasDestinatario.Value);
                        priEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value);
                    end;

                    if (priOrigemSel.Items.Count <> 0) and (priDestinoSel.Items.Count = 0) then
                    begin
                        a := 0;
                        for i := 0 to priOrigemSel.Items.Count - 1 do
                        begin
                            if priOrigemSel.Items.Strings[i] = dtmPrincipal.tblEntregasID_LocalOrigem.Value then
                            begin
                                a := 1;
                            end;
                        end;

                        if a = 1 then
                        begin
                            lstEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value + ' - ' + dtmPrincipal.tblEntregasDestinatario.Value);
                            priEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value);
                        end;
                    end;

                    if (priOrigemSel.Items.Count = 0) and (priDestinoSel.Items.Count <> 0) then
                    begin
                        a := 0;
                        for i := 0 to priDestinoSel.Items.Count - 1 do
                        begin
                            if priDestinoSel.Items.Strings[i] = dtmPrincipal.tblEntregasID_LocalDestino.Value then
                            begin
                                a := 1;
                            end;
                        end;

                        if a = 1 then
                        begin
                            lstEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value + ' - ' + dtmPrincipal.tblEntregasDestinatario.Value);
                            priEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value);
                        end;
                    end;

                    if (priOrigemSel.Items.Count <> 0) and (priDestinoSel.Items.Count <> 0) then
                    begin
                        a := 0;
                        for i := 0 to priOrigemSel.Items.Count - 1 do
                        begin
                            if priOrigemSel.Items.Strings[i] = dtmPrincipal.tblEntregasID_LocalOrigem.Value then
                            begin
                                a := 1;
                            end;
                        end;

                        b := 0;
                        for i := 0 to priDestinoSel.Items.Count - 1 do
                        begin
                            if priDestinoSel.Items.Strings[i] = dtmPrincipal.tblEntregasID_LocalDestino.Value then
                            begin
                                b := 1;
                            end;
                        end;

                        if (a = 1) and (b = 1) then
                        begin
                            lstEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value + ' - ' + dtmPrincipal.tblEntregasDestinatario.Value);
                            priEntregas.Items.Add(dtmPrincipal.tblEntregasID_Entrega.Value);
                        end;
                    end;
                end;

                dtmPrincipal.tblEntregas.Next;
            end;
        end;
        Mudou := False;
    end;
end;
procedure TfrmWizardCargas.rgpTipoClick(Sender: TObject);
begin
    if rgpTipo.ItemIndex = 0 then
    begin
        edtPeso.Enabled := True;
    end
    else
    begin
        edtPeso.Enabled := False;
    end;
end;

procedure TfrmWizardCargas.edtPesoKeyPress(Sender: TObject; var Key: Char);
begin
    if not(key in['0'..'9',#8,',']) then
    begin
        key:=#0;
    end;
end;

procedure TfrmWizardCargas.rgpParadaClick(Sender: TObject);
begin
    if rgpParada.ItemIndex = 0 then
    begin
        edtParada.Enabled := True;
        rgpTempo.Enabled := False;
    end
    else
    begin
        edtParada.Enabled := False;
        rgpTempo.Enabled := True;
    end;
end;

procedure TfrmWizardCargas.rgpVelocidadeClick(Sender: TObject);
begin
    if rgpVelocidade.ItemIndex = 0 then
    begin
        edtVelocidade.Enabled := True;
        rgpTipoVelocidade.Enabled := False;
    end
    else
    begin
        edtVelocidade.Enabled := False;
        rgpTipoVelocidade.Enabled := True;
    end;
end;

procedure TfrmWizardCargas.ExcluirRegistros;
begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('DELETE * FROM Aux_Entregas');
    ADOQuery1.ExecSQL;
    ADOQuery1.Close;

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('DELETE * FROM Aux_Otimizacoes');
    ADOQuery1.ExecSQL;
    ADOQuery1.Close;

    dtmPrincipal.tblAux_Entregas.Close;
    dtmPrincipal.tblAux_Entregas.Open;

    dtmPrincipal.tblAux_Otimizacoes.Close;
    dtmPrincipal.tblAux_Otimizacoes.Open;
end;

procedure TfrmWizardCargas.CalcGanho;
begin
    dtmPrincipal.tblAux_Entregas.Close;
    dtmPrincipal.tblAux_Entregas.Open;

    dtmPrincipal.tblAux_Entregas.First;
    while not dtmPrincipal.tblAux_Entregas.Eof do
    begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT ID_LocalOrigem, ID_Veiculo, ID_Local_1, ID_Local_2, ValorDistancia FROM Otimizacoes');
        ADOQuery1.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + dtmPrincipal.tblLocaisID_Local.Value + #39);
        ADOQuery1.SQL.Add('AND ID_Veiculo = ' + #39 + 'Sistema' + #39);
        ADOQuery1.SQL.Add('AND ID_Local_1 = ' + #39 + dtmPrincipal.tblAux_EntregasID_LocalDestino.Value + #39);
        ADOQuery1.Open;
        ADOQuery1.First;
        while not ADOQuery1.Eof do
        begin
            dtmPrincipal.tblAux_Otimizacoes.Insert;

            dtmPrincipal.tblAux_OtimizacoesID_Local_1.Value := ADOQuery1.FieldByName('ID_Local_1').Value;
            dtmPrincipal.tblAux_OtimizacoesID_Local_2.Value := ADOQuery1.FieldByName('ID_Local_2').Value;
            dtmPrincipal.tblAux_OtimizacoesValorOtimizacao.Value := ADOQuery1.FieldByName('ValorDistancia').Value;

            dtmPrincipal.tblAux_OtimizacoesO_ID_LocalOrigem.Value := ADOQuery1.FieldByName('ID_LocalOrigem').Value;
            dtmPrincipal.tblAux_OtimizacoesO_ID_Veiculo.Value := ADOQuery1.FieldByName('ID_Veiculo').Value;
            dtmPrincipal.tblAux_OtimizacoesO_ID_Local_1.Value := ADOQuery1.FieldByName('ID_Local_1').Value;
            dtmPrincipal.tblAux_OtimizacoesO_ID_Local_2.Value := ADOQuery1.FieldByName('ID_Local_2').Value;

            dtmPrincipal.tblAux_Otimizacoes.Post;
            ADOQuery1.Next;
        end;
        ADOQuery1.Close;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT ID_LocalOrigem, ID_Veiculo, ID_Local_1, ID_Local_2, ValorDistancia FROM Otimizacoes');
        ADOQuery1.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + dtmPrincipal.tblLocaisID_Local.Value + #39);
        ADOQuery1.SQL.Add('AND ID_Veiculo = ' + #39 + 'Sistema' + #39);
        ADOQuery1.SQL.Add('AND ID_Local_2 = ' + #39 + dtmPrincipal.tblAux_EntregasID_LocalDestino.Value + #39);
        ADOQuery1.Open;
        ADOQuery1.First;
        while not ADOQuery1.Eof do
        begin
            dtmPrincipal.tblAux_Otimizacoes.Insert;

            dtmPrincipal.tblAux_OtimizacoesID_Local_1.Value := ADOQuery1.FieldByName('ID_Local_1').Value;
            dtmPrincipal.tblAux_OtimizacoesID_Local_2.Value := ADOQuery1.FieldByName('ID_Local_2').Value;
            dtmPrincipal.tblAux_OtimizacoesValorOtimizacao.Value := ADOQuery1.FieldByName('ValorDistancia').Value;

            dtmPrincipal.tblAux_OtimizacoesO_ID_LocalOrigem.Value := ADOQuery1.FieldByName('ID_LocalOrigem').Value;
            dtmPrincipal.tblAux_OtimizacoesO_ID_Veiculo.Value := ADOQuery1.FieldByName('ID_Veiculo').Value;
            dtmPrincipal.tblAux_OtimizacoesO_ID_Local_1.Value := ADOQuery1.FieldByName('ID_Local_1').Value;
            dtmPrincipal.tblAux_OtimizacoesO_ID_Local_2.Value := ADOQuery1.FieldByName('ID_Local_2').Value;

            dtmPrincipal.tblAux_Otimizacoes.Post;
            ADOQuery1.Next;
        end;
        ADOQuery1.Close;

        dtmPrincipal.tblAux_Entregas.Next;
    end;
end;

procedure TfrmWizardCargas.CalcEntrega;
var
    i : integer;
    iPeso : double;
    iLocal : string;
begin
    for i := 0 to priEntregasSel.Count - 1 do
    begin
        if dtmPrincipal.tblEntregas.Locate('ID_Entrega', priEntregasSel.Items.Strings[i],[loPartialKey]) then
        begin
            if dtmPrincipal.tblEntregasID_LocalOrigem.Value = dtmPrincipal.tblLocaisID_Local.Value then
            begin
                iLocal := dtmPrincipal.tblEntregasID_LocalDestino.Value;
                iPeso := dtmPrincipal.tblEntregasPeso.Value;

                if dtmPrincipal.tblAux_Entregas.Locate('ID_LocalDestino',iLocal,[loPartialKey]) then
                begin
                    dtmPrincipal.tblAux_Entregas.Edit;
                    dtmPrincipal.tblAux_EntregasID_LocalDestino.Value := iLocal;
                    dtmPrincipal.tblAux_EntregasPeso.Value := dtmPrincipal.tblAux_EntregasPeso.Value + iPeso;
                    dtmPrincipal.tblAux_Entregas.Post;
                end
                else
                begin
                    dtmPrincipal.tblAux_Entregas.Insert;
                    dtmPrincipal.tblAux_EntregasID_LocalDestino.Value := iLocal;
                    dtmPrincipal.tblAux_EntregasPeso.Value := iPeso;
                    dtmPrincipal.tblAux_Entregas.Post;
                end;
            end;
        end;
    end;
    dtmPrincipal.tblAux_Entregas.Close;
    dtmPrincipal.tblAux_Entregas.Open;
end;

procedure TfrmWizardCargas.InicializaVariaveis;
begin
    iPeso := 0;
    iDistancia1 := 0;
    iDistancia2 := 0;
    iValor1 := 0;
    iValor2 := 0;
    iParada := 0;
    iVelocidade1 := 0;
    iVelocidade2 := 0;
    iCiclo := 0;
    iTempoCiclo := 0;

    if rgpTipoGanho.ItemIndex = 0 then //Indica como buscar os ganhos
    begin
        iVeiculo := 'Sistema';
    end
    else
    begin
        iVeiculo := dtmPrincipal.tblVeiculosID_Veiculo.Value;
    end;

    case rgpGanho.ItemIndex of
       0 : begin //Distancia
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorDistancia.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorDistancia.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
       1 : begin //Custo Minimo
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorCustoMinimo.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorCustoMinimo.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
       2 : begin //Custo Máximo
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorCustoMaximo.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorCustoMaximo.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
       3 : begin //Custo Médio
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorCustoMedio.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorCustoMedio.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
       4 : begin //Velocidade Minima
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorVelocidadeMinima.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorVelocidadeMinima.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
       5 : begin //Velocidade Máxima
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorVelocidadeMaxima.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
       6 : begin //Velocidade Média
               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value,dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,iVeiculo]), [loPartialKey]);
               iValor1 := dtmPrincipal.tblGanhosValorVelocidadeMedia.Value;
               iDistancia1 := dtmPrincipal.tblGanhosValorDistancia.Value;

               dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem; ID_LocalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblLocaisID_Local.Value,iVeiculo]), [loPartialKey]);
               iValor2 := dtmPrincipal.tblGanhosValorVelocidadeMedia.Value;
               iDistancia2 := dtmPrincipal.tblGanhosValorDistancia.Value;
           end;
    end;

    //peso
    if rgpTipo.ItemIndex = 0 then //Peso Genério
    begin
        iPeso := StrToFloat(edtPeso.Text);
    end
    else // por veículo
    begin
        iPeso := dtmPrincipal.tblVeiculosPesoMaximo.Value;
    end;

    //Parada
    case rgpParada.ItemIndex of
       0 : begin //Generico
               iParada := StrToFloat(edtParada.Text);
           end;
       1 : begin //Por local
               iLocal := dtmPrincipal.tblLocaisID_Local.Value;
               dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,[loPartialKey]);
               if rgpTempo.ItemIndex = 0 then iParada := dtmPrincipal.tblLocaisTempoMinimoParada.Value;
               if rgpTempo.ItemIndex = 1 then iParada := dtmPrincipal.tblLocaisTempoMaximoParada.Value;
               if rgpTempo.ItemIndex = 2 then iParada := dtmPrincipal.tblLocaisTempoMedioParada.Value;
               dtmPrincipal.tblLocais.Locate('ID_Local',iLocal,[loPartialKey]);
           end;
       2 : begin //Por veiculo
               if rgpTempo.ItemIndex = 0 then iParada := dtmPrincipal.tblVeiculosTempoMinimoParada.Value;
               if rgpTempo.ItemIndex = 1 then iParada := dtmPrincipal.tblVeiculosTempoMaximoParada.Value;
               if rgpTempo.ItemIndex = 2 then iParada := dtmPrincipal.tblVeiculosTempoMedioParada.Value;
           end;
       3 : begin //Por veiculo no local
               dtmPrincipal.tblParadasVeiculo.Locate('ID_Local; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value,dtmPrincipal.tblVeiculosID_Veiculo.Value]),[loPartialKey]);
               if rgpTempo.ItemIndex = 0 then iParada := dtmPrincipal.tblParadasVeiculoTempoMinimoParada.Value;
               if rgpTempo.ItemIndex = 1 then iParada := dtmPrincipal.tblParadasVeiculoTempoMaximoParada.Value;
               if rgpTempo.ItemIndex = 2 then iParada := dtmPrincipal.tblParadasVeiculoTempoMedioParada.Value;
           end;
    end;

    //Ciclo
    case rgpVelocidade.ItemIndex of
       0 : begin //Generico
               iVelocidade1 := StrToFloat(edtVelocidade.Text);
               iVelocidade2 := StrToFloat(edtVelocidade.Text);
           end;
       1 : begin //Por Ligacao
               dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value, dtmPrincipal.tblAux_EntregasID_LocalDestino.Value]),[loPartialKey]);
               if rgpTipoVelocidade.ItemIndex = 0 then iVelocidade1 := dtmPrincipal.tblLigacoesVelocidadeMinima.Value;
               if rgpTipoVelocidade.ItemIndex = 1 then iVelocidade1 := dtmPrincipal.tblLigacoesVelocidadeMaxima.Value;
               if rgpTipoVelocidade.ItemIndex = 2 then iVelocidade1 := dtmPrincipal.tblLigacoesVelocidadeMedia.Value;

               dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value, dtmPrincipal.tblLocaisID_Local.Value]),[loPartialKey]);
               if rgpTipoVelocidade.ItemIndex = 0 then iVelocidade2 := dtmPrincipal.tblLigacoesVelocidadeMinima.Value;
               if rgpTipoVelocidade.ItemIndex = 1 then iVelocidade2 := dtmPrincipal.tblLigacoesVelocidadeMaxima.Value;
               if rgpTipoVelocidade.ItemIndex = 2 then iVelocidade2 := dtmPrincipal.tblLigacoesVelocidadeMedia.Value;

           end;
       2 : begin //Por veiculo
               if rgpTipoVelocidade.ItemIndex = 0 then iVelocidade1 := dtmPrincipal.tblVeiculosVelocidadeMinima.Value;
               if rgpTipoVelocidade.ItemIndex = 1 then iVelocidade1 := dtmPrincipal.tblVeiculosVelocidadeMaxima.Value;
               if rgpTipoVelocidade.ItemIndex = 2 then iVelocidade1 := dtmPrincipal.tblVeiculosVelocidadeMedia.Value;

               if rgpTipoVelocidade.ItemIndex = 0 then iVelocidade2 := dtmPrincipal.tblVeiculosVelocidadeMinima.Value;
               if rgpTipoVelocidade.ItemIndex = 1 then iVelocidade2 := dtmPrincipal.tblVeiculosVelocidadeMaxima.Value;
               if rgpTipoVelocidade.ItemIndex = 2 then iVelocidade2 := dtmPrincipal.tblVeiculosVelocidadeMedia.Value;

           end;
       3 : begin //Por veiculo no local
               dtmPrincipal.tblLigacoesVeiculo.Locate('ID_LocalOrigem; ID_LodalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblLocaisID_Local.Value, dtmPrincipal.tblAux_EntregasID_LocalDestino.Value, dtmPrincipal.tblVeiculosID_Veiculo.Value]),[loPartialKey]);
               if rgpTipoVelocidade.ItemIndex = 0 then iVelocidade1 := dtmPrincipal.tblLigacoesVelocidadeMinima.Value;
               if rgpTipoVelocidade.ItemIndex = 1 then iVelocidade1 := dtmPrincipal.tblLigacoesVelocidadeMaxima.Value;
               if rgpTipoVelocidade.ItemIndex = 2 then iVelocidade1 := dtmPrincipal.tblLigacoesVelocidadeMedia.Value;

               dtmPrincipal.tblLigacoesVeiculo.Locate('ID_LocalOrigem; ID_LodalDestino; ID_Veiculo',VarArrayOf([dtmPrincipal.tblAux_EntregasID_LocalDestino.Value, dtmPrincipal.tblLocaisID_Local.Value, dtmPrincipal.tblVeiculosID_Veiculo.Value]),[loPartialKey]);
               if rgpTipoVelocidade.ItemIndex = 0 then iVelocidade2 := dtmPrincipal.tblLigacoesVelocidadeMinima.Value;
               if rgpTipoVelocidade.ItemIndex = 1 then iVelocidade2 := dtmPrincipal.tblLigacoesVelocidadeMaxima.Value;
               if rgpTipoVelocidade.ItemIndex = 2 then iVelocidade2 := dtmPrincipal.tblLigacoesVelocidadeMedia.Value;
           end;
    end;

    //Tempo de Ciclo
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM Cargas');
    ADOQuery1.SQL.Add('WHERE ID_Veiculo = ' + #39 + dtmPrincipal.tblVeiculosID_Veiculo.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    While not ADOQuery1.Eof do
    begin
        iTempoCiclo := iTempoCiclo + ADOQuery1.FieldByName('TempoCiclo').Value;
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;

    case rgpCiclo.ItemIndex of
       0 : begin //Generico
               iTempoCiclo := StrToFloat(edtCiclo.Text) - iTempoCiclo;
           end;
       1 : begin //Generico
               iTempoCiclo := dtmPrincipal.tblVeiculosTempoCiclo.Value - iTempoCiclo;
           end;
    end;
end;

procedure TfrmWizardCargas.EntregaUnica;
var
    i, a, b, inicial, aux, iProblema : integer;
    iPesoAcum : double;
    iSequencia : integer;
begin
    lstEntregasRealizadas.Clear;
    Inicial := 1;

    if dtmPrincipal.tblCargas.RecordCount > 0 then
    begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT MAX(ID_Carga) FROM Cargas');
        ADOQuery1.Open;
        try
            if Inicial <= ADOQuery1.Fields[0].AsInteger then
            begin
               Inicial := ADOQuery1.Fields[0].AsInteger + 1;
            end;
        except
        end;
        ADOQuery1.Close;
    end;

    for a := 0 to priVeiculosSel.Count - 1 do
    begin
        iPesoAcum := 0;
        iSequencia := 1;
        dtmPrincipal.tblVeiculos.Locate('ID_Veiculo',priVeiculosSel.Items.Strings[a],[loPartialKey]);

        for i := 0 to priEntregasSel.Count - 1 do
        begin
            aux := 0;
            for b := 0 to lstEntregasRealizadas.Count - 1 do
            begin
                if lstEntregasRealizadas.Items.Strings[b] = priEntregasSel.Items.Strings[i] then
                begin
                    aux := 1;
                end;
            end;

            if aux = 0 then
            begin
                dtmPrincipal.tblEntregas.Locate('ID_Entrega',priEntregasSel.Items.Strings[i],[loPartialKey]);
                InicializaVariaveis;
                iCiclo := (iDistancia1 / iVelocidade1) + (iDistancia2 / iVelocidade2) + iParada;

                iProblema := 0;

                if iCiclo > iTempoCiclo then // ciclo
                begin
                    iProblema := 1;
                end;

                if iPeso < (dtmPrincipal.tblEntregasPeso.Value + iPesoAcum) then
                begin
                    iProblema := 1;
                end;

                if iProblema = 0 then
                begin
                    iPesoAcum := iPesoAcum + dtmPrincipal.tblEntregasPeso.Value;
                    lstEntregasRealizadas.Items.Add(priEntregasSel.Items.Strings[i]);

                    if dtmPrincipal.tblCargas.Locate('ID_Veiculo; ID_Deposito; Dt_Carga; Status',
                            VarArrayOf([dtmPrincipal.tblVeiculosID_Veiculo.Value,
                            dtmPrincipal.tblLocaisID_Local.Value,
                            DateToStr(Date),
                            'R']),[loPartialKey]) = false then
                    begin
                        dtmPrincipal.tblCargas.Insert;
                        dtmPrincipal.tblCargasID_Carga.Value := IntToStr(Inicial);
                        dtmPrincipal.tblCargasNome.Value := 'Carga Dia ' + DateToStr(Date);
                        dtmPrincipal.tblCargasID_Veiculo.Value := dtmPrincipal.tblVeiculosID_Veiculo.Value;
                        dtmPrincipal.tblCargasID_Deposito.Value := dtmPrincipal.tblLocaisID_Local.Value;
                        dtmPrincipal.tblCargasDt_Carga.Value := StrToDate(MaskEdit1.Text);
                        dtmPrincipal.tblCargasStatus.Value := 'R';
                        dtmPrincipal.tblCargasCalculo.Value := rgpGanho.Items.Strings[rgpGanho.ItemIndex];

                        if iVeiculo = 'Sistema' then
                        begin
                            dtmPrincipal.tblCargasVeiculo_Sistema.Value := 'S';
                        end
                        else
                        begin
                            dtmPrincipal.tblCargasVeiculo_Sistema.Value := 'N';
                        end;

                        Inicial := Inicial + 1;
                    end
                    else
                    begin
                        dtmPrincipal.tblCargas.Edit;
                    end;
                    dtmPrincipal.tblCargasTempoCiclo.Value := iCiclo;
                    dtmPrincipal.tblCargasPeso.Value := iPesoAcum;
                    dtmPrincipal.tblCargasValor.Value := iValor1 + iValor2;
                    dtmPrincipal.tblCargas.Post;

                    dtmPrincipal.tblEntregas.Edit;
                    dtmPrincipal.tblEntregasSituacao.Value := 'R';
                    dtmPrincipal.tblEntregasID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
                    dtmPrincipal.tblEntregasSequencia.Value := iSequencia;

                    iSequencia := iSequencia + 1;

                    dtmPrincipal.tblEntregas.Post;
                end;
            end;
        end;
    end;
end;

procedure TfrmWizardCargas.SpeedButton18Click(Sender: TObject);
var
    i,a : integer;
    v1 : array of string;
begin
    if priEntregasSel.Count = 0 then
    begin
        MessageDlg('Não existe nenhum entrega selecionada.', mtWarning, [mbOK], 0);
    end
    else
    begin
        frmMostra := TfrmMostra.Create(Self);
        frmMostra.Mensagem := 'Calculando rotas otimizadas para as entregas selecionadas.';
        frmMostra.ProgressBar1.Max := (priOrigemSel.Count * 3) + 3;
        frmMostra.Show;
        frmMostra.Repaint;

        a := 1;
        for i := 0 to priOrigemSel.Count - 1 do
        begin
            dtmPrincipal.tblLocais.Locate('ID_Local',priOrigemSel.Items.Strings[i],[loPartialKey]);

            frmMostra.ProgressBar1.Position := a;
            a := a + 1;
            ExcluirRegistros;

            frmMostra.ProgressBar1.Position := a;
            a := a + 1;
            CalcEntrega;

            if dtmPrincipal.tblAux_Entregas.RecordCount = 1 then
            begin
                frmMostra.ProgressBar1.Position := a;
                a := a + 1;
                EntregaUnica;
            end
            else
            begin
                frmMostra.ProgressBar1.Position := a;
                a := a + 1;
                //CalcGanho;
                MessageDlg('Selecione somente um local de destino...', mtWarning, [mbOK], 0);
            end;

            //ExcluirRegistros;
        end;

        // Confirma as cargas geradas
        frmMostra.ProgressBar1.Position := a;
        a := a + 1;
        dtmPrincipal.tblCargas.Filtered := False;
        dtmPrincipal.tblCargas.Filter := 'Dt_Carga = ' + #39 + MaskEdit1.Text + #39;
        dtmPrincipal.tblCargas.Filtered := True;
        SetLength(v1,dtmPrincipal.tblCargas.RecordCount);
        dtmPrincipal.tblCargas.First;

        i := 0;
        while not dtmPrincipal.tblCargas.Eof do
        begin
            if dtmPrincipal.tblCargasStatus.Value = 'R' then
            begin
                v1[i] := dtmPrincipal.tblCargasID_Carga.Value;
                i := i + 1;
            end;
            dtmPrincipal.tblCargas.Next;
        end;
        dtmPrincipal.tblCargas.Filtered := False;
        dtmPrincipal.tblCargas.Filter := '';

        frmMostra.ProgressBar1.Position := a;
        a := a + 1;
        for i := 0 to Length(v1) - 1 do
        begin
            dtmPrincipal.tblCargas.Locate('ID_Carga',v1[i],[loPartialKey]);
            dtmPrincipal.tblCargas.Edit;
            dtmPrincipal.tblCargasStatus.Value := 'A';
            dtmPrincipal.tblCargas.Post;
        end;

        // Monta pontos de passagem da carga
        frmMostra.ProgressBar1.Position := a;
        a := a + 1;
        for i := 0 to Length(v1) - 1 do
        begin
            dtmPrincipal.tblCargas.Locate('ID_Carga',v1[i],[loPartialKey]);

            dtmPrincipal.tblEntregas.Filtered := False;
            dtmPrincipal.tblEntregas.Filter := 'ID_Carga = ' + #39 + dtmPrincipal.tblCargasID_Carga.Value + #39;
            dtmPrincipal.tblEntregas.Filtered := True;

            dtmPrincipal.tblEntregas.IndexFieldNames := 'Sequencia';
            iSeq := 1;
            MontaPontos;

            dtmPrincipal.tblEntregas.Filtered := False;
            dtmPrincipal.tblEntregas.Filter := '';
            dtmPrincipal.tblEntregas.IndexFieldNames := '';
        end;

        MessageDlg('Cargas geradas com sucesso.', mtInformation, [mbOK], 0);

        FreeAndNil(frmMostra);
        SpeedButton18.Enabled := False;
    end;
end;

procedure TfrmWizardCargas.MontaPontos;
var
    l1, l2, aux : string;
    iVeiculo : string;
begin
    dtmPrincipal.tblEntregas.First;
    l1 := dtmPrincipal.tblEntregasID_LocalOrigem.Value;
    while not dtmPrincipal.tblEntregas.Eof do
    begin
        if dtmPrincipal.tblEntregas.RecordCount > 1 then
        begin
            if dtmPrincipal.tblEntregas.RecordCount = dtmPrincipal.tblEntregas.RecNo then
            begin
                l2 := dtmPrincipal.tblEntregasID_LocalOrigem.Value;
            end
            else
            begin
                l2 := dtmPrincipal.tblEntregasID_LocalDestino.Value;
            end;
        end
        else
        begin
            l2 := dtmPrincipal.tblEntregasID_LocalDestino.Value;
        end;

        if dtmPrincipal.tblCargasVeiculo_Sistema.Value = 'S' then
        begin
            iVeiculo := 'Sistema';
        end
        else
        begin
            iVeiculo := dtmPrincipal.tblCargasID_Veiculo.Value;
        end;

        if dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem;ID_LocalDestino;ID_Veiculo',VarArrayOf([l1,l2,iVeiculo]),[loPartialKey]) then
        begin
            if dtmPrincipal.tblCargasCalculo.Value = 'Distância' then RotasDistancia;
            if dtmPrincipal.tblCargasCalculo.Value = 'Custo Mínimo' then RotasCustoMinimo;
            if dtmPrincipal.tblCargasCalculo.Value = 'Custo Máximo' then RotasCustoMaximo;
            if dtmPrincipal.tblCargasCalculo.Value = 'Custo Médio' then RotasCustoMedio;
            if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Mínima' then RotasVelocidadeMinima;
            if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Máxima' then RotasVelocidadeMaxima;
            if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Média' then RotasVelocidadeMedia;
        end;

        dtmPrincipal.tblEntregas.Next;
        l1 := l2;

        if dtmPrincipal.tblEntregas.RecordCount = 1 then
        begin
            l2 := dtmPrincipal.tblEntregasID_LocalOrigem.Value;

            if dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem;ID_LocalDestino;ID_Veiculo',VarArrayOf([l1,l2,iVeiculo]),[loPartialKey]) then
            begin
                if dtmPrincipal.tblCargasCalculo.Value = 'Distância' then RotasDistancia;
                if dtmPrincipal.tblCargasCalculo.Value = 'Custo Mínimo' then RotasCustoMinimo;
                if dtmPrincipal.tblCargasCalculo.Value = 'Custo Máximo' then RotasCustoMaximo;
                if dtmPrincipal.tblCargasCalculo.Value = 'Custo Médio' then RotasCustoMedio;
                if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Mínima' then RotasVelocidadeMinima;
                if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Máxima' then RotasVelocidadeMaxima;
                if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Média' then RotasVelocidadeMedia;
            end;
        end;
    end;
end;

procedure TfrmWizardCargas.RotasDistancia;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoDistancia.First;
    l1 := dtmPrincipal.tblRotasGanhoDistanciaID_Local.Value;
    dtmPrincipal.tblRotasGanhoDistancia.Next;
    while not dtmPrincipal.tblRotasGanhoDistancia.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoDistanciaID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoDistancia.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.RotasCustoMinimo;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoCustoMinimo.First;
    l1 := dtmPrincipal.tblRotasGanhoCustoMinimoID_Local.Value;
    dtmPrincipal.tblRotasGanhoCustoMinimo.Next;
    while not dtmPrincipal.tblRotasGanhoCustoMinimo.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoCustoMinimoID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoCustoMinimo.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.RotasCustoMaximo;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoCustoMaximo.First;
    l1 := dtmPrincipal.tblRotasGanhoCustoMaximoID_Local.Value;
    dtmPrincipal.tblRotasGanhoCustoMaximo.Next;
    while not dtmPrincipal.tblRotasGanhoCustoMaximo.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoCustoMaximoID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoCustoMaximo.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.RotasCustoMedio;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoCustoMedio.First;
    l1 := dtmPrincipal.tblRotasGanhoCustoMedioID_Local.Value;
    dtmPrincipal.tblRotasGanhoCustoMedio.Next;
    while not dtmPrincipal.tblRotasGanhoCustoMedio.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoCustoMedioID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoCustoMedio.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.RotasVelocidadeMinima;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoVelocidadeMinima.First;
    l1 := dtmPrincipal.tblRotasGanhoVelocidadeMinimaID_Local.Value;
    dtmPrincipal.tblRotasGanhoVelocidadeMinima.Next;
    while not dtmPrincipal.tblRotasGanhoVelocidadeMinima.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoVelocidadeMinimaID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoVelocidadeMinima.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.RotasVelocidadeMaxima;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoVelocidadeMaxima.First;
    l1 := dtmPrincipal.tblRotasGanhoVelocidadeMaximaID_Local.Value;
    dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Next;
    while not dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoVelocidadeMaximaID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.RotasVelocidadeMedia;
var
    l1, l2, aux : string;
begin
    dtmPrincipal.tblRotasGanhoVelocidadeMedia.First;
    l1 := dtmPrincipal.tblRotasGanhoVelocidadeMediaID_Local.Value;
    dtmPrincipal.tblRotasGanhoVelocidadeMedia.Next;
    while not dtmPrincipal.tblRotasGanhoVelocidadeMedia.Eof do
    begin
        aux := '0';
        l2 := dtmPrincipal.tblRotasGanhoVelocidadeMediaID_Local.Value;

        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        qryAux.Close;

        if aux = '0' then
        begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            qryAux.Open;
            if qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            qryAux.Close;
        end;

        if aux = '1' then
        begin
            dtmPrincipal.tblCargasPontos.Insert;
            dtmPrincipal.tblCargasPontosID_Carga.Value := dtmPrincipal.tblCargasID_Carga.Value;
            dtmPrincipal.tblCargasPontosID_Entrega.Value := dtmPrincipal.tblEntregasID_Entrega.Value;
            dtmPrincipal.tblCargasPontosID_LocalOrigem.Value := dtmPrincipal.tblLigacoesID_LocalOrigem.Value;
            dtmPrincipal.tblCargasPontosID_LocalDestino.Value := dtmPrincipal.tblLigacoesID_LocalDestino.Value;
            dtmPrincipal.tblCargasPontosDistancia.Value := dtmPrincipal.tblLigacoesDistancia.Value;
            dtmPrincipal.tblCargasPontosSequencia.Value := iSeq;
            dtmPrincipal.tblCargasPontos.Post;
            iSeq := iSeq + 1;
        end;

        dtmPrincipal.tblRotasGanhoVelocidadeMedia.Next;
        l1 := l2;
    end;
end;

procedure TfrmWizardCargas.rgpCicloClick(Sender: TObject);
begin
    if rgpCiclo.ItemIndex = 0 then
    begin
        edtCiclo.Enabled := True;
    end
    else
    begin
        edtCiclo.Enabled := False;
    end;
end;

end.


