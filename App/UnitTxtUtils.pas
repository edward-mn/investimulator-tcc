unit UnitTxtUtils;

interface

type
  TGravar = class
    procedure GravarTxt(PathFile, Text: string);
    function TextoPadraoTesouroDireto(ValorAplicado, TipoPrincipalInvestimento,
      TipoInvestimentoEscolhido, TipoTaxa: string; Rendimento, TaxaCDI: Double; IOF180, IOF360, IOF720,
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
  TipoInvestimentoEscolhido, TipoTaxa: string; Rendimento, TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720,
  TesouroSelicValorFinal: Currency; QtdDias: Integer): String;
var
 PadrãoSalvar: string;
const
  Separador = '###############################################################';
begin
  PadrãoSalvar :=
    sLineBreak +
    Separador + sLineBreak +
    'Tipo de Investimento Principal: ' + TipoPrincipalInvestimento + sLineBreak +
    'Tipo de Investimento Escolhido: ' + TipoInvestimentoEscolhido +
    ' - ' + TipoTaxa + sLineBreak +
    'Valor Aplicado: R$ ' + ValorAplicado + sLineBreak +
    'Quantidade de Dias Aplicado: ' + IntToStr(QtdDias) + sLineBreak +
    'Data da Aplicação: ' + FormatDateTime('dd\mm\yyyy - hh:MM:ss', Now) + sLineBreak +
    'Taxa Selic: 6.5%' + sLineBreak +
    'Taxa CDI : ' + FloatToStr(TaxaCDI) + '%' + sLineBreak +
    'Taxa de Rendimento mensal: R$ ' + FloatToStr(Rendimento) + sLineBreak +
    'Rendimento IOF gerado de 0 a 180 dias: R$ ' + CurrToStr(IOF180) + sLineBreak +
    'Rendimento IOF gerado de 181 a 360 dias: R$ ' + CurrToStr(IOF360) + sLineBreak +
    'Rendimento IOF gerado de 361 a 720 dias: R$ ' + CurrToStr(IOF720) + sLineBreak +
    'Rendimento IOF gerado com mais de 720 dias: R$ ' + CurrToStr(IOF_Mais720) + sLineBreak +
    'Rendimento final: R$ ' + CurrToStr(TesouroSelicValorFinal) + sLineBreak +
    Separador;

  Result := PadrãoSalvar;
end;

end.
