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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  UnitTxtUtils,
  UnitDadosUtils;

type
  TFormInvestimulator = class(TForm)
    PageControlInvestimulator: TPageControl;
    TabSheetTodos: TTabSheet;
    TabSheetTesouroDireto: TTabSheet;
    MemoTodosInvestimentos: TMemo;
    ButtonTesouroDiretoSimular: TButton;
    MemoTesouroDireto: TMemo;
    GroupBoxTesouroDireto: TGroupBox;
    EditValorAplicadoTD: TEdit;
    LabelValorAplicadoTD: TLabel;
    SpinEditQtdDiasTD: TSpinEdit;
    LabelQtdDiasTD: TLabel;
    RadioButtonSelic: TRadioButton;
    RadioButtonPrefixadoSemestrais: TRadioButton;
    RadioButtonPrefixado: TRadioButton;
    RadioButtonIPCA: TRadioButton;
    RadioButtonIPCASemestrais: TRadioButton;
    RadioButtonTaxaPreTD: TRadioButton;
    RadioButtonTaxaPosTD: TRadioButton;
    TabSheetPoupanca: TTabSheet;
    MemoPoupanca: TMemo;
    GroupBoxPoupanca: TGroupBox;
    LabelValoAplicadoPoupanca: TLabel;
    LabelQtdDiasPoupanca: TLabel;
    EditValorAplicadoPoupanca: TEdit;
    SpinEditQtdDiasPoupanca: TSpinEdit;
    RadioButtonPoupanca: TRadioButton;
    ButtonSimularPoupanca: TButton;
    TabSheetCDB: TTabSheet;
    MemoCDB: TMemo;
    GroupBoxTiposCDB: TGroupBox;
    RadioButtonTaxaPreCDB: TRadioButton;
    RadioButtonTaxaPosCDB: TRadioButton;
    LabelValorAplicadoCDB: TLabel;
    LabelQtdDiasCDB: TLabel;
    EditValorAplicadoCDB: TEdit;
    SpinEditQtdDiasCDB: TSpinEdit;
    ButtonSimularrCDB: TButton;
    ComboBoxCDBBancos: TComboBox;
    LabelCDBBancos: TLabel;
    TabSheetLCs: TTabSheet;
    GroupBoxTiposLC: TGroupBox;
    ButtonLCSimular: TButton;
    MemoLC: TMemo;
    RadioButtonLCI: TRadioButton;
    RadioButtonLCA: TRadioButton;
    RadioButtonLC: TRadioButton;
    ComboBoxLCsFundosInvestimento: TComboBox;
    EditValorAplicadoLCs: TEdit;
    SpinEditQtdDiasLCs: TSpinEdit;
    RadioButtonTaxaPreLC: TRadioButton;
    RadioButtonTaxaPosLC: TRadioButton;
    LabelValorAplicadoLC: TLabel;
    LabelQtdDiasLC: TLabel;
    LabelFundosInvestimentosLC: TLabel;
    TabSheetDebentures: TTabSheet;
    MemoDebentures: TMemo;
    GroupBoxTiposDebentures: TGroupBox;
    ButtonDebenturesSimular: TButton;
    EditValorAplicadoDebentures: TEdit;
    SpinEditQtdDiasDebentures: TSpinEdit;
    LabelValorAplicadoDebentures: TLabel;
    LabelQtdDiasDebentures: TLabel;
    RadioButtonDebenturesNominativas: TRadioButton;
    RadioButtonDebenturesEscriturais: TRadioButton;
    RadioButtonDebenturesSimples: TRadioButton;
    RadioButtonDebenturesConversiveis: TRadioButton;
    RadioButtonTaxaPreDebentures: TRadioButton;
    RadioButtonTaxaPosDebentures: TRadioButton;
    RadioButtonDebenturesPermutaveis: TRadioButton;
    TabSheetCOE: TTabSheet;
    GroupBoxTiposCOE: TGroupBox;
    MemoCOE: TMemo;
    ButtonCOESimular: TButton;
    RadioButtonCOE_LC: TRadioButton;
    RadioButtonCOE_LCA: TRadioButton;
    RadioButtonCOE_LCI: TRadioButton;
    RadioButtonCOE_CDB: TRadioButton;
    EditValorAplicadoCOE: TEdit;
    SpinEditQtdDiasCOE: TSpinEdit;
    ComboBoxFundosCOE: TComboBox;
    LabelFundoInvestimentoCOE: TLabel;
    LabelValorAplicadoCOE: TLabel;
    LabelQtdDiasCOE: TLabel;
    RadioButtonCapitalProtegidoCOE: TRadioButton;
    RadioButtonCapitalRiscoCOE: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonTesouroDiretoSimularClick(Sender: TObject);
    procedure EditValorAplicadoTDKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorAplicadoPoupancaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonSimularPoupancaClick(Sender: TObject);
    procedure EditValorAplicadoCDBKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonSimularrCDBClick(Sender: TObject);
    procedure EditValorAplicadoLCsKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButtonLCIClick(Sender: TObject);
    procedure RadioButtonLCAClick(Sender: TObject);
    procedure RadioButtonLCClick(Sender: TObject);
    procedure ButtonLCSimularClick(Sender: TObject);
    procedure EditValorAplicadoDebenturesKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonDebenturesSimularClick(Sender: TObject);
    procedure EditValorAplicadoCOEKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButtonCOE_LCClick(Sender: TObject);
    procedure RadioButtonCOE_LCAClick(Sender: TObject);
    procedure RadioButtonCOE_LCIClick(Sender: TObject);
    procedure RadioButtonCOE_CDBClick(Sender: TObject);
    procedure ButtonCOESimularClick(Sender: TObject);
  private
    FGravarArquivo: TGravar;
    function PegarTipoTaxaBase(RadioPreFixado, RadioPosFixado: Boolean; TextoTaxa1: string = TaxaPreFixado;
      TextoTaxa2: string = TaxaPosFixado): string;
    procedure ValidarCurrencyImput(Teclas: Char; Tecla: string);
    procedure GravarSimulacoesPadrao(PathArquivoSimulado, Conteudo: string);
    procedure ValidarValor_Dias(Valor: string; Dias: Integer);
    procedure ValidarTesouroDireto;
    procedure ValidarPoupanca;
    procedure ValidarCDB;
    procedure ValidarLCs;
    procedure ValidarDebentures;
    procedure SimularTesouroDireto;
    procedure SimularPoupanca;
    procedure SimularCDB;
    procedure SimularLCs;
    procedure SimularDebentures;
    procedure LerDadosMemo;
    procedure LimparCampos;
    function PegarTipoTD: string;
    function PegarTipoLCs: string;
    function PegarTipoDebentures: string;
    function PegarTipoCOE: string;
    function PegarDescricaoCOE: string;
    function PegarTipoTaxaTD: string;
    function PegarTipoTaxaCDB: string;
    function PegarTipoTaxaLCs: string;
    function PegarTipoTaxaDebentures: string;
    function PegarTipoTaxaCOE: string;
    function PegarBancoCDB: string;
    function PegarFundoLCs: string;
    function PegarFundoCOE: string;
    function PegarComboBase(ItemSelecionado: Integer; TextoSelecionado, MsgError: string): string;
    procedure InserirValoresCombo(ComboBox: TComboBox);
    function PegarDescricaoDebentures: string;
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
  StrUtils;

