unit ByteType;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { IByte }

  IByte = interface(ISerializable)
    function Getvalue: Byte;
    procedure Setvalue(AValue: Byte);
    property value : Byte read Getvalue write Setvalue;
  end;

  operator := (aValue :  Byte) :  IByte;
  operator Explicit(aValue :  Byte) :  IByte;
  operator Explicit(aValue :  IByte) :  Byte;
  operator + (const Left : IByte;const right : IByte) :  Byte;
  operator + (const Left : IByte;const right : Byte)  :  Byte;
  operator + (const Left : Byte;const right : IByte)  :  Byte;
  operator + (const Left : IByte;const right : IByte) :  IByte;
                             
implementation
Uses
  paxtypes;
type
   { TByte }

  TByte = class(TInterfacedObject, IByte,ISerializable)
  private
    function GetValue: Byte;
    procedure SetValue(AValue: Byte);
  protected
    FValue: Byte;
  public
    constructor Create(aValue: Byte);
    property Value : Byte read GetValue write SetValue;
  end;


operator := (aValue: Byte)        : IByte;
begin
  result := TByte.Create(aValue);
end;

operator Explicit(aValue: Byte)    : IByte;
begin
  result := TByte.Create(aValue);
end;

operator Explicit(aValue: IByte)   : Byte;
begin
  result := aValue.Value;
end;

operator+(const Left: IByte; const right: IByte)    : Byte;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IByte;const right : IByte) :  IByte;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IByte; const right: Byte)     : Byte;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Byte; const right: IByte)     : Byte;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TByte }

function TByte.GetValue: Byte;
begin
  result := FValue;
end;

procedure TByte.SetValue(AValue: Byte);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TByte.Create(aValue: Byte);
begin
  FValue:= aValue;
end;

end.
