unit UnitTxtUtils;

interface

type
  TGravar = class
  private
    function PegarDataAtualSimulacao: string;
  public
    procedure GravarTxt(PathFile, Text: string);
    function TextoPadraoTesouroDireto(ValorAplicado, TipoInvestimentoEscolhido, TipoTaxa: string; TaxaSelic,
      TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720, TesouroSelicValorFinal: Currency; QtdDias: Integer): String;
    function TextoPadraoPoupanca(ValorAplicado: string; TaxaPoupanca, TaxaCDI: Double; PoupancaValorFinal: Currency;
       QtdDias: Integer): String;
    function TextoPadraoCertificadoDepositoBancario(ValorAplicado, TipoTaxa, BancoEmissor: string; TaxaCDB, TaxaCDI: Double;
      IOF180, IOF360, IOF720, IOF_Mais720, CDBValorFinal: Currency; QtdDias: Integer): String;
    function TextoPadraoLetrasCreditos(ValorAplicado, TipoInvestimentoEscolhido, TipoFundoEscolhido, TipoTaxa: string; TaxaLCs,
      TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720, LCsValorFinal: Currency; QtdDias: Integer): String;
  end;
  const
    Separador = '###############################################################';

implementation

uses
  System.SysUtils,
  System.Classes,
  UnitDadosUtils;

{ TGravar }

function TGravar.PegarDataAtualSimulacao: string;
begin
  Result := 'Data da Aplicação: ' + FormatDateTime('dd\mm\yyyy - hh:MM:ss', Now);
end;

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

function TGravar.TextoPadraoTesouroDireto(ValorAplicado, TipoInvestimentoEscolhido,
  TipoTaxa: string; TaxaSelic, TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720,
  TesouroSelicValorFinal: Currency; QtdDias: Integer): String;
var
  PadraoSalvarTesouroDireto: string;
begin
  PadraoSalvarTesouroDireto :=
    Separador + sLineBreak +
    'Tipo de Investimento Principal: ' + TesouroDireto + sLineBreak +
    'Tipo de Investimento Escolhido: ' + TipoInvestimentoEscolhido + ' - ' + TipoTaxa + sLineBreak +
    'Valor Aplicado: R$ ' + ValorAplicado + sLineBreak +
    'Quantidade de Dias Aplicado: ' + IntToStr(QtdDias) + sLineBreak +
    PegarDataAtualSimulacao + sLineBreak +
    'Taxa Selic: ' + FloatToStr(TaxaSelic) + '%' + sLineBreak +
    'Taxa CDI : ' + FloatToStr(TaxaCDI) + '%' + sLineBreak +
    'Rendimento IOF gerado de 0 a 180 dias: R$ ' + CurrToStr(IOF180) + sLineBreak +
    'Rendimento IOF gerado de 181 a 360 dias: R$ ' + CurrToStr(IOF360) + sLineBreak +
    'Rendimento IOF gerado de 361 a 720 dias: R$ ' + CurrToStr(IOF720) + sLineBreak +
    'Rendimento IOF gerado com mais de 720 dias: R$ ' + CurrToStr(IOF_Mais720) + sLineBreak +
    'Rendimento final: R$ ' + CurrToStr(TesouroSelicValorFinal) + sLineBreak +
    Separador + sLineBreak;

  Result := PadraoSalvarTesouroDireto;
end;

function TGravar.TextoPadraoPoupanca(ValorAplicado: string; TaxaPoupanca, TaxaCDI: Double;
  PoupancaValorFinal: Currency; QtdDias: Integer): String;
var
  PadraoSalvarPoupanca: string;
begin
  PadraoSalvarPoupanca :=
    Separador + sLineBreak +
    'Tipo de Investimento Escolhido: ' + Poupanca + sLineBreak +
    'Valor Aplicado: R$ ' + ValorAplicado + sLineBreak +
    'Quantidade de Dias Aplicado: ' + IntToStr(QtdDias) + sLineBreak +
    PegarDataAtualSimulacao + sLineBreak +
    'Taxa Poupança: ' + FloatToStr(TaxaPoupanca) + '%' + sLineBreak +
    'Taxa CDI : ' + FloatToStr(TaxaCDI) + '%' + sLineBreak +
    'Rendimento do tipo Liquidação Diária' + sLineBreak +
    'Rendimento final: R$ ' + CurrToStr(PoupancaValorFinal) + sLineBreak +
    Separador + sLineBreak;

  Result := PadraoSalvarPoupanca;
