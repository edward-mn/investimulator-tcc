unit UnitInvestimulator;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Samples.Spin,
  UnitTxtUtils,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormInvestimulator = class(TForm)
    PageControlInvestimulator: TPageControl;
    TabSheetTodos: TTabSheet;
    TabSheetTesouroDireto: TTabSheet;
    MemoTodosInvestimentos: TMemo;
    ButtonTesouroDiretoSimular: TButton;
    MemoTesouroDireto: TMemo;
    GroupBoxTesouroDireto: TGroupBox;
    EditValorAplicado: TEdit;
    LabelValorAplicado: TLabel;
    SpinEditQuantidadeDias: TSpinEdit;
    LabelQuantidadeDias: TLabel;
    RadioButtonSelic: TRadioButton;
    RadioButtonPrefixadoSemestrais: TRadioButton;
    RadioButtonPrefixado: TRadioButton;
    RadioButtonIPCA: TRadioButton;
    RadioButtonIPCASemestrais: TRadioButton;
    RadioButtonTaxaPreFixado: TRadioButton;
    RadioButtonTaxaPosFixado: TRadioButton;
    TabSheetPoupanca: TTabSheet;
    MemoPoupanca: TMemo;
    GroupBoxPoupanca: TGroupBox;
    LabelValoAplicadoPoupanca: TLabel;
    LabelQtdDiasPoupanca: TLabel;
    EditValorAplicadoPoupanca: TEdit;
    SpinEditQtdDiasPoupanca: TSpinEdit;
    RadioButtonPoupanca: TRadioButton;
    ButtonSimularPoupanca: TButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonTesouroDiretoSimularClick(Sender: TObject);
    procedure EditValorAplicadoKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorAplicadoPoupancaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonSimularPoupancaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FGravarArquivo: TGravar;
    procedure ValidarTesouroDireto;
    procedure ValidarPoupanca;
    procedure ValidarCurrencyImput(Teclas: Char; Tecla: string);
    procedure SimularTesouroDireto;
    procedure SimularPoupanca;
    procedure LerDadosMemo;
    procedure LimparCampos;
    function PegarTipoTesouroDireto: string;
    function PegarTipoTaxa: string;
    function PegarValorFinalTesouroDireto: Currency;
  public
    procedure EvalidationErrorMsg(Msg: string);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormInvestimulator: TFormInvestimulator;

implementation

{$R *.dfm}

uses
  UnitEvalidationError,
  UnitCalculo,
  UnitDadosUtils,
  StrUtils;

procedure TFormInvestimulator.Button1Click(Sender: TObject);
begin
  TCalculo.TesouroSelicTaxasPos(StrToFloat('1000,12'), 480);
end;

procedure TFormInvestimulator.ButtonSimularPoupancaClick(Sender: TObject);
begin
  SimularPoupanca;
end;

procedure TFormInvestimulator.ButtonTesouroDiretoSimularClick(Sender: TObject);
begin
  SimularTesouroDireto;
end;

constructor TFormInvestimulator.Create(AOwner: TComponent);
begin
  inherited;
  FGravarArquivo := TGravar.Create;
end;

destructor TFormInvestimulator.Destroy;
begin
  FGravarArquivo.Free;
  inherited;
end;

procedure TFormInvestimulator.EditValorAplicadoKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicado.Text);
end;

procedure TFormInvestimulator.EditValorAplicadoPoupancaKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicadoPoupanca.Text);
end;

procedure TFormInvestimulator.EvalidationErrorMsg(Msg: string);
begin
  raise EValidationError.Create(Msg);
end;

procedure TFormInvestimulator.FormShow(Sender: TObject);
begin
  LerDadosMemo;
  PageControlInvestimulator.ActivePageIndex := 0;
end;

procedure TFormInvestimulator.LerDadosMemo;
begin
  MemoTodosInvestimentos.Lines.LoadFromFile(PathTodosInvestimentos);
  MemoTesouroDireto.Lines.LoadFromFile(PathArquivoTesouroDireto);
  MemoPoupanca.Lines.LoadFromFile(PathArquivoPoupanca);
end;

procedure TFormInvestimulator.LimparCampos;
begin
  RadioButtonSelic.Checked := False;
  RadioButtonPrefixadoSemestrais.Checked := False;
  RadioButtonPrefixado.Checked := False;
  RadioButtonIPCA.Checked := False;
  RadioButtonIPCASemestrais.Checked := False;
  RadioButtonTaxaPreFixado.Checked := False;
  RadioButtonTaxaPosFixado.Checked := False;
  EditValorAplicado.Clear;
  SpinEditQuantidadeDias.Clear;
  EditValorAplicadoPoupanca.Clear;
  SpinEditQtdDiasPoupanca.Clear;
end;

function TFormInvestimulator.PegarTipoTaxa: string;
begin
  if RadioButtonTaxaPreFixado.Checked then
    Exit(TaxaPreFixado)
  else if RadioButtonTaxaPosFixado.Checked then
    Exit(TaxaPosFixado)
  else
    EvalidationErrorMsg(TaxaAplicacaoNecessario);
end;

function TFormInvestimulator.PegarTipoTesouroDireto: string;
begin
  if RadioButtonSelic.Checked then
    Exit(TesouroSelic)
  else if RadioButtonPrefixado.Checked then
    Exit(TesouroPrefixado)
  else if RadioButtonPrefixadoSemestrais.Checked then
    Exit(TesouroPrefixadoSemestrais)
  else if RadioButtonIPCA.Checked then
    Exit(TesouroIPCA)
  else if RadioButtonIPCASemestrais.Checked then
    Exit(TesouroIPCASemestrais)
  else
    EvalidationErrorMsg(TesouroSelicNecessario);
