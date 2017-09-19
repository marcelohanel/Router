unit uMapa;

interface

uses
  Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ADODB;

type
  TfrmMapa = class(TForm)
    Panel4: TPanel;
    ScrollBox1: TScrollBox;
    imgMapa: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    qryAux: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Ponto;
    procedure imgMapaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMapaClick(Sender: TObject);
    procedure Desenha;
    procedure VerTodosOsLocais;
    procedure LocalizacaoNoMapa;
    procedure Ligacoes;
    procedure VerTodasAsLigacoes;
    procedure VerRotasDistancia;
    procedure VerRotasCustoMinimo;
    procedure VerRotasCustoMaximo;
    procedure VerRotasCustoMedio;
    procedure VerRotasVelocidadeMinima;
    procedure VerRotasVelocidadeMaxima;
    procedure VerRotasVelocidadeMedia;
    procedure Otimizacoes;
    procedure VerRotasCarga;
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : integer;
  end;

var
  frmMapa: TfrmMapa;
  pX, pY : Integer;
  cX, cY : Integer;
  tam    : integer;
  cor    : TColor;
  p1X,p1Y,p2X,p2Y : integer;
  p3X,p3Y         : integer;
  tamC,tam1,tam2  : integer;
  corC            : TColor;

implementation

uses uPrincipal, uModule, uGanhos, uCargas;

{$R *.dfm}

procedure TfrmMapa.Ponto;
begin
    if dtmPrincipal.tblLocaisDeposito.Value = 'S' then
    begin
        tam := dtmPrincipal.tblParametrosDeposito_tamanho.Value;
        if dtmPrincipal.tblParametrosDeposito_cor.Value = '1' then cor := clWhite;
        if dtmPrincipal.tblParametrosDeposito_cor.Value = '2' then cor := clRed;
        if dtmPrincipal.tblParametrosDeposito_cor.Value = '3' then cor := clGreen;
        if dtmPrincipal.tblParametrosDeposito_cor.Value = '4' then cor := clBlue;
        if dtmPrincipal.tblParametrosDeposito_cor.Value = '5' then cor := clBlack;
    end
    else
    begin
        tam := dtmPrincipal.tblParametrosPonto_tamanho.Value;
        if dtmPrincipal.tblParametrosPonto_cor.Value = '1' then cor := clWhite;
        if dtmPrincipal.tblParametrosPonto_cor.Value = '2' then cor := clRed;
        if dtmPrincipal.tblParametrosPonto_cor.Value = '3' then cor := clGreen;
        if dtmPrincipal.tblParametrosPonto_cor.Value = '4' then cor := clBlue;
        if dtmPrincipal.tblParametrosPonto_cor.Value = '5' then cor := clBlack;
    end;
end;

