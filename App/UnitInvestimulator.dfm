object FormInvestimulator: TFormInvestimulator
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Investimulator'
  ClientHeight = 470
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlInvestimulator: TPageControl
    Left = 0
    Top = 0
    Width = 708
    Height = 470
    ActivePage = TabSheetLCs
    Align = alClient
    TabOrder = 0
    object TabSheetTodos: TTabSheet
      Caption = 'Meus Investimentos'
      object MemoTodosInvestimentos: TMemo
        Left = 0
        Top = 0
        Width = 700
        Height = 442
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheetTesouroDireto: TTabSheet
      Caption = 'Tesouro Direto'
      ImageIndex = 1
      object ButtonTesouroDiretoSimular: TButton
        Left = 620
        Top = 3
        Width = 75
        Height = 126
        Caption = 'Simular'
        TabOrder = 0
        OnClick = ButtonTesouroDiretoSimularClick
      end
      object GroupBoxTesouroDireto: TGroupBox
        Left = 0
        Top = 0
        Width = 610
        Height = 129
        Caption = 'Tipos de investimento'
        TabOrder = 1
        object LabelValorAplicadoTD: TLabel
          Left = 409
          Top = 77
          Width = 71
          Height = 13
          Caption = 'Valor a aplicar:'
        end
        object LabelQtdDiasTD: TLabel
          Left = 428
          Top = 100
          Width = 98
          Height = 13
          Caption = 'Quantidade de Dias:'
        end
        object EditValorAplicadoTD: TEdit
          Left = 482
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '1001,11'
          OnKeyPress = EditValorAplicadoTDKeyPress
        end
        object SpinEditQtdDiasTD: TSpinEdit
          Left = 530
          Top = 98
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 480
        end
        object RadioButtonSelic: TRadioButton
          Left = 8
          Top = 21
          Width = 42
          Height = 41
          Caption = 'Selic'
          TabOrder = 2
        end
        object RadioButtonPrefixadoSemestrais: TRadioButton
          Left = 52
          Top = 43
          Width = 185
          Height = 20
          Caption = 'Prefixado Juros Semestrais'#13'(NTN-F)'
          TabOrder = 3
        end
        object RadioButtonPrefixado: TRadioButton
          Left = 52
          Top = 20
          Width = 105
          Height = 17
          Caption = 'Prefixado (LTN)'
          TabOrder = 4
        end
        object RadioButtonIPCA: TRadioButton
          Left = 256
          Top = 20
          Width = 139
          Height = 17
          Caption = 'IPCA + (NTN - B Principal)'
          TabOrder = 5
        end
        object RadioButtonIPCASemestrais: TRadioButton
          Left = 256
          Top = 44
          Width = 224
          Height = 17
          Caption = 'IPCA + Juros '#10'Semestrais (NTN - B Principal)'
          TabOrder = 6
        end
      end
      object MemoTesouroDireto: TMemo
        Left = 0
        Top = 135
        Width = 700
        Height = 307
        Align = alBottom
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object RadioButtonTaxaPreTD: TRadioButton
        Left = 514
        Top = 20
        Width = 73
        Height = 17
        Caption = 'Pr'#233'-Fixado'
        TabOrder = 3
      end
      object RadioButtonTaxaPosTD: TRadioButton
        Left = 514
        Top = 44
        Width = 73
        Height = 17
        Caption = 'P'#243's-Fixado'
        TabOrder = 4
      end
    end
    object TabSheetPoupanca: TTabSheet
      Caption = 'Poupan'#231'a'
      ImageIndex = 2
      object MemoPoupanca: TMemo
        Left = 0
        Top = 87
        Width = 700
        Height = 355
        Align = alBottom
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object GroupBoxPoupanca: TGroupBox
        Left = 0
        Top = 0
        Width = 610
        Height = 81
        Caption = 'Tipos de investimento'
        TabOrder = 1
        object LabelValoAplicadoPoupanca: TLabel
          Left = 137
          Top = 29
          Width = 71
          Height = 13
          Caption = 'Valor a aplicar:'
        end
        object LabelQtdDiasPoupanca: TLabel
          Left = 388
          Top = 29
          Width = 98
          Height = 13
          Caption = 'Quantidade de Dias:'
        end
        object EditValorAplicadoPoupanca: TEdit
          Left = 226
          Top = 26
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '1001,11'
          OnKeyPress = EditValorAplicadoPoupancaKeyPress
        end
        object SpinEditQtdDiasPoupanca: TSpinEdit
          Left = 514
          Top = 26
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 480
        end
        object RadioButtonPoupanca: TRadioButton
          Left = 24
          Top = 30
          Width = 73
          Height = 17
          Caption = 'Poupan'#231'a'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object ButtonSimularPoupanca: TButton
        Left = 616
        Top = 8
        Width = 75
        Height = 73
        Caption = 'Simular'
        TabOrder = 2
        OnClick = ButtonSimularPoupancaClick
      end
    end
    object TabSheetCDB: TTabSheet
      Caption = 'CDB'
      ImageIndex = 3
      object MemoCDB: TMemo
        Left = 0
        Top = 103
        Width = 700
        Height = 339
        Align = alBottom
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object GroupBoxCDB: TGroupBox
        Left = 0
        Top = 0
        Width = 586
        Height = 97
        Caption = 'Certificado de Dep'#243'sito Banc'#225'rio'
        TabOrder = 1
        object LabelQtdDiasCDB: TLabel
          Left = 223
          Top = 26
          Width = 98
          Height = 13
          Caption = 'Quantidade de Dias:'
        end
        object LabelValorAplicadoCDB: TLabel
          Left = 19
          Top = 26
          Width = 71
          Height = 13
          Caption = 'Valor Aplicado:'
        end
        object LabelCDBBancos: TLabel
          Left = 19
          Top = 59
          Width = 89
          Height = 13
          Caption = 'Escolha um banco:'
        end
        object SpinEditQtdDiasCDB: TSpinEdit
          Left = 327
          Top = 23
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 480
        end
        object RadioButtonTaxaPosCDB: TRadioButton
          Left = 480
          Top = 35
          Width = 81
          Height = 17
          Caption = 'P'#243's-Fixado'
          TabOrder = 1
        end
        object RadioButtonTaxaPreCDB: TRadioButton
          Left = 480
          Top = 12
          Width = 73
          Height = 17
          Caption = 'Pr'#233'-Fixado'
          TabOrder = 2
        end
        object EditValorAplicadoCDB: TEdit
          Left = 96
          Top = 23
          Width = 121
          Height = 21
          TabOrder = 3
          Text = '1001,11'
          OnKeyPress = EditValorAplicadoCDBKeyPress
        end
        object ComboBoxCDBBancos: TComboBox
          Left = 117
          Top = 55
          Width = 145
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 2
          TabOrder = 4
          Text = 'Ita'#250' Unibanco'
          Items.Strings = (
            'Banco do Brasil'
            'Caixa Econ'#244'mica Federal'
            'Ita'#250' Unibanco'
            'Bradesco'
            'BNDES'
            'Santander'
            'BTG Pactual'
            'HSBC'
            'Banco Mercantil do Brasil'
            'Safra'
            'Banco Votorantim'
            'Citi'
            'Banrisul'
            'BNP Paribas'
            'Credit Suisse'
            'Banco do Nordeste'
            'JP Morgan'
            'Soci'#233't'#233' G'#233'n'#233'rale'
            'Sicredi'
            'Banco Pan'
            'Bancoob')
        end
      end
      object ButtonSimularrCDB: TButton
        Left = 592
        Top = 3
        Width = 105
        Height = 94
        Caption = 'Simular'
        TabOrder = 2
        OnClick = ButtonSimularrCDBClick
      end
    end
    object TabSheetLCs: TTabSheet
      Caption = 'LC'#39's'
      ImageIndex = 4
      object GroupBoxLC: TGroupBox
        Left = 0
        Top = 0
        Width = 601
        Height = 105
        Caption = 'Letras de Cr'#233'dito'
        TabOrder = 0
        object LabelFundosInvestimentosLC: TLabel
          Left = 239
          Top = 70
          Width = 99
          Height = 13
          Caption = 'Selecione um Fundo:'
        end
        object LabelQtdDiasLC: TLabel
          Left = 239
          Top = 47
          Width = 98
          Height = 13
          Caption = 'Quantidade de Dias:'
        end
        object LabelValorAplicadoLC: TLabel
          Left = 239
          Top = 22
          Width = 71
          Height = 13
          Caption = 'Valor Aplicado:'
        end
        object RadioButtonLC: TRadioButton
          Left = 10
          Top = 22
          Width = 121
          Height = 17
          Caption = 'Letra de C'#226'mbio (LC)'
          TabOrder = 0
          OnClick = RadioButtonLCClick
        end
        object RadioButtonLCA: TRadioButton
          Left = 10
          Top = 47
          Width = 193
          Height = 17
          Caption = 'Letra de Cr'#233'dito Agropecu'#225'rio (LCA)'
          TabOrder = 1
          OnClick = RadioButtonLCAClick
        end
        object RadioButtonLCI: TRadioButton
          Left = 10
          Top = 72
          Width = 185
          Height = 17
          Caption = 'Letra de Cr'#233'dito Imobili'#225'rio (LCI)'
          TabOrder = 2
          OnClick = RadioButtonLCIClick
        end
        object ComboBoxLCsFundosInvestimento: TComboBox
          Left = 344
          Top = 70
          Width = 162
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 3
        end
        object EditValorAplicadoLC: TEdit
          Left = 383
          Top = 17
          Width = 121
          Height = 21
          TabOrder = 4
          Text = '1001,11'
          OnKeyPress = EditValorAplicadoLCKeyPress
        end
        object SpinEditQtdDiasLC: TSpinEdit
          Left = 383
          Top = 44
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 480
        end
      end
      object ButtonLCSimular: TButton
        Left = 607
        Top = 3
        Width = 90
        Height = 102
        Caption = 'Simular'
        TabOrder = 1
      end
      object MemoLC: TMemo
        Left = 0
        Top = 111
        Width = 700
        Height = 331
        Align = alBottom
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object RadioButtonTaxaPosLC: TRadioButton
        Left = 514
        Top = 61
        Width = 73
        Height = 17
        Caption = 'P'#243's-Fixado'
        TabOrder = 3
      end
      object RadioButtonTaxaPreLC: TRadioButton
        Left = 514
        Top = 30
        Width = 73
        Height = 17
        Caption = 'Pr'#233'-Fixado'
        TabOrder = 4
      end
    end
  end
end
