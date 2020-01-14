unit ByteType;
interface
uses
  Classes, SysUtils;
type
  { IByte }

  IByte = interface
    function Getvalue: Byte;
    procedure Setvalue(AValue: Byte);
    property value : Byte read Getvalue write Setvalue;
  end;

  operator := (aValue :  Byte) res:  IByte;
  operator Explicit(aValue :  Byte) res:  IByte;
  operator Explicit(aValue :  IByte) res:  Byte;
  operator + (const Left : IByte;const right : IByte) res:  Byte;
  operator + (const Left : IByte;const right : Byte) res:  Byte;
  operator + (const Left : Byte;const right : IByte) res:  Byte;
  operator + (const Left : IByte;const right : IByte) res:  IByte;
                             
implementation
Uses
  paxtypes;
type
   { TByte }

  TByte = class(TInterfacedObject, IByte)
  private
    function GetValue: Byte;
    procedure SetValue(AValue: Byte);
  protected
    FValue: Byte;
  public
    constructor Create(aValue: Byte);
    property Value : Byte read GetValue write SetValue;
  end;


operator := (aValue: Byte)res: IByte;
begin
  result := TByte.Create(aValue);
end;

operator Explicit(aValue: Byte)res: IByte;
begin
  result := TByte.Create(aValue);
end;

operator Explicit(aValue: IByte)res: Byte;
begin
  result := aValue.Value;
end;

operator+(const Left: IByte; const right: IByte) res: Byte;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IByte;const right : IByte) res:  IByte;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IByte; const right: Byte)res: Byte;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: Byte; const right: IByte)res: Byte;
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