procedure TFormInvestimulator.ButtonCOESimularClick(Sender: TObject);
var
  DescricaoCOE_Selecionada, TextoCOE: string;
  RendimentoPorcentagemCOE, TaxaCDI_COE: Double;
  IOF180 ,IOF360, IOF720, IOF_Mais720, ValorCOE_Final: Currency;
begin
  ValorCOE_Final := 0.0;
  ValidarDebentures;
  DescricaoCOE_Selecionada := PegarDescricaoCOE;
  TaxaCDI_COE := TCalculo.TaxaCDI_Radon;
  RendimentoPorcentagemCOE := TCalculo.TaxaCOE(SpinEditQtdDiasCOE.Value);

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicadoCOE.Text), RendimentoPorcentagemCOE);
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicadoCOE.Text), RendimentoPorcentagemCOE);
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicadoCOE.Text), RendimentoPorcentagemCOE);
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicadoCOE.Text), RendimentoPorcentagemCOE);

  if PegarTipoTaxaCOE = TaxaCapitalProtegido then
    ValorCOE_Final := TCalculo.COECapitalProtegido(StrToCurr(EditValorAplicadoCOE.Text), SpinEditQtdDiasCOE.Value, TaxaCDI_Aleatorio)
  else if PegarTipoTaxaCOE = TaxaCapitalRisco then
    ValorCOE_Final := TCalculo.COECapitalRisco(StrToCurr(EditValorAplicadoCOE.Text), SpinEditQtdDiasCOE.Value, TaxaCDI_COE)
  else
    EvalidationErrorMsg('Error');

  TextoCOE := FGravarArquivo.TextoPadraoCOE(EditValorAplicadoCOE.Text, PegarTipoCOE, DescricaoCOE_Selecionada, PegarTipoTaxaCOE,
    RendimentoPorcentagemCOE, TaxaCDI_COE, IOF180, IOF360, IOF720, IOF_Mais720, ValorCOE_Final, SpinEditQtdDiasCOE.Value);

  GravarSimulacoesPadrao(PathArquivoCOE, TextoCOE);
