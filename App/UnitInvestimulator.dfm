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
    ActivePage = TabSheetTodos
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
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheetTesouroDireto: TTabSheet
      Caption = 'Tesouro Direto'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
        object LabelValorAplicado: TLabel
          Left = 409
          Top = 77
          Width = 71
          Height = 13
          Caption = 'Valor a aplicar:'
        end
        object LabelQuantidadeDias: TLabel
          Left = 428
          Top = 100
          Width = 98
          Height = 13
          Caption = 'Quantidade de Dias:'
        end
        object EditValorAplicado: TEdit
          Left = 482
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyPress = EditValorAplicadoKeyPress
        end
        object SpinEditQuantidadeDias: TSpinEdit
          Left = 530
          Top = 98
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
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
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object RadioButtonTaxaPreFixado: TRadioButton
        Left = 514
        Top = 20
        Width = 73
        Height = 17
        Caption = 'Pr'#233'-Fixado'
        TabOrder = 3
      end
      object RadioButtonTaxaPosFixado: TRadioButton
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoPoupanca: TMemo
        Left = 0
        Top = 87
        Width = 700
        Height = 355
        Align = alBottom
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object GroupBoxPoupanca: TGroupBox
        Left = 0
        Top = 8
        Width = 610
        Height = 73
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
          Value = 0
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
  end
end
