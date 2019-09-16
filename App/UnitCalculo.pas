unit UnitCalculo;

interface

type
  TCalculo = class
  private
    class function RendimentoPadrao(DiasBaseRendimento, DiasAplicado: Integer): double;
    class function ValorFinalBasePosFixado(ValorAplicado: Currency; Dias: integer; TipoRendimento: Double): Currency;
    class function ValorFinalBasePreFixado(ValorAplicado: Currency; Dias: integer; TipoRendimento: Double): Currency;
    class function TaxaIOF_Base(ValorAplicado: Currency; QtdDias: Integer; Porcentagem: Double): Currency;
  public
    class function RendimentoMensal(Dias: Integer): double;
    class function RendimentoSemestral(Dias: Integer): double;
    class function TaxaCDI_Radon: Double;
    class function TesouroSelicTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroSelicTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroSemestraisTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroSemestraisTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
    class function TesouroIOF_180(ValorAplicado: Currency): Currency;
    class function TesouroIOF_360(ValorAplicado: Currency): Currency;
    class function TesouroIOF_720(ValorAplicado: Currency): Currency;
    class function TesouroIOF_Mais720(ValorAplicado: Currency): Currency;
  end;


implementation

uses
  UnitDadosUtils;

{ TCalculo }

class function TCalculo.RendimentoPadrao(DiasBaseRendimento, DiasAplicado: Integer): double;
var
  Multiplicador, PorcentagemInteira: Integer;
  Taxa: Double;
begin
  PorcentagemInteira := 0;
  Taxa := 0;
  Multiplicador := DiasBaseRendimento;

  try
    while not (Multiplicador > DiasAplicado) do
    begin
      Inc(PorcentagemInteira);
      Multiplicador := Multiplicador + DiasBaseRendimento;
    end;
  finally
    Taxa := ((Multiplicador - DiasAplicado) * 0.005) + (PorcentagemInteira * 0.1);
  end;

  Result := Taxa;
end;

class function TCalculo.ValorFinalBasePosFixado(ValorAplicado: Currency; Dias: integer; TipoRendimento: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := (TaxaCDI_Radon * ValorAplicado) * TipoRendimento;
  ValorDaTaxa := ValorComTaxa * TaxaSelicPadrao;
  ValorFinal := ValorComTaxa - ValorDaTaxa;

  Result := ValorFinal + ValorAplicado;
end;

class function TCalculo.ValorFinalBasePreFixado(ValorAplicado: Currency; Dias: integer; TipoRendimento: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := (0.5 * ValorAplicado) * TipoRendimento;
  ValorDaTaxa := ValorComTaxa * TaxaSelicPadrao;
  ValorFinal := ValorComTaxa - ValorDaTaxa;

  Result := ValorFinal + ValorAplicado;
end;

class function TCalculo.TaxaIOF_Base(ValorAplicado: Currency; QtdDias: Integer; Porcentagem: Double): Currency;
var
  ValorComTaxa, ValorDaTaxa, ValorFinal: Currency;
begin
  ValorComTaxa := RendimentoMensal(QtdDias) * ValorAplicado;;
  ValorDaTaxa := ValorComTaxa * Porcentagem;
  ValorFinal := ValorAplicado + ValorDaTaxa;

  Result := ValorFinal;
end;

class function TCalculo.RendimentoMensal(Dias: Integer): double;
begin
  Result := RendimentoPadrao(30 ,Dias);
end;

class function TCalculo.RendimentoSemestral(Dias: Integer): double;
begin
  Result := RendimentoPadrao(180, Dias)
end;

class function TCalculo.TaxaCDI_Radon: Double;
var
  CDI: Double;
begin
  CDI := Random(10) * 0.2;
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
  Result := ValorFinalBasePosFixado(ValorAplicado, Dias, RendimentoMensal(Dias));
end;

class function TCalculo.TesouroSelicTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePreFixado(ValorAplicado, Dias, RendimentoMensal(Dias));
end;

class function TCalculo.TesouroSemestraisTaxasPos(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePosFixado(ValorAplicado, Dias, RendimentoSemestral(Dias));
end;

class function TCalculo.TesouroSemestraisTaxasPre(ValorAplicado: Currency; Dias: Integer): Currency;
begin
  Result := ValorFinalBasePreFixado(ValorAplicado, Dias, RendimentoSemestral(Dias));
end;

end.