end;

procedure TFormInvestimulator.ButtonDebenturesSimularClick(Sender: TObject);
begin
  SimularDebentures;
end;

procedure TFormInvestimulator.ButtonLCSimularClick(Sender: TObject);
begin
  SimularLCs;
end;

procedure TFormInvestimulator.ButtonSimularPoupancaClick(Sender: TObject);
begin
  SimularPoupanca;
end;

procedure TFormInvestimulator.ButtonSimularrCDBClick(Sender: TObject);
begin
  SimularCDB;
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

procedure TFormInvestimulator.EditValorAplicadoCDBKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicadoCDB.Text);
end;

procedure TFormInvestimulator.EditValorAplicadoCOEKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicadoCOE.Text);
end;

procedure TFormInvestimulator.EditValorAplicadoDebenturesKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicadoDebentures.Text);
end;

procedure TFormInvestimulator.EditValorAplicadoLCsKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicadoLCs.Text);
end;

procedure TFormInvestimulator.EditValorAplicadoTDKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarCurrencyImput(Key, EditValorAplicadoTD.Text);
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

procedure TFormInvestimulator.GravarSimulacoesPadrao(PathArquivoSimulado, Conteudo: string);
begin
  if (not PathArquivoSimulado.IsEmpty) and (not Conteudo.IsEmpty) then
  begin
    FGravarArquivo.GravarTxt(PathArquivoSimulado, Conteudo);
    LimparCampos;
    LerDadosMemo;
    ShowMessage(SimulacaoSucesso);
  end
  else
    EvalidationErrorMsg('Error');
end;

procedure TFormInvestimulator.InserirValoresCombo(ComboBox: TComboBox);
const
  FundoLCI: array[0..4] of string = ('Hipotecas', 'Financiamentos', 'Reformas', 'Vendas', 'Aluguéis');
  FundoLCA: array[0..5] of string = ('Pecuária', 'Agricultura', 'Agronegócios', 'Insumos/Sementes',
    'Serviços Agropecuários','Comercialização/Industrialização');
  FundoLC = 'Crédito Consiginado';
  BancosEmissores: array[0..20] of string = ('Banco do Brasil', 'Caixa Econômica Federal', 'Itaú Unibanco',
    'Bradesco', 'BNDES', 'Santander', 'BTG Pactual', 'HSBC', 'Banco Mercantil do Brasil', 'Safra', 'Banco Votorantim',
    'Citi', 'Banrisul', 'BNP Paribas', 'Credit Suisse', 'Banco do Nordeste', 'JP Morgan', 'Société Générale', 'Sicredi',
    'Banco Pan', 'Bancoob');
var
  ContadorFundos: Integer;
begin
  ContadorFundos := 0;
  if RadioButtonLCI.Checked or RadioButtonCOE_LCI.Checked then
  begin
    ComboBox.Clear;
    while ContadorFundos < Length(FundoLCI) do
    begin
      ComboBox.Items.Add(FundoLCI[ContadorFundos]);
      Inc(ContadorFundos);
    end;
  end
  else if RadioButtonLCA.Checked or RadioButtonCOE_LCA.Checked then
  begin
    ComboBox.Clear;
    while ContadorFundos < Length(FundoLCA) do
    begin
      ComboBox.Items.Add(FundoLCA[ContadorFundos]);
      Inc(ContadorFundos);
    end;
  end
  else if RadioButtonLC.Checked or RadioButtonCOE_LC.Checked then
  begin
    ComboBox.Clear;
    ComboBox.Items.Add(FundoLC);
    ComboBox.ItemIndex := 0;
  end
  else if RadioButtonCOE_CDB.Checked then
  begin
    ComboBox.Clear;
    while ContadorFundos < Length(BancosEmissores) do
    begin
      ComboBox.Items.Add(BancosEmissores[ContadorFundos]);
      Inc(ContadorFundos);
    end;
  end
  else
    EvalidationErrorMsg('Error');
