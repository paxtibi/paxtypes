unit IntegerType;
interface
uses
  Classes, SysUtils;
type
  { IInteger }

  IInteger = interface
    function Getvalue: Integer;
    procedure Setvalue(AValue: Integer);
    property value : Integer read Getvalue write Setvalue;
  end;

  operator := (aValue :  Integer) res:  IInteger;
  operator Explicit(aValue :  Integer) res:  IInteger;
  operator Explicit(aValue :  IInteger) res:  Integer;
  operator + (const Left : IInteger;const right : IInteger) res:  Integer;
  operator + (const Left : IInteger;const right : Integer) res:  Integer;
  operator + (const Left : Integer;const right : IInteger) res:  Integer;
  operator + (const Left : IInteger;const right : IInteger) res:  IInteger;
                             
implementation
Uses
  paxtypes;
type
   { TInteger }

  TInteger = class(TInterfacedObject, IInteger)
  private
    function GetValue: Integer;
    procedure SetValue(AValue: Integer);
  protected
    FValue: Integer;
  public
    constructor Create(aValue: Integer);
    property Value : Integer read GetValue write SetValue;
  end;


operator := (aValue: Integer)res: IInteger;
begin
  result := TInteger.Create(aValue);
end;

operator Explicit(aValue: Integer)res: IInteger;
begin
  result := TInteger.Create(aValue);
end;

operator Explicit(aValue: IInteger)res: Integer;
begin
  result := aValue.Value;
end;

operator+(const Left: IInteger; const right: IInteger) res: Integer;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IInteger;const right : IInteger) res:  IInteger;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IInteger; const right: Integer)res: Integer;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: Integer; const right: IInteger)res: Integer;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TInteger }

function TInteger.GetValue: Integer;
begin
  result := FValue;
end;

procedure TInteger.SetValue(AValue: Integer);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TInteger.Create(aValue: Integer);
begin
  FValue:= aValue;
end;

end.
