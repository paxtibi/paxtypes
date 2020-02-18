unit RealType;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { IReal }

  IReal = interface(ISerializable)
    function Getvalue: Real;
    procedure Setvalue(AValue: Real);
    property value : Real read Getvalue write Setvalue;
  end;

  operator := (aValue :  Real) :  IReal;
  operator Explicit(aValue :  Real) :  IReal;
  operator Explicit(aValue :  IReal) :  Real;
  operator + (const Left : IReal;const right : IReal) :  Real;
  operator + (const Left : IReal;const right : Real)  :  Real;
  operator + (const Left : Real;const right : IReal)  :  Real;
  operator + (const Left : IReal;const right : IReal) :  IReal;
                             
implementation
Uses
  paxtypes;
type
   { TReal }

  TReal = class(TInterfacedObject, IReal,ISerializable)
  private
    function GetValue: Real;
    procedure SetValue(AValue: Real);
  protected
    FValue: Real;
  public
    constructor Create(aValue: Real);
    property Value : Real read GetValue write SetValue;
  end;


operator := (aValue: Real)        : IReal;
begin
  result := TReal.Create(aValue);
end;

operator Explicit(aValue: Real)    : IReal;
begin
  result := TReal.Create(aValue);
end;

operator Explicit(aValue: IReal)   : Real;
begin
  result := aValue.Value;
end;

operator+(const Left: IReal; const right: IReal)    : Real;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IReal;const right : IReal) :  IReal;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IReal; const right: Real)     : Real;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Real; const right: IReal)     : Real;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TReal }

function TReal.GetValue: Real;
begin
  result := FValue;
end;

procedure TReal.SetValue(AValue: Real);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TReal.Create(aValue: Real);
begin
  FValue:= aValue;
end;

end.
