unit UnitDadosUtils;

interface

const
  PathTodosInvestimentos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TodosInvestimentos.txt';
  PathArquivoTesouroDireto = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TesouroDireto.txt';
  PathArquivoPoupanca = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\Poupanca.txt';
  PathArquivoCertificadoDepositoBancario = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\CertificadoDepositoBancario.txt';
  PathArquivoCertificadoLetrasCreditos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\LetrasCreditos.txt';
  PathArquivoDebentures = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\Debentures.txt';

  TaxaPreFixado = 'Pré-fixado';
  TaxaPosFixado = 'Pós-fixado';
  TesouroDireto = 'Tesouro Direto';
  TesouroSelic = 'Tesouro Selic';
  TesouroPrefixado = 'Tesouro Prefixado (LTN)';
  TesouroPrefixadoSemestrais = 'Tesouro Prefixado com Juros Semestrais (NTN-F)';
  TesouroIPCA = 'Tesouro IPCA+ (NTN – B Principal)';
  TesouroIPCASemestrais = 'Tesouro IPCA+ Juros semestrais (NTN – B Principal)';
  Poupanca = 'Poupança';
  CertifucadoDepositoBancario = 'Certificado de Depósito Bancário';
  LetraCredito = 'Letra de Crédito';
  LetraCreditoImobiliario = 'Letra de Crédito Imobiliário';
  LetraCreditoAgropecuario = 'Letra de Crédito Agropecuário';
  LetraCambio = 'Letra de Câmbio';
  BancoEmissorCDB = 'Banco Emissor';
  FundoInvestimentoLCs = 'Fundo de investimento';
  Debentures = 'Debêntures';
  DebenturesNominativas = 'Debêntures Nominativas';
  DebenturesEscriturais = 'Debêntures Escriturais';
  DebenturesSimples = 'Debentures Simples';
  DebenturesConversiveis = 'Debentures Conversíveis';
  DebenturesPermutaveis = 'Debêntures Permutáveis';

  SimulacaoSucesso = 'Simulação feita com Sucesso!';
  DescricaoDebenturesNominativos = 'Utiliza um banco de dados, demonstrando todo histórico'
    + ' dos investimentos,' + sLineBreak + ' -> transferências e investidores. A empresa que faz todo manuseamento dos dados.';
  DescicaoDebenturesEscriturais = 'Utiliza um banco de dados, porem são manuseadosguardados e gerenciados'
    + sLineBreak + ' -> por terceiros.';
  DescicaoDebenturesSimples = 'É o mais simples, pois sua aplicação e finalidade'
   + ' é simplesmente servir crédito' + sLineBreak + ' -> para quem precisa, nada mais que isso.';
  DescricaoDebenturesConversiveis = 'É um tipo de investimento que pode ou não ser convertido'
   + ' em algo, como por' + sLineBreak + ' -> exemplo as ações somente daquela empresa.';
  DescricaoDebeturesPermutaveis = 'É um tipo de investimento que pode ou não ser convertido'
   + ' em algo,como por' + sLineBreak + ' -> exemplo as ações, porem pode ser investido em outras empresas.';

  FGC = 'FGC - Fundo Garantidor de Créditos';
  FGCValor = 'Seu investimento está assegurado até R$ 250 mil por instituição de aplicação';

  MsgSelecionarAlgumTipo = 'É necessário selecionar um %s simular';
  ValorAplicadoInvalido = 'O Valor aplicado não pode ser vazio';
  QuantidadeInvalida = 'A quantidade de dias deve ser maior que 0';
  TaxaAplicacaoNecessario = 'É preciso selecionar um tipo de Taxa para o investimento';

  PorcentagemIOF_180 = 00.225;
  PorcentagemIOF_360 = 00.22;
  PorcentagemIOF_720 = 00.175;
  PorcentagemIOF_Mais720 = 00.15;

  TaxaCDI_Aleatorio = 0.4;
  TaxaSelicAnual = 0.6; {https://br.advfn.com/indicadores/taxa-selic}
  TaxaSelicMensal = 0.043;
  TaxaPoupancaAnual = 0.42; {https://blog.magnetis.com.br/rendimento-da-poupanca-hoje-e-ruim/}
  TaxaPoupancaMensal = 0.034;
  TaxaCDBAnual = 0.65;
  TaxaCDBMensal = 0.053;
  TaxaLCsAnual = 0.68;
  TaxaLCsMensal = 0.056;
  TaxaDebenturesAnual = 0.69;
  TaxaDebenturesMensal = 0.057;

  BaseTaxaPosFixadoTD = 0.15;
  BaseTaxaPreFixadoTD = 0.24;
  BaseTaxaPosFixadoCDB = 0.2;
  BaseTaxaPreFixadoCDB = 0.3;
  BaseTaxaPosFixadoLCs = 0.23;
  BaseTaxaPreFixadoLCs = 0.34;
  BaseTaxaPosFixadoDebentures = 0.27;
  BaseTaxaPreFixadoDebentures = 0.39;

implementation

end.
