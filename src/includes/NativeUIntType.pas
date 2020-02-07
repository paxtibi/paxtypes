unit NativeUIntType;
interface
uses
  Interfaces, Classes, SysUtils;
type
  { INativeUInt }

  INativeUInt = interface(ISerializable)
    function Getvalue: NativeUInt;
    procedure Setvalue(AValue: NativeUInt);
    property value : NativeUInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  NativeUInt) res:  INativeUInt;
  operator Explicit(aValue :  NativeUInt) res:  INativeUInt;
  operator Explicit(aValue :  INativeUInt) res:  NativeUInt;
  operator + (const Left : INativeUInt;const right : INativeUInt) res:  NativeUInt;
  operator + (const Left : INativeUInt;const right : NativeUInt) res:  NativeUInt;
  operator + (const Left : NativeUInt;const right : INativeUInt) res:  NativeUInt;
  operator + (const Left : INativeUInt;const right : INativeUInt) res:  INativeUInt;
                             
implementation
Uses
  paxtypes;
type
   { TNativeUInt }

  TNativeUInt = class(TInterfacedObject, INativeUInt,ISerializable)
  private
    function GetValue: NativeUInt;
    procedure SetValue(AValue: NativeUInt);
  protected
    FValue: NativeUInt;
  public
    constructor Create(aValue: NativeUInt);
    property Value : NativeUInt read GetValue write SetValue;
  end;


operator := (aValue: NativeUInt)res: INativeUInt;
begin
  result := TNativeUInt.Create(aValue);
end;

operator Explicit(aValue: NativeUInt)res: INativeUInt;
begin
  result := TNativeUInt.Create(aValue);
end;

operator Explicit(aValue: INativeUInt)res: NativeUInt;
begin
  result := aValue.Value;
end;

operator+(const Left: INativeUInt; const right: INativeUInt) res: NativeUInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : INativeUInt;const right : INativeUInt) res:  INativeUInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: INativeUInt; const right: NativeUInt)res: NativeUInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: NativeUInt; const right: INativeUInt)res: NativeUInt;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TNativeUInt }

function TNativeUInt.GetValue: NativeUInt;
begin
  result := FValue;
end;

procedure TNativeUInt.SetValue(AValue: NativeUInt);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TNativeUInt.Create(aValue: NativeUInt);
begin
  FValue:= aValue;
end;

end.