end;

procedure TFormInvestimulator.LerDadosMemo;
begin
  MemoTodosInvestimentos.Lines.LoadFromFile(PathTodosInvestimentos);
  MemoTesouroDireto.Lines.LoadFromFile(PathArquivoTesouroDireto);
  MemoPoupanca.Lines.LoadFromFile(PathArquivoPoupanca);
  MemoCDB.Lines.LoadFromFile(PathArquivoCertificadoDepositoBancario);
  MemoLC.Lines.LoadFromFile(PathArquivoCertificadoLetrasCreditos);
  MemoDebentures.Lines.LoadFromFile(PathArquivoDebentures);
  MemoCOE.Lines.LoadFromFile(PathArquivoCOE);
end;

procedure TFormInvestimulator.LimparCampos;
begin
  RadioButtonSelic.Checked := False;
  RadioButtonPrefixadoSemestrais.Checked := False;
  RadioButtonPrefixado.Checked := False;
  RadioButtonIPCA.Checked := False;
  RadioButtonIPCASemestrais.Checked := False;
  RadioButtonTaxaPreTD.Checked := False;
  RadioButtonTaxaPosTD.Checked := False;
  EditValorAplicadoTD.Clear;
  SpinEditQtdDiasTD.Clear;

  EditValorAplicadoPoupanca.Clear;
  SpinEditQtdDiasPoupanca.Clear;

  EditValorAplicadoCDB.Clear;
  SpinEditQtdDiasCDB.Clear;
  RadioButtonTaxaPreCDB.Checked := False;
  RadioButtonTaxaPosCDB.Checked := False;
  ComboBoxCDBBancos.ItemIndex := -1;

  EditValorAplicadoLCs.Clear;
  SpinEditQtdDiasLCs.Clear;
  ComboBoxLCsFundosInvestimento.Clear;
  RadioButtonLCI.Checked := False;
  RadioButtonLCA.Checked := False;
  RadioButtonLC.Checked := False;
  RadioButtonTaxaPreLC.Checked := False;
  RadioButtonTaxaPosLC.Checked := False;

  RadioButtonDebenturesSimples.Checked := False;
  RadioButtonDebenturesNominativas.Checked := False;
  RadioButtonDebenturesEscriturais.Checked := False;
  RadioButtonDebenturesConversiveis.Checked := False;
  RadioButtonDebenturesPermutaveis.Checked := False;
  EditValorAplicadoDebentures.Clear;
  SpinEditQtdDiasDebentures.Clear;
  RadioButtonTaxaPreDebentures.Checked := False;
  RadioButtonTaxaPosDebentures.Checked := False;

  RadioButtonCOE_LC.Checked := False;
  RadioButtonCOE_LCA.Checked := False;
  RadioButtonCOE_LCI.Checked := False;
  RadioButtonCOE_CDB.Checked := False;
  EditValorAplicadoCOE.Clear;
  SpinEditQtdDiasCOE.Clear;
  RadioButtonCapitalProtegidoCOE.Checked := False;
  RadioButtonCapitalRiscoCOE.Checked := False;
  ComboBoxFundosCOE.Clear;
end;

function TFormInvestimulator.PegarComboBase(ItemSelecionado: Integer; TextoSelecionado, MsgError: string): string;
const
  NenhumItemSelecionado = -1;
begin
  if (ItemSelecionado = NenhumItemSelecionado) then
    EvalidationErrorMsg(MsgError)
  else
    Exit(TextoSelecionado);
end;

function TFormInvestimulator.PegarDescricaoDebentures: string;
begin
  if PegarTipoDebentures = DebenturesNominativas then
    Exit(DescricaoDebenturesNominativos)
  else if PegarTipoDebentures = DebenturesEscriturais then
    Exit(DescicaoDebenturesEscriturais)
  else if PegarTipoDebentures = DebenturesSimples then
    Exit(DescicaoDebenturesSimples)
  else if PegarTipoDebentures = DebenturesConversiveis then
    Exit(DescricaoDebenturesConversiveis)
  else if PegarTipoDebentures = DebenturesPermutaveis then
     Exit(DescricaoDebeturesPermutaveis)
  else
    EvalidationErrorMsg(Format(MsgSelecionarAlgumTipo, [Debentures]));
end;

