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
    ActivePage = TabSheetTesouroDireto
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
      object ButtonTesouroDiretoSimular: TButton
        Left = 620
        Top = 3
        Width = 75
        Height = 71
        Caption = 'Simular'
        TabOrder = 0
        OnClick = ButtonTesouroDiretoSimularClick
      end
      object GroupBoxTesouroDireto: TGroupBox
        Left = 0
        Top = 0
        Width = 610
        Height = 74
        Caption = 'Tipos de investimento'
        TabOrder = 1
        object LabelValorAplicado: TLabel
          Left = 409
          Top = 21
          Width = 71
          Height = 13
          Caption = 'Valor a aplicar:'
        end
        object LabelQuantidadeDias: TLabel
          Left = 428
          Top = 44
          Width = 98
          Height = 13
          Caption = 'Quantidade de Dias:'
        end
        object EditValorAplicado: TEdit
          Left = 482
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object SpinEditQuantidadeDias: TSpinEdit
          Left = 530
          Top = 42
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
          Left = 198
          Top = 12
          Width = 185
          Height = 34
          Caption = 'Prefixado Juros Semestrais'#13'(NTN-F)'
          TabOrder = 3
        end
        object RadioButtonPrefixado: TRadioButton
          Left = 54
          Top = 20
          Width = 105
          Height = 17
          Caption = 'Prefixado (LTN)'
          TabOrder = 4
        end
        object RadioButtonIPCA: TRadioButton
          Left = 52
          Top = 43
          Width = 139
          Height = 17
          Caption = 'IPCA + (NTN - B Principal)'
          TabOrder = 5
        end
        object RadioButtonIPCASemestrais: TRadioButton
          Left = 198
          Top = 43
          Width = 224
          Height = 17
          Caption = 'IPCA + Juros'#10'Semestrais (NTN - B Principal)'
          TabOrder = 6
        end
      end
      object MemoTesouroDireto: TMemo
        Left = 0
        Top = 80
        Width = 700
        Height = 362
        Align = alBottom
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
  end
end
