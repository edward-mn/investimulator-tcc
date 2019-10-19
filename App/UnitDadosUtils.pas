unit UnitDadosUtils;

interface

const
  PathTodosInvestimentos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TodosInvestimentos.txt';
  PathArquivoTesouroDireto = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TesouroDireto.txt';
  PathArquivoPoupanca = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\Poupanca.txt';
  PathArquivoCertificadoDepositoBancario = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\CertificadoDepositoBancario.txt';
  PathArquivoCertificadoLetrasCreditos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\LetrasCreditos.txt';
  PathArquivoDebentures = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\Debentures.txt';
  PathArquivoFundosInvestimentos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\FundosInvestimentos.txt';
  PathArquivoCOE = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\CertificadoOperacoesEstruturais.txt';

  TaxaPreFixado = 'Pré-fixado';
  TaxaPosFixado = 'Pós-fixado';
  TaxaCapitalProtegido = 'Capital Protegido';
  TaxaCapitalRisco = 'Capital em Risco';
  EmpresaTerceira = 'Empresa prestadora de Serviço';
  TesouroDireto = 'Tesouro Direto';
  TesouroSelic = 'Tesouro Selic';
  TesouroPrefixado = 'Tesouro Prefixado (LTN)';
  TesouroPrefixadoSemestrais = 'Tesouro Prefixado com Juros Semestrais (NTN-F)';
  TesouroIPCA = 'Tesouro IPCA+ (NTN – B Principal)';
  TesouroIPCASemestrais = 'Tesouro IPCA+ Juros semestrais (NTN – B Principal)';
  Poupanca = 'Poupança';
  CertificadoDepositoBancario = 'Certificado de Depósito Bancário';
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
  FundosInvestimento = 'Fundos de investimentos';
  FundosCurtoPrazo = 'Fundos de Curto Prazo';
  FundosLongoPrazo = 'Fundos de Longo Prazo';
  FundosCambiais = 'Fundos Cambiais';
  FundosAcoes = 'Fundos em ações';
  FundosImobiliários = 'Fundos de Investimento Imobiliários';
  FundosDividaExterna = 'Fundos de Dívida Externa';
  FundosMultimercado = 'Fundos Multimercado';
  CertificadoOperacoesEstruturais = 'Certificado de Operações Estruturadas';

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

  DescricaoFI_FundoAcoes = 'O dinheiro é aplicado na bolsa de valores.';
  DescricaoFI_CurtoLongoPrazo = 'Estão conectados ao Certificado de Depósito Interbancário (CDI).';
  DescricaoFI_FundosCambiais = 'São os investimentos feitos em câmbio, ou seja, em moedas estrangeiras.';
  DescricaoFI_FundosDividaExterna = 'A dívida externa seria uma junção dos juros de câmbio internacional e os' + sLineBreak +
    ' -> papéis das transações internacionais.';
  DescricaoFI_FundosMultimercado = 'O investidor possui alternativas de outros tipos de investimentos sem' + sLineBreak +
    ' -> ser exatamente oque foi investido.';
  DescricaoFI_FundosInvestimentoImobiliarios = 'O Fundo Imobiliário (FII) possui um profissional altamente' + sLineBreak +
    ' -> qualificado no ramo de Imóveis.';

  FGC = 'FGC - Fundo Garantidor de Créditos';
  FGCValor = 'Seu investimento está assegurado até R$ 250 mil por instituição de aplicação';
  CVM = 'CVM - Comissão de Valores Mobiliários';
  ANBIMA = 'ANBIMA - Associação Brasileira das Entidades dos Mercados Financeiros e de Capitais';

  MsgSelecionarAlgumTipo = 'É necessário selecionar um %s para simular';
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
  TaxaFIAnual = 0.72;
  TaxaFIEMensal = 0.060;
  TaxaCurtoPrazo = 0.35;
  TaxaLongoPrazo = 0.48;
  TaxaCOEAnual = 0.75;
  TaxaCOEMensal = 0.063;

  BaseTaxaPosFixadoTD = 0.15;
  BaseTaxaPreFixadoTD = 0.24;
  BaseTaxaPosFixadoCDB = 0.2;
  BaseTaxaPreFixadoCDB = 0.3;
  BaseTaxaPosFixadoLCs = 0.23;
  BaseTaxaPreFixadoLCs = 0.34;
  BaseTaxaPosFixadoDebentures = 0.27;
  BaseTaxaPreFixadoDebentures = 0.39;
  BaseTaxaCurtoPrazoFI = 0.31;
  BaseTaxaLongoPrazoFI = 0.44;
  BaseTaxaProtegidoCOE = 0.35;
  BaseTaxaRiscoCOE = 0.49;

implementation

end.
