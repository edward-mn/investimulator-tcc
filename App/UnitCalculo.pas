unit UnitCalculo;

interface

type
  TCalculo = class
  private
    class function ValorFinalBasePosFixado(ValorAplicado: Currency; TipoRendimento: Double): Currency;
    class function ValorFinalBasePreFixado(ValorAplicado: Currency; TipoRendimento: Double): Currency;
    class function TaxaIOF_Base(ValorAplicado: Currency; QtdDias: Integer; Porcentagem: Double): Currency;
  public
    class function RendimentoPadrao(DiasAplicado: Integer; TaxaAnual: Double = 1; TaxaMensal: Double = 1;
       DiasBaseRendimento :Integer = 360): double;
    class function RendimentoSemestral(Dias: Integer): double;
    class function TaxaCDI_Radon: Double;
    class function TaxaSelic(Dias: integer): double;
    class function TaxaPoupanca(Dias: integer): double;
    class function TesouroSelicTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroSelicTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroSemestraisTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroSemestraisTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
    class function Poupanca(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroIOF_180(ValorAplicado: Currency): Currency;
    class function TesouroIOF_360(ValorAplicado: Currency): Currency;
    class function TesouroIOF_720(ValorAplicado: Currency): Currency;
    class function TesouroIOF_Mais720(ValorAplicado: Currency): Currency;
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

class function TCalculo.ValorFinalBasePosFixado(ValorAplicado: Currency; TipoRendimento: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorDaTaxa := TaxaCDI_Radon * TipoRendimento;
  ValorComTaxa := (ValorAplicado * ValorDaTaxa);

  Result := ValorComTaxa + ValorAplicado;
end;

class function TCalculo.ValorFinalBasePreFixado(ValorAplicado: Currency; TipoRendimento: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorDaTaxa := TaxaCDI_Aleatorio * TipoRendimento;
  ValorComTaxa := (ValorAplicado * ValorDaTaxa);

  Result := ValorComTaxa + ValorAplicado;
end;

class function TCalculo.TaxaIOF_Base(ValorAplicado: Currency; QtdDias: Integer; Porcentagem: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorComTaxa := RendimentoPadrao(QtdDias) * ValorAplicado;;
  ValorDaTaxa := ValorComTaxa * Porcentagem;

  Result := ValorAplicado + ValorDaTaxa;
end;

class function TCalculo.TaxaPoupanca(Dias: integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaPoupancaAnual, TaxaPoupancaMensal);
end;

class function TCalculo.TaxaSelic(Dias: integer): double;
begin
  Result := RendimentoPadrao(Dias, TaxaSelicAnual, TaxaSelicMensal);
end;

class function TCalculo.Poupanca(ValorAplicado: Currency; Dias: Integer): Currency;
var
  ValorComTaxa, ValorDaTaxa: Currency;
begin
  ValorDaTaxa := TaxaPoupanca(Dias) * ValorAplicado;
  ValorComTaxa := ValorDaTaxa * TaxaCDI_Radon;

  Result := ValorComTaxa + ValorAplicado;
end;

class function TCalculo.RendimentoSemestral(Dias: Integer): double;
const
  UtilizaTaxaPadrao = 1;
begin
  Result := RendimentoPadrao(Dias, UtilizaTaxaPadrao, UtilizaTaxaPadrao, 180);
end;

class function TCalculo.TaxaCDI_Radon: Double;
var
  CDI: Double;
begin
  CDI := TaxaSelicAnual - (Random(5) * 0.01);
  Result := CDI;
end;

class function TCalculo.TesouroIOF_180(ValorAplicado: Currency): Currency;
begin
  Result := TaxaIOF_Base(ValorAplicado, 180, PorcentagemIOF_180);
end;

class function TCalculo.TesouroIOF_360(ValorAplicado: Currency): Currency;
begin
  Result := TaxaIOF_Base(ValorAplicado, 360, PorcentagemIOF_360);
end;

class function TCalculo.TesouroIOF_720(ValorAplicado: Currency): Currency;
begin
  Result := TaxaIOF_Base(ValorAplicado, 720, PorcentagemIOF_720)
end;

class function TCalculo.TesouroIOF_Mais720(ValorAplicado: Currency): Currency;
var
  RandoMais720: Integer;
begin
  RandoMais720 := Random(100) + 720;
  Result := TaxaIOF_Base(ValorAplicado, RandoMais720, PorcentagemIOF_Mais720);
end;

class function TCalculo.TesouroSelicTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePosFixado(ValorAplicado, TaxaSelic(Dias));
end;

class function TCalculo.TesouroSelicTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePreFixado(ValorAplicado, TaxaSelic(Dias));
end;

class function TCalculo.TesouroSemestraisTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePosFixado(ValorAplicado, RendimentoSemestral(Dias));
end;

class function TCalculo.TesouroSemestraisTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePreFixado(ValorAplicado, RendimentoSemestral(Dias));
end;

end.
