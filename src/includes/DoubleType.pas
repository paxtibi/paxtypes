unit DoubleType;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { IDouble }

  IDouble = interface(ISerializable)
    function Getvalue: Double;
    procedure Setvalue(AValue: Double);
    property value : Double read Getvalue write Setvalue;
  end;

  operator := (aValue :  Double) :  IDouble;
  operator Explicit(aValue :  Double) :  IDouble;
  operator Explicit(aValue :  IDouble) :  Double;
  operator + (const Left : IDouble;const right : IDouble) :  Double;
  operator + (const Left : IDouble;const right : Double)  :  Double;
  operator + (const Left : Double;const right : IDouble)  :  Double;
  operator + (const Left : IDouble;const right : IDouble) :  IDouble;
                             
implementation
Uses
  paxtypes;
type
   { TDouble }

  TDouble = class(TInterfacedObject, IDouble,ISerializable)
  private
    function GetValue: Double;
    procedure SetValue(AValue: Double);
  protected
    FValue: Double;
  public
    constructor Create(aValue: Double);
    property Value : Double read GetValue write SetValue;
  end;


operator := (aValue: Double)        : IDouble;
begin
  result := TDouble.Create(aValue);
end;

operator Explicit(aValue: Double)    : IDouble;
begin
  result := TDouble.Create(aValue);
end;

operator Explicit(aValue: IDouble)   : Double;
begin
  result := aValue.Value;
end;

operator+(const Left: IDouble; const right: IDouble)    : Double;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IDouble;const right : IDouble) :  IDouble;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IDouble; const right: Double)     : Double;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Double; const right: IDouble)     : Double;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TDouble }

function TDouble.GetValue: Double;
begin
  result := FValue;
end;

procedure TDouble.SetValue(AValue: Double);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TDouble.Create(aValue: Double);
begin
  FValue:= aValue;
end;

end.