end;

function TGravar.TextoPadraoCertificadoDepositoBancario(ValorAplicado, TipoTaxa, BancoEmissor: string; TaxaCDB,
  TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720, CDBValorFinal: Currency; QtdDias: Integer): String;
var
 PadraoSalvarCDB: string;
begin
  PadraoSalvarCDB :=
    Separador + sLineBreak +
    'Tipo de Investimento Escolhido: ' + CertifucadoDepositoBancario + ' - ' + TipoTaxa + sLineBreak +
    'Banco emissor do Certificado Escolhido: ' + BancoEmissor + sLineBreak +
    'Valor Aplicado: R$ ' + ValorAplicado + sLineBreak +
    'Quantidade de Dias Aplicado: ' + IntToStr(QtdDias) + sLineBreak +
    PegarDataAtualSimulacao + sLineBreak +
    'Taxa do Certificado: ' + FloatToStr(TaxaCDB) + '%' + sLineBreak +
    'Taxa CDI : ' + FloatToStr(TaxaCDI) + '%' + sLineBreak +
    'Rendimento do tipo Liquidação Diária' + sLineBreak +
    'Rendimento IOF gerado de 0 a 180 dias: R$ ' + CurrToStr(IOF180) + sLineBreak +
    'Rendimento IOF gerado de 181 a 360 dias: R$ ' + CurrToStr(IOF360) + sLineBreak +
    'Rendimento IOF gerado de 361 a 720 dias: R$ ' + CurrToStr(IOF720) + sLineBreak +
    'Rendimento IOF gerado com mais de 720 dias: R$ ' + CurrToStr(IOF_Mais720) + sLineBreak +
    'Rendimento final: R$ ' + CurrToStr(CDBValorFinal) + sLineBreak +
    'Seguro do Investimento: ' + FGC + sLineBreak +
    'Descrição do Seguro: ' + FGCValor + sLineBreak +
    Separador + sLineBreak;

  Result := PadraoSalvarCDB;
end;

function TGravar.TextoPadraoLetrasCreditos(ValorAplicado, TipoInvestimentoEscolhido,
  TipoFundoEscolhido, TipoTaxa: string; TaxaLCs, TaxaCDI: Double; IOF180, IOF360, IOF720, IOF_Mais720,
  LCsValorFinal: Currency; QtdDias: Integer): String;
var
 PadraoSalvarLCs: string;
begin
  PadraoSalvarLCs :=
    Separador + sLineBreak +
    'Tipo de Investimento Principal: ' + LetraCredito + ' - ' + TipoTaxa + sLineBreak +
    'Fundo de Investimento Escolhido: ' + TipoInvestimentoEscolhido + ' - ' + TipoFundoEscolhido + sLineBreak +
    'Valor Aplicado: R$ ' + ValorAplicado + sLineBreak +
    'Quantidade de Dias Aplicado: ' + IntToStr(QtdDias) + sLineBreak +
    PegarDataAtualSimulacao + sLineBreak +
    'Taxa da Letra de Crédito: ' + FloatToStr(TaxaLCs) + '%' + sLineBreak +
    'Taxa CDI: ' + FloatToStr(TaxaCDI) + '%' + sLineBreak +
    'Rendimento IOF gerado de 0 a 180 dias: R$ ' + CurrToStr(IOF180) + sLineBreak +
    'Rendimento IOF gerado de 181 a 360 dias: R$ ' + CurrToStr(IOF360) + sLineBreak +
    'Rendimento IOF gerado de 361 a 720 dias: R$ ' + CurrToStr(IOF720) + sLineBreak +
    'Rendimento IOF gerado com mais de 720 dias: R$ ' + CurrToStr(IOF_Mais720) + sLineBreak +
    'Rendimento final: R$ ' + CurrToStr(LCsValorFinal) + sLineBreak +
    Separador + sLineBreak;

  Result := PadraoSalvarLCs;
end;

end.
