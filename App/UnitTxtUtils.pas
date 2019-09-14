unit UnitTxtUtils;

interface

type
  TGravar = class
    procedure GravarTxt(PathFile, Text: string);
    function TextoPadraoTesouroDireto(ValorAplicado, TipoPrincipalInvestimento,
      TipoInvestimentoEscolhido: string; Rendimento, TaxaCDI: Double; IOF180, IOF360, IOF720,
      IOF_Mais720, TesouroSelicValorFinal: Currency; QtdDias: Integer): String;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  UnitDadosUtils;

{ TGravar }

procedure TGravar.GravarTxt(PathFile, Text: string);
var
  Arquivo, ArquivoFinal : TStringList;
begin
  Arquivo := TStringList.Create;
  ArquivoFinal := TStringList.Create;
  try
    if not FileExists(PathFile) then
      Exit;

    ArquivoFinal.LoadFromFile(PathTodosInvestimentos);
    Arquivo.LoadFromFile(PathFile);

    ArquivoFinal.Add(Text);
    Arquivo.Add(Text);

    ArquivoFinal.SaveToFile(PathTodosInvestimentos);
    Arquivo.SaveToFile(PathFile);
  finally
    Arquivo.Free;
    ArquivoFinal.Free;
  end;
end;

function TGravar.TextoPadraoTesouroDireto(ValorAplicado, TipoPrincipalInvestimento,
  TipoInvestimentoEscolhido: string; Rendimento, TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720,
  TesouroSelicValorFinal: Currency; QtdDias: Integer): String;
var
 PadrãoSalvar: string;
begin
  PadrãoSalvar :=
    sLineBreak +
    '--------------------------------------------------------------------------' +
    'Tipo de Investimento Principal: ' + TipoPrincipalInvestimento + sLineBreak +
    'Tipo de Investimento Escolhido: ' + TipoInvestimentoEscolhido + sLineBreak +
    'Taxa Selic: 6.5' + sLineBreak +
    'Taxa CDI : ' + FloatToStr(TaxaCDI) + sLineBreak +
    'Taxa de Rendimento mensal: ' + FloatToStr(Rendimento) + sLineBreak +
    'Valor Aplicado: ' + ValorAplicado + sLineBreak +
    'Rendimento IOF gerado de 0 a 180 dias: ' + CurrToStr(IOF180) + sLineBreak +
    'Rendimento IOF gerado de 181 a 360 dias: ' + CurrToStr(IOF360) + sLineBreak +
    'Rendimento IOF gerado de 361 a 720 dias: ' + CurrToStr(IOF720) + sLineBreak +
    'Rendimento IOF gerado com mais de 720 dias: ' + CurrToStr(IOF_Mais720) + sLineBreak +
    'Rendimento final: ' + CurrToStr(TesouroSelicValorFinal) + sLineBreak +
    '--------------------------------------------------------------------------' +
    sLineBreak;

  Result := PadrãoSalvar;
end;

end.