function TFormInvestimulator.PegarFundoCOE: string;
begin
  Result := PegarComboBase(ComboBoxFundosCOE.ItemIndex, ComboBoxFundosCOE.Text, Format(MsgSelecionarAlgumTipo, [BancoEmissorCDB]));
end;

function TFormInvestimulator.PegarFundoLCs: string;
begin
  Result := PegarComboBase(ComboBoxLCsFundosInvestimento.ItemIndex, ComboBoxLCsFundosInvestimento.Text, Format(MsgSelecionarAlgumTipo, [FundoInvestimentoLCs]));
end;

function TFormInvestimulator.PegarBancoCDB: string;
begin
  Result := PegarComboBase(ComboBoxCDBBancos.ItemIndex, ComboBoxCDBBancos.Text, Format(MsgSelecionarAlgumTipo, [CertificadoOperacoesEstruturais]));
end;

function TFormInvestimulator.PegarTipoCOE: string;
begin
  if RadioButtonCOE_LC.Checked then
    Exit(RadioButtonCOE_LC.Caption)
  else if RadioButtonCOE_LCA.Checked then
    Exit(RadioButtonCOE_LCA.Caption)
  else if RadioButtonCOE_LCI.Checked then
    Exit(RadioButtonCOE_LCI.Caption)
  else if RadioButtonCOE_CDB.Checked then
    Exit(RadioButtonCOE_CDB.Caption)
  else
    EvalidationErrorMsg(Format(MsgSelecionarAlgumTipo, [CertificadoOperacoesEstruturais]));
end;

function TFormInvestimulator.PegarDescricaoCOE: string;
const
  SiglaCDB = 'CDB';
  OrgaoEmissor = 'Orgão emissor %s Escolhido foi: ';
begin
  if RadioButtonCOE_LC.Checked then
    Exit(LetraCredito + ' - ' + LetraCambio + sLineBreak + ' -> ' + Format(OrgaoEmissor, ['da ' + LetraCredito]) + PegarFundoCOE)
  else if RadioButtonCOE_LCA.Checked then
    Exit(LetraCredito + ' - ' + LetraCreditoAgropecuario + sLineBreak + ' -> ' + Format(OrgaoEmissor, ['da ' + LetraCredito]) + PegarFundoCOE)
  else if RadioButtonCOE_LCI.Checked then
    Exit(LetraCredito + ' - ' + LetraCreditoImobiliario + sLineBreak + ' -> ' + Format(OrgaoEmissor, ['da ' + LetraCredito]) + PegarFundoCOE)
  else if RadioButtonCOE_CDB.Checked then
    Exit(CertificadoDepositoBancario + ' - ' + SiglaCDB + sLineBreak + ' -> ' + Format(OrgaoEmissor, ['do CDB ']) + PegarFundoCOE)
  else
    EvalidationErrorMsg(Format(MsgSelecionarAlgumTipo, [CertificadoOperacoesEstruturais]));
end;

function TFormInvestimulator.PegarTipoDebentures: string;
begin
  if RadioButtonDebenturesNominativas.Checked then
    Exit(DebenturesNominativas)
  else if RadioButtonDebenturesEscriturais.Checked then
    Exit(DebenturesEscriturais)
  else if RadioButtonDebenturesSimples.Checked then
    Exit(DebenturesSimples)
  else if RadioButtonDebenturesConversiveis.Checked then
    Exit(DebenturesConversiveis)
  else if (RadioButtonDebenturesPermutaveis.Checked) then
     Exit(DebenturesPermutaveis)
  else
    EvalidationErrorMsg(Format(MsgSelecionarAlgumTipo, [Debentures]));
end;

function TFormInvestimulator.PegarTipoLCs: string;
begin
  if RadioButtonLCI.Checked then
    Exit(LetraCreditoImobiliario)
  else if RadioButtonLCA.Checked then
    Exit(LetraCreditoAgropecuario)
  else if RadioButtonLC.Checked then
    Exit(LetraCambio)
  else
    EvalidationErrorMsg(Format(MsgSelecionarAlgumTipo, [LetraCredito]));
end;

function TFormInvestimulator.PegarTipoTaxaBase(RadioPreFixado, RadioPosFixado: Boolean; TextoTaxa1, TextoTaxa2: string): string;
begin
  if RadioPreFixado then
    Exit(TextoTaxa1)
  else if RadioPosFixado then
    Exit(TextoTaxa2)
  else
    EvalidationErrorMsg(TaxaAplicacaoNecessario);
end;

