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
    procedure FormShow(Sender: TObject);
    procedure ButtonTesouroDiretoSimularClick(Sender: TObject);
    procedure EditValorAplicadoKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    FGravarArquivo: TGravar;
    procedure LimparCampos;
    procedure LerDadosMemo;
    procedure ValidarTesouroDireto;
    procedure ValidarCurrencyImput(Teclas: Char; Tecla: string);
    function PegarTipoTesouroDireto: string;
    function PegarTipoTaxa: string;
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
  UnitDadosUtils;

procedure TFormInvestimulator.Button1Click(Sender: TObject);
begin
  TCalculo.TesouroIOF_180(FloatToCurr(1000.11));
end;

procedure TFormInvestimulator.ButtonTesouroDiretoSimularClick(Sender: TObject);
var
  ValorFinal: Currency;
  RendimentoFinal, CDIFinal: Double;
  IOF180, IOF360, IOF720, IOF_Mais720: Currency;
  TextoTesouroDireto: string;
begin
  ValidarTesouroDireto;
  PegarTipoTesouroDireto;
  PegarTipoTaxa;

  RendimentoFinal := TCalculo.Rendimento(SpinEditQuantidadeDias.Value);
  CDIFinal := TCalculo.TaxaCDI_Radon;
  if PegarTipoTaxa = TaxaPreFixado then
    ValorFinal := TCalculo.TesouroSelicTaxasPre(StrToCurr(EditValorAplicado.Text), SpinEditQuantidadeDias.Value)
  else if PegarTipoTaxa = TaxaPosFixado then
    ValorFinal := TCalculo.TesouroSelicTaxasPos(StrToCurr(EditValorAplicado.Text), SpinEditQuantidadeDias.Value)
  else
    EvalidationErrorMsg('Erro');

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicado.Text));
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicado.Text));
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicado.Text));
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicado.Text));

  TextoTesouroDireto := FGravarArquivo.TextoPadraoTesouroDireto(EditValorAplicado.Text, TesouroDireto, PegarTipoTesouroDireto,
  PegarTipoTaxa, RendimentoFinal, CDIFinal, IOF180, IOF360, IOF720, IOF_Mais720, ValorFinal, SpinEditQuantidadeDias.Value);

  FGravarArquivo.GravarTxt(PathArquivoTesouroDireto, TextoTesouroDireto);
  LimparCampos;
  LerDadosMemo;
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

procedure TFormInvestimulator.EvalidationErrorMsg(Msg: string);
begin
  raise EValidationError.Create(Msg);
end;

procedure TFormInvestimulator.FormShow(Sender: TObject);
begin
  LerDadosMemo;
end;

procedure TFormInvestimulator.LerDadosMemo;
begin
  MemoTodosInvestimentos.Lines.LoadFromFile(PathTodosInvestimentos);
  MemoTesouroDireto.Lines.LoadFromFile(PathArquivoTesouroDireto);
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
    Exit(TesouroPrefixado)
  else if RadioButtonIPCA.Checked then
    Exit(TesouroIPCASemestrais)
  else if RadioButtonIPCASemestrais.Checked then
    Exit(TesouroIPCASemestrais)
  else
    EvalidationErrorMsg(TesouroSelicNecessario);
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

procedure TFormInvestimulator.ValidarTesouroDireto;
begin
  if EditValorAplicado.Text = '' then
    EvalidationErrorMsg(ValorAplicadoInvalido)
  else if SpinEditQuantidadeDias.Value <= 0 then
    EvalidationErrorMsg(QuantidadeInvalida);
end;

end.
