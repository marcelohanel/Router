object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 211
  Top = 147
  Height = 396
  Width = 554
  object bdDados: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Temp\Router\Dado' +
      's\Dados.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 480
    Top = 16
  end
  object dtsProgramas: TDataSource
    DataSet = tblProgramas
    Left = 56
    Top = 16
  end
  object dtsUsuarios: TDataSource
    DataSet = tblUsuarios
    Left = 56
    Top = 64
  end
  object dtsParametros: TDataSource
    DataSet = tblParametros
    Left = 56
    Top = 112
  end
  object tblProgramas: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblProgramasBeforeOpen
    BeforeDelete = tblProgramasBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Programas'
    Left = 24
    Top = 16
    object tblProgramasID_Programa: TWideStringField
      DisplayLabel = 'Programa'
      FieldName = 'ID_Programa'
    end
    object tblProgramasNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblProgramasTitulo: TWideStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Titulo'
    end
    object tblProgramasVersao: TWideStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'Versao'
      Size = 10
    end
  end
  object tblUsuarios: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblUsuariosBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblUsuariosBeforePost
    AfterPost = tblUsuariosAfterPost
    BeforeDelete = tblUsuariosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Usuarios'
    Left = 24
    Top = 64
    object tblUsuariosID_Usuario: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'ID_Usuario'
    end
    object tblUsuariosNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblUsuariosSenha: TWideStringField
      DisplayLabel = '#Senha'
      FieldName = 'Senha'
    end
    object tblUsuariosID_Parametro: TWideStringField
      DisplayLabel = 'Par'#226'metro'
      FieldName = 'ID_Parametro'
      Size = 10
    end
  end
  object tblParametros: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblParametrosBeforeOpen
    AfterInsert = tblParametrosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblParametrosBeforePost
    AfterPost = tblParametrosAfterPost
    BeforeDelete = tblParametrosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Parametros'
    Left = 24
    Top = 112
    object tblParametrosID_Parametro: TWideStringField
      DisplayLabel = 'ID Par'#226'metro'
      FieldName = 'ID_Parametro'
      Size = 10
    end
    object tblParametrosMapa_altura: TIntegerField
      DisplayLabel = 'Altura do Mapa'
      FieldName = 'Mapa_altura'
    end
    object tblParametrosMapa_largura: TIntegerField
      DisplayLabel = 'Largura do Mapa'
      FieldName = 'Mapa_largura'
    end
    object tblParametrosMapa_imagem: TWideStringField
      DisplayLabel = 'Imagem do Mapa'
      FieldName = 'Mapa_imagem'
      Size = 200
    end
    object tblParametrosDeposito_Tamanho: TIntegerField
      DisplayLabel = 'Tamanho do Dep'#243'sito'
      FieldName = 'Deposito_Tamanho'
    end
    object tblParametrosDeposito_Cor: TWideStringField
      DisplayLabel = 'Cor do Dep'#243'sito'
      FieldName = 'Deposito_Cor'
      Size = 1
    end
    object tblParametrosPonto_Tamanho: TIntegerField
      DisplayLabel = 'Tamanho do Ponto'
      FieldName = 'Ponto_Tamanho'
    end
    object tblParametrosPonto_Cor: TWideStringField
      DisplayLabel = 'Cor do Ponto'
      FieldName = 'Ponto_Cor'
      Size = 1
    end
    object tblParametrosTipo_ligacao: TWideStringField
      DisplayLabel = 'Tipo Liga'#231#227'o'
      FieldName = 'Tipo_ligacao'
      Size = 1
    end
    object tblParametrosEDI_A_ID_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_ID_Inicio'
      FieldName = 'EDI_A_ID_Inicio'
    end
    object tblParametrosEDI_A_ID_Fim: TIntegerField
      DisplayLabel = '#EDI_A_ID_Fim'
      FieldName = 'EDI_A_ID_Fim'
    end
    object tblParametrosEDI_A_Origem_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Origem_Inicio'
      FieldName = 'EDI_A_Origem_Inicio'
    end
    object tblParametrosEDI_A_Origem_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Origem_Fim'
      FieldName = 'EDI_A_Origem_Fim'
    end
    object tblParametrosEDI_A_Destino_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Destino_Inicio'
      FieldName = 'EDI_A_Destino_Inicio'
    end
    object tblParametrosEDI_A_Destino_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Destino_Fim'
      FieldName = 'EDI_A_Destino_Fim'
    end
    object tblParametrosEDI_A_Solicitacao_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Solicitacao_Inicio'
      FieldName = 'EDI_A_Solicitacao_Inicio'
    end
    object tblParametrosEDI_A_Solicitacao_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Solicitacao_Fim'
      FieldName = 'EDI_A_Solicitacao_Fim'
    end
    object tblParametrosEDI_A_Entrega_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Entrega_Inicio'
      FieldName = 'EDI_A_Entrega_Inicio'
    end
    object tblParametrosEDI_A_Entrega_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Entrega_Fim'
      FieldName = 'EDI_A_Entrega_Fim'
    end
    object tblParametrosEDI_A_Peso_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Peso_Inicio'
      FieldName = 'EDI_A_Peso_Inicio'
    end
    object tblParametrosEDI_A_Peso_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Peso_Fim'
      FieldName = 'EDI_A_Peso_Fim'
    end
    object tblParametrosEDI_A_Composicao_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Composicao_Inicio'
      FieldName = 'EDI_A_Composicao_Inicio'
    end
    object tblParametrosEDI_A_Composicao_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Composicao_Fim'
      FieldName = 'EDI_A_Composicao_Fim'
    end
    object tblParametrosEDI_A_Destinatario_Inicio: TIntegerField
      DisplayLabel = '#EDI_A_Destinatario_Inicio'
      FieldName = 'EDI_A_Destinatario_Inicio'
    end
    object tblParametrosEDI_A_Destinatario_Fim: TIntegerField
      DisplayLabel = '#EDI_A_Destinatario_Fim'
      FieldName = 'EDI_A_Destinatario_Fim'
    end
    object tblParametrosMostrarNomesLocais: TWideStringField
      DisplayLabel = 'Mostrar Locais'
      FieldName = 'MostrarNomesLocais'
      Size = 1
    end
    object tblParametrosMostrarDistanciaLigacoes: TWideStringField
      DisplayLabel = 'Mostrar Liga'#231#245'es'
      FieldName = 'MostrarDistanciaLigacoes'
      Size = 1
    end
    object tblParametrosDt_atualizacao: TDateTimeField
      DisplayLabel = '#Dt_atualizacao'
      FieldName = 'Dt_atualizacao'
      EditMask = '!99/99/0000;1;_'
    end
    object tblParametrosAtualiza_Veiculo: TWideStringField
      DisplayLabel = '#Atualiza_Veiculo'
      FieldName = 'Atualiza_Veiculo'
      Size = 1
    end
  end
  object tblPermissoesUsuario: TADOTable
    Connection = bdDados
    BeforeOpen = tblPermissoesUsuarioBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblPermissoesUsuarioBeforePost
    AfterPost = tblPermissoesUsuarioAfterPost
    BeforeDelete = tblPermissoesUsuarioBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'PermissoesUsuario'
    Left = 24
    Top = 160
    object tblPermissoesUsuarioID_Usuario: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'ID_Usuario'
    end
    object tblPermissoesUsuarioID_Programa: TWideStringField
      DisplayLabel = 'Programa'
      FieldName = 'ID_Programa'
    end
    object tblPermissoesUsuarioLer: TWideStringField
      FieldName = 'Ler'
      Size = 1
    end
    object tblPermissoesUsuarioIncluir: TWideStringField
      FieldName = 'Incluir'
      Size = 1
    end
    object tblPermissoesUsuarioAlterar: TWideStringField
      FieldName = 'Alterar'
      Size = 1
    end
    object tblPermissoesUsuarioExcluir: TWideStringField
      FieldName = 'Excluir'
      Size = 1
    end
  end
  object dtsPermissoesUsuario: TDataSource
    DataSet = tblPermissoesUsuario
    Left = 56
    Top = 160
  end
  object tblLogs: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblLogsBeforeOpen
    BeforeDelete = tblLogsBeforeDelete
    OnDeleteError = tblLogsDeleteError
    OnEditError = tblLogsEditError
    OnPostError = tblLogsPostError
    TableName = 'Logs'
    Left = 24
    Top = 208
    object tblLogsLocal: TWideStringField
      FieldName = 'Local'
      Size = 50
    end
    object tblLogsID_Usuario: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'ID_Usuario'
    end
    object tblLogsDt_Log: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'Dt_Log'
      EditMask = '!99/99/0000;1;_'
    end
    object tblLogsHr_Log: TDateTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Hr_Log'
      DisplayFormat = 'hh:mm:ss'
      EditMask = '!90:00:00;1;_'
    end
    object tblLogsAcao: TWideStringField
      DisplayLabel = 'A'#231#227'o'
      FieldName = 'Acao'
      Size = 50
    end
    object tblLogsAutorizado: TWideStringField
      FieldName = 'Autorizado'
      Size = 1
    end
    object tblLogsAntes: TMemoField
      DisplayLabel = '#Antes'
      FieldName = 'Antes'
      BlobType = ftMemo
    end
    object tblLogsDepois: TMemoField
      DisplayLabel = '#Depois'
      FieldName = 'Depois'
      BlobType = ftMemo
    end
  end
  object dtsLogs: TDataSource
    DataSet = tblLogs
    Left = 56
    Top = 208
  end
  object tblRelatorios: TADOTable
    Connection = bdDados
    BeforeOpen = tblRelatoriosBeforeOpen
    AfterInsert = tblRelatoriosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRelatoriosBeforePost
    AfterPost = tblRelatoriosAfterPost
    BeforeDelete = tblRelatoriosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Relatorios'
    Left = 112
    Top = 16
    object tblRelatoriosID_Relatorio: TWideStringField
      DisplayLabel = 'Relat'#243'rio'
      FieldName = 'ID_Relatorio'
      Size = 10
    end
    object tblRelatoriosNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblRelatoriosLayout: TWideStringField
      FieldName = 'Layout'
      Size = 200
    end
    object tblRelatoriosParticular: TWideStringField
      FieldName = 'Particular'
      Size = 1
    end
    object tblRelatoriosID_Usuario: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'ID_Usuario'
    end
    object tblRelatoriosID_Programa: TWideStringField
      DisplayLabel = 'Programa'
      FieldName = 'ID_Programa'
    end
    object tblRelatoriosGenerico: TWideStringField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'Generico'
      Size = 1
    end
    object tblRelatorioscNomePrograma: TStringField
      DisplayLabel = 'Nome Programa'
      FieldKind = fkLookup
      FieldName = 'cNomePrograma'
      LookupDataSet = tblProgramas
      LookupKeyFields = 'ID_Programa'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Programa'
      Size = 50
      Lookup = True
    end
    object tblRelatorioscNomeUsuario: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'cNomeUsuario'
      LookupDataSet = tblUsuarios
      LookupKeyFields = 'ID_Usuario'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Usuario'
      Size = 50
      Lookup = True
    end
  end
  object dtsRelatorios: TDataSource
    DataSet = tblRelatorios
    Left = 144
    Top = 16
  end
  object tblLocais: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblLocaisBeforeOpen
    AfterInsert = tblLocaisAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblLocaisBeforePost
    AfterPost = tblLocaisAfterPost
    BeforeDelete = tblLocaisBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Locais'
    Left = 112
    Top = 64
    object tblLocaisID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblLocaisNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblLocaisDeposito: TWideStringField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'Deposito'
      Size = 1
    end
    object tblLocaisCoord_X: TIntegerField
      DisplayLabel = 'Coordenda X'
      FieldName = 'Coord_X'
    end
    object tblLocaisCoord_Y: TIntegerField
      DisplayLabel = 'Coordenada Y'
      FieldName = 'Coord_Y'
    end
    object tblLocaisTempoMinimoParada: TBCDField
      DisplayLabel = 'Tempo M'#237'nimo Parada'
      FieldName = 'TempoMinimoParada'
      Precision = 19
    end
    object tblLocaisTempoMaximoParada: TBCDField
      DisplayLabel = 'Tempo M'#225'ximo Parada'
      FieldName = 'TempoMaximoParada'
      Precision = 19
    end
    object tblLocaisTempoMedioParada: TBCDField
      DisplayLabel = 'Tempo M'#233'dio Parada'
      FieldName = 'TempoMedioParada'
      Precision = 19
    end
  end
  object dtsLocais: TDataSource
    DataSet = tblLocais
    OnDataChange = dtsLocaisDataChange
    Left = 144
    Top = 64
  end
  object tblTiposCaminho: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblTiposCaminhoBeforeOpen
    AfterInsert = tblTiposCaminhoAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblTiposCaminhoBeforePost
    AfterPost = tblTiposCaminhoAfterPost
    BeforeDelete = tblTiposCaminhoBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'TiposCaminho'
    Left = 112
    Top = 112
    object tblTiposCaminhoID_TipoCaminho: TWideStringField
      DisplayLabel = 'Tipo Caminho'
      FieldName = 'ID_TipoCaminho'
      Size = 10
    end
    object tblTiposCaminhoNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblTiposCaminhoCor: TWideStringField
      FieldName = 'Cor'
      Size = 1
    end
    object tblTiposCaminhoLargura: TIntegerField
      FieldName = 'Largura'
    end
  end
  object dtsTiposCaminho: TDataSource
    DataSet = tblTiposCaminho
    Left = 144
    Top = 112
  end
  object tblLigacoes: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblLigacoesBeforeOpen
    AfterInsert = tblLigacoesAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblLigacoesBeforePost
    AfterPost = tblLigacoesAfterPost
    BeforeDelete = tblLigacoesBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Ligacoes'
    Left = 112
    Top = 160
    object tblLigacoesID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblLigacoesID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblLigacoesID_TipoCaminho: TWideStringField
      DisplayLabel = 'Tipo Caminho'
      FieldName = 'ID_TipoCaminho'
      Size = 10
    end
    object tblLigacoesSentido: TWideStringField
      FieldName = 'Sentido'
      Size = 1
    end
    object tblLigacoescNomeOrigem: TStringField
      DisplayLabel = 'Nome Local Origem'
      FieldKind = fkLookup
      FieldName = 'cNomeOrigem'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_LocalOrigem'
      Size = 50
      Lookup = True
    end
    object tblLigacoescNomeDestino: TStringField
      DisplayLabel = 'Nome Local Destino'
      FieldKind = fkLookup
      FieldName = 'cNomeDestino'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_LocalDestino'
      Size = 50
      Lookup = True
    end
    object tblLigacoescNomeTipoCaminho: TStringField
      DisplayLabel = 'Nome Tipo Caminho'
      FieldKind = fkLookup
      FieldName = 'cNomeTipoCaminho'
      LookupDataSet = tblTiposCaminho
      LookupKeyFields = 'ID_TipoCaminho'
      LookupResultField = 'Nome'
      KeyFields = 'ID_TipoCaminho'
      Size = 50
      Lookup = True
    end
    object tblLigacoesDistancia: TBCDField
      DisplayLabel = 'Dist'#226'ncia'
      FieldName = 'Distancia'
      Precision = 19
    end
    object tblLigacoesVelocidadeMedia: TBCDField
      DisplayLabel = 'Velocidade M'#233'dia'
      FieldName = 'VelocidadeMedia'
      Precision = 19
    end
    object tblLigacoesVelocidadeMinima: TBCDField
      DisplayLabel = 'Velocidade M'#237'nima'
      FieldName = 'VelocidadeMinima'
      Precision = 19
    end
    object tblLigacoesVelocidadeMaxima: TBCDField
      DisplayLabel = 'Velocidade M'#225'xima'
      FieldName = 'VelocidadeMaxima'
      Precision = 19
    end
    object tblLigacoesCustoMedio: TBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'CustoMedio'
      Precision = 19
    end
    object tblLigacoesCustoMinimo: TBCDField
      DisplayLabel = 'Custo M'#237'nimo'
      FieldName = 'CustoMinimo'
      Precision = 19
    end
    object tblLigacoesCustoMaximo: TBCDField
      DisplayLabel = 'Custo M'#225'ximo'
      FieldName = 'CustoMaximo'
      Precision = 19
    end
  end
  object dtsLigacoes: TDataSource
    DataSet = tblLigacoes
    OnDataChange = dtsLigacoesDataChange
    Left = 144
    Top = 160
  end
  object tblEntregas: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblEntregasBeforeOpen
    AfterInsert = tblEntregasAfterInsert
    BeforeEdit = tblEntregasBeforeEdit
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblEntregasBeforePost
    AfterPost = tblEntregasAfterPost
    BeforeDelete = tblEntregasBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Entregas'
    Left = 112
    Top = 208
    object tblEntregasID_Entrega: TWideStringField
      DisplayLabel = 'ID'
      FieldName = 'ID_Entrega'
      Size = 10
    end
    object tblEntregasID_LocalOrigem: TWideStringField
      DisplayLabel = 'Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblEntregasID_LocalDestino: TWideStringField
      DisplayLabel = 'Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblEntregasID_Carga: TWideStringField
      FieldName = 'ID_Carga'
      Size = 10
    end
    object tblEntregasPeso: TBCDField
      FieldName = 'Peso'
      Precision = 19
    end
    object tblEntregasSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
    object tblEntregasDt_Solicitacao: TDateTimeField
      DisplayLabel = 'Solicita'#231#227'o'
      FieldName = 'Dt_Solicitacao'
      EditMask = '!99/99/0000;1;_'
    end
    object tblEntregasSituacao: TWideStringField
      DisplayLabel = 'Sit.'
      FieldName = 'Situacao'
      Size = 1
    end
    object tblEntregasComposicao: TMemoField
      DisplayLabel = '#Composi'#231#227'o'
      FieldName = 'Composicao'
      BlobType = ftMemo
    end
    object tblEntregasDestinatario: TMemoField
      DisplayLabel = '#Destinat'#225'rio'
      FieldName = 'Destinatario'
      BlobType = ftMemo
    end
    object tblEntregascNomeOrigem: TStringField
      DisplayLabel = 'Nome da Origem'
      FieldKind = fkLookup
      FieldName = 'cNomeOrigem'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_LocalOrigem'
      Size = 50
      Lookup = True
    end
    object tblEntregascNomeDestino: TStringField
      DisplayLabel = 'Nome do Destino'
      FieldKind = fkLookup
      FieldName = 'cNomeDestino'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_LocalDestino'
      Size = 50
      Lookup = True
    end
  end
  object dtsEntregas: TDataSource
    DataSet = tblEntregas
    Left = 144
    Top = 208
  end
  object tblVeiculos: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblVeiculosBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblVeiculosBeforePost
    AfterPost = tblVeiculosAfterPost
    BeforeDelete = tblVeiculosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Veiculos'
    Left = 200
    Top = 16
    object tblVeiculosID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblVeiculosNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblVeiculosPesoMaximo: TBCDField
      DisplayLabel = 'Peso'
      FieldName = 'PesoMaximo'
      Precision = 19
    end
    object tblVeiculosTempoCiclo: TBCDField
      DisplayLabel = 'Tempo Ciclo'
      FieldName = 'TempoCiclo'
      Precision = 19
    end
    object tblVeiculosTempoMinimoParada: TBCDField
      DisplayLabel = 'Tempo M'#237'nimo Parada'
      FieldName = 'TempoMinimoParada'
      Precision = 19
    end
    object tblVeiculosTempoMaximoParada: TBCDField
      DisplayLabel = 'Tempo M'#225'ximo Parada'
      FieldName = 'TempoMaximoParada'
      Precision = 19
    end
    object tblVeiculosTempoMedioParada: TBCDField
      DisplayLabel = 'Tempo M'#233'dio Parada'
      FieldName = 'TempoMedioParada'
      Precision = 19
    end
    object tblVeiculosVelocidadeMedia: TBCDField
      DisplayLabel = 'Velocidade M'#233'dia'
      FieldName = 'VelocidadeMedia'
      Precision = 19
    end
    object tblVeiculosVelocidadeMinima: TBCDField
      DisplayLabel = 'Velocidade M'#237'nima'
      FieldName = 'VelocidadeMinima'
      Precision = 19
    end
    object tblVeiculosVelocidadeMaxima: TBCDField
      DisplayLabel = 'Velocidade M'#225'xima'
      FieldName = 'VelocidadeMaxima'
      Precision = 19
    end
    object tblVeiculosCustoMedio: TBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'CustoMedio'
      Precision = 19
    end
    object tblVeiculosCustoMinimo: TBCDField
      DisplayLabel = 'Custo M'#237'nimo'
      FieldName = 'CustoMinimo'
      Precision = 19
    end
    object tblVeiculosCustoMaximo: TBCDField
      DisplayLabel = 'Custo M'#225'ximo'
      FieldName = 'CustoMaximo'
      Precision = 19
    end
  end
  object dtsVeiculos: TDataSource
    DataSet = tblVeiculos
    Left = 232
    Top = 16
  end
  object tblGanhos: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblGanhosBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblGanhosBeforePost
    AfterPost = tblGanhosAfterPost
    BeforeDelete = tblGanhosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Ganhos'
    Left = 200
    Top = 64
    object tblGanhosID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblGanhosID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblGanhoscNomeOrigem: TStringField
      DisplayLabel = 'Nome Origem'
      FieldKind = fkLookup
      FieldName = 'cNomeOrigem'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_LocalOrigem'
      Size = 50
      Lookup = True
    end
    object tblGanhoscNomeDestino: TStringField
      DisplayLabel = 'Nome Destino'
      FieldKind = fkLookup
      FieldName = 'cNomeDestino'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_LocalDestino'
      Size = 50
      Lookup = True
    end
    object tblGanhosID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblGanhoscNomeVeiculo: TStringField
      DisplayLabel = 'Nome Ve'#237'culo'
      FieldKind = fkLookup
      FieldName = 'cNomeVeiculo'
      LookupDataSet = tblVeiculos
      LookupKeyFields = 'ID_Veiculo'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Veiculo'
      Size = 50
      Lookup = True
    end
    object tblGanhosValorCustoMinimo: TBCDField
      DisplayLabel = 'Custo M'#237'nimo'
      FieldName = 'ValorCustoMinimo'
      Precision = 19
    end
    object tblGanhosValorCustoMaximo: TBCDField
      DisplayLabel = 'Custo M'#225'ximo'
      FieldName = 'ValorCustoMaximo'
      Precision = 19
    end
    object tblGanhosValorCustoMedio: TBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'ValorCustoMedio'
      Precision = 19
    end
    object tblGanhosValorVelocidadeMinima: TBCDField
      DisplayLabel = 'Velocidade M'#237'nima'
      FieldName = 'ValorVelocidadeMinima'
      Precision = 19
    end
    object tblGanhosValorVelocidadeMaxima: TBCDField
      DisplayLabel = 'Velocidade M'#225'xima'
      FieldName = 'ValorVelocidadeMaxima'
      Precision = 19
    end
    object tblGanhosValorVelocidadeMedia: TBCDField
      DisplayLabel = 'Velocidade M'#233'dia'
      FieldName = 'ValorVelocidadeMedia'
      Precision = 19
    end
    object tblGanhosValorDistancia: TBCDField
      DisplayLabel = 'Dist'#226'ncia'
      FieldName = 'ValorDistancia'
      Precision = 19
    end
  end
  object dtsGanhos: TDataSource
    DataSet = tblGanhos
    OnDataChange = dtsGanhosDataChange
    Left = 232
    Top = 64
  end
  object tblRotasGanhoDistancia: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblRotasGanhoDistanciaBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoDistanciaBeforePost
    AfterPost = tblRotasGanhoDistanciaAfterPost
    BeforeDelete = tblRotasGanhoDistanciaBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoDistancia'
    Left = 200
    Top = 112
    object tblRotasGanhoDistanciaID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoDistanciaID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoDistanciaID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoDistanciaID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoDistanciaSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoDistancia: TDataSource
    DataSet = tblRotasGanhoDistancia
    Left = 232
    Top = 112
  end
  object tblRotasGanhoCustoMinimo: TADOTable
    Connection = bdDados
    BeforeOpen = tblRotasGanhoCustoMinimoBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoCustoMinimoBeforePost
    AfterPost = tblRotasGanhoCustoMinimoAfterPost
    BeforeDelete = tblRotasGanhoCustoMinimoBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoCustoMinimo'
    Left = 24
    Top = 264
    object tblRotasGanhoCustoMinimoID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoCustoMinimoID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoCustoMinimoID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoCustoMinimoID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoCustoMinimoSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoCustoMinimo: TDataSource
    DataSet = tblRotasGanhoCustoMinimo
    Left = 56
    Top = 264
  end
  object tblRotasGanhoVelocidadeMinima: TADOTable
    Connection = bdDados
    BeforeOpen = tblRotasGanhoVelocidadeMinimaBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoVelocidadeMinimaBeforePost
    AfterPost = tblRotasGanhoVelocidadeMinimaAfterPost
    BeforeDelete = tblRotasGanhoVelocidadeMinimaBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoVelocidadeMinima'
    Left = 24
    Top = 312
    object tblRotasGanhoVelocidadeMinimaID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMinimaID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMinimaID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMinimaID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMinimaSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoVelocidadeMinima: TDataSource
    DataSet = tblRotasGanhoVelocidadeMinima
    Left = 56
    Top = 312
  end
  object tblRotasGanhoCustoMaximo: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblRotasGanhoCustoMaximoBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoCustoMaximoBeforePost
    AfterPost = tblRotasGanhoCustoMaximoAfterPost
    BeforeDelete = tblRotasGanhoCustoMaximoBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoCustoMaximo'
    Left = 112
    Top = 264
    object tblRotasGanhoCustoMaximoID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoCustoMaximoID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoCustoMaximoID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoCustoMaximoID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoCustoMaximoSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoCustoMaximo: TDataSource
    DataSet = tblRotasGanhoCustoMaximo
    Left = 144
    Top = 264
  end
  object tblRotasGanhoCustoMedio: TADOTable
    Connection = bdDados
    BeforeOpen = tblRotasGanhoCustoMedioBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoCustoMedioBeforePost
    AfterPost = tblRotasGanhoCustoMedioAfterPost
    BeforeDelete = tblRotasGanhoCustoMedioBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoCustoMedio'
    Left = 200
    Top = 264
    object tblRotasGanhoCustoMedioID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoCustoMedioID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoCustoMedioID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoCustoMedioID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoCustoMedioSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoCustoMedio: TDataSource
    DataSet = tblRotasGanhoCustoMedio
    Left = 232
    Top = 264
  end
  object tblRotasGanhoVelocidadeMaxima: TADOTable
    Connection = bdDados
    BeforeOpen = tblRotasGanhoVelocidadeMaximaBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoVelocidadeMaximaBeforePost
    AfterPost = tblRotasGanhoVelocidadeMaximaAfterPost
    BeforeDelete = tblRotasGanhoVelocidadeMaximaBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoVelocidadeMaxima'
    Left = 112
    Top = 312
    object tblRotasGanhoVelocidadeMaximaID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMaximaID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMaximaID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMaximaID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMaximaSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoVelocidadeMaxima: TDataSource
    DataSet = tblRotasGanhoVelocidadeMaxima
    Left = 144
    Top = 312
  end
  object tblRotasGanhoVelocidadeMedia: TADOTable
    Connection = bdDados
    BeforeOpen = tblRotasGanhoVelocidadeMediaBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblRotasGanhoVelocidadeMediaBeforePost
    AfterPost = tblRotasGanhoVelocidadeMediaAfterPost
    BeforeDelete = tblRotasGanhoVelocidadeMediaBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    IndexFieldNames = 'Sequencia'
    TableName = 'RotasGanhoVelocidadeMedia'
    Left = 200
    Top = 312
    object tblRotasGanhoVelocidadeMediaID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMediaID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMediaID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMediaID_Local: TWideStringField
      DisplayLabel = 'Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblRotasGanhoVelocidadeMediaSequencia: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia'
      FieldName = 'Sequencia'
    end
  end
  object dtsRotasGanhoVelocidadeMedia: TDataSource
    DataSet = tblRotasGanhoVelocidadeMedia
    Left = 232
    Top = 312
  end
  object tblCargas: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblCargasBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblCargasBeforePost
    AfterPost = tblCargasAfterPost
    BeforeDelete = tblCargasBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Cargas'
    Left = 200
    Top = 160
    object tblCargasID_Carga: TWideStringField
      DisplayLabel = 'ID Carga'
      FieldName = 'ID_Carga'
      Size = 10
    end
    object tblCargasNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblCargasID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblCargasID_Deposito: TWideStringField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'ID_Deposito'
      Size = 10
    end
    object tblCargascNomeVeiculo: TStringField
      DisplayLabel = 'Nome Ve'#237'culo'
      FieldKind = fkLookup
      FieldName = 'cNomeVeiculo'
      LookupDataSet = tblVeiculos
      LookupKeyFields = 'ID_Veiculo'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Veiculo'
      Size = 50
      Lookup = True
    end
    object tblCargascNomeDeposito: TStringField
      DisplayLabel = 'Nome Dep'#243'sito'
      FieldKind = fkLookup
      FieldName = 'cNomeDeposito'
      LookupDataSet = tblLocais
      LookupKeyFields = 'ID_Local'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Deposito'
      Size = 50
      Lookup = True
    end
    object tblCargasDt_Carga: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'Dt_Carga'
      EditMask = '!99/99/0000;1;_'
    end
    object tblCargasStatus: TWideStringField
      FieldName = 'Status'
      Size = 1
    end
    object tblCargasTempoCiclo: TBCDField
      DisplayLabel = 'Tempo Ciclo'
      FieldName = 'TempoCiclo'
      Precision = 19
    end
    object tblCargasPeso: TBCDField
      FieldName = 'Peso'
      Precision = 19
    end
    object tblCargasCalculo: TWideStringField
      DisplayLabel = 'C'#225'lculo'
      FieldName = 'Calculo'
      Size = 50
    end
    object tblCargasValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object tblCargasVeiculo_Sistema: TWideStringField
      DisplayLabel = 'Ve'#237'culo Gen'#233'rico'
      FieldName = 'Veiculo_Sistema'
      Size = 1
    end
  end
  object dtsCargas: TDataSource
    DataSet = tblCargas
    OnDataChange = dtsCargasDataChange
    Left = 232
    Top = 160
  end
  object tblOtimizacoes: TADOTable
    Connection = bdDados
    BeforeOpen = tblOtimizacoesBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblOtimizacoesBeforePost
    AfterPost = tblOtimizacoesAfterPost
    BeforeDelete = tblOtimizacoesBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Otimizacoes'
    Left = 200
    Top = 208
    object tblOtimizacoesID_LocalOrigem: TWideStringField
      DisplayLabel = 'ID Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblOtimizacoesID_Veiculo: TWideStringField
      DisplayLabel = 'ID Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblOtimizacoesID_Local_1: TWideStringField
      DisplayLabel = 'ID Local 1'
      FieldName = 'ID_Local_1'
      Size = 10
    end
    object tblOtimizacoesID_Local_2: TWideStringField
      DisplayLabel = 'ID Local 2'
      FieldName = 'ID_Local_2'
      Size = 10
    end
    object tblOtimizacoesValorCustoMinimo: TBCDField
      DisplayLabel = 'Custo M'#237'nimo'
      FieldName = 'ValorCustoMinimo'
      Precision = 19
    end
    object tblOtimizacoesValorCustoMaximo: TBCDField
      DisplayLabel = 'Custo M'#225'ximo'
      FieldName = 'ValorCustoMaximo'
      Precision = 19
    end
    object tblOtimizacoesValorCustoMedio: TBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'ValorCustoMedio'
      Precision = 19
    end
    object tblOtimizacoesValorVelocidadeMinima: TBCDField
      DisplayLabel = 'Vel. M'#237'nima'
      FieldName = 'ValorVelocidadeMinima'
      Precision = 19
    end
    object tblOtimizacoesValorVelocidadeMaxima: TBCDField
      DisplayLabel = 'Vel. M'#225'xima'
      FieldName = 'ValorVelocidadeMaxima'
      Precision = 19
    end
    object tblOtimizacoesValorVelocidadeMedia: TBCDField
      DisplayLabel = 'Vel. M'#233'dia'
      FieldName = 'ValorVelocidadeMedia'
      Precision = 19
    end
    object tblOtimizacoesValorDistancia: TBCDField
      DisplayLabel = 'Dist'#226'ncia'
      FieldName = 'ValorDistancia'
      Precision = 19
    end
  end
  object dtsOtimizacoes: TDataSource
    DataSet = tblOtimizacoes
    Left = 232
    Top = 208
  end
  object tblParadasVeiculo: TADOTable
    Connection = bdDados
    BeforeOpen = tblParadasVeiculoBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblParadasVeiculoBeforePost
    AfterPost = tblParadasVeiculoAfterPost
    BeforeDelete = tblParadasVeiculoBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'ParadasVeiculo'
    Left = 288
    Top = 16
    object tblParadasVeiculoID_Local: TWideStringField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_Local'
      Size = 10
    end
    object tblParadasVeiculoID_Veiculo: TWideStringField
      DisplayLabel = 'ID Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblParadasVeiculocNomeVeiculo: TStringField
      DisplayLabel = 'Nome Ve'#237'culo'
      FieldKind = fkLookup
      FieldName = 'cNomeVeiculo'
      LookupDataSet = tblVeiculos
      LookupKeyFields = 'ID_Veiculo'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Veiculo'
      Size = 50
      Lookup = True
    end
    object tblParadasVeiculoTempoMinimoParada: TBCDField
      DisplayLabel = 'Tempo M'#237'nimo'
      FieldName = 'TempoMinimoParada'
      Precision = 19
    end
    object tblParadasVeiculoTempoMaximoParada: TBCDField
      DisplayLabel = 'Tempo M'#225'ximo'
      FieldName = 'TempoMaximoParada'
      Precision = 19
    end
    object tblParadasVeiculoTempoMedioParada: TBCDField
      DisplayLabel = 'Tempo M'#233'dio'
      FieldName = 'TempoMedioParada'
      Precision = 19
    end
  end
  object dtsParadasVeiculo: TDataSource
    DataSet = tblParadasVeiculo
    Left = 320
    Top = 16
  end
  object tblLigacoesVeiculo: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblLigacoesVeiculoBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblLigacoesVeiculoBeforePost
    AfterPost = tblLigacoesVeiculoAfterPost
    BeforeDelete = tblLigacoesVeiculoBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'LigacoesVeiculo'
    Left = 288
    Top = 64
    object tblLigacoesVeiculoID_LocalOrigem: TWideStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblLigacoesVeiculoID_LocalDestino: TWideStringField
      DisplayLabel = 'Local Destino'
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblLigacoesVeiculoID_Veiculo: TWideStringField
      DisplayLabel = 'Veiculo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblLigacoesVeiculoSentido: TWideStringField
      FieldName = 'Sentido'
      Size = 1
    end
    object tblLigacoesVeiculocNomeVeiculo: TStringField
      DisplayLabel = 'Nome Ve'#237'culo'
      FieldKind = fkLookup
      FieldName = 'cNomeVeiculo'
      LookupDataSet = tblVeiculos
      LookupKeyFields = 'ID_Veiculo'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Veiculo'
      Size = 50
      Lookup = True
    end
    object tblLigacoesVeiculoVelocidadeMedia: TBCDField
      DisplayLabel = 'Vel. M'#233'dia'
      FieldName = 'VelocidadeMedia'
      Precision = 19
    end
    object tblLigacoesVeiculoVelocidadeMinima: TBCDField
      DisplayLabel = 'Vel. M'#237'nima'
      FieldName = 'VelocidadeMinima'
      Precision = 19
    end
    object tblLigacoesVeiculoVelocidadeMaxima: TBCDField
      DisplayLabel = 'Vel. M'#225'xima'
      FieldName = 'VelocidadeMaxima'
      Precision = 19
    end
    object tblLigacoesVeiculoCustoMedio: TBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'CustoMedio'
      Precision = 19
    end
    object tblLigacoesVeiculoCustoMinimo: TBCDField
      DisplayLabel = 'Custo M'#237'nimo'
      FieldName = 'CustoMinimo'
      Precision = 19
    end
    object tblLigacoesVeiculoCustoMaximo: TBCDField
      DisplayLabel = 'Custo M'#225'ximo'
      FieldName = 'CustoMaximo'
      Precision = 19
    end
  end
  object dtsLigacoesVeiculo: TDataSource
    DataSet = tblLigacoesVeiculo
    Left = 320
    Top = 64
  end
  object tblAux_Entregas: TADOTable
    Connection = bdDados
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblAux_EntregasBeforePost
    AfterPost = tblAux_EntregasAfterPost
    BeforeDelete = tblAux_EntregasBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasEditError
    OnPostError = tblProgramasPostError
    TableName = 'Aux_Entregas'
    Left = 288
    Top = 112
    object tblAux_EntregasID_LocalDestino: TWideStringField
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblAux_EntregasPeso: TBCDField
      FieldName = 'Peso'
      Precision = 19
    end
  end
  object dtsAux_Entregas: TDataSource
    DataSet = tblAux_Entregas
    Left = 320
    Top = 112
  end
  object tblAux_Otimizacoes: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblAux_OtimizacoesBeforePost
    AfterPost = tblAux_OtimizacoesAfterPost
    BeforeDelete = tblAux_OtimizacoesBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasDeleteError
    OnPostError = tblProgramasPostError
    TableName = 'Aux_Otimizacoes'
    Left = 288
    Top = 160
    object tblAux_OtimizacoesID_Local_1: TWideStringField
      FieldName = 'ID_Local_1'
      Size = 10
    end
    object tblAux_OtimizacoesID_Local_2: TWideStringField
      FieldName = 'ID_Local_2'
      Size = 10
    end
    object tblAux_OtimizacoesValorOtimizacao: TBCDField
      FieldName = 'ValorOtimizacao'
      Precision = 19
    end
    object tblAux_OtimizacoesO_ID_LocalOrigem: TWideStringField
      FieldName = 'O_ID_LocalOrigem'
      Size = 10
    end
    object tblAux_OtimizacoesO_ID_Veiculo: TWideStringField
      FieldName = 'O_ID_Veiculo'
      Size = 10
    end
    object tblAux_OtimizacoesO_ID_Local_1: TWideStringField
      FieldName = 'O_ID_Local_1'
      Size = 10
    end
    object tblAux_OtimizacoesO_ID_Local_2: TWideStringField
      FieldName = 'O_ID_Local_2'
      Size = 10
    end
  end
  object dtsAux_Otimizacoes: TDataSource
    DataSet = tblAux_Otimizacoes
    Left = 320
    Top = 160
  end
  object tblCargasPontos: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    AfterInsert = tblVeiculosAfterInsert
    BeforeEdit = tblCargasPontosBeforeEdit
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblCargasPontosBeforePost
    AfterPost = tblCargasPontosAfterPost
    BeforeDelete = tblCargasPontosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasDeleteError
    OnPostError = tblProgramasPostError
    TableName = 'CargasPontos'
    Left = 288
    Top = 208
    object tblCargasPontosID_Carga: TWideStringField
      FieldName = 'ID_Carga'
      Size = 10
    end
    object tblCargasPontosID_Entrega: TWideStringField
      FieldName = 'ID_Entrega'
      Size = 10
    end
    object tblCargasPontosID_LocalOrigem: TWideStringField
      FieldName = 'ID_LocalOrigem'
      Size = 10
    end
    object tblCargasPontosID_LocalDestino: TWideStringField
      FieldName = 'ID_LocalDestino'
      Size = 10
    end
    object tblCargasPontosSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
    object tblCargasPontosTempo: TBCDField
      FieldName = 'Tempo'
      Precision = 19
    end
    object tblCargasPontosCusto: TBCDField
      FieldName = 'Custo'
      Precision = 19
    end
    object tblCargasPontosParadaOrigem: TBCDField
      DisplayLabel = 'Parada Origem'
      FieldName = 'ParadaOrigem'
      Precision = 19
    end
    object tblCargasPontosParadaDestino: TBCDField
      DisplayLabel = 'Parada Destino'
      FieldName = 'ParadaDestino'
      Precision = 19
    end
    object tblCargasPontosDistancia: TBCDField
      DisplayLabel = 'Dist'#226'ncia'
      FieldName = 'Distancia'
      Precision = 19
    end
  end
  object dtsCargasPontos: TDataSource
    DataSet = tblCargasPontos
    Left = 320
    Top = 208
  end
  object tblPneus: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblPneusBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblPneusBeforePost
    AfterPost = tblPneusAfterPost
    BeforeDelete = tblPneusBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasDeleteError
    OnPostError = tblProgramasPostError
    TableName = 'Pneus'
    Left = 288
    Top = 264
    object tblPneusID_Pneu: TWideStringField
      DisplayLabel = 'Pneu'
      FieldName = 'ID_Pneu'
      Size = 10
    end
    object tblPneusObservacoes: TMemoField
      DisplayLabel = '#Observa'#231#245'es'
      FieldName = 'Observacoes'
      BlobType = ftMemo
    end
    object tblPneusDt_Inicio: TDateTimeField
      DisplayLabel = 'Data Inicio'
      FieldName = 'Dt_Inicio'
      EditMask = '!99/99/0000;1;_'
    end
    object tblPneusDt_Termino: TDateTimeField
      DisplayLabel = 'Data T'#233'rmino'
      FieldName = 'Dt_Termino'
      EditMask = '!99/99/0000;1;_'
    end
    object tblPneusCusto_Inicial: TBCDField
      DisplayLabel = 'Custo Inicial'
      FieldName = 'Custo_Inicial'
      currency = True
      Precision = 19
    end
    object tblPneusCusto_Atual: TBCDField
      DisplayLabel = 'Custo Atual'
      FieldName = 'Custo_Atual'
      currency = True
      Precision = 19
    end
    object tblPneusKM_Inicial: TIntegerField
      DisplayLabel = 'KM Inicial'
      FieldName = 'KM_Inicial'
    end
    object tblPneusKM_Atual: TIntegerField
      DisplayLabel = 'KM Atual'
      FieldName = 'KM_Atual'
    end
    object tblPneusID_Veiculo: TWideStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'ID_Veiculo'
      Size = 10
    end
    object tblPneusID_Deposito: TWideStringField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'ID_Deposito'
      Size = 10
    end
    object tblPneusID_Fornecedor: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'ID_Fornecedor'
      Size = 10
    end
  end
  object dtsPneus: TDataSource
    DataSet = tblPneus
    Left = 320
    Top = 264
  end
  object tblDepositos: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblDepositosBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblDepositosBeforePost
    AfterPost = tblDepositosAfterPost
    BeforeDelete = tblDepositosBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasDeleteError
    OnPostError = tblProgramasPostError
    TableName = 'Depositos'
    Left = 288
    Top = 312
    object tblDepositosID_Deposito: TWideStringField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'ID_Deposito'
      Size = 10
    end
    object tblDepositosNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblDepositosObservacoes: TMemoField
      DisplayLabel = '#Observacoes'
      FieldName = 'Observacoes'
      BlobType = ftMemo
    end
  end
  object dtsDepositos: TDataSource
    DataSet = tblDepositos
    Left = 320
    Top = 312
  end
  object tblFornecedores: TADOTable
    Connection = bdDados
    CursorType = ctStatic
    BeforeOpen = tblFornecedoresBeforeOpen
    AfterInsert = tblVeiculosAfterInsert
    AfterEdit = tblVeiculosAfterEdit
    BeforePost = tblFornecedoresBeforePost
    AfterPost = tblFornecedoresAfterPost
    BeforeDelete = tblFornecedoresBeforeDelete
    OnDeleteError = tblProgramasDeleteError
    OnEditError = tblProgramasDeleteError
    OnPostError = tblProgramasPostError
    TableName = 'Fornecedores'
    Left = 384
    Top = 16
    object tblFornecedoresID_Fornecedor: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'ID_Fornecedor'
      Size = 10
    end
    object tblFornecedoresNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tblFornecedoresObservacoes: TMemoField
      DisplayLabel = '#Observacoes'
      FieldName = 'Observacoes'
      BlobType = ftMemo
    end
  end
  object dtsFornecedores: TDataSource
    DataSet = tblFornecedores
    Left = 416
    Top = 16
  end
end
