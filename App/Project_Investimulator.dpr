program Project_Investimulator;

uses
  Vcl.Forms,
  UnitInvestimulator in 'UnitInvestimulator.pas' {FormInvestimulator},
  UnitTxtUtils in 'UnitTxtUtils.pas',
  UnitEvalidationError in 'UnitEvalidationError.pas',
  UnitCalculo in 'UnitCalculo.pas',
  UnitDadosUtils in 'UnitDadosUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormInvestimulator, FormInvestimulator);
  Application.Run;
end.
