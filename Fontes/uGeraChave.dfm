object frmGeraChave: TfrmGeraChave
  Left = 169
  Top = 61
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmGeraChave'
  ClientHeight = 427
  ClientWidth = 594
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
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
    Width = 594
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    Color = 16764573
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 72
    Width = 177
    Height = 355
    Align = alLeft
    BevelOuter = bvNone
    Color = 9987378
    TabOrder = 2
    object JLabel1: TJLabel
      Left = 10
      Top = 16
      Width = 115
      Height = 16
      Cursor = crHandPoint
      Caption = 'Fechar o formul'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = JLabel1Click
      OnMouseUp = JLabel1MouseUp
      OnMoveBColor = 9987378
      OffMoveBColor = 9987378
      OnMoveFColor = clYellow
      OffMoveFColor = clWhite
      OnStyles = [fsUnderline]
      OffStyles = []
      OnEnabled = True
    end
    object JLabel2: TJLabel
      Left = 10
      Top = 77
      Width = 106
      Height = 16
      Cursor = crHandPoint
      Caption = 'Ajuda do Sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = JLabel2Click
      OnMouseUp = JLabel2MouseUp
      OnMoveBColor = 9987378
      OffMoveBColor = 9987378
      OnMoveFColor = clYellow
      OffMoveFColor = clWhite
      OnStyles = [fsUnderline]
      OffStyles = []
      OnEnabled = True
    end
    object JLabel3: TJLabel
      Left = 10
      Top = 109
      Width = 145
      Height = 16
      Cursor = crHandPoint
      Caption = 'Informa'#231#245'es do Sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = JLabel3Click
      OnMouseUp = JLabel3MouseUp
      OnMoveBColor = 9987378
      OffMoveBColor = 9987378
      OnMoveFColor = clYellow
      OffMoveFColor = clWhite
      OnStyles = [fsUnderline]
      OffStyles = []
      OnEnabled = True
    end
    object JLabel4: TJLabel
      Left = 10
      Top = 46
      Width = 76
      Height = 16
      Cursor = crHandPoint
      Caption = 'Gerar Chave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = JLabel4Click
      OnMouseUp = JLabel4MouseUp
      OnMoveBColor = 9987378
      OffMoveBColor = 9987378
      OnMoveFColor = clYellow
      OffMoveFColor = clWhite
      OnStyles = [fsUnderline]
      OffStyles = []
      OnEnabled = True
    end
  end
  object PageControl1: TPageControl
    Left = 177
    Top = 72
    Width = 417
    Height = 355
    ActivePage = TabSheet1
    Align = alClient
    Style = tsButtons
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'Informa'#231#245'es Gerais'
      object RadioGroup1: TRadioGroup
        Left = 9
        Top = 68
        Width = 393
        Height = 49
        Caption = 'Tipo de Chave'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Demonstra'#231#227'o'
          'Comercial')
        ParentFont = False
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 205
        Width = 209
        Height = 57
        Caption = 'Contra Senha'
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 179
          Top = 20
          Width = 23
          Height = 22
          Enabled = False
          Flat = True
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333330000003333333333333333330000003333333333333333330000003800
            000000000003330000003007B7B7B7B7B7B03300000030F07B7B7B7B7B703300
            000030B0B7B7B7B7B7B70300000030FB0B7B7B7B7B7B0300000030BF07B7B7B7
            B7B7B000000030FBF000007B7B7B7000000030BFBFBFBF0000000300000030FB
            FBFBFBFBFB033300000030BFBFBFBFBFBF033300000030FBFBF0000000333300
            0000330000033333333333000000333333333333333333000000333333333333
            333333000000333333333333333333000000}
          OnClick = SpeedButton1Click
        end
        object Edit1: TEdit
          Left = 8
          Top = 21
          Width = 167
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object RadioGroup2: TRadioGroup
        Left = 9
        Top = 124
        Width = 393
        Height = 73
        Caption = 'Forma de Prote'#231#227'o'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Sem restri'#231#245'es'
          'Data fixa'
          'N'#250'mero de locais')
        ParentFont = False
        TabOrder = 2
        OnClick = RadioGroup2Click
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 268
        Width = 137
        Height = 50
        Caption = 'Valor de Prote'#231#227'o'
        TabOrder = 3
        object MaskEdit1: TMaskEdit
          Left = 10
          Top = 19
          Width = 116
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 9
        Top = 4
        Width = 393
        Height = 57
        Caption = 'Arquivo da Chave'
        TabOrder = 4
        object edtArquivo: TEdit
          Left = 8
          Top = 21
          Width = 377
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 152
        Top = 268
        Width = 129
        Height = 50
        Caption = 'ID da Chave'
        TabOrder = 5
        object MaskEdit2: TMaskEdit
          Left = 8
          Top = 19
          Width = 113
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object GroupBox5: TGroupBox
        Left = 289
        Top = 268
        Width = 113
        Height = 50
        Caption = 'CRC da Chave'
        TabOrder = 6
        object MaskEdit3: TMaskEdit
          Left = 8
          Top = 19
          Width = 98
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 225
        Top = 205
        Width = 177
        Height = 57
        Caption = 'Vers'#227'o da Chave'
        TabOrder = 7
        object Edit2: TEdit
          Left = 8
          Top = 21
          Width = 159
          Height = 21
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'M'#243'dulos'
      ImageIndex = 1
      object GroupBox7: TGroupBox
        Left = 8
        Top = 8
        Width = 396
        Height = 107
        Caption = 'M'#243'dulos Ativos'
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'M'#243'dulo Geral'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 48
          Width = 281
          Height = 17
          Caption = 'Roteiriza'#231#227'o e Programa'#231#227'o de Ve'#237'culos de Carga'
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 16
          Top = 72
          Width = 281
          Height = 17
          Caption = 'Controle e Gerenciamento de Pneus'
          TabOrder = 2
        end
      end
    end
  end
  object Memo1: TMemo
    Left = 24
    Top = 192
    Width = 257
    Height = 105
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
  object Memo2: TMemo
    Left = 24
    Top = 304
    Width = 249
    Height = 113
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssBoth
    TabOrder = 4
    Visible = False
    WordWrap = False
  end
  object MainMenu1: TMainMenu
    Left = 136
    Top = 16
    object Usurios1: TMenuItem
      Caption = 'Geral'
      object FecharFormulrio1: TMenuItem
        Caption = 'Fechar Formul'#225'rio'
        ShortCut = 32883
        OnClick = JLabel1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object AjudadoSistema1: TMenuItem
        Caption = 'Ajuda do Sistema'
        OnClick = JLabel2Click
      end
      object SobreoSistema1: TMenuItem
        Caption = 'Sobre o Sistema'
        OnClick = JLabel3Click
      end
    end
  end
end
