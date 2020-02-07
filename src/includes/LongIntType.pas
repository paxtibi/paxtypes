unit LongIntType;
interface
uses
  Interfaces, Classes, SysUtils;
type
  { ILongInt }

  ILongInt = interface(ISerializable)
    function Getvalue: LongInt;
    procedure Setvalue(AValue: LongInt);
    property value : LongInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  LongInt) res:  ILongInt;
  operator Explicit(aValue :  LongInt) res:  ILongInt;
  operator Explicit(aValue :  ILongInt) res:  LongInt;
  operator + (const Left : ILongInt;const right : ILongInt) res:  LongInt;
  operator + (const Left : ILongInt;const right : LongInt) res:  LongInt;
  operator + (const Left : LongInt;const right : ILongInt) res:  LongInt;
  operator + (const Left : ILongInt;const right : ILongInt) res:  ILongInt;
                             
implementation
Uses
  paxtypes;
type
   { TLongInt }

  TLongInt = class(TInterfacedObject, ILongInt,ISerializable)
  private
    function GetValue: LongInt;
    procedure SetValue(AValue: LongInt);
  protected
    FValue: LongInt;
  public
    constructor Create(aValue: LongInt);
    property Value : LongInt read GetValue write SetValue;
  end;


operator := (aValue: LongInt)res: ILongInt;
begin
  result := TLongInt.Create(aValue);
end;

operator Explicit(aValue: LongInt)res: ILongInt;
begin
  result := TLongInt.Create(aValue);
end;

operator Explicit(aValue: ILongInt)res: LongInt;
begin
  result := aValue.Value;
end;

operator+(const Left: ILongInt; const right: ILongInt) res: LongInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : ILongInt;const right : ILongInt) res:  ILongInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: ILongInt; const right: LongInt)res: LongInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: LongInt; const right: ILongInt)res: LongInt;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TLongInt }

function TLongInt.GetValue: LongInt;
begin
  result := FValue;
end;

procedure TLongInt.SetValue(AValue: LongInt);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TLongInt.Create(aValue: LongInt);
begin
  FValue:= aValue;
end;

end.
