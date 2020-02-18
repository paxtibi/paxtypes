unit Int64Type;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { IInt64 }

  IInt64 = interface(ISerializable)
    function Getvalue: Int64;
    procedure Setvalue(AValue: Int64);
    property value : Int64 read Getvalue write Setvalue;
  end;

  operator := (aValue :  Int64) :  IInt64;
  operator Explicit(aValue :  Int64) :  IInt64;
  operator Explicit(aValue :  IInt64) :  Int64;
  operator + (const Left : IInt64;const right : IInt64) :  Int64;
  operator + (const Left : IInt64;const right : Int64)  :  Int64;
  operator + (const Left : Int64;const right : IInt64)  :  Int64;
  operator + (const Left : IInt64;const right : IInt64) :  IInt64;
                             
implementation
Uses
  paxtypes;
type
   { TInt64 }

  TInt64 = class(TInterfacedObject, IInt64,ISerializable)
  private
    function GetValue: Int64;
    procedure SetValue(AValue: Int64);
  protected
    FValue: Int64;
  public
    constructor Create(aValue: Int64);
    property Value : Int64 read GetValue write SetValue;
  end;


operator := (aValue: Int64)        : IInt64;
begin
  result := TInt64.Create(aValue);
end;

operator Explicit(aValue: Int64)    : IInt64;
begin
  result := TInt64.Create(aValue);
end;

operator Explicit(aValue: IInt64)   : Int64;
begin
  result := aValue.Value;
end;

operator+(const Left: IInt64; const right: IInt64)    : Int64;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IInt64;const right : IInt64) :  IInt64;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IInt64; const right: Int64)     : Int64;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Int64; const right: IInt64)     : Int64;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TInt64 }

function TInt64.GetValue: Int64;
begin
  result := FValue;
end;

procedure TInt64.SetValue(AValue: Int64);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TInt64.Create(aValue: Int64);
begin
  FValue:= aValue;
end;

end.
