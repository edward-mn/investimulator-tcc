unit UnitDadosUtils;

interface

const
  PathTodosInvestimentos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TodosInvestimentos.txt';
  PathArquivoTesouroDireto = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TesouroDireto.txt';
  PathArquivoPoupanca = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\Poupanca.txt';
  PathArquivoCertificadoDepositoBancario = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\CertificadoDepositoBancario.txt';
  PathArquivoCertificadoLetrasCreditos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\LetraCredito.txt';

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

  FGC = 'FGC - Fundo Garantidor de Créditos';
  FGCValor = 'Seu investimento está assegurado até R$ 250 mil por instituição de aplicação';

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
  TaxaPreFixado = 'Pré-fixado';
  TaxaPosFixado = 'Pós-fixado';

  ValorAplicadoInvalido = 'O Valor aplicado não pode ser vazio';
  QuantidadeInvalida = 'A quantidade de dias deve ser maior que 0';
  TesouroSelicNecessario = 'É preciso selecionar um tipo do Tesouro Direto';
  LetraCreditoNecessario = 'É preciso selecionar um tipo de Letra de Crédito';
  TaxaAplicacaoNecessario = 'É preciso selecionar um tipo de Taxa para o investimento';

  SelecionarBanco = 'É necessário selecionar um Banco para simular';
  SelecionarFundoLCs = 'É necessário selecionar um Fundo para simular';

implementation

end.