function TFormInvestimulator.PegarTipoTaxaCDB: string;
begin
  Result := PegarTipoTaxaBase(RadioButtonTaxaPreCDB.Checked, RadioButtonTaxaPosCDB.Checked);
end;

function TFormInvestimulator.PegarTipoTaxaCOE: string;
begin
  Result := PegarTipoTaxaBase(RadioButtonCapitalProtegidoCOE.Checked, RadioButtonCapitalRiscoCOE.Checked,
    TaxaCapitalProtegido, TaxaCapitalRisco);
end;

function TFormInvestimulator.PegarTipoTaxaDebentures: string;
begin
  Result := PegarTipoTaxaBase(RadioButtonTaxaPreDebentures.Checked, RadioButtonTaxaPosDebentures.Checked);
end;

function TFormInvestimulator.PegarTipoTaxaLCs: string;
begin
  Result := PegarTipoTaxaBase(RadioButtonTaxaPreLC.Checked, RadioButtonTaxaPosLC.Checked);
end;

function TFormInvestimulator.PegarTipoTaxaTD: string;
begin
  Result := PegarTipoTaxaBase(RadioButtonTaxaPreTD.Checked, RadioButtonTaxaPosTD.Checked);
end;

function TFormInvestimulator.PegarTipoTD: string;
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
    EvalidationErrorMsg(Format(MsgSelecionarAlgumTipo, [TesouroDireto]));
end;

procedure TFormInvestimulator.RadioButtonCOE_CDBClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxFundosCOE);
end;

procedure TFormInvestimulator.RadioButtonCOE_LCAClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxFundosCOE);
end;

procedure TFormInvestimulator.RadioButtonCOE_LCClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxFundosCOE);
end;

procedure TFormInvestimulator.RadioButtonCOE_LCIClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxFundosCOE);
end;

procedure TFormInvestimulator.RadioButtonLCAClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxLCsFundosInvestimento);
end;

procedure TFormInvestimulator.RadioButtonLCClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxLCsFundosInvestimento);
end;

procedure TFormInvestimulator.RadioButtonLCIClick(Sender: TObject);
begin
  InserirValoresCombo(ComboBoxLCsFundosInvestimento);
end;

procedure TFormInvestimulator.SimularCDB;
var
  BancoSelecionado, TextoCDB: string;
  RendimentoPorcentagemCDB, TaxaCDI_CDB: Double;
  IOF180 ,IOF360, IOF720, IOF_Mais720, ValorCDBFinal: Currency;
begin
  ValorCDBFinal := 0.0;
  ValidarCDB;
  BancoSelecionado := PegarBancoCDB;
  TaxaCDI_CDB := TCalculo.TaxaCDI_Radon;
  RendimentoPorcentagemCDB := TCalculo.TaxaCDB(SpinEditQtdDiasCDB.Value);

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicadoCDB.Text), RendimentoPorcentagemCDB);
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicadoCDB.Text), RendimentoPorcentagemCDB);
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicadoCDB.Text), RendimentoPorcentagemCDB);
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicadoCDB.Text), RendimentoPorcentagemCDB);

  if PegarTipoTaxaCDB = TaxaPreFixado then
    ValorCDBFinal := TCalculo.CertificadoDepositoBancarioPre(StrToCurr(EditValorAplicadoCDB.Text),
      SpinEditQtdDiasCDB.Value, TaxaCDI_Aleatorio)
  else if PegarTipoTaxaCDB = TaxaPosFixado then
    ValorCDBFinal := TCalculo.CertificadoDepositoBancarioPos(StrToCurr(EditValorAplicadoCDB.Text),
      SpinEditQtdDiasCDB.Value, TaxaCDI_CDB)
  else
    EvalidationErrorMsg('Error');

  TextoCDB := FGravarArquivo.TextoPadraoCertificadoDepositoBancario(EditValorAplicadoCDB.Text, PegarTipoTaxaCDB,
    BancoSelecionado, RendimentoPorcentagemCDB, TaxaCDI_CDB, IOF180, IOF360, IOF720, IOF_Mais720, ValorCDBFinal, SpinEditQtdDiasCDB.Value);

  GravarSimulacoesPadrao(PathArquivoCertificadoDepositoBancario, TextoCDB);
end;

procedure TFormInvestimulator.SimularDebentures;
var
  DescricaoDebenturesSelecionada, TextoDebentures: string;
  RendimentoPorcentagemDebentures, TaxaCDI_Debentures: Double;
  IOF180 ,IOF360, IOF720, IOF_Mais720, ValorDebenturesFinal: Currency;