end;

function TFormInvestimulator.PegarValorFinalTesouroDireto: Currency;
const
  RendimentoConvenvional: array[0..2] of string = (TesouroSelic, TesouroPrefixado, TesouroIPCA);
  RendimentoSemestral: array[0..1] of string = (TesouroPrefixadoSemestrais, TesouroIPCASemestrais);
begin
  Result := 0.0;
  if PegarTipoTaxa = TaxaPreFixado then
  begin
    if MatchStr(PegarTipoTesouroDireto, RendimentoConvenvional) then
      Exit(TCalculo.TesouroSelicTaxasPre(StrToCurr(EditValorAplicado.Text), SpinEditQuantidadeDias.Value))
    else
      Exit(TCalculo.TesouroSemestraisTaxasPre(StrToCurr(EditValorAplicado.Text), SpinEditQuantidadeDias.Value))
  end
  else if PegarTipoTaxa = TaxaPosFixado then
  begin
    if MatchStr(PegarTipoTesouroDireto, RendimentoConvenvional) then
      Exit(TCalculo.TesouroSelicTaxasPos(StrToCurr(EditValorAplicado.Text), SpinEditQuantidadeDias.Value))
    else
      Exit(TCalculo.TesouroSemestraisTaxasPos(StrToCurr(EditValorAplicado.Text), SpinEditQuantidadeDias.Value))
  end
  else
    EvalidationErrorMsg('Erro');
end;

procedure TFormInvestimulator.SimularPoupanca;
var
  ValorFinal: Currency;
  TaxaPoupancaFinal, TaxaCDIFinal: Double;
  TextoPoupanca: string;
begin
  ValidarPoupanca;

  TaxaPoupancaFinal := TCalculo.TaxaPoupanca(SpinEditQtdDiasPoupanca.Value);
  TaxaCDIFinal := TCalculo.TaxaCDI_Radon;
  ValorFinal := TCalculo.Poupanca(StrToCurr(EditValorAplicadoPoupanca.Text), SpinEditQtdDiasPoupanca.Value);

  TextoPoupanca := FGravarArquivo.TextoPadraoPoupanca(EditValorAplicadoPoupanca.Text, Poupanca, TaxaPoupancaFinal,
    TaxaCDIFinal, ValorFinal, SpinEditQtdDiasPoupanca.Value);

  FGravarArquivo.GravarTxt(PathArquivoPoupanca, TextoPoupanca);
  LimparCampos;
  LerDadosMemo;
end;

procedure TFormInvestimulator.SimularTesouroDireto;
var
  ValorFinal: Currency;
  TaxaSelicFinal, TaxaCDIFinal: Double;
  IOF180, IOF360, IOF720, IOF_Mais720: Currency;
  TextoTesouroDireto: string;
begin
  ValidarTesouroDireto;
  PegarTipoTesouroDireto;
  PegarTipoTaxa;

  if RadioButtonPrefixado.Checked then
    TaxaCDIFinal := TaxaCDI_Aleatorio
  else
    TaxaCDIFinal := TCalculo.TaxaCDI_Radon;

  TaxaSelicFinal := TCalculo.TaxaSelic(SpinEditQuantidadeDias.Value);
  ValorFinal := PegarValorFinalTesouroDireto;

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicado.Text));
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicado.Text));
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicado.Text));
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicado.Text));

  TextoTesouroDireto := FGravarArquivo.TextoPadraoTesouroDireto(EditValorAplicado.Text, TesouroDireto, PegarTipoTesouroDireto,
  PegarTipoTaxa, TaxaSelicFinal, TaxaCDIFinal, IOF180, IOF360, IOF720, IOF_Mais720, ValorFinal, SpinEditQuantidadeDias.Value);

  FGravarArquivo.GravarTxt(PathArquivoTesouroDireto, TextoTesouroDireto);
  LimparCampos;
  LerDadosMemo;
end;

procedure TFormInvestimulator.ValidarCurrencyImput(Teclas: Char; Tecla: string);
const
  SeparadorDecimal = ',';
  TeclaNaoPermitida = 'Carácter inválido, só é permitido valores de moeda';
  VirgulaApenasUmaVez = 'Vírgula permitida apenas uma vez';
begin
  if not (Teclas in [#8, '0'..'9', SeparadorDecimal]) then
  begin
    ShowMessage(TeclaNaoPermitida);
    Abort;
  end
  else if (Teclas = SeparadorDecimal) and (Pos(Teclas, Tecla) > 0) then
  begin
    ShowMessage(VirgulaApenasUmaVez);
    Abort;
  end;
end;

procedure TFormInvestimulator.ValidarPoupanca;
begin
  if EditValorAplicadoPoupanca.Text = EmptyStr then
    EvalidationErrorMsg(ValorAplicadoInvalido)
  else if SpinEditQtdDiasPoupanca.Value <= 0 then
    EvalidationErrorMsg(QuantidadeInvalida);
end;

procedure TFormInvestimulator.ValidarTesouroDireto;
begin
  if EditValorAplicado.Text = EmptyStr then
    EvalidationErrorMsg(ValorAplicadoInvalido)
  else if SpinEditQuantidadeDias.Value <= 0 then
    EvalidationErrorMsg(QuantidadeInvalida);
end;

end.