procedure TfrmMapa.VerTodosOsLocais;
begin
    dtmPrincipal.tblLocais.First;
    while not dtmPrincipal.tblLocais.Eof do
    begin
        Ponto;
        if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
           (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
        begin
            cX := dtmPrincipal.tblLocaisCoord_X.Value;
            cY := dtmPrincipal.tblLocaisCoord_Y.Value;
            imgMapa.Canvas.Brush.Color := cor;
            imgMapa.Canvas.Pen.Color := cor;
            imgMapa.Canvas.Pen.Width := 1;
            imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
            if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
            begin
                imgMapa.Canvas.Brush.Color := clWhite;
                imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
            end;
        end;
        dtmPrincipal.tblLocais.Next;
    end;
end;

procedure TfrmMapa.LocalizacaoNoMapa;
begin
    if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
       (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
    begin
        Ponto;
        cX := dtmPrincipal.tblLocaisCoord_X.Value;
        cY := dtmPrincipal.tblLocaisCoord_Y.Value;
        imgMapa.Canvas.Brush.Color := cor;
        imgMapa.Canvas.Pen.Color := cor;
        imgMapa.Canvas.Pen.Width := 1;
        imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
        if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
        begin
            imgMapa.Canvas.Brush.Color := clWhite;
            imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
        end;
        ScrollBox1.HorzScrollBar.Position := cX - Trunc((dtmPrincipal.tblParametrosMapa_Altura.Value / 3.6));
        ScrollBox1.VertScrollBar.Position := cY - Trunc((dtmPrincipal.tblParametrosMapa_Largura.Value / 8));
    end;
end;

procedure TfrmMapa.Ligacoes;
begin
    if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
    begin
        Ponto;
        tam1 := tam;
        p1X := dtmPrincipal.tblLocaisCoord_X.Value;
        p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
        if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
           (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
        begin
            cX := dtmPrincipal.tblLocaisCoord_X.Value;
            cY := dtmPrincipal.tblLocaisCoord_Y.Value;
            imgMapa.Canvas.Brush.Color := cor;
            imgMapa.Canvas.Pen.Color := cor;
            imgMapa.Canvas.Pen.Width := 1;
            imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
            if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
            begin
                imgMapa.Canvas.Brush.Color := clWhite;
                imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
            end;
        end;
    end;

    if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
    begin
        Ponto;
        tam2 := tam;
        p2X := dtmPrincipal.tblLocaisCoord_X.Value;
        p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
        if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
           (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
        begin
            cX := dtmPrincipal.tblLocaisCoord_X.Value;
            cY := dtmPrincipal.tblLocaisCoord_Y.Value;
            imgMapa.Canvas.Brush.Color := cor;
            imgMapa.Canvas.Pen.Color := cor;
            imgMapa.Canvas.Pen.Width := 1;
            imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
            if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
            begin
                imgMapa.Canvas.Brush.Color := clWhite;
                imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
            end;
        end;
    end;

    if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
    begin
        tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
        if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
        if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
        if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
        if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
        if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
    end;

    if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
    begin
        p3X := trunc((p1X + p2X) / 2);
        p3Y := trunc((p1Y + p2Y) / 2);
        imgMapa.Canvas.Pen.Color := corC;
        imgMapa.Canvas.Pen.Width := tamC;
        imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
        imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
        if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
        begin
            imgMapa.Canvas.Brush.Color := clWhite;
            imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesDistancia.AsString);
        end;
    end;
end;

procedure TfrmMapa.VerTodasAsLigacoes;
begin
    dtmPrincipal.tblLigacoes.First;
    while not dtmPrincipal.tblLigacoes.Eof do
    begin
        if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
        begin
            Ponto;
            tam1 := tam;
            p1X := dtmPrincipal.tblLocaisCoord_X.Value;
            p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
            if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
               (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
            begin
                cX := dtmPrincipal.tblLocaisCoord_X.Value;
                cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                imgMapa.Canvas.Brush.Color := cor;
                imgMapa.Canvas.Pen.Color := cor;
                imgMapa.Canvas.Pen.Width := 1;
                imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                end;
            end;
        end;

        if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
        begin
            Ponto;
            tam2 := tam;
            p2X := dtmPrincipal.tblLocaisCoord_X.Value;
            p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
            if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
               (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
            begin
                cX := dtmPrincipal.tblLocaisCoord_X.Value;
                cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                imgMapa.Canvas.Brush.Color := cor;
                imgMapa.Canvas.Pen.Color := cor;
                imgMapa.Canvas.Pen.Width := 1;
                imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                end;
            end;
        end;

        if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
        begin
            tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
        end;

        if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
        begin
            p3X := trunc((p1X + p2X) / 2);
            p3Y := trunc((p1Y + p2Y) / 2);
            imgMapa.Canvas.Pen.Color := corC;
            imgMapa.Canvas.Pen.Width := tamC;
            imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
            imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
            if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
            begin
                imgMapa.Canvas.Brush.Color := clWhite;
                imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesDistancia.AsString);
            end;
        end;
        dtmPrincipal.tblLigacoes.Next;
    end;
    VerTodosOsLocais;
end;

procedure TfrmMapa.VerRotasDistancia;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesDistancia.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoDistancia.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.VerRotasCarga;
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
            if dtmPrincipal.tblCargasCalculo.Value = 'Distância' then VerRotasDistancia;
            if dtmPrincipal.tblCargasCalculo.Value = 'Custo Mínimo' then VerRotasCustoMinimo;
            if dtmPrincipal.tblCargasCalculo.Value = 'Custo Máximo' then VerRotasCustoMaximo;
            if dtmPrincipal.tblCargasCalculo.Value = 'Custo Médio' then VerRotasCustoMedio;
            if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Mínima' then VerRotasVelocidadeMinima;
            if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Máxima' then VerRotasVelocidadeMaxima;
            if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Média' then VerRotasVelocidadeMedia;
        end;

        dtmPrincipal.tblEntregas.Next;
        l1 := l2;

        if dtmPrincipal.tblEntregas.RecordCount = 1 then
        begin
            l2 := dtmPrincipal.tblEntregasID_LocalOrigem.Value;

            if dtmPrincipal.tblGanhos.Locate('ID_LocalOrigem;ID_LocalDestino;ID_Veiculo',VarArrayOf([l1,l2,iVeiculo]),[loPartialKey]) then
            begin
                if dtmPrincipal.tblCargasCalculo.Value = 'Distância' then VerRotasDistancia;
                if dtmPrincipal.tblCargasCalculo.Value = 'Custo Mínimo' then VerRotasCustoMinimo;
                if dtmPrincipal.tblCargasCalculo.Value = 'Custo Máximo' then VerRotasCustoMaximo;
                if dtmPrincipal.tblCargasCalculo.Value = 'Custo Médio' then VerRotasCustoMedio;
                if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Mínima' then VerRotasVelocidadeMinima;
                if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Máxima' then VerRotasVelocidadeMaxima;
                if dtmPrincipal.tblCargasCalculo.Value = 'Velocidade Média' then VerRotasVelocidadeMedia;
            end;
        end;
    end;
end;

procedure TfrmMapa.Otimizacoes;
var
    l1, l2 : string;
    i : integer;
begin
    for i := 1 to 3 do
    begin
        if i = 1 then
        begin
            l1 := dtmPrincipal.tblOtimizacoesID_LocalOrigem.Value;
            l2 := dtmPrincipal.tblOtimizacoesID_Local_1.Value;
        end;

        if i = 2 then
        begin
            l1 := dtmPrincipal.tblOtimizacoesID_Local_1.Value;
            l2 := dtmPrincipal.tblOtimizacoesID_Local_2.Value;
        end;

        if i = 3 then
        begin
            l1 := dtmPrincipal.tblOtimizacoesID_Local_2.Value;
            l2 := dtmPrincipal.tblOtimizacoesID_LocalOrigem.Value;
        end;

        if dtmPrincipal.tblLocais.Locate('ID_Local',l1,[loPartialKey]) then
        begin
            Ponto;
            tam1 := tam;
            p1X := dtmPrincipal.tblLocaisCoord_X.Value;
            p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
            if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
               (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
            begin
                cX := dtmPrincipal.tblLocaisCoord_X.Value;
                cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                imgMapa.Canvas.Brush.Color := cor;
                imgMapa.Canvas.Pen.Color := cor;
                imgMapa.Canvas.Pen.Width := 1;
                imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                end;
            end;
        end;

        if dtmPrincipal.tblLocais.Locate('ID_Local',l2,[loPartialKey]) then
        begin
            Ponto;
            tam2 := tam;
            p2X := dtmPrincipal.tblLocaisCoord_X.Value;
            p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
            if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
               (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
            begin
                cX := dtmPrincipal.tblLocaisCoord_X.Value;
                cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                imgMapa.Canvas.Brush.Color := cor;
                imgMapa.Canvas.Pen.Color := cor;
                imgMapa.Canvas.Pen.Width := 1;
                imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                end;
            end;
        end;

        dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);

        if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
        begin
            tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
            if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
        end;

        if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
        begin
            p3X := trunc((p1X + p2X) / 2);
            p3Y := trunc((p1Y + p2Y) / 2);
            imgMapa.Canvas.Pen.Color := corC;
            imgMapa.Canvas.Pen.Width := tamC;
            imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
            imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
            if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
            begin
                imgMapa.Canvas.Brush.Color := clWhite;
                imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesDistancia.AsString);
            end;
        end;
    end;
end;

procedure TfrmMapa.VerRotasCustoMinimo;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesCustoMinimo.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoCustoMinimo.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.VerRotasVelocidadeMedia;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesVelocidadeMedia.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoVelocidadeMedia.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.VerRotasVelocidadeMaxima;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesVelocidadeMaxima.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoVelocidadeMaxima.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.VerRotasVelocidadeMinima;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesVelocidadeMinima.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoVelocidadeMinima.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.VerRotasCustoMedio;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesCustoMedio.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoCustoMedio.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.VerRotasCustoMaximo;
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

        frmMapa.qryAux.SQL.Clear;
        frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
        frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l1 + #39);
        frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l2 + #39);
        frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
        frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'E' + #39 + ')');
        frmMapa.qryAux.Open;
        if frmMapa.qryAux.RecordCount > 0 then
        begin
            dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l1, l2]),[loPartialKey]);
            aux := '1';
        end;
        frmMapa.qryAux.Close;

        if aux = '0' then
        begin
            frmMapa.qryAux.SQL.Clear;
            frmMapa.qryAux.SQL.Add('SELECT ID_LocalOrigem, ID_LocalDestino, Sentido FROM Ligacoes');
            frmMapa.qryAux.SQL.Add('WHERE ID_LocalOrigem = ' + #39 + l2 + #39);
            frmMapa.qryAux.SQL.Add('AND ID_LocalDestino = ' + #39 + l1 + #39);
            frmMapa.qryAux.SQL.Add('AND (Sentido = ' + #39 + 'A' + #39);
            frmMapa.qryAux.SQL.Add('OR Sentido = ' + #39 + 'D' + #39 + ')');
            frmMapa.qryAux.Open;
            if frmMapa.qryAux.RecordCount > 0 then
            begin
                dtmPrincipal.tblLigacoes.Locate('ID_LocalOrigem; ID_LocalDestino',VarArrayOf([l2, l1]),[loPartialKey]);
                aux := '1';
            end;
            frmMapa.qryAux.Close;
        end;

        if aux = '1' then
        begin
            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalOrigem.Value,[loPartialKey]) then
            begin
                Ponto;
                tam1 := tam;
                p1X := dtmPrincipal.tblLocaisCoord_X.Value;
                p1Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblLocais.Locate('ID_Local',dtmPrincipal.tblLigacoesID_LocalDestino.Value,[loPartialKey]) then
            begin
                Ponto;
                tam2 := tam;
                p2X := dtmPrincipal.tblLocaisCoord_X.Value;
                p2Y := dtmPrincipal.tblLocaisCoord_Y.Value;
                if (dtmPrincipal.tblLocaisCoord_X.Value <> 0) and
                   (dtmPrincipal.tblLocaisCoord_Y.Value <> 0) then
                begin
                    cX := dtmPrincipal.tblLocaisCoord_X.Value;
                    cY := dtmPrincipal.tblLocaisCoord_Y.Value;
                    imgMapa.Canvas.Brush.Color := cor;
                    imgMapa.Canvas.Pen.Color := cor;
                    imgMapa.Canvas.Pen.Width := 1;
                    imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
                    if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
                    begin
                        imgMapa.Canvas.Brush.Color := clWhite;
                        imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                    end;
                end;
            end;

            if dtmPrincipal.tblTiposCaminho.Locate('ID_TipoCaminho',dtmPrincipal.tblLigacoesID_TipoCaminho.Value,[loPartialKey]) then
            begin
                tamC := dtmPrincipal.tblTiposCaminhoLargura.Value;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '1' then corC := clWhite;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '2' then corC := clRed;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '3' then corC := clGreen;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '4' then corC := clBlue;
                if dtmPrincipal.tblTiposCaminhoCor.Value = '5' then corC := clBlack;
            end;

            if dtmPrincipal.tblParametrosTipo_ligacao.Value = 'R' then
            begin
                p3X := trunc((p1X + p2X) / 2);
                p3Y := trunc((p1Y + p2Y) / 2);
                imgMapa.Canvas.Pen.Color := corC;
                imgMapa.Canvas.Pen.Width := tamC;
                imgMapa.Canvas.MoveTo(p1X+tam1,p1Y+trunc((tam1 / 2)));
                imgMapa.Canvas.LineTo(p2X,p2Y+trunc(tam2 / 2));
                if dtmPrincipal.tblParametrosMostrarDistanciaLigacoes.Value = 'S' then
                begin
                    imgMapa.Canvas.Brush.Color := clWhite;
                    imgMapa.Canvas.TextOut(p3X,p3Y, dtmPrincipal.tblLigacoesCustoMaximo.AsString);
                end;
            end;
        end;
        dtmPrincipal.tblRotasGanhoCustoMaximo.Next;
        l1 := l2;
    end;
end;

procedure TfrmMapa.Desenha;
begin
    p1X  := 0;
    p1Y  := 0;
    p2X  := 0;
    p2Y  := 0;

    imgMapa.Height := dtmPrincipal.tblParametrosMapa_Altura.Value;
    imgMapa.Width := dtmPrincipal.tblParametrosMapa_Largura.Value;

    if dtmPrincipal.tblParametrosMapa_imagem.Value <> '' then
       imgMapa.Picture.LoadFromFile(dtmPrincipal.tblParametrosMapa_imagem.Value);

    if Tipo = 0 then LocalizacaoNoMapa;
    if Tipo = 1 then Ligacoes;
    if Tipo = 2 then VerTodosOsLocais;
    if Tipo = 3 then VerTodasAsLigacoes;
    if Tipo = 4 then VerRotasDistancia;

    if Tipo = 5 then VerRotasCustoMinimo;
    if Tipo = 6 then VerRotasCustoMaximo;
    if Tipo = 7 then VerRotasCustoMedio;

    if Tipo = 11 then VerRotasVelocidadeMinima;
    if Tipo = 12 then VerRotasVelocidadeMaxima;
    if Tipo = 13 then VerRotasVelocidadeMedia;

    if Tipo = 14 then Otimizacoes;

    if Tipo = 15 then VerRotasCarga;
end;

procedure TfrmMapa.FormShow(Sender: TObject);
begin
    dtmPrincipal.tblParametros.Locate('ID_Parametro',frmPrincipal.sParametro,[loPartialKey]);
    Desenha;
end;

procedure TfrmMapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

procedure TfrmMapa.SpeedButton1Click(Sender: TObject);
begin
    if Tipo = 0 then
    begin
        dtmPrincipal.tblLocais.Edit;
        dtmPrincipal.tblLocaisCoord_X.Value := cX;
        dtmPrincipal.tblLocaisCoord_Y.Value := cY;
        dtmPrincipal.tblLocais.Post;
    end;

    close;
end;

procedure TfrmMapa.imgMapaMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    Label3.Caption := IntToStr(X);
    Label4.Caption := IntToStr(Y);
    pX := X;
    pY := Y;
end;

procedure TfrmMapa.imgMapaClick(Sender: TObject);
begin
    if Tipo = 0 then
    begin
        if dtmPrincipal.tblParametrosMapa_imagem.Value <> '' then
        begin
            imgMapa.Picture.LoadFromFile(dtmPrincipal.tblParametrosMapa_imagem.Value);
        end
        else
        begin
            imgMapa.Canvas.Brush.Color := clWhite;
            imgMapa.Canvas.Pen.Color := clWhite;
            imgMapa.Canvas.Rectangle(cX,cY,cX + tam, cY + tam);
            if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
            begin
                imgMapa.Canvas.Font.Color := clWhite;
                imgMapa.Canvas.TextOut(cX,cY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
                imgMapa.Canvas.Font.Color := clBlack;
            end;
        end;

        imgMapa.Canvas.Brush.Color := cor;
        imgMapa.Canvas.Pen.Color := cor;
        imgMapa.Canvas.Pen.Width := 1;
        imgMapa.Canvas.Rectangle(pX,pY,pX + tam, pY + tam);
        if dtmPrincipal.tblParametrosMostrarNomesLocais.Value = 'S' then
        begin
            imgMapa.Canvas.Brush.Color := clWhite;
            imgMapa.Canvas.TextOut(pX,pY - tam - 3, dtmPrincipal.tblLocaisID_Local.AsString);
        end;

        cX := pX;
        cY := pY;
    end;
end;

end.