begin
  ValorDebenturesFinal := 0.0;
  ValidarDebentures;
  DescricaoDebenturesSelecionada := PegarDescricaoDebentures;
  TaxaCDI_Debentures := TCalculo.TaxaCDI_Radon;
  RendimentoPorcentagemDebentures := TCalculo.TaxaDebentures(SpinEditQtdDiasDebentures.Value);

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicadoDebentures.Text), RendimentoPorcentagemDebentures);
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicadoDebentures.Text), RendimentoPorcentagemDebentures);
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicadoDebentures.Text), RendimentoPorcentagemDebentures);
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicadoDebentures.Text), RendimentoPorcentagemDebentures);

  if PegarTipoTaxaDebentures = TaxaPreFixado then
    ValorDebenturesFinal := TCalculo.DebenturesPre(StrToCurr(EditValorAplicadoDebentures.Text), SpinEditQtdDiasDebentures.Value, TaxaCDI_Aleatorio)
  else if PegarTipoTaxaDebentures = TaxaPosFixado then
    ValorDebenturesFinal := TCalculo.DebenturesPos(StrToCurr(EditValorAplicadoDebentures.Text), SpinEditQtdDiasDebentures.Value, TaxaCDI_Debentures)
  else
    EvalidationErrorMsg('Error');

  TextoDebentures := FGravarArquivo.TextoPadraoDebentures(EditValorAplicadoDebentures.Text, PegarTipoDebentures, PegarDescricaoDebentures, PegarTipoTaxaDebentures,
    RendimentoPorcentagemDebentures, TaxaCDI_Debentures, IOF180, IOF360, IOF720, IOF_Mais720, ValorDebenturesFinal, SpinEditQtdDiasDebentures.Value);

  GravarSimulacoesPadrao(PathArquivoDebentures, TextoDebentures);
end;

procedure TFormInvestimulator.SimularLCs;
var
  FundoSelecionado, TextoLCs: string;
  RendimentoPorcentagemLCs, TaxaCDI_LCs: Double;
  IOF180 ,IOF360, IOF720, IOF_Mais720, ValorLCsFinal: Currency;
begin
  ValorLCsFinal := 0.0;
  ValidarLCs;
  FundoSelecionado := PegarFundoLCs;
  TaxaCDI_LCs := TCalculo.TaxaCDI_Radon;
  RendimentoPorcentagemLCs := TCalculo.TaxaLCs(SpinEditQtdDiasLCs.Value);

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicadoLCs.Text), RendimentoPorcentagemLCs);
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicadoLCs.Text), RendimentoPorcentagemLCs);
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicadoLCs.Text), RendimentoPorcentagemLCs);
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicadoLCs.Text), RendimentoPorcentagemLCs);

  if PegarTipoTaxaLCs = TaxaPreFixado then
    ValorLCsFinal := TCalculo.LetrasCreditosPre(StrToCurr(EditValorAplicadoLCs.Text), SpinEditQtdDiasLCs.Value, TaxaCDI_Aleatorio)
  else if PegarTipoTaxaLCs = TaxaPosFixado then
    ValorLCsFinal := TCalculo.LetrasCreditosPos(StrToCurr(EditValorAplicadoLCs.Text), SpinEditQtdDiasLCs.Value, TaxaCDI_LCs)
  else
    EvalidationErrorMsg('Error');

  TextoLCs := FGravarArquivo.TextoPadraoLetrasCreditos(EditValorAplicadoLCs.Text, PegarTipoLCs, FundoSelecionado, PegarTipoTaxaLCs,
    RendimentoPorcentagemLCs, TaxaCDI_LCs, IOF180, IOF360, IOF720, IOF_Mais720, ValorLCsFinal, SpinEditQtdDiasLCs.Value);

  GravarSimulacoesPadrao(PathArquivoCertificadoLetrasCreditos, TextoLCs);
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
  ValorFinal := TCalculo.Poupanca(StrToCurr(EditValorAplicadoPoupanca.Text), SpinEditQtdDiasPoupanca.Value, TaxaCDIFinal);

  TextoPoupanca := FGravarArquivo.TextoPadraoPoupanca(EditValorAplicadoPoupanca.Text, TaxaPoupancaFinal,
    TaxaCDIFinal, ValorFinal, SpinEditQtdDiasPoupanca.Value);

  GravarSimulacoesPadrao(PathArquivoPoupanca, TextoPoupanca);
