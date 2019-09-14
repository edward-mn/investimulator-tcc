unit UnitEvalidationError;

interface

uses
  System.SysUtils,
  System.TypInfo;

type
  EvalidationError = class (Exception)
    constructor Create(Const Msg: string); overload;
  end;

implementation

{ EvalidationError }

constructor EvalidationError.Create(Const Msg: string);
begin
  inherited Create(Msg);
end;

end.
