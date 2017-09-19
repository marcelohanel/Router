unit uModule;

interface

uses
  Variants, SysUtils, Classes, DB, ADODB;

type
  TdtmPrincipal = class(TDataModule)
    bdDados: TADOConnection;
    dtsProgramas: TDataSource;
    dtsUsuarios: TDataSource;
    dtsParametros: TDataSource;
    tblProgramas: TADOTable;
    tblProgramasID_Programa: TWideStringField;
    tblProgramasNome: TWideStringField;
    tblProgramasTitulo: TWideStringField;
    tblProgramasVersao: TWideStringField;
    tblUsuarios: TADOTable;
    tblUsuariosID_Usuario: TWideStringField;
    tblUsuariosNome: TWideStringField;
    tblUsuariosSenha: TWideStringField;
    tblParametros: TADOTable;
    tblParametrosID_Parametro: TWideStringField;
    tblPermissoesUsuario: TADOTable;
    tblPermissoesUsuarioID_Usuario: TWideStringField;
    tblPermissoesUsuarioID_Programa: TWideStringField;
    tblPermissoesUsuarioLer: TWideStringField;
    tblPermissoesUsuarioIncluir: TWideStringField;
    tblPermissoesUsuarioAlterar: TWideStringField;
    tblPermissoesUsuarioExcluir: TWideStringField;
    dtsPermissoesUsuario: TDataSource;
    tblLogs: TADOTable;
    tblLogsID_Usuario: TWideStringField;
    tblLogsDt_Log: TDateTimeField;
    tblLogsHr_Log: TDateTimeField;
    tblLogsAcao: TWideStringField;
    dtsLogs: TDataSource;
    tblLogsAutorizado: TWideStringField;
    tblRelatorios: TADOTable;
    tblRelatoriosID_Relatorio: TWideStringField;
    tblRelatoriosNome: TWideStringField;
    tblRelatoriosLayout: TWideStringField;
    tblRelatoriosParticular: TWideStringField;
    tblRelatoriosID_Usuario: TWideStringField;
    dtsRelatorios: TDataSource;
    tblRelatoriosID_Programa: TWideStringField;
    tblRelatoriosGenerico: TWideStringField;
    tblLocais: TADOTable;
    tblLocaisID_Local: TWideStringField;
    tblLocaisNome: TWideStringField;
    tblLocaisDeposito: TWideStringField;
    tblLocaisCoord_X: TIntegerField;
    tblLocaisCoord_Y: TIntegerField;
    dtsLocais: TDataSource;
    tblParametrosMapa_altura: TIntegerField;
    tblParametrosMapa_largura: TIntegerField;
    tblParametrosMapa_imagem: TWideStringField;
    tblParametrosDeposito_Tamanho: TIntegerField;
    tblParametrosDeposito_Cor: TWideStringField;
    tblParametrosPonto_Tamanho: TIntegerField;
    tblParametrosPonto_Cor: TWideStringField;
    tblTiposCaminho: TADOTable;
    tblTiposCaminhoID_TipoCaminho: TWideStringField;
    tblTiposCaminhoNome: TWideStringField;
    tblTiposCaminhoCor: TWideStringField;
    tblTiposCaminhoLargura: TIntegerField;
    dtsTiposCaminho: TDataSource;
    tblLigacoes: TADOTable;
    tblLigacoesID_LocalOrigem: TWideStringField;
    tblLigacoesID_LocalDestino: TWideStringField;
    tblLigacoesID_TipoCaminho: TWideStringField;
    tblLigacoesSentido: TWideStringField;
    dtsLigacoes: TDataSource;
    tblRelatorioscNomePrograma: TStringField;
    tblRelatorioscNomeUsuario: TStringField;
    tblLigacoescNomeOrigem: TStringField;
    tblLigacoescNomeDestino: TStringField;
    tblLigacoescNomeTipoCaminho: TStringField;
    tblParametrosTipo_ligacao: TWideStringField;
    tblEntregas: TADOTable;
    dtsEntregas: TDataSource;
    tblEntregasID_Entrega: TWideStringField;
    tblEntregasID_LocalOrigem: TWideStringField;
    tblEntregasID_LocalDestino: TWideStringField;
    tblEntregasDt_Solicitacao: TDateTimeField;
    tblEntregasSituacao: TWideStringField;
    tblEntregasComposicao: TMemoField;
    tblEntregasDestinatario: TMemoField;
    tblEntregascNomeOrigem: TStringField;
    tblEntregascNomeDestino: TStringField;
    tblUsuariosID_Parametro: TWideStringField;
    tblParametrosEDI_A_ID_Inicio: TIntegerField;
    tblParametrosEDI_A_ID_Fim: TIntegerField;
    tblParametrosEDI_A_Origem_Inicio: TIntegerField;
    tblParametrosEDI_A_Origem_Fim: TIntegerField;
    tblParametrosEDI_A_Destino_Inicio: TIntegerField;
    tblParametrosEDI_A_Destino_Fim: TIntegerField;
    tblParametrosEDI_A_Solicitacao_Inicio: TIntegerField;
    tblParametrosEDI_A_Solicitacao_Fim: TIntegerField;
    tblParametrosEDI_A_Entrega_Inicio: TIntegerField;
    tblParametrosEDI_A_Entrega_Fim: TIntegerField;
    tblParametrosEDI_A_Peso_Inicio: TIntegerField;
    tblParametrosEDI_A_Peso_Fim: TIntegerField;
    tblParametrosEDI_A_Composicao_Inicio: TIntegerField;
    tblParametrosEDI_A_Composicao_Fim: TIntegerField;
    tblParametrosEDI_A_Destinatario_Inicio: TIntegerField;
    tblParametrosEDI_A_Destinatario_Fim: TIntegerField;
    tblEntregasPeso: TBCDField;
    tblParametrosMostrarNomesLocais: TWideStringField;
    tblParametrosMostrarDistanciaLigacoes: TWideStringField;
    tblLigacoesDistancia: TBCDField;
    tblLigacoesVelocidadeMedia: TBCDField;
    tblLigacoesVelocidadeMinima: TBCDField;
    tblLigacoesVelocidadeMaxima: TBCDField;
    tblVeiculos: TADOTable;
    tblVeiculosID_Veiculo: TWideStringField;
    tblVeiculosNome: TWideStringField;
    tblVeiculosPesoMaximo: TBCDField;
    dtsVeiculos: TDataSource;
    tblGanhos: TADOTable;
    tblGanhosID_LocalOrigem: TWideStringField;
    tblGanhosID_LocalDestino: TWideStringField;
    tblGanhoscNomeOrigem: TStringField;
    tblGanhoscNomeDestino: TStringField;
    dtsGanhos: TDataSource;
    tblGanhosID_Veiculo: TWideStringField;
    tblGanhoscNomeVeiculo: TStringField;
    tblLigacoesCustoMedio: TBCDField;
    tblLigacoesCustoMinimo: TBCDField;
    tblLigacoesCustoMaximo: TBCDField;
    tblRotasGanhoDistancia: TADOTable;
    tblRotasGanhoDistanciaID_LocalOrigem: TWideStringField;
    tblRotasGanhoDistanciaID_LocalDestino: TWideStringField;
    tblRotasGanhoDistanciaID_Veiculo: TWideStringField;
    tblRotasGanhoDistanciaID_Local: TWideStringField;
    tblRotasGanhoDistanciaSequencia: TIntegerField;
    dtsRotasGanhoDistancia: TDataSource;
    tblRotasGanhoCustoMinimo: TADOTable;
    tblRotasGanhoCustoMinimoID_LocalOrigem: TWideStringField;
    tblRotasGanhoCustoMinimoID_LocalDestino: TWideStringField;
    tblRotasGanhoCustoMinimoID_Veiculo: TWideStringField;
    tblRotasGanhoCustoMinimoID_Local: TWideStringField;
    tblRotasGanhoCustoMinimoSequencia: TIntegerField;
    dtsRotasGanhoCustoMinimo: TDataSource;
    tblRotasGanhoVelocidadeMinima: TADOTable;
    tblRotasGanhoVelocidadeMinimaID_LocalOrigem: TWideStringField;
    tblRotasGanhoVelocidadeMinimaID_LocalDestino: TWideStringField;
    tblRotasGanhoVelocidadeMinimaID_Veiculo: TWideStringField;
    tblRotasGanhoVelocidadeMinimaID_Local: TWideStringField;
    tblRotasGanhoVelocidadeMinimaSequencia: TIntegerField;
    dtsRotasGanhoVelocidadeMinima: TDataSource;
    tblGanhosValorCustoMinimo: TBCDField;
    tblGanhosValorCustoMaximo: TBCDField;
    tblGanhosValorCustoMedio: TBCDField;
    tblGanhosValorVelocidadeMinima: TBCDField;
    tblGanhosValorVelocidadeMaxima: TBCDField;
    tblGanhosValorVelocidadeMedia: TBCDField;
    tblGanhosValorDistancia: TBCDField;
    tblRotasGanhoCustoMaximo: TADOTable;
    dtsRotasGanhoCustoMaximo: TDataSource;
    tblRotasGanhoCustoMedio: TADOTable;
    dtsRotasGanhoCustoMedio: TDataSource;
    tblRotasGanhoVelocidadeMaxima: TADOTable;
    dtsRotasGanhoVelocidadeMaxima: TDataSource;
    tblRotasGanhoVelocidadeMedia: TADOTable;
    dtsRotasGanhoVelocidadeMedia: TDataSource;
    tblRotasGanhoCustoMaximoID_LocalOrigem: TWideStringField;
    tblRotasGanhoCustoMaximoID_LocalDestino: TWideStringField;
    tblRotasGanhoCustoMaximoID_Veiculo: TWideStringField;
    tblRotasGanhoCustoMaximoID_Local: TWideStringField;
    tblRotasGanhoCustoMaximoSequencia: TIntegerField;
    tblRotasGanhoCustoMedioID_LocalOrigem: TWideStringField;
    tblRotasGanhoCustoMedioID_LocalDestino: TWideStringField;
    tblRotasGanhoCustoMedioID_Veiculo: TWideStringField;
    tblRotasGanhoCustoMedioID_Local: TWideStringField;
    tblRotasGanhoCustoMedioSequencia: TIntegerField;
    tblRotasGanhoVelocidadeMaximaID_LocalOrigem: TWideStringField;
    tblRotasGanhoVelocidadeMaximaID_LocalDestino: TWideStringField;
    tblRotasGanhoVelocidadeMaximaID_Veiculo: TWideStringField;
    tblRotasGanhoVelocidadeMaximaID_Local: TWideStringField;
    tblRotasGanhoVelocidadeMaximaSequencia: TIntegerField;
    tblRotasGanhoVelocidadeMediaID_LocalOrigem: TWideStringField;
    tblRotasGanhoVelocidadeMediaID_LocalDestino: TWideStringField;
    tblRotasGanhoVelocidadeMediaID_Veiculo: TWideStringField;
    tblRotasGanhoVelocidadeMediaID_Local: TWideStringField;
    tblRotasGanhoVelocidadeMediaSequencia: TIntegerField;
    tblVeiculosTempoCiclo: TBCDField;
    tblLocaisTempoMinimoParada: TBCDField;
    tblLocaisTempoMaximoParada: TBCDField;
    tblLocaisTempoMedioParada: TBCDField;
    tblCargas: TADOTable;
    tblCargasID_Carga: TWideStringField;
    tblCargasNome: TWideStringField;
    tblCargasID_Veiculo: TWideStringField;
    tblCargasID_Deposito: TWideStringField;
    tblCargascNomeVeiculo: TStringField;
    tblCargascNomeDeposito: TStringField;
    dtsCargas: TDataSource;
    tblOtimizacoes: TADOTable;
    tblOtimizacoesID_LocalOrigem: TWideStringField;
    tblOtimizacoesID_Veiculo: TWideStringField;
    tblOtimizacoesID_Local_1: TWideStringField;
    tblOtimizacoesID_Local_2: TWideStringField;
    tblOtimizacoesValorCustoMinimo: TBCDField;
    tblOtimizacoesValorCustoMaximo: TBCDField;
    tblOtimizacoesValorCustoMedio: TBCDField;
    tblOtimizacoesValorVelocidadeMinima: TBCDField;
    tblOtimizacoesValorVelocidadeMaxima: TBCDField;
    tblOtimizacoesValorVelocidadeMedia: TBCDField;
    tblOtimizacoesValorDistancia: TBCDField;
    dtsOtimizacoes: TDataSource;
    tblParadasVeiculo: TADOTable;
    tblParadasVeiculoID_Local: TWideStringField;
    tblParadasVeiculoID_Veiculo: TWideStringField;
    tblParadasVeiculoTempoMinimoParada: TBCDField;
    tblParadasVeiculoTempoMaximoParada: TBCDField;
    tblParadasVeiculoTempoMedioParada: TBCDField;
    dtsParadasVeiculo: TDataSource;
    tblParadasVeiculocNomeVeiculo: TStringField;
    tblLigacoesVeiculo: TADOTable;
    tblLigacoesVeiculoVelocidadeMedia: TBCDField;
    tblLigacoesVeiculoVelocidadeMinima: TBCDField;
    tblLigacoesVeiculoVelocidadeMaxima: TBCDField;
    tblLigacoesVeiculoCustoMedio: TBCDField;
    tblLigacoesVeiculoCustoMinimo: TBCDField;
    tblLigacoesVeiculoCustoMaximo: TBCDField;
    tblLigacoesVeiculocNomeVeiculo: TStringField;
    dtsLigacoesVeiculo: TDataSource;
    tblParametrosDt_atualizacao: TDateTimeField;
    tblParametrosAtualiza_Veiculo: TWideStringField;
    tblAux_Entregas: TADOTable;
    tblAux_EntregasID_LocalDestino: TWideStringField;
    tblAux_EntregasPeso: TBCDField;
    dtsAux_Entregas: TDataSource;
    tblAux_Otimizacoes: TADOTable;
    dtsAux_Otimizacoes: TDataSource;
    tblAux_OtimizacoesID_Local_1: TWideStringField;
    tblAux_OtimizacoesID_Local_2: TWideStringField;
    tblAux_OtimizacoesValorOtimizacao: TBCDField;
    tblAux_OtimizacoesO_ID_LocalOrigem: TWideStringField;
    tblAux_OtimizacoesO_ID_Veiculo: TWideStringField;
    tblAux_OtimizacoesO_ID_Local_1: TWideStringField;
    tblAux_OtimizacoesO_ID_Local_2: TWideStringField;
    tblVeiculosTempoMinimoParada: TBCDField;
    tblVeiculosTempoMaximoParada: TBCDField;
    tblVeiculosTempoMedioParada: TBCDField;
    tblVeiculosVelocidadeMedia: TBCDField;
    tblVeiculosVelocidadeMinima: TBCDField;
    tblVeiculosVelocidadeMaxima: TBCDField;
    tblVeiculosCustoMedio: TBCDField;
    tblVeiculosCustoMinimo: TBCDField;
    tblVeiculosCustoMaximo: TBCDField;
    tblLigacoesVeiculoID_LocalOrigem: TWideStringField;
    tblLigacoesVeiculoID_LocalDestino: TWideStringField;
    tblLigacoesVeiculoID_Veiculo: TWideStringField;
    tblLigacoesVeiculoSentido: TWideStringField;
    tblCargasDt_Carga: TDateTimeField;
    tblCargasStatus: TWideStringField;
    tblLogsAntes: TMemoField;
    tblLogsDepois: TMemoField;
    tblLogsLocal: TWideStringField;
    tblEntregasID_Carga: TWideStringField;
    tblCargasTempoCiclo: TBCDField;
    tblCargasPeso: TBCDField;
    tblCargasCalculo: TWideStringField;
    tblCargasValor: TBCDField;
    tblEntregasSequencia: TIntegerField;
    tblCargasVeiculo_Sistema: TWideStringField;
    tblCargasPontos: TADOTable;
    dtsCargasPontos: TDataSource;
    tblCargasPontosID_Carga: TWideStringField;
    tblCargasPontosID_Entrega: TWideStringField;
    tblCargasPontosID_LocalOrigem: TWideStringField;
    tblCargasPontosID_LocalDestino: TWideStringField;
    tblCargasPontosSequencia: TIntegerField;
    tblCargasPontosTempo: TBCDField;
    tblCargasPontosCusto: TBCDField;
    tblCargasPontosParadaOrigem: TBCDField;
    tblCargasPontosParadaDestino: TBCDField;
    tblCargasPontosDistancia: TBCDField;
    tblPneus: TADOTable;
    dtsPneus: TDataSource;
    tblPneusID_Pneu: TWideStringField;
    tblPneusObservacoes: TMemoField;
    tblPneusDt_Inicio: TDateTimeField;
    tblPneusDt_Termino: TDateTimeField;
    tblPneusCusto_Inicial: TBCDField;
    tblPneusCusto_Atual: TBCDField;
    tblPneusKM_Inicial: TIntegerField;
    tblPneusKM_Atual: TIntegerField;
    tblPneusID_Veiculo: TWideStringField;
    tblPneusID_Deposito: TWideStringField;
    tblPneusID_Fornecedor: TWideStringField;
    tblDepositos: TADOTable;
    dtsDepositos: TDataSource;
    tblDepositosID_Deposito: TWideStringField;
    tblDepositosNome: TWideStringField;
    tblDepositosObservacoes: TMemoField;
    tblFornecedores: TADOTable;
    dtsFornecedores: TDataSource;
    tblFornecedoresID_Fornecedor: TWideStringField;
    tblFornecedoresNome: TWideStringField;
    tblFornecedoresObservacoes: TMemoField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblUsuariosBeforeDelete(DataSet: TDataSet);
    procedure tblProgramasBeforeOpen(DataSet: TDataSet);
    procedure tblUsuariosBeforeOpen(DataSet: TDataSet);
    procedure tblParametrosBeforeOpen(DataSet: TDataSet);
    procedure tblPermissoesUsuarioBeforeOpen(DataSet: TDataSet);
    procedure tblLogsBeforeOpen(DataSet: TDataSet);
    procedure tblRelatoriosBeforeOpen(DataSet: TDataSet);
    procedure tblRelatoriosAfterInsert(DataSet: TDataSet);
    procedure tblRelatoriosBeforeDelete(DataSet: TDataSet);
    procedure tblLocaisAfterInsert(DataSet: TDataSet);
    procedure tblLocaisBeforeDelete(DataSet: TDataSet);
    procedure LogBase(DataSet: TDataSet);
    procedure tblLocaisBeforeOpen(DataSet: TDataSet);
    procedure tblParametrosAfterInsert(DataSet: TDataSet);
    procedure tblTiposCaminhoBeforeDelete(DataSet: TDataSet);
    procedure tblParametrosBeforeDelete(DataSet: TDataSet);
    procedure tblPermissoesUsuarioBeforeDelete(DataSet: TDataSet);
    procedure tblProgramasBeforeDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tblLogsBeforeDelete(DataSet: TDataSet);
    procedure tblTiposCaminhoBeforeOpen(DataSet: TDataSet);
    procedure tblTiposCaminhoAfterInsert(DataSet: TDataSet);
    procedure tblLigacoesAfterInsert(DataSet: TDataSet);
    procedure tblLigacoesBeforeDelete(DataSet: TDataSet);
    procedure tblLigacoesBeforeOpen(DataSet: TDataSet);
    procedure tblLigacoesBeforePost(DataSet: TDataSet);
    procedure tblEntregasAfterInsert(DataSet: TDataSet);
    procedure tblEntregasBeforeDelete(DataSet: TDataSet);
    procedure tblEntregasBeforeOpen(DataSet: TDataSet);
    procedure tblEntregasBeforePost(DataSet: TDataSet);
    procedure tblUsuariosBeforePost(DataSet: TDataSet);
    procedure tblParametrosBeforePost(DataSet: TDataSet);
    procedure tblVeiculosBeforeDelete(DataSet: TDataSet);
    procedure tblVeiculosBeforeOpen(DataSet: TDataSet);
    procedure tblGanhosBeforeDelete(DataSet: TDataSet);
    procedure tblGanhosBeforeOpen(DataSet: TDataSet);
    procedure tblVeiculosBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoDistanciaBeforeOpen(DataSet: TDataSet);
    procedure dtsGanhosDataChange(Sender: TObject; Field: TField);
    procedure tblRotasGanhoDistanciaBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMinimoBeforeOpen(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMinimoBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMinimaBeforeOpen(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMinimaBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMaximoBeforeOpen(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMaximoBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMedioBeforeOpen(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMedioBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMaximaBeforeOpen(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMaximaBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMediaBeforeOpen(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMediaBeforePost(DataSet: TDataSet);
    procedure tblRotasGanhoDistanciaBeforeDelete(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMinimoBeforeDelete(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMaximoBeforeDelete(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMedioBeforeDelete(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMinimaBeforeDelete(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMaximaBeforeDelete(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMediaBeforeDelete(DataSet: TDataSet);
    procedure tblCargasBeforeDelete(DataSet: TDataSet);
    procedure tblCargasBeforeOpen(DataSet: TDataSet);
    procedure tblOtimizacoesBeforeDelete(DataSet: TDataSet);
    procedure tblOtimizacoesBeforeOpen(DataSet: TDataSet);
    procedure tblParadasVeiculoBeforeDelete(DataSet: TDataSet);
    procedure tblParadasVeiculoBeforeOpen(DataSet: TDataSet);
    procedure tblParadasVeiculoBeforePost(DataSet: TDataSet);
    procedure dtsLocaisDataChange(Sender: TObject; Field: TField);
    procedure tblLigacoesVeiculoBeforeDelete(DataSet: TDataSet);
    procedure tblLigacoesVeiculoBeforeOpen(DataSet: TDataSet);
    procedure tblLigacoesVeiculoBeforePost(DataSet: TDataSet);
    procedure dtsLigacoesDataChange(Sender: TObject; Field: TField);
    procedure tblProgramasDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblProgramasEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblProgramasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblUsuariosAfterPost(DataSet: TDataSet);
    procedure tblLocaisAfterPost(DataSet: TDataSet);
    procedure tblParametrosAfterPost(DataSet: TDataSet);
    procedure tblPermissoesUsuarioAfterPost(DataSet: TDataSet);
    procedure tblRelatoriosAfterPost(DataSet: TDataSet);
    procedure tblTiposCaminhoAfterPost(DataSet: TDataSet);
    procedure tblEntregasAfterPost(DataSet: TDataSet);
    procedure tblVeiculosAfterPost(DataSet: TDataSet);
    procedure tblCargasAfterPost(DataSet: TDataSet);
    procedure tblAux_EntregasAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMinimoAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMinimaAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMaximoAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMaximaAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoCustoMedioAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoVelocidadeMediaAfterPost(DataSet: TDataSet);
    procedure tblLigacoesAfterPost(DataSet: TDataSet);
    procedure tblGanhosAfterPost(DataSet: TDataSet);
    procedure tblRotasGanhoDistanciaAfterPost(DataSet: TDataSet);
    procedure tblOtimizacoesAfterPost(DataSet: TDataSet);
    procedure tblParadasVeiculoAfterPost(DataSet: TDataSet);
    procedure tblLigacoesVeiculoAfterPost(DataSet: TDataSet);
    procedure tblAux_OtimizacoesAfterPost(DataSet: TDataSet);
    procedure tblEntregasCargaAfterPost(DataSet: TDataSet);
    procedure tblVeiculosAfterEdit(DataSet: TDataSet);
    procedure tblVeiculosAfterInsert(DataSet: TDataSet);
    procedure tblAux_EntregasBeforeDelete(DataSet: TDataSet);
    procedure tblAux_OtimizacoesBeforeDelete(DataSet: TDataSet);
    procedure tblPermissoesUsuarioBeforePost(DataSet: TDataSet);
    procedure tblRelatoriosBeforePost(DataSet: TDataSet);
    procedure tblLocaisBeforePost(DataSet: TDataSet);
    procedure tblTiposCaminhoBeforePost(DataSet: TDataSet);
    procedure tblGanhosBeforePost(DataSet: TDataSet);
    procedure tblCargasBeforePost(DataSet: TDataSet);
    procedure tblOtimizacoesBeforePost(DataSet: TDataSet);
    procedure tblAux_EntregasBeforePost(DataSet: TDataSet);
    procedure tblAux_OtimizacoesBeforePost(DataSet: TDataSet);
    procedure tblEntregasCargaBeforePost(DataSet: TDataSet);
    procedure tblLogsDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblLogsEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblLogsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblEntregasBeforeEdit(DataSet: TDataSet);
    procedure tblCargasPontosAfterPost(DataSet: TDataSet);
    procedure tblCargasPontosBeforeDelete(DataSet: TDataSet);
    procedure tblCargasPontosBeforePost(DataSet: TDataSet);
    procedure dtsCargasDataChange(Sender: TObject; Field: TField);
    procedure tblCargasPontosBeforeEdit(DataSet: TDataSet);
    procedure tblPneusAfterPost(DataSet: TDataSet);
    procedure tblPneusBeforeDelete(DataSet: TDataSet);
    procedure tblPneusBeforeOpen(DataSet: TDataSet);
    procedure tblPneusBeforePost(DataSet: TDataSet);
    procedure tblDepositosAfterPost(DataSet: TDataSet);
    procedure tblDepositosBeforeDelete(DataSet: TDataSet);
    procedure tblDepositosBeforeOpen(DataSet: TDataSet);
    procedure tblDepositosBeforePost(DataSet: TDataSet);
    procedure tblFornecedoresAfterPost(DataSet: TDataSet);
    procedure tblFornecedoresBeforeDelete(DataSet: TDataSet);
    procedure tblFornecedoresBeforeOpen(DataSet: TDataSet);
    procedure tblFornecedoresBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    cDelete : boolean;
    iPermiteEntrega : integer;
  end;

var
  dtmPrincipal: TdtmPrincipal;
  vOperacao : string;

implementation

uses uPrincipal, Dialogs;

{$R *.dfm}

procedure TdtmPrincipal.DataModuleDestroy(Sender: TObject);
begin
    bdDados.Connected := False;
end;

procedure TdtmPrincipal.tblUsuariosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblUsuarios.FieldCount - 1 do
        begin
            if Copy(tblUsuarios.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblUsuarios.Fields[i].DisplayLabel + ': ' + tblUsuarios.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    if tblUsuariosID_Usuario.Value = 'Mestre' then
    begin
        MessageDlg('O usuário Mestre não pode ser excluído.', mtWarning, [mbOK], 0);
        Abort;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblProgramasBeforeOpen(DataSet: TDataSet);
begin
    tblProgramas.Filtered := False;
    tblProgramas.Filter := '';
end;

procedure TdtmPrincipal.tblUsuariosBeforeOpen(DataSet: TDataSet);
begin
    tblUsuarios.Filtered := False;
    tblUsuarios.Filter := '';
end;

procedure TdtmPrincipal.tblParametrosBeforeOpen(DataSet: TDataSet);
begin
    tblParametros.Filtered := False;
    tblParametros.Filter := '';
end;

procedure TdtmPrincipal.tblPermissoesUsuarioBeforeOpen(DataSet: TDataSet);
begin
    tblPermissoesUsuario.Filtered := False;
    tblPermissoesUsuario.Filter := '';
end;

procedure TdtmPrincipal.tblLogsBeforeOpen(DataSet: TDataSet);
begin
    tblLogs.Filtered := False;
    tblLogs.Filter := '';
end;

procedure TdtmPrincipal.tblRelatoriosBeforeOpen(DataSet: TDataSet);
begin
    tblRelatorios.Filtered := False;
    tblRelatorios.Filter := '';
end;

procedure TdtmPrincipal.tblRelatoriosAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
    tblRelatoriosGenerico.Value := 'S';
    tblRelatoriosParticular.Value := 'N';
end;

procedure TdtmPrincipal.tblRelatoriosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRelatorios.FieldCount - 1 do
        begin
            if Copy(tblRelatorios.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRelatorios.Fields[i].DisplayLabel + ': ' + tblRelatorios.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblLocaisAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
    tblLocaisDeposito.Value := 'N';
end;

procedure TdtmPrincipal.tblLocaisBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblLocais.FieldCount - 1 do
        begin
            if Copy(tblLocais.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblLocais.Fields[i].DisplayLabel + ': ' + tblLocais.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblLocaisBeforeOpen(DataSet: TDataSet);
begin
    tblLocais.Filtered := False;
    tblLocais.Filter := '';
end;

procedure TdtmPrincipal.tblParametrosAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
    tblParametrosDeposito_Cor.Value := '1';
    tblParametrosMostrarNomesLocais.Value := 'S';
    tblParametrosMostrarDistanciaLigacoes.Value := 'S';
end;

procedure TdtmPrincipal.tblTiposCaminhoBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblTiposCaminho.FieldCount - 1 do
        begin
            if Copy(tblTiposCaminho.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblTiposCaminho.Fields[i].DisplayLabel + ': ' + tblTiposCaminho.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblParametrosBeforeDelete(DataSet: TDataSet);
begin
    MessageDlg('Os parâmetros não podem ser excluídos.', mtWarning, [mbOK], 0);
    Abort;
end;

procedure TdtmPrincipal.tblPermissoesUsuarioBeforeDelete(
  DataSet: TDataSet);
begin
    MessageDlg('As permissões de usários não podem ser excluídas.', mtWarning, [mbOK], 0);
    Abort;
end;

procedure TdtmPrincipal.tblProgramasBeforeDelete(DataSet: TDataSet);
begin
    MessageDlg('Os programas não podem ser excluídos.', mtWarning, [mbOK], 0);
    Abort;
end;

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
begin
    cDelete := True;
end;

procedure TdtmPrincipal.tblLogsBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblLogs.FieldCount - 1 do
        begin
            if Copy(tblLogs.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblLogs.Fields[i].DisplayLabel + ': ' + tblLogs.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;
end;

procedure TdtmPrincipal.tblTiposCaminhoBeforeOpen(DataSet: TDataSet);
begin
    tblTiposCaminho.Filtered := False;
    tblTiposCaminho.Filter := '';
end;

procedure TdtmPrincipal.tblTiposCaminhoAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
    tblTiposCaminhoCor.Value := '1';
end;

procedure TdtmPrincipal.tblLigacoesAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
    tblLigacoesSentido.Value := 'A';
end;

procedure TdtmPrincipal.tblLigacoesBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblLigacoes.FieldCount - 1 do
        begin
            if Copy(tblLigacoes.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblLigacoes.Fields[i].DisplayLabel + ': ' + tblLigacoes.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblLigacoesBeforeOpen(DataSet: TDataSet);
begin
    tblLigacoes.Filtered := False;
    tblLigacoes.Filter := '';
end;

procedure TdtmPrincipal.tblLigacoesBeforePost(DataSet: TDataSet);
begin
    if tblLigacoesID_LocalOrigem.Value = tblLigacoesID_LocalDestino.Value then
    begin
        MessageDlg('O local de destino não pode ser o mesmo do que o local de '+#13+#10+'origem.', mtError, [mbOK], 0);
        Abort;
    end;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblEntregasAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
    tblEntregasSituacao.Value := 'P';
end;

procedure TdtmPrincipal.tblEntregasBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if iPermiteEntrega = 0 then
    begin
        if tblEntregasID_Carga.Value <> '' then
        begin
            MessageDlg('Esta entrega já está carregada e não pode ser excluída.', mtWarning, [mbOK], 0);
            Abort;
        end;
    end;

    if cDelete then
    begin
        for i := 0 to tblEntregas.FieldCount - 1 do
        begin
            if Copy(tblEntregas.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblEntregas.Fields[i].DisplayLabel + ': ' + tblEntregas.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblEntregasBeforeOpen(DataSet: TDataSet);
begin
    iPermiteEntrega := 0;
    tblEntregas.Filtered := False;
    tblEntregas.Filter := '';
end;

procedure TdtmPrincipal.tblEntregasBeforePost(DataSet: TDataSet);
begin
    if tblEntregasID_LocalOrigem.Value = tblEntregasID_LocalDestino.Value then
    begin
        MessageDlg('O local de destino não pode ser o mesmo do que o local de '+#13+#10+'origem.', mtError, [mbOK], 0);
        Abort;
    end;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblUsuariosBeforePost(DataSet: TDataSet);
begin
    tblUsuariosID_Parametro.Value := frmPrincipal.sParametro;
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblParametrosBeforePost(DataSet: TDataSet);
begin
    if tblParametrosEDI_A_ID_Inicio.Value > tblParametrosEDI_A_ID_Fim.Value then
    begin
        MessageDlg('O ponto de inicio do ID não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Origem_Inicio.Value > tblParametrosEDI_A_Origem_Fim.Value then
    begin
        MessageDlg('O ponto de inicio da Origem não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Destino_Inicio.Value > tblParametrosEDI_A_Destino_Fim.Value then
    begin
        MessageDlg('O ponto de inicio do Destino não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Solicitacao_Inicio.Value > tblParametrosEDI_A_Solicitacao_Fim.Value then
    begin
        MessageDlg('O ponto de inicio da Data de Solicitação não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Entrega_Inicio.Value > tblParametrosEDI_A_Entrega_Fim.Value then
    begin
        MessageDlg('O ponto de inicio da Data de Entrega não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Peso_Inicio.Value > tblParametrosEDI_A_Peso_Fim.Value then
    begin
        MessageDlg('O ponto de inicio do Peso não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Composicao_Inicio.Value > tblParametrosEDI_A_Composicao_Fim.Value then
    begin
        MessageDlg('O ponto de inicio da Composição não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    if tblParametrosEDI_A_Destinatario_Inicio.Value > tblParametrosEDI_A_Destinatario_Fim.Value then
    begin
        MessageDlg('O ponto de inicio do Destinatário não pode ser maior do que o ponto final.', mtError, [mbOK], 0);
        Abort;
    end;

    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblVeiculosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if tblVeiculosID_Veiculo.Value = 'Sistema' then
    begin
        MessageDlg('Não é possível excluir este veículo, pois o funcionamento'+#13+#10+'do sistema depende do mesmo.', mtWarning, [mbOK], 0);
        Abort;
    end;

    if cDelete then
    begin
        for i := 0 to tblVeiculos.FieldCount - 1 do
        begin
            if Copy(tblVeiculos.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblVeiculos.Fields[i].DisplayLabel + ': ' + tblVeiculos.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblVeiculosBeforeOpen(DataSet: TDataSet);
begin
    tblVeiculos.Filtered := False;
    tblVeiculos.Filter := '';
end;

procedure TdtmPrincipal.tblGanhosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblGanhos.FieldCount - 1 do
        begin
            if Copy(tblGanhos.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblGanhos.Fields[i].DisplayLabel + ': ' + tblGanhos.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblGanhosBeforeOpen(DataSet: TDataSet);
begin
    tblGanhos.Filtered := False;
    tblGanhos.Filter := '';
end;

procedure TdtmPrincipal.LogBase(DataSet: TDataSet);
var
    i : integer;
begin
    frmPrincipal.vAntes := '';
    frmPrincipal.vDepois := '';

    for i := 0 to DataSet.FieldCount - 1 do
    begin
        if DataSet.Fields[i].FieldKind = fkData then
        begin
            if vOperacao = 'Edit' then
            begin
                try
                    if DataSet.Fields[i].OldValue <> DataSet.Fields[i].Value then
                    begin
                        frmPrincipal.vAntes  := frmPrincipal.vAntes  + '* ' + DataSet.Fields[i].DisplayLabel + ': ' + VarToStr(DataSet.Fields[i].OldValue) + #10;
                        frmPrincipal.vDepois := frmPrincipal.vDepois + '* ' + DataSet.Fields[i].DisplayLabel + ': ' + DataSet.Fields[i].AsString + #10;
                    end
                    else
                    begin
                        frmPrincipal.vAntes  := frmPrincipal.vAntes  + DataSet.Fields[i].DisplayLabel + ': ' + VarToStr(DataSet.Fields[i].OldValue) + #10;
                        frmPrincipal.vDepois := frmPrincipal.vDepois + DataSet.Fields[i].DisplayLabel + ': ' + DataSet.Fields[i].AsString + #10;
                    end;
                except
                    frmPrincipal.vAntes  := frmPrincipal.vAntes  + DataSet.Fields[i].DisplayLabel + ': ' + DataSet.Fields[i].AsString + #10;
                    frmPrincipal.vDepois := frmPrincipal.vDepois + DataSet.Fields[i].DisplayLabel + ': ' + DataSet.Fields[i].AsString + #10;
                end;
            end;

            if vOperacao = 'Insert' then
            begin
                frmPrincipal.vDepois := frmPrincipal.vDepois + DataSet.Fields[i].DisplayLabel + ': ' + DataSet.Fields[i].AsString + #10;
            end;

            if vOperacao = 'Delete' then
            begin
                frmPrincipal.vAntes  := frmPrincipal.vAntes  + DataSet.Fields[i].DisplayLabel + ': ' + DataSet.Fields[i].AsString + #10;
            end;
        end;
    end;

    frmPrincipal.GeraLogs(DataSet.Name,vOperacao,'S',1);
end;

procedure TdtmPrincipal.tblVeiculosBeforePost(DataSet: TDataSet);
begin
    if tBLVeiculosID_Veiculo.OldValue = 'Sistema' then
    begin
        if tBLVeiculosID_Veiculo.OldValue <> tblVeiculosID_Veiculo.Value then
        begin
            MessageDlg('O ID deste veículo não pode ser modificado, pois o mesmo é '+#13+#10+'utilizado pelo sistema.', mtWarning, [mbOK], 0);
            Abort;
        end;
    end;

    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoDistanciaBeforeOpen(DataSet: TDataSet);
begin
    tblRotasGanhoDistancia.Filtered := False;
    tblRotasGanhoDistancia.Filter := '';
end;

procedure TdtmPrincipal.dtsGanhosDataChange(Sender: TObject;
  Field: TField);
begin
    if tblRotasGanhoDistancia.Active = true then
    begin
        tblRotasGanhoDistancia.Filtered := False;
        tblRotasGanhoDistancia.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoDistancia.Filtered := True;
    end;

    if tblRotasGanhoCustoMinimo.Active = true then
    begin
        tblRotasGanhoCustoMinimo.Filtered := False;
        tblRotasGanhoCustoMinimo.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoCustoMinimo.Filtered := True;
    end;

    if tblRotasGanhoCustoMaximo.Active = true then
    begin
        tblRotasGanhoCustoMaximo.Filtered := False;
        tblRotasGanhoCustoMaximo.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoCustoMaximo.Filtered := True;
    end;

    if tblRotasGanhoCustoMedio.Active = true then
    begin
        tblRotasGanhoCustoMedio.Filtered := False;
        tblRotasGanhoCustoMedio.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoCustoMedio.Filtered := True;
    end;

    if tblRotasGanhoVelocidadeMinima.Active = true then
    begin
        tblRotasGanhoVelocidadeMinima.Filtered := False;
        tblRotasGanhoVelocidadeMinima.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoVelocidadeMinima.Filtered := True;
    end;

    if tblRotasGanhoVelocidadeMaxima.Active = true then
    begin
        tblRotasGanhoVelocidadeMaxima.Filtered := False;
        tblRotasGanhoVelocidadeMaxima.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoVelocidadeMaxima.Filtered := True;
    end;

    if tblRotasGanhoVelocidadeMedia.Active = true then
    begin
        tblRotasGanhoVelocidadeMedia.Filtered := False;
        tblRotasGanhoVelocidadeMedia.Filter := 'ID_LocalOrigem = ' + #39 + tblGanhosID_LocalOrigem.Value + #39 +
                                ' AND ID_LocalDestino = ' + #39 + tblGanhosID_LocalDestino.Value + #39 +
                                ' AND ID_Veiculo = ' + #39 + tblGanhosID_Veiculo.Value + #39;
        tblRotasGanhoVelocidadeMedia.Filtered := True;
    end;

end;

procedure TdtmPrincipal.tblRotasGanhoDistanciaBeforePost(DataSet: TDataSet);
begin
    tblRotasGanhoDistanciaID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoDistanciaID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoDistanciaID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMinimoBeforeOpen(DataSet: TDataSet);
begin
    tblRotasGanhoCustoMinimo.Filtered := False;
    tblRotasGanhoCustoMinimo.Filter := '';
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMinimoBeforePost(DataSet: TDataSet);
begin
    tblRotasGanhoCustoMinimoID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoCustoMinimoID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoCustoMinimoID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMinimaBeforeOpen(
  DataSet: TDataSet);
begin
    tblRotasGanhoVelocidadeMinima.Filtered := False;
    tblRotasGanhoVelocidadeMinima.Filter := '';
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMinimaBeforePost(
  DataSet: TDataSet);
begin
    tblRotasGanhoVelocidadeMinimaID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoVelocidadeMinimaID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoVelocidadeMinimaID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMaximoBeforeOpen(
  DataSet: TDataSet);
begin
    tblRotasGanhoCustoMaximo.Filtered := False;
    tblRotasGanhoCustoMaximo.Filter := '';
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMaximoBeforePost(
  DataSet: TDataSet);
begin
    tblRotasGanhoCustoMaximoID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoCustoMaximoID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoCustoMaximoID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMedioBeforeOpen(
  DataSet: TDataSet);
begin
    tblRotasGanhoCustoMedio.Filtered := False;
    tblRotasGanhoCustoMedio.Filter := '';

end;

procedure TdtmPrincipal.tblRotasGanhoCustoMedioBeforePost(
  DataSet: TDataSet);
begin
    tblRotasGanhoCustoMedioID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoCustoMedioID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoCustoMedioID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMaximaBeforeOpen(
  DataSet: TDataSet);
begin
    tblRotasGanhoVelocidadeMaxima.Filtered := False;
    tblRotasGanhoVelocidadeMaxima.Filter := '';

end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMaximaBeforePost(
  DataSet: TDataSet);
begin
    tblRotasGanhoVelocidadeMaximaID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoVelocidadeMaximaID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoVelocidadeMaximaID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMediaBeforeOpen(
  DataSet: TDataSet);
begin
    tblRotasGanhoVelocidadeMedia.Filtered := False;
    tblRotasGanhoVelocidadeMedia.Filter := '';
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMediaBeforePost(
  DataSet: TDataSet);
begin
    tblRotasGanhoVelocidadeMediaID_LocalOrigem.Value := tblGanhosID_LocalOrigem.Value;
    tblRotasGanhoVelocidadeMediaID_LocalDestino.Value := tblGanhosID_LocalDestino.Value;
    tblRotasGanhoVelocidadeMediaID_Veiculo.Value := tblGanhosID_Veiculo.Value;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.tblRotasGanhoDistanciaBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoDistancia.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoDistancia.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoDistancia.Fields[i].DisplayLabel + ': ' + tblRotasGanhoDistancia.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMinimoBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoCustoMinimo.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoCustoMinimo.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoCustoMinimo.Fields[i].DisplayLabel + ': ' + tblRotasGanhoCustoMinimo.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMaximoBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoCustoMaximo.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoCustoMaximo.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoCustoMaximo.Fields[i].DisplayLabel + ': ' + tblRotasGanhoCustoMaximo.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMedioBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoCustoMedio.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoCustoMedio.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoCustoMedio.Fields[i].DisplayLabel + ': ' + tblRotasGanhoCustoMedio.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMinimaBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoVelocidadeMinima.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoVelocidadeMinima.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoVelocidadeMinima.Fields[i].DisplayLabel + ': ' + tblRotasGanhoVelocidadeMinima.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMaximaBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoVelocidadeMaxima.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoVelocidadeMaxima.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoVelocidadeMaxima.Fields[i].DisplayLabel + ': ' + tblRotasGanhoVelocidadeMaxima.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMediaBeforeDelete(
  DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblRotasGanhoVelocidadeMedia.FieldCount - 1 do
        begin
            if Copy(tblRotasGanhoVelocidadeMedia.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblRotasGanhoVelocidadeMedia.Fields[i].DisplayLabel + ': ' + tblRotasGanhoVelocidadeMedia.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblCargasBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
    iProblema : integer;
    v1 : array of string;
begin
    if cDelete then
    begin
        for i := 0 to tblCargas.FieldCount - 1 do
        begin
            if Copy(tblCargas.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblCargas.Fields[i].DisplayLabel + ': ' + tblCargas.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    iProblema := 0;
    tblEntregas.Filtered := False;
    tblEntregas.Filter := 'ID_Carga = ' + #39 + tblCargasID_Carga.Value + #39;
    tblEntregas.Filtered := True;
    SetLength(v1,tblEntregas.RecordCount);
    i := 0;
    tblEntregas.First;
    while not tblEntregas.Eof do
    begin
        if tblEntregasSituacao.Value = 'E' then
        begin
            iProblema := 1;
        end;
        v1[i] := tblEntregasID_Entrega.Value;
        i := i + 1;
        tblEntregas.Next;
    end;

    if iProblema = 1 then
    begin
        MessageDlg('Esta carga possui entregas já realizadas e não pode ser excluída.', mtInformation, [mbOK], 0);
        Abort;
    end
    else
    begin
        tblEntregas.Filtered := False;
        tblEntregas.Filter := '' ;

        for i := 0 to Length(v1) - 1 do
        begin
            iPermiteEntrega := 1;
            tblEntregas.Locate('ID_Entrega',v1[i],[loPartialKey]);
            tblEntregas.Edit;
            tblEntregasID_Carga.Clear;
            tblEntregasSituacao.Value := 'P';
            tblEntregasSequencia.Value := 1;
            tblEntregas.Post;
            iPermiteEntrega := 0;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblCargasBeforeOpen(DataSet: TDataSet);
begin
    tblCargas.Filtered := False;
    tblCargas.Filter := '';
end;

procedure TdtmPrincipal.tblOtimizacoesBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblOtimizacoes.FieldCount - 1 do
        begin
            if Copy(tblOtimizacoes.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblOtimizacoes.Fields[i].DisplayLabel + ': ' + tblOtimizacoes.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblOtimizacoesBeforeOpen(DataSet: TDataSet);
begin
    tblOtimizacoes.Filtered := False;
    tblOtimizacoes.Filter := '';
end;

procedure TdtmPrincipal.tblParadasVeiculoBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblParadasVeiculo.FieldCount - 1 do
        begin
            if Copy(tblParadasVeiculo.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblParadasVeiculo.Fields[i].DisplayLabel + ': ' + tblParadasVeiculo.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblParadasVeiculoBeforeOpen(DataSet: TDataSet);
begin
    tblParadasVeiculo.Filtered := False;
    tblParadasVeiculo.Filter := '';
end;

procedure TdtmPrincipal.tblParadasVeiculoBeforePost(DataSet: TDataSet);
begin
    tblParadasVeiculoID_Local.Value := tblLocaisID_Local.Value;

    if tblParadasVeiculoID_Veiculo.Value = 'Sistema' then
    begin
        MessageDlg('Este veículo é de uso exclusivo do sistema.', mtWarning, [mbOK], 0);
        Abort;
    end;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.dtsLocaisDataChange(Sender: TObject;
  Field: TField);
begin
    if tblParadasVeiculo.Active = true then
    begin
        tblParadasVeiculo.Filtered := False;
        tblParadasVeiculo.Filter := 'ID_Local = ' + #39 + tblLocaisID_Local.Value + #39;
        tblParadasVeiculo.Filtered := True;
    end;
end;

procedure TdtmPrincipal.tblLigacoesVeiculoBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblLigacoesVeiculo.FieldCount - 1 do
        begin
            if Copy(tblLigacoesVeiculo.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblLigacoesVeiculo.Fields[i].DisplayLabel + ': ' + tblLigacoesVeiculo.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblLigacoesVeiculoBeforeOpen(DataSet: TDataSet);
begin
    tblLigacoesVeiculo.Filtered := False;
    tblLigacoesVeiculo.Filter := '';
end;

procedure TdtmPrincipal.tblLigacoesVeiculoBeforePost(DataSet: TDataSet);
begin
    tblLigacoesVeiculoID_LocalOrigem.Value := tblLigacoesID_LocalOrigem.Value;
    tblLigacoesVeiculoID_LocalDestino.Value := tblLigacoesID_LocalDestino.Value;
    tblLigacoesVeiculoSentido.Value := tblLigacoesSentido.Value;

    if tblLigacoesVeiculoID_Veiculo.Value = 'Sistema' then
    begin
        MessageDlg('Este veículo é de uso exclusivo do sistema.', mtWarning, [mbOK], 0);
        Abort;
    end;

    LogBase(DataSet);    
end;

procedure TdtmPrincipal.dtsLigacoesDataChange(Sender: TObject;
  Field: TField);
begin
    if tblLigacoesVeiculo.Active = true then
    begin
        tblLigacoesVeiculo.Filtered := False;
        tblLigacoesVeiculo.Filter := 'ID_LocalOrigem = ' + #39 + tblLigacoesID_LocalOrigem.Value + #39 +
                                     'AND ID_LocalDestino = ' + #39 + tblLigacoesID_LocalDestino.Value + #39;
        tblLigacoesVeiculo.Filtered := True;
    end;
end;

procedure TdtmPrincipal.tblProgramasDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    frmPrincipal.vDepois := '';
    frmPrincipal.vAntes := E.Message;
    frmPrincipal.GeraLogs(DataSet.Name,'DeleteError','S',1);
    MessageDlg('Ocorreu um erro ao tentar apagar o registro solicitado.'+#13+#10+'Descrição do erro: ' + E.Message, mtError, [mbOK], 0);
    Action := daAbort;
end;

procedure TdtmPrincipal.tblProgramasEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    frmPrincipal.vDepois := '';
    frmPrincipal.vAntes := E.Message;
    frmPrincipal.GeraLogs(DataSet.Name,'EditError','S',1);
    MessageDlg('Ocorreu um erro ao tentar modificar o registro solicitado.'+#13+#10+'Descrição do erro: ' + E.Message, mtError, [mbOK], 0);
    Action := daAbort;
end;

procedure TdtmPrincipal.tblProgramasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    frmPrincipal.vDepois := '';
    frmPrincipal.vAntes := E.Message;
    frmPrincipal.GeraLogs(DataSet.Name,'PostError','S',1);
    MessageDlg('Ocorreu um erro ao tentar confirmar as modificações no registro solicitado.'+#13+#10+'Descrição do erro: ' + E.Message, mtError, [mbOK], 0);
    Action := daAbort;
end;

procedure TdtmPrincipal.tblUsuariosAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    Filtro : string;
begin
    campo := 'ID_Usuario';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblLocaisAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Local';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblParametrosAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Parametro';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblPermissoesUsuarioAfterPost(DataSet: TDataSet);
var
    valor : string;
    valor1 : string;
    campo : string;
    campo1 : string;
    filtro : string;
begin
    campo := 'ID_Usuario';
    campo1 := 'ID_Programa';
    valor := DataSet.FieldByName(campo).Value;
    valor1 := DataSet.FieldByName(campo1).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate('ID_Usuario; ID_Programa',VarArrayOf([valor, valor1]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRelatoriosAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Relatorio';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblTiposCaminhoAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_TipoCaminho';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblEntregasAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Entrega';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblVeiculosAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Veiculo';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblCargasAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Carga';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblAux_EntregasAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalDestino';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMinimoAfterPost(
  DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMinimaAfterPost(
  DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMaximoAfterPost(
  DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMaximaAfterPost(
  DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoCustoMedioAfterPost(
  DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoVelocidadeMediaAfterPost(
  DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblLigacoesAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblGanhosAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblRotasGanhoDistanciaAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    valor5 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo;ID_Local;Sequencia';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    valor4 := DataSet.FieldByName('ID_Local').Value;
    valor5 := DataSet.FieldByName('Sequencia').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4, valor5]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblOtimizacoesAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_Veiculo;ID_Local_1;ID_Local_2';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_Veiculo').Value;
    valor3 := DataSet.FieldByName('ID_Local_1').Value;
    valor4 := DataSet.FieldByName('ID_Local_2').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblParadasVeiculoAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Local;ID_Veiculo';
    valor1 := DataSet.FieldByName('ID_Local').Value;
    valor2 := DataSet.FieldByName('ID_Veiculo').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblLigacoesVeiculoAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_LocalOrigem;ID_LocalDestino;ID_Veiculo';
    valor1 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor2 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor3 := DataSet.FieldByName('ID_Veiculo').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblAux_OtimizacoesAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Local_1;ID_Local_2';
    valor1 := DataSet.FieldByName('ID_Local_1').Value;
    valor2 := DataSet.FieldByName('ID_Local_2').Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblEntregasCargaAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    campo : string;
begin
    campo := 'ID_Carga;ID_Entrega';
    valor1 := DataSet.FieldByName('ID_Carga').Value;
    valor2 := DataSet.FieldByName('ID_Entrega').Value;
    DataSet.Close;
    DataSet.Open;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblVeiculosAfterEdit(DataSet: TDataSet);
begin
    vOperacao := 'Edit';
end;

procedure TdtmPrincipal.tblVeiculosAfterInsert(DataSet: TDataSet);
begin
    vOperacao := 'Insert';
end;

procedure TdtmPrincipal.tblAux_EntregasBeforeDelete(DataSet: TDataSet);
begin
    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblAux_OtimizacoesBeforeDelete(DataSet: TDataSet);
begin
    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblPermissoesUsuarioBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblRelatoriosBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblLocaisBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblTiposCaminhoBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblGanhosBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblCargasBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblOtimizacoesBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblAux_EntregasBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblAux_OtimizacoesBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblEntregasCargaBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblLogsDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    MessageDlg('Ocorreu um erro ao tentar apagar o registro solicitado.'+#13+#10+'Descrição do erro: ' + E.Message, mtError, [mbOK], 0);
    Action := daAbort;
end;

procedure TdtmPrincipal.tblLogsEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    MessageDlg('Ocorreu um erro ao tentar modificar o registro solicitado.'+#13+#10+'Descrição do erro: ' + E.Message, mtError, [mbOK], 0);
    Action := daAbort;
end;

procedure TdtmPrincipal.tblLogsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    MessageDlg('Ocorreu um erro ao tentar confirmar as modificações no registro solicitado.'+#13+#10+'Descrição do erro: ' + E.Message, mtError, [mbOK], 0);
    Action := daAbort;
end;

procedure TdtmPrincipal.tblEntregasBeforeEdit(DataSet: TDataSet);
begin
    if iPermiteEntrega = 0 then
    begin
        if tblEntregasID_Carga.Value <> '' then
        begin
            MessageDlg('Esta entrega já está carregada e não pode ser alterada.', mtWarning, [mbOK], 0);
            Abort;
        end;
    end;
end;

procedure TdtmPrincipal.tblCargasPontosAfterPost(DataSet: TDataSet);
var
    valor1 : string;
    valor2 : string;
    valor3 : string;
    valor4 : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Carga;ID_LocalOrigem;ID_LocalDestino;Sequencia';
    valor1 := DataSet.FieldByName('ID_Carga').Value;
    valor2 := DataSet.FieldByName('ID_LocalOrigem').Value;
    valor3 := DataSet.FieldByName('ID_LocalDestino').Value;
    valor4 := DataSet.FieldByName('Sequencia').AsString;

    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,VarArrayOf([valor1, valor2, valor3, valor4]),[loPartialKey]);
end;

procedure TdtmPrincipal.tblCargasPontosBeforeDelete(DataSet: TDataSet);
begin
    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblCargasPontosBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.dtsCargasDataChange(Sender: TObject;
  Field: TField);
begin
    if tblCargasPontos.Active = true then
    begin
        tblCargasPontos.Filtered := False;
        tblCargasPontos.Filter := 'ID_Carga = ' + #39 + tblCargasID_Carga.Value + #39;
        tblCargasPontos.Filtered := True;
    end;
end;

procedure TdtmPrincipal.tblCargasPontosBeforeEdit(DataSet: TDataSet);
begin
    if (tblCargasStatus.Value = 'E') or (tblCargasStatus.Value = 'F') then
    begin
        MessageDlg('A carga já está encerrada ou finalizada.', mtWarning, [mbOK], 0);
        Abort;
    end;
end;

procedure TdtmPrincipal.tblPneusAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Pneu';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblPneusBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblPneus.FieldCount - 1 do
        begin
            if Copy(tblPneus.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblPneus.Fields[i].DisplayLabel + ': ' + tblPneus.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblPneusBeforeOpen(DataSet: TDataSet);
begin
    tblPneus.Filtered := False;
    tblPneus.Filter := '';
end;

procedure TdtmPrincipal.tblPneusBeforePost(DataSet: TDataSet);
begin
    if tblPneusCusto_Atual.Value = 0 then tblPneusCusto_Atual.Value := tblPneusCusto_Inicial.Value;
    if tblPneusKM_Atual.Value = 0 then tblPneusKM_Atual.Value := tblPneusKM_Inicial.Value;

    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblDepositosAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Deposito';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblDepositosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblDepositos.FieldCount - 1 do
        begin
            if Copy(tblDepositos.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblDepositos.Fields[i].DisplayLabel + ': ' + tblDepositos.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblDepositosBeforeOpen(DataSet: TDataSet);
begin
    tblDepositos.Filtered := False;
    tblDepositos.Filter := '';
end;

procedure TdtmPrincipal.tblDepositosBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblFornecedoresAfterPost(DataSet: TDataSet);
var
    valor : string;
    campo : string;
    filtro : string;
begin
    campo := 'ID_Fornecedor';
    valor := DataSet.FieldByName(campo).Value;
    Filtro := DataSet.Filter;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filtered := False;
    if Filtro <> '' then
    begin
        DataSet.Filter := Filtro;
        DataSet.Filtered := True;
    end;
    DataSet.Locate(campo,valor,[loPartialKey]);
end;

procedure TdtmPrincipal.tblFornecedoresBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    i : integer;
begin
    if cDelete then
    begin
        for i := 0 to tblFornecedores.FieldCount - 1 do
        begin
            if Copy(tblFornecedores.Fields[i].DisplayLabel,1,1) <> '#' then
            begin
                aux := aux + tblFornecedores.Fields[i].DisplayLabel + ': ' + tblFornecedores.Fields[i].AsString + #10;
            end;
        end;

        if Confirma('Deseja relamente apagar o registro corrente.' + #10 + #10 + aux) = False then
        begin
            Abort;
        end;
    end;

    vOperacao := 'Delete';
    LogBase(DataSet);
end;

procedure TdtmPrincipal.tblFornecedoresBeforeOpen(DataSet: TDataSet);
begin
    tblFornecedores.Filtered := False;
    tblFornecedores.Filter := '';
end;

procedure TdtmPrincipal.tblFornecedoresBeforePost(DataSet: TDataSet);
begin
    LogBase(DataSet);
end;

end.
