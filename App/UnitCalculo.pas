unit UnitCalculo;

interface

type
  TCalculo = class
  private
    class function ValorFinalBasePosFixado(ValorAplicado: Currency; TipoRendimento, TaxaCDI: Double): Currency;
    class function ValorFinalBasePreFixado(ValorAplicado: Currency; TipoRendimento, TaxaCDI: Double): Currency;
    class function ValorFinalBase(ValorAplicado: Currency; TipoRendimento, TaxaCDI, TaxaInvestimento: Double): Currency;
    class function TaxaIOF_Base(ValorAplicado: Currency; QtdDias: Integer; Porcentagem, TaxaTipoRendimento: Double): Currency;
  public
    class function RendimentoPadrao(DiasAplicado: Integer; TaxaAnual: Double = 1; TaxaMensal: Double = 1;
       DiasBaseRendimento: Integer = 360): double;
    class function RendimentoSemestral(Dias: Integer): double;
    class function TaxaCDI_Radon: Double;
    class function TaxaSelic(Dias: integer): double;
    class function TaxaPoupanca(Dias: integer): double;
    class function TaxaCDB(Dias: integer): double;
    class function TaxaLCs(Dias: integer): double;
    class function TaxaDebentures(Dias: Integer): double;
    class function TaxaCOE(Dias: Integer): double;
    class function TesouroSelicTaxasPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function TesouroSelicTaxasPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function TesouroSemestraisTaxasPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function TesouroSemestraisTaxasPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function Poupanca(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function CertificadoDepositoBancarioPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function CertificadoDepositoBancarioPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function LetrasCreditosPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function LetrasCreditosPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function DebenturesPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function DebenturesPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function COECapitalRisco(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function COECapitalProtegido(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
    class function TesouroIOF_180(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
    class function TesouroIOF_360(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
    class function TesouroIOF_720(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
    class function TesouroIOF_Mais720(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
  end;


implementation

uses
  UnitDadosUtils,
  System.Math;

{ TCalculo }

class function TCalculo.RendimentoPadrao(DiasAplicado: Integer; TaxaAnual, TaxaMensal: Double; DiasBaseRendimento: Integer): double;
var
  TipoTaxaAnual, TipoTaxaMensal, Divisao: Double;
const
  TresCasasAposVirgula = -3;
begin
  Divisao := (DiasAplicado/DiasBaseRendimento);
  TipoTaxaAnual := Trunc(Divisao) * TaxaAnual;
  TipoTaxaMensal := Frac(Divisao) * TaxaMensal;
  Result := RoundTo((TipoTaxaAnual + TipoTaxaMensal), TresCasasAposVirgula);
end;

class function TCalculo.ValorFinalBase(ValorAplicado: Currency; TipoRendimento,
  TaxaCDI, TaxaInvestimento: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorDaTaxa := TaxaCDI + TipoRendimento + TaxaInvestimento;
  ValorComTaxa := ValorAplicado * ValorDaTaxa;

  Result := ValorComTaxa + ValorAplicado;
end;

class function TCalculo.ValorFinalBasePosFixado(ValorAplicado: Currency; TipoRendimento, TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TipoRendimento, TaxaCDI, BaseTaxaPosFixadoTD);
end;

class function TCalculo.ValorFinalBasePreFixado(ValorAplicado: Currency; TipoRendimento, TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TipoRendimento, TaxaCDI, BaseTaxaPreFixadoTD);
end;

class function TCalculo.TaxaIOF_Base(ValorAplicado: Currency; QtdDias: Integer; Porcentagem, TaxaTipoRendimento: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorComTaxa := TaxaTipoRendimento + Porcentagem + (QtdDias * 0.001);
  ValorDaTaxa := ValorComTaxa * ValorAplicado;

  Result := ValorAplicado + ValorDaTaxa;
end;

class function TCalculo.TaxaDebentures(Dias: Integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaDebenturesAnual,TaxaDebenturesMensal);
end;

class function TCalculo.TaxaLCs(Dias: integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaLCsAnual, TaxaLCsMensal);
end;

class function TCalculo.TaxaPoupanca(Dias: integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaPoupancaAnual, TaxaPoupancaMensal);
end;

class function TCalculo.TaxaSelic(Dias: integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaSelicAnual, TaxaSelicMensal);
end;

class function TCalculo.CertificadoDepositoBancarioPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaCDB(Dias), TaxaCDI, BaseTaxaPosFixadoCDB);
end;

class function TCalculo.CertificadoDepositoBancarioPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaCDB(Dias), TaxaCDI, BaseTaxaPreFixadoCDB);
end;

class function TCalculo.COECapitalProtegido(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaCOE(Dias), TaxaCDI, BaseTaxaProtegidoCOE);
end;

class function TCalculo.COECapitalRisco(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaCOE(Dias), TaxaCDI, BaseTaxaRiscoCOE);
end;

class function TCalculo.DebenturesPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaDebentures(Dias), TaxaCDI, BaseTaxaPosFixadoDebentures);
end;

class function TCalculo.DebenturesPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaDebentures(Dias), TaxaCDI, BaseTaxaPreFixadoDebentures);
end;

class function TCalculo.LetrasCreditosPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaLCs(Dias), TaxaCDI, BaseTaxaPosFixadoLCs);
end;

class function TCalculo.LetrasCreditosPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBase(ValorAplicado, TaxaLCs(Dias), TaxaCDI, BaseTaxaPreFixadoLCs);
end;

class function TCalculo.Poupanca(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorDaTaxa := TaxaPoupanca(Dias) * ValorAplicado;
  ValorComTaxa := ValorDaTaxa * TaxaCDI;

  Result := ValorComTaxa + ValorAplicado;
end;

class function TCalculo.RendimentoSemestral(Dias: Integer): double;
const
  UtilizaTaxaPadrao = 1;
begin
  Result := RendimentoPadrao(Dias, UtilizaTaxaPadrao, UtilizaTaxaPadrao, 180);
end;

class function TCalculo.TaxaCDB(Dias: integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaCDBAnual, TaxaCDBMensal);
end;

class function TCalculo.TaxaCOE(Dias: Integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaCOEAnual, TaxaCOEMensal);
end;

class function TCalculo.TaxaCDI_Radon: Double;
var
  CDI: Double;
begin
  CDI := TaxaSelicAnual - (Random(5) * 0.01);
  Result := CDI;
end;

class function TCalculo.TesouroIOF_180(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
begin
  Result := TaxaIOF_Base(ValorAplicado, 180, PorcentagemIOF_180, TaxaTipoRendimento);
end;

class function TCalculo.TesouroIOF_360(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
begin
  Result := TaxaIOF_Base(ValorAplicado, 360, PorcentagemIOF_360, TaxaTipoRendimento);
end;

class function TCalculo.TesouroIOF_720(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
begin
  Result := TaxaIOF_Base(ValorAplicado, 720, PorcentagemIOF_720, TaxaTipoRendimento)
end;

class function TCalculo.TesouroIOF_Mais720(ValorAplicado: Currency; TaxaTipoRendimento: Double): Currency;
var
  RandoMais720: Integer;
begin
  RandoMais720 := Random(1000) + 720;
  Result := TaxaIOF_Base(ValorAplicado, RandoMais720, PorcentagemIOF_Mais720, TaxaTipoRendimento);
end;

class function TCalculo.TesouroSelicTaxasPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBasePosFixado(ValorAplicado, TaxaSelic(Dias), TaxaCDI);
end;

class function TCalculo.TesouroSelicTaxasPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBasePreFixado(ValorAplicado, TaxaSelic(Dias), TaxaCDI);
end;

class function TCalculo.TesouroSemestraisTaxasPos(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBasePosFixado(ValorAplicado, RendimentoSemestral(Dias), TaxaCDI);
end;

class function TCalculo.TesouroSemestraisTaxasPre(ValorAplicado: Currency; Dias: Integer; TaxaCDI: Double): Currency;
begin
  Result := ValorFinalBasePreFixado(ValorAplicado, RendimentoSemestral(Dias), TaxaCDI);
end;

end.
