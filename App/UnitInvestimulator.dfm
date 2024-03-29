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
    ActivePage = TabSheetCOE
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
        Caption = 'Tipos de Tesouro Direto'
        TabOrder = 3
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
          TabOrder = 5
          Text = '0'
          OnKeyPress = EditValorAplicadoTDKeyPress
        end
        object SpinEditQtdDiasTD: TSpinEdit
          Left = 530
          Top = 98
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
        object RadioButtonSelic: TRadioButton
          Left = 8
          Top = 21
          Width = 42
          Height = 41
          Caption = 'Selic'
          TabOrder = 0
        end
        object RadioButtonPrefixadoSemestrais: TRadioButton
          Left = 52
          Top = 43
          Width = 185
          Height = 20
          Caption = 'Prefixado Juros Semestrais'#13'(NTN-F)'
          TabOrder = 2
        end
        object RadioButtonPrefixado: TRadioButton
          Left = 52
          Top = 20
          Width = 105
          Height = 17
          Caption = 'Prefixado (LTN)'
          TabOrder = 1
        end
        object RadioButtonIPCA: TRadioButton
          Left = 256
          Top = 20
          Width = 139
          Height = 17
          Caption = 'IPCA + (NTN - B Principal)'
          TabOrder = 3
        end
        object RadioButtonIPCASemestrais: TRadioButton
          Left = 256
          Top = 44
          Width = 224
          Height = 17
          Caption = 'IPCA + Juros '#10'Semestrais (NTN - B Principal)'
          TabOrder = 4
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
        TabOrder = 4
      end
      object RadioButtonTaxaPreTD: TRadioButton
        Left = 514
        Top = 20
        Width = 73
        Height = 17
        Caption = 'Pr'#233'-Fixado'
        TabOrder = 1
      end
      object RadioButtonTaxaPosTD: TRadioButton
        Left = 514
        Top = 44
        Width = 73
        Height = 17
        Caption = 'P'#243's-Fixado'
        TabOrder = 2
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
        TabOrder = 2
      end
      object GroupBoxPoupanca: TGroupBox
        Left = 0
        Top = 0
        Width = 610
        Height = 81
        Caption = 'Simples Poupan'#231'a'
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
          TabOrder = 1
          Text = '0'
          OnKeyPress = EditValorAplicadoPoupancaKeyPress
        end
        object SpinEditQtdDiasPoupanca: TSpinEdit
          Left = 514
          Top = 26
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object RadioButtonPoupanca: TRadioButton
          Left = 24
          Top = 30
          Width = 73
          Height = 17
          Caption = 'Poupan'#231'a'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
      end
      object ButtonSimularPoupanca: TButton
        Left = 616
        Top = 8
        Width = 75
        Height = 73
        Caption = 'Simular'
        TabOrder = 0
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
        TabOrder = 2
      end
      object GroupBoxTiposCDB: TGroupBox
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
          TabOrder = 2
          Value = 0
        end
        object RadioButtonTaxaPosCDB: TRadioButton
          Left = 480
          Top = 35
          Width = 81
          Height = 17
          Caption = 'P'#243's-Fixado'
          TabOrder = 4
        end
        object RadioButtonTaxaPreCDB: TRadioButton
          Left = 480
          Top = 12
          Width = 73
          Height = 17
          Caption = 'Pr'#233'-Fixado'
          TabOrder = 3
        end
        object EditValorAplicadoCDB: TEdit
          Left = 96
          Top = 23
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
          OnKeyPress = EditValorAplicadoCDBKeyPress
        end
        object ComboBoxCDBBancos: TComboBox
          Left = 117
          Top = 55
          Width = 145
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
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
        TabOrder = 0
        OnClick = ButtonSimularrCDBClick
      end
    end
    object TabSheetLCs: TTabSheet
      Caption = 'Letras de Cr'#233'ditos'
      ImageIndex = 4
      object GroupBoxTiposLC: TGroupBox
        Left = 0
        Top = 0
        Width = 601
        Height = 105
        Caption = 'Tipos de Letras de Cr'#233'ditos'
        TabOrder = 3
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
          Top = 49
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
          TabOrder = 5
        end
        object EditValorAplicadoLCs: TEdit
          Left = 383
          Top = 17
          Width = 121
          Height = 21
          TabOrder = 3
          Text = '0'
          OnKeyPress = EditValorAplicadoLCsKeyPress
        end
        object SpinEditQtdDiasLCs: TSpinEdit
          Left = 383
          Top = 44
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
      end
      object ButtonLCSimular: TButton
        Left = 607
        Top = 3
        Width = 90
        Height = 102
        Caption = 'Simular'
        TabOrder = 0
        OnClick = ButtonLCSimularClick
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
        TabOrder = 4
      end
      object RadioButtonTaxaPosLC: TRadioButton
        Left = 514
        Top = 61
        Width = 73
        Height = 17
        Caption = 'P'#243's-Fixado'
        TabOrder = 2
      end
      object RadioButtonTaxaPreLC: TRadioButton
        Left = 514
        Top = 30
        Width = 73
        Height = 17
        Caption = 'Pr'#233'-Fixado'
        TabOrder = 1
      end
    end
    object TabSheetDebentures: TTabSheet
      Caption = 'Deb'#234'ntures'
      ImageIndex = 5
      object MemoDebentures: TMemo
        Left = 0
        Top = 143
        Width = 700
        Height = 299
        Align = alBottom
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object GroupBoxTiposDebentures: TGroupBox
        Left = 0
        Top = 0
        Width = 616
        Height = 137
        Caption = 'Tipos de Deb'#234'ntures'
        TabOrder = 3
        object LabelQtdDiasDebentures: TLabel
          Left = 423
          Top = 109
          Width = 97
          Height = 13
          Caption = 'Quantidade de dias:'
        end
        object LabelValorAplicadoDebentures: TLabel
          Left = 423
          Top = 82
          Width = 71
          Height = 13
          Caption = 'Valor Aplicado:'
        end
        object RadioButtonDebenturesConversiveis: TRadioButton
          Left = 200
          Top = 52
          Width = 145
          Height = 17
          Caption = 'Deb'#234'ntures Convers'#237'veis'
          TabOrder = 3
        end
        object RadioButtonDebenturesSimples: TRadioButton
          Left = 18
          Top = 25
          Width = 145
          Height = 17
          Caption = 'Deb'#234'ntures Simples'
          TabOrder = 0
        end
        object RadioButtonDebenturesEscriturais: TRadioButton
          Left = 372
          Top = 36
          Width = 145
          Height = 17
          Caption = 'Deb'#234'ntures Escriturais'
          TabOrder = 4
        end
        object RadioButtonDebenturesNominativas: TRadioButton
          Left = 18
          Top = 52
          Width = 145
          Height = 17
          Caption = 'Deb'#234'ntures Nominativas'
          TabOrder = 1
        end
        object SpinEditQtdDiasDebentures: TSpinEdit
          Left = 531
          Top = 106
          Width = 78
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
        object EditValorAplicadoDebentures: TEdit
          Left = 531
          Top = 79
          Width = 78
          Height = 21
          TabOrder = 5
          Text = '0'
          OnKeyPress = EditValorAplicadoDebenturesKeyPress
        end
        object RadioButtonDebenturesPermutaveis: TRadioButton
          Left = 200
          Top = 23
          Width = 145
          Height = 17
          Caption = 'Deb'#234'ntures Permut'#225'veis'
          TabOrder = 2
        end
      end
      object ButtonDebenturesSimular: TButton
        Left = 622
        Top = 0
        Width = 75
        Height = 137
        Caption = 'Simular'
        TabOrder = 0
        OnClick = ButtonDebenturesSimularClick
      end
      object RadioButtonTaxaPreDebentures: TRadioButton
        Left = 531
        Top = 23
        Width = 78
        Height = 17
        Caption = 'Pr'#233'-Fixado'
        TabOrder = 1
      end
      object RadioButtonTaxaPosDebentures: TRadioButton
        Left = 531
        Top = 49
        Width = 78
        Height = 17
        Caption = 'P'#243's-Fixado'
        TabOrder = 2
      end
    end
    object TabSheetFundosInvestimentos: TTabSheet
      Caption = 'Fundos'#160'de'#160'investimento'
      ImageIndex = 7
      object GroupBoxTiposFI: TGroupBox
        Left = 3
        Top = 0
        Width = 582
        Height = 126
        Caption = 'Tipos de Fundos de Investimentos'
        TabOrder = 1
        object LabelQtdDiasFI: TLabel
          Left = 401
          Top = 52
          Width = 82
          Height = 13
          Caption = 'Quantidade dias:'
        end
        object LabelValorAplicadoFI: TLabel
          Left = 401
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Valor Aplicado:'
        end
        object LabelInvestidoraTerceira: TLabel
          Left = 309
          Top = 76
          Width = 122
          Height = 26
          Caption = 'Selecione uma institui'#231#227'o '#10'para Investir para voc'#234':'
        end
        object RadioButtonFI_FundosCambiais: TRadioButton
          Left = 16
          Top = 69
          Width = 113
          Height = 17
          Caption = 'Fundos Cambiais'
          TabOrder = 2
        end
        object RadioButtonFI_FundosAcoes: TRadioButton
          Left = 16
          Top = 92
          Width = 105
          Height = 17
          Caption = 'Fundos em a'#231#245'es'
          TabOrder = 3
        end
        object RadioButtonFI_FundosLongoPrazo: TRadioButton
          Left = 16
          Top = 46
          Width = 129
          Height = 17
          Caption = 'Fundos de Longo Prazo'
          TabOrder = 1
        end
        object RadioButtonFI_FundosInvestimentoImobiliarios: TRadioButton
          Left = 159
          Top = 28
          Width = 193
          Height = 17
          Caption = 'Fundos de Investimento Imobili'#225'rios'
          TabOrder = 4
        end
        object RadioButtonFI_FundosDividaExterna: TRadioButton
          Left = 159
          Top = 55
          Width = 145
          Height = 17
          Caption = 'Fundos de D'#237'vida Externa'
          TabOrder = 5
        end
        object RadioButtonFI_FundosMultimercado: TRadioButton
          Left = 159
          Top = 84
          Width = 121
          Height = 17
          Caption = 'Fundos Multimercado'
          TabOrder = 6
        end
        object RadioButtonFI_FundosCurtoPrazo: TRadioButton
          Left = 16
          Top = 23
          Width = 129
          Height = 17
          Caption = 'Fundos de Curto Prazo'
          TabOrder = 0
        end
        object EditValorAplicadoFI: TEdit
          Left = 480
          Top = 21
          Width = 92
          Height = 21
          TabOrder = 7
          Text = '0'
          OnKeyPress = EditValorAplicadoFIKeyPress
        end
        object SpinEditQtdDiasFI: TSpinEdit
          Left = 501
          Top = 49
          Width = 71
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 8
          Value = 0
        end
        object ComboBoxInvestidoraTerceira: TComboBox
          Left = 440
          Top = 78
          Width = 132
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 9
          Items.Strings = (
            'XP'
            'Blog  Rico'
            'Toro Investimentos '
            'Ourinvest'
            'Porto Seguro'
            'Anbima')
        end
      end
      object ButtonFI_Simular: TButton
        Left = 591
        Top = 3
        Width = 106
        Height = 126
        Caption = 'Simular'
        TabOrder = 0
        OnClick = ButtonFI_SimularClick
      end
      object MemoFI: TMemo
        Left = 0
        Top = 135
        Width = 700
        Height = 307
        Align = alBottom
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object TabSheetCOE: TTabSheet
      Caption = 'COE'
      ImageIndex = 6
      object GroupBoxTiposCOE: TGroupBox
        Left = 3
        Top = 3
        Width = 582
        Height = 134
        Caption = 'Tipos de Certificados'#160'de Opera'#231#245'es Estruturadas'
        TabOrder = 3
        object LabelFundoInvestimentoCOE: TLabel
          Left = 18
          Top = 88
          Width = 180
          Height = 13
          Caption = 'Selecione um Fundo de Investimento:'
        end
        object LabelQtdDiasCOE: TLabel
          Left = 398
          Top = 104
          Width = 83
          Height = 13
          Caption = 'Quantidade Dias:'
        end
        object LabelValorAplicadoCOE: TLabel
          Left = 398
          Top = 75
          Width = 71
          Height = 13
          Caption = 'Valor Aplicado:'
        end
        object ComboBoxFundosCOE: TComboBox
          Left = 207
          Top = 85
          Width = 162
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 4
        end
        object EditValorAplicadoCOE: TEdit
          Left = 480
          Top = 72
          Width = 91
          Height = 21
          TabOrder = 5
          Text = '0'
          OnKeyPress = EditValorAplicadoCOEKeyPress
        end
        object RadioButtonCOE_LCA: TRadioButton
          Left = 18
          Top = 45
          Width = 193
          Height = 17
          Caption = 'Letra de Cr'#233'dito Agropecu'#225'rio (LCA)'
          TabOrder = 1
          OnClick = RadioButtonCOE_LCAClick
        end
        object RadioButtonCOE_CDB: TRadioButton
          Left = 234
          Top = 22
          Width = 207
          Height = 17
          Caption = 'Certificado de Dep'#243'sito Banc'#225'rio (CDB)'
          TabOrder = 2
          OnClick = RadioButtonCOE_CDBClick
        end
        object RadioButtonCOE_LC: TRadioButton
          Left = 18
          Top = 22
          Width = 121
          Height = 17
          Caption = 'Letra de C'#226'mbio (LC)'
          TabOrder = 0
          OnClick = RadioButtonCOE_LCClick
        end
        object RadioButtonCOE_LCI: TRadioButton
          Left = 234
          Top = 45
          Width = 185
          Height = 17
          Caption = 'Letra de Cr'#233'dito Imobili'#225'rio (LCI)'
          TabOrder = 3
          OnClick = RadioButtonCOE_LCIClick
        end
        object SpinEditQtdDiasCOE: TSpinEdit
          Left = 504
          Top = 101
          Width = 67
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
      end
      object ButtonCOESimular: TButton
        Left = 591
        Top = 3
        Width = 106
        Height = 134
        Caption = 'Simular'
        TabOrder = 0
        OnClick = ButtonCOESimularClick
      end
      object RadioButtonCapitalProtegidoCOE: TRadioButton
        Left = 471
        Top = 25
        Width = 103
        Height = 17
        Caption = 'Capital Protegido'
        TabOrder = 1
      end
      object RadioButtonCapitalRiscoCOE: TRadioButton
        Left = 471
        Top = 48
        Width = 103
        Height = 17
        Caption = 'Capital em Risco'
        TabOrder = 2
      end
      object MemoCOE: TMemo
        Left = 0
        Top = 143
        Width = 700
        Height = 299
        Align = alBottom
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
    end
  end
end
