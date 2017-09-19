object frmWizardCargas: TfrmWizardCargas
  Left = 17
  Top = 25
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmWizardCargas'
  ClientHeight = 476
  ClientWidth = 707
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    Color = 13995776
    TabOrder = 0
    object lblTitulo2: TLabel
      Left = 8
      Top = 7
      Width = 95
      Height = 37
      Caption = 'Router'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTitulo1: TLabel
      Left = 10
      Top = 9
      Width = 95
      Height = 37
      Caption = 'Router'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 55
    Width = 707
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    Color = 16764573
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 435
    Width = 707
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 14805739
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 610
      Top = 3
      Width = 95
      Height = 36
      Hint = 'Clique aqui para sair.'
      Caption = 'Fechar'
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
        00000000909790909790909790FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000090C8FF00000090C8FF90C8
        FF90C8FF00000000000090979090979090979090979090979090979090979090
        9790FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000090C8FF00000090C8
        FF90C8FF90C8FF00000090979090979090979090979090979090979090979090
        9790909790909790909790FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000090C8FF0000
        0090C8FF00000000000090979090979090979090979090979090979090979090
        9790909790909790909790FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        000000002F6790000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000006097CF0000
        006097CF6097CF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000006097CF0000
        006097CF6097CF2F6790000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000006097CF6097CF0000
        006097CF6097CF2F6790000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000006097CF6097CF0000
        006097CF2F67902F6790000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002F67906097CF0000
        006097CFFFFFFFFFFFFF00000090C8FF90C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF2F67906097CF6097
        CF6097CFFFFFFFFFFFFF00000090C8FF90C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF2F67906097
        CF6097CFFFFFFF2F6790000000000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF2F67906097
        CF2F67902F67902F679000000060C8FF60C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002F67902F67902F67
        902F679000000000000000000060C8FF60C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        002F679000000000676000000060C8FF60C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000FFFFFF00000060C8FF60C8FF60C8
        FF00000060C8FF00676000000060C8FF60C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000090C8FF90C8FF00000000000000000060C8FF60C8FF60C8
        FF00000060C8FF00676000000060C8FF60C8FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000090C8FF00000000000060C8FF0000006097CF60C8FF60C8
        FF60C8FF60C8FF60C8FF60C8FF00000060C8FF000000FFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFF60C8FF0000000000006097CF60C8FF60C8
        FF60C8FF60C8FF60C8FFFFFFFFFFFFFF60C8FF000000FFFFFFFFFFFF00000060
        67FF6067FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000060C8FF60C8FF60C8FF0000000000000000000000
        00FFFFFFFFFFFFFFFFFF60C8FF60C8FF60C8FF000000FFFFFF0000009097FF90
        97FF6067FF6067FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000000060C8FFFFFFFF00676060C8FFFFFFFFFFFF
        FF00000000000060C8FF60C8FF60C8FF000000000000FFFFFF0000009097FF90
        97FF9097FF6067FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000060C8FF60C8FFFFFFFFFFFFFF5050505050
        50505050505050505050505050000000FFFFFFFFFFFFFFFFFF0000009097FF60
        67FF9097FF6067FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000060C8FF60C8FF60C8FF5050500000000000
        00000000000000505050000000000000000000000000FFFFFF0000006067FF90
        97FF9097FF6067FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000060C8FF0000000000002F67902F67
        902F67902F6790000000000000FFFFFFFFFFFFFFFFFF0000000000006067FF60
        67FF9097FF9097FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000002F67906097CF90C8
        FF90C8FF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F201F5050506097CF2F67
        9090C8FF000000000000000000FFFFFFFFFFFFFFFFFF0000000000009097FF00
        00009097FF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000005050506097CF90C8
        FF505050000000000000000000FFFFFFFFFFFF0000000000009097FF00000000
        00009097FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F201F0000000000000000
        00505050000000000000505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5050501F201F0000000000
        0000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5050500000000000
        1F000000505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 72
    Width = 707
    Height = 363
    ActivePage = TabSheet1
    Align = alClient
    Style = tsButtons
    TabOrder = 3
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Locais de Origem'
      object SpeedButton2: TSpeedButton
        Left = 320
        Top = 63
        Width = 57
        Height = 41
        Hint = 'Adicionar um item.'
        Caption = '>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 320
        Top = 111
        Width = 57
        Height = 41
        Hint = 'Adicionar todos os itens.'
        Caption = '>>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 320
        Top = 159
        Width = 57
        Height = 41
        Hint = 'Remover um item.'
        Caption = '<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 320
        Top = 207
        Width = 57
        Height = 41
        Hint = 'Remover todos os itens.'
        Caption = '<<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton5Click
      end
      object lstOrigem: TListBox
        Left = 4
        Top = 5
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SpeedButton2Click
      end
      object lstOrigemSel: TListBox
        Left = 391
        Top = 4
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 1
        OnDblClick = SpeedButton4Click
      end
      object priOrigem: TListBox
        Left = 12
        Top = 75
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
      object priOrigemSel: TListBox
        Left = 396
        Top = 75
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Locais de Destino'
      ImageIndex = 3
      object SpeedButton6: TSpeedButton
        Left = 320
        Top = 63
        Width = 57
        Height = 41
        Hint = 'Adicionar um item.'
        Caption = '>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton6Click
      end
      object SpeedButton7: TSpeedButton
        Left = 320
        Top = 111
        Width = 57
        Height = 41
        Hint = 'Adicionar todos os itens.'
        Caption = '>>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton7Click
      end
      object SpeedButton8: TSpeedButton
        Left = 320
        Top = 159
        Width = 57
        Height = 41
        Hint = 'Remover um item.'
        Caption = '<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton8Click
      end
      object SpeedButton9: TSpeedButton
        Left = 320
        Top = 207
        Width = 57
        Height = 41
        Hint = 'Remover todos os itens.'
        Caption = '<<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton9Click
      end
      object lstDestino: TListBox
        Left = 4
        Top = 5
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SpeedButton6Click
      end
      object priDestino: TListBox
        Left = 20
        Top = 123
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object lstDestinoSel: TListBox
        Left = 391
        Top = 4
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 2
        OnDblClick = SpeedButton8Click
      end
      object priDestinoSel: TListBox
        Left = 404
        Top = 123
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ve'#237'culos'
      ImageIndex = 1
      object SpeedButton10: TSpeedButton
        Left = 320
        Top = 63
        Width = 57
        Height = 41
        Hint = 'Adicionar um item.'
        Caption = '>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton10Click
      end
      object SpeedButton11: TSpeedButton
        Left = 320
        Top = 111
        Width = 57
        Height = 41
        Hint = 'Adicionar todos os itens.'
        Caption = '>>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton11Click
      end
      object SpeedButton12: TSpeedButton
        Left = 320
        Top = 159
        Width = 57
        Height = 41
        Hint = 'Remover um item.'
        Caption = '<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton12Click
      end
      object SpeedButton13: TSpeedButton
        Left = 320
        Top = 207
        Width = 57
        Height = 41
        Hint = 'Remover todos os itens.'
        Caption = '<<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton13Click
      end
      object lstVeiculos: TListBox
        Left = 4
        Top = 5
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SpeedButton10Click
      end
      object priVeiculos: TListBox
        Left = 12
        Top = 83
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object lstVeiculosSel: TListBox
        Left = 391
        Top = 4
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 2
        OnDblClick = SpeedButton12Click
      end
      object priVeiculosSel: TListBox
        Left = 396
        Top = 83
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Entregas'
      ImageIndex = 2
      object SpeedButton14: TSpeedButton
        Left = 320
        Top = 63
        Width = 57
        Height = 41
        Hint = 'Adicionar um item.'
        Caption = '>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton14Click
      end
      object SpeedButton15: TSpeedButton
        Left = 320
        Top = 111
        Width = 57
        Height = 41
        Hint = 'Adicionar todos os itens.'
        Caption = '>>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton15Click
      end
      object SpeedButton16: TSpeedButton
        Left = 320
        Top = 159
        Width = 57
        Height = 41
        Hint = 'Remover um item.'
        Caption = '<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton16Click
      end
      object SpeedButton17: TSpeedButton
        Left = 320
        Top = 207
        Width = 57
        Height = 41
        Hint = 'Remover todos os itens.'
        Caption = '<<'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton17Click
      end
      object lstEntregas: TListBox
        Left = 4
        Top = 5
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = SpeedButton14Click
      end
      object priEntregas: TListBox
        Left = 12
        Top = 107
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object lstEntregasSel: TListBox
        Left = 391
        Top = 4
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 2
        OnDblClick = SpeedButton16Click
      end
      object priEntregasSel: TListBox
        Left = 396
        Top = 107
        Width = 303
        Height = 321
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Par'#226'metros'
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 170
        Top = 4
        Width = 252
        Height = 92
        Caption = 'Capacidade de Peso do Ve'#237'culo'
        TabOrder = 0
        object Label1: TLabel
          Left = 142
          Top = 33
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object rgpTipo: TRadioGroup
          Left = 37
          Top = 17
          Width = 97
          Height = 65
          Caption = 'Tipo'
          ItemIndex = 1
          Items.Strings = (
            'Gen'#233'rica'
            'Por Ve'#237'culo')
          TabOrder = 0
          OnClick = rgpTipoClick
        end
        object edtPeso: TEdit
          Left = 142
          Top = 48
          Width = 79
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyPress = edtPesoKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 171
        Top = 99
        Width = 251
        Height = 226
        Caption = 'Tempo de Parada Para Carga e Descarga'
        TabOrder = 1
        object Label2: TLabel
          Left = 155
          Top = 63
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object rgpParada: TRadioGroup
          Left = 9
          Top = 15
          Width = 135
          Height = 128
          Caption = 'Tipo'
          ItemIndex = 1
          Items.Strings = (
            'Gen'#233'rico'
            'Por Local'
            'Por Ve'#237'culo'
            'Por Ve'#237'culo no Local')
          TabOrder = 0
          OnClick = rgpParadaClick
        end
        object edtParada: TEdit
          Left = 155
          Top = 78
          Width = 79
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyPress = edtPesoKeyPress
        end
        object rgpTempo: TRadioGroup
          Left = 9
          Top = 146
          Width = 135
          Height = 72
          Caption = 'Tempo'
          ItemIndex = 2
          Items.Strings = (
            'M'#237'nimo'
            'M'#225'ximo'
            'M'#233'dio')
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 429
        Top = 99
        Width = 251
        Height = 225
        Caption = 'Velocidade'
        TabOrder = 2
        object Label3: TLabel
          Left = 162
          Top = 53
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object rgpVelocidade: TRadioGroup
          Left = 9
          Top = 15
          Width = 148
          Height = 122
          Caption = 'Tipo'
          ItemIndex = 1
          Items.Strings = (
            'Gen'#233'rica'
            'Por Liga'#231#227'o'
            'Por Ve'#237'culo'
            'Por Ve'#237'culo na Liga'#231#227'o')
          TabOrder = 0
          OnClick = rgpVelocidadeClick
        end
        object edtVelocidade: TEdit
          Left = 162
          Top = 68
          Width = 79
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyPress = edtPesoKeyPress
        end
        object rgpTipoVelocidade: TRadioGroup
          Left = 9
          Top = 139
          Width = 148
          Height = 78
          Caption = 'Velocidade'
          ItemIndex = 2
          Items.Strings = (
            'M'#237'nima'
            'M'#225'xima'
            'M'#233'dia')
          TabOrder = 2
        end
      end
      object rgpGanho: TRadioGroup
        Left = 14
        Top = 4
        Width = 148
        Height = 241
        Caption = 'C'#225'lculo'
        ItemIndex = 0
        Items.Strings = (
          'Dist'#226'ncia'
          'Custo M'#237'nimo'
          'Custo M'#225'ximo'
          'Custo M'#233'dio'
          'Velocidade M'#237'nima'
          'Velocidade M'#225'xima'
          'Velocidade M'#233'dia')
        TabOrder = 3
        OnClick = rgpParadaClick
      end
      object rgpTipoGanho: TRadioGroup
        Left = 13
        Top = 248
        Width = 149
        Height = 78
        Caption = 'Tipo de C'#225'lculo'
        ItemIndex = 0
        Items.Strings = (
          'Gen'#233'rico'
          'Por Ve'#237'culo')
        TabOrder = 4
      end
      object GroupBox4: TGroupBox
        Left = 428
        Top = 4
        Width = 252
        Height = 92
        Caption = 'Tempo de Ciclo'
        TabOrder = 5
        object Label4: TLabel
          Left = 142
          Top = 33
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object rgpCiclo: TRadioGroup
          Left = 37
          Top = 17
          Width = 97
          Height = 65
          Caption = 'Tipo'
          ItemIndex = 1
          Items.Strings = (
            'Gen'#233'rico'
            'Por Ve'#237'culo')
          TabOrder = 0
          OnClick = rgpCicloClick
        end
        object edtCiclo: TEdit
          Left = 142
          Top = 48
          Width = 79
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyPress = edtPesoKeyPress
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Calcular'
      ImageIndex = 5
      object SpeedButton18: TSpeedButton
        Left = 235
        Top = 155
        Width = 225
        Height = 49
        Caption = 'Realizar os C'#225'lculos de Rotas'
        OnClick = SpeedButton18Click
      end
      object lstEntregasRealizadas: TListBox
        Left = 7
        Top = 16
        Width = 170
        Height = 237
        ItemHeight = 13
        TabOrder = 0
        Visible = False
      end
      object GroupBox5: TGroupBox
        Left = 256
        Top = 16
        Width = 185
        Height = 105
        Caption = 'Dados Carga'
        TabOrder = 1
        object Label5: TLabel
          Left = 38
          Top = 45
          Width = 26
          Height = 13
          Caption = 'Data:'
        end
        object MaskEdit1: TMaskEdit
          Left = 67
          Top = 42
          Width = 65
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dtmPrincipal.bdDados
    Parameters = <>
    Left = 532
    Top = 11
  end
  object qryAux: TADOQuery
    Connection = dtmPrincipal.bdDados
    Parameters = <>
    Left = 408
    Top = 16
  end
end
