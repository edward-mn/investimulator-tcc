unit UnitDadosUtils;

interface

const
  PathTodosInvestimentos = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TodosInvestimentos.txt';
  PathArquivoTesouroDireto = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\TesouroDireto.txt';
  PathArquivoPoupanca = 'C:\Users\Edward\Desktop\dev\investimulator_tcc\Investimentos\Poupanca.txt';

  TesouroDireto = 'Tesouro Direto';
  TesouroSelic = 'Tesouro Selic';
  TesouroPrefixado = 'Tesouro Prefixado (LTN)';
  TesouroPrefixadoSemestrais = 'Tesouro Prefixado com Juros Semestrais (NTN-F)';
  TesouroIPCA = 'Tesouro IPCA+ (NTN – B Principal)';
  TesouroIPCASemestrais = 'Tesouro IPCA+ Juros semestrais (NTN – B Principal)';
  Poupanca = 'Poupança';

  PorcentagemIOF_180 = 00.225;
  PorcentagemIOF_360 = 00.22;
  PorcentagemIOF_720 = 00.175;
  PorcentagemIOF_Mais720 = 00.15;

  TaxaSelicAnual = 0.55; {https://br.advfn.com/indicadores/taxa-selic}
  TaxaSelicMensal = 0.043;
  TaxaPoupancaAnual = 0.42; {https://blog.magnetis.com.br/rendimento-da-poupanca-hoje-e-ruim/}
  TaxaPoupancaMensal = 0.034;
  TaxaPreFixado = 'Pré-fixado';
  TaxaPosFixado = 'Pós-fixado';

  ValorAplicadoInvalido = 'O Valor aplicado não pode ser vazio';
  QuantidadeInvalida = 'A quantidade de dias deve ser maior que 0';
  TesouroSelicNecessario = 'É preciso selecionar um tipo do Tesouro Direto';
  TaxaAplicacaoNecessario = 'É preciso selecionar um tipo de Taxa para o investimento';

implementation

end.