end;

procedure TFormInvestimulator.SimularTesouroDireto;
var
  ValorFinal: Currency;
  TaxaSelicFinal, TaxaCDIFinal: Double;
  IOF180, IOF360, IOF720, IOF_Mais720: Currency;
  TextoTesouroDireto: string;
const
  RendimentoConvenvional: array[0..2] of string = (TesouroSelic, TesouroPrefixado, TesouroIPCA);
  RendimentoSemestral: array[0..1] of string = (TesouroPrefixadoSemestrais, TesouroIPCASemestrais);
begin
  ValorFinal := 0.0;
  ValidarTesouroDireto;
  TaxaCDIFinal := TCalculo.TaxaCDI_Radon;
  TaxaSelicFinal := TCalculo.TaxaSelic(SpinEditQtdDiasTD.Value);

  if PegarTipoTaxaTD = TaxaPreFixado then
  begin
    if MatchStr(PegarTipoTD, RendimentoConvenvional) then
      ValorFinal := TCalculo.TesouroSelicTaxasPre(StrToCurr(EditValorAplicadoTD.Text), SpinEditQtdDiasTD.Value, TaxaCDI_Aleatorio)
    else
      ValorFinal := TCalculo.TesouroSemestraisTaxasPre(StrToCurr(EditValorAplicadoTD.Text), SpinEditQtdDiasTD.Value, TaxaCDI_Aleatorio)
  end
  else if PegarTipoTaxaTD = TaxaPosFixado then
  begin
    if MatchStr(PegarTipoTD, RendimentoConvenvional) then
      ValorFinal := TCalculo.TesouroSelicTaxasPos(StrToCurr(EditValorAplicadoTD.Text), SpinEditQtdDiasTD.Value, TaxaCDIFinal)
    else
      ValorFinal := TCalculo.TesouroSemestraisTaxasPos(StrToCurr(EditValorAplicadoTD.Text), SpinEditQtdDiasTD.Value, TaxaCDIFinal)
  end
  else
    EvalidationErrorMsg('Erro');

  IOF180 := TCalculo.TesouroIOF_180(StrToCurr(EditValorAplicadoTD.Text), TaxaSelicFinal);
  IOF360 := TCalculo.TesouroIOF_360(StrToCurr(EditValorAplicadoTD.Text), TaxaSelicFinal);
  IOF720 := TCalculo.TesouroIOF_720(StrToCurr(EditValorAplicadoTD.Text), TaxaSelicFinal);
  IOF_Mais720 := TCalculo.TesouroIOF_Mais720(StrToCurr(EditValorAplicadoTD.Text), TaxaSelicFinal);

  TextoTesouroDireto := FGravarArquivo.TextoPadraoTesouroDireto(EditValorAplicadoTD.Text, PegarTipoTD, PegarTipoTaxaTD,
    TaxaSelicFinal, TaxaCDIFinal, IOF180, IOF360, IOF720, IOF_Mais720, ValorFinal, SpinEditQtdDiasTD.Value);

  GravarSimulacoesPadrao(PathArquivoTesouroDireto, TextoTesouroDireto);
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

procedure TFormInvestimulator.ValidarValor_Dias(Valor: string; Dias: Integer);
begin
  if Valor = EmptyStr then
    EvalidationErrorMsg(ValorAplicadoInvalido)
  else if Dias <= 0 then
    EvalidationErrorMsg(QuantidadeInvalida);
end;

procedure TFormInvestimulator.ValidarPoupanca;
begin
  ValidarValor_Dias(EditValorAplicadoPoupanca.Text, SpinEditQtdDiasPoupanca.Value);
end;

procedure TFormInvestimulator.ValidarTesouroDireto;
begin
  ValidarValor_Dias(EditValorAplicadoTD.Text, SpinEditQtdDiasTD.Value);
end;

procedure TFormInvestimulator.ValidarCDB;
begin
  ValidarValor_Dias(EditValorAplicadoCDB.Text, SpinEditQtdDiasCDB.Value);
end;

procedure TFormInvestimulator.ValidarLCs;
begin
  ValidarValor_Dias(EditValorAplicadoLCs.Text, SpinEditQtdDiasLCs.Value);
end;

procedure TFormInvestimulator.ValidarDebentures;
begin
  ValidarValor_Dias(EditValorAplicadoDebentures.Text, SpinEditQtdDiasDebentures.Value);
end;

end.
