unit UnitCalculo;

interface

type
  TCalculo = class
    class function Rendimento(Dias: Integer): double;
    class function TaxaCDI_Radon: Double;
    class function TesouroSelicTaxas(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroIOF_180(ValorAplicado: Currency): Currency;
    class function TesouroIOF_360(ValorAplicado: Currency): Currency;
    class function TesouroIOF_720(ValorAplicado: Currency): Currency;
    class function TesouroIOF_Mais720(ValorAplicado: Currency): Currency;
  end;


implementation

uses
  UnitDadosUtils;

{ TCalculo }

class function TCalculo.Rendimento(Dias: Integer): double;
var
  Multiplicador, PorcentagemInteira: Integer;
  Taxa: Double;
begin
  PorcentagemInteira := 0;
  Taxa := 0;
  Multiplicador := 30;

  try
    while not (Multiplicador > Dias) do
    begin
      Inc(PorcentagemInteira);
      Multiplicador := Multiplicador + 30;
    end;
  finally
    Taxa := ((Multiplicador - Dias) * 0.005) + (PorcentagemInteira * 0.1);
  end;

  Result := Taxa;
end;

class function TCalculo.TaxaCDI_Radon: Double;
var
  CDI: Double;
begin
  CDI := Random(10) * 0.2;
  Result := CDI;
end;

class function TCalculo.TesouroIOF_180(ValorAplicado: Currency): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := TaxaRentabilidade * ValorAplicado;
  ValorDaTaxa := ValorComTaxa * 00.225;
  ValorFinal := ValorComTaxa - ValorDaTaxa;

  Result := ValorFinal;
end;

class function TCalculo.TesouroIOF_360(ValorAplicado: Currency): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := TaxaRentabilidade * ValorAplicado;
  ValorDaTaxa := ValorComTaxa * 00.22;
  ValorFinal := ValorComTaxa - ValorDaTaxa;

  Result := ValorFinal;
end;

class function TCalculo.TesouroIOF_720(ValorAplicado: Currency): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := TaxaRentabilidade * ValorAplicado;
  ValorDaTaxa := ValorComTaxa * 00.175;
  ValorFinal := ValorDaTaxa - ValorComTaxa;

  Result := ValorFinal;
end;

class function TCalculo.TesouroIOF_Mais720(ValorAplicado: Currency): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := TaxaRentabilidade * ValorAplicado;
  ValorDaTaxa := ValorComTaxa * 00.15;
  ValorFinal := ValorDaTaxa - ValorComTaxa;

  Result := ValorFinal;
end;

class function TCalculo.TesouroSelicTaxas(ValorAplicado: Currency; Dias: Integer): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := (TaxaCDI_Radon * ValorAplicado) * Rendimento(Dias);
  ValorDaTaxa := ValorComTaxa * TaxaSelicPadrao;
  ValorFinal := ValorComTaxa - ValorDaTaxa;

  Result := ValorFinal + ValorAplicado;
end;

end.
