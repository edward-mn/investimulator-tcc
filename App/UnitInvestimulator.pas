unit UnitInvestimulator;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Samples.Spin,
  UnitTxtUtils,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormInvestimulator = class(TForm)
    PageControlInvestimulator: TPageControl;
    TabSheetTodos: TTabSheet;
    TabSheetTesouroDireto: TTabSheet;
    MemoTodosInvestimentos: TMemo;
    ButtonTesouroDiretoSimular: TButton;
    MemoTesouroDireto: TMemo;
    GroupBoxTesouroDireto: TGroupBox;
    EditValorAplicado: TEdit;
    LabelValorAplicado: TLabel;
    SpinEditQuantidadeDias: TSpinEdit;
    LabelQuantidadeDias: TLabel;
    RadioButtonSelic: TRadioButton;
    RadioButtonPrefixadoSemestrais: TRadioButton;
    RadioButtonPrefixado: TRadioButton;
    RadioButtonIPCA: TRadioButton;
    RadioButtonIPCASemestrais: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonTesouroDiretoSimularClick(Sender: TObject);
  private
    FGravarArquivo: TGravar;
    FArrayArquivos: Array[0..2] of string;
    procedure SetPathFiles;
    procedure LerDadosMemo;
    procedure ValidarTesouroDireto;
    function PegarTipoTesouroDireto: string;
  public
    procedure EvalidationErrorMsg(Msg: string);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  const
    Arquivo = 'C:\Users\Edward\Desktop\sem_banco\Investimentos\TesouroDireto.txt';
var
  FormInvestimulator: TFormInvestimulator;

implementation

{$R *.dfm}

uses
  UnitEvalidationError,
  UnitCalculo,
  UnitDadosUtils;

procedure TFormInvestimulator.ButtonTesouroDiretoSimularClick(Sender: TObject);
begin
  PegarTipoTesouroDireto;
  ValidarTesouroDireto;
end;

constructor TFormInvestimulator.Create(AOwner: TComponent);
begin
  inherited;
  FGravarArquivo := TGravar.Create;
end;

destructor TFormInvestimulator.Destroy;
begin
  FGravarArquivo.Free;
  inherited;
end;

procedure TFormInvestimulator.EvalidationErrorMsg(Msg: string);
begin
  raise EValidationError.Create(Msg);
end;

procedure TFormInvestimulator.FormShow(Sender: TObject);
begin
  LerDadosMemo;
end;

procedure TFormInvestimulator.LerDadosMemo;
begin
  MemoTodosInvestimentos.Lines.LoadFromFile(PathTodosInvestimentos);
end;

function TFormInvestimulator.PegarTipoTesouroDireto: string;
begin
  if RadioButtonSelic.Checked then
    Exit(TesouroSelic)
  else if RadioButtonPrefixado.Checked then
    Exit(TesouroPrefixado)
  else if RadioButtonPrefixadoSemestrais.Checked then
    Exit(TesouroPrefixado)
  else if RadioButtonIPCA.Checked then
    Exit(TesouroIPCASemestrais)
  else if RadioButtonIPCASemestrais.Checked then
    Exit(TesouroIPCASemestrais)
  else
    EvalidationErrorMsg(TesouroSelicNecessario);
end;

procedure TFormInvestimulator.SetPathFiles;
begin
  FArrayArquivos[0] := PathArquivoTesouroDireto;
end;

procedure TFormInvestimulator.ValidarTesouroDireto;
begin
  if EditValorAplicado.Text = '' then
    EvalidationErrorMsg(ValorAplicadoInvalido)
  else if SpinEditQuantidadeDias.Value <= 0 then
    EvalidationErrorMsg(QuantidadeInvalida);
end;

end.
