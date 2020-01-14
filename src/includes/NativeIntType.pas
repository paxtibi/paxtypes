unit NativeIntType;
interface
uses
  Classes, SysUtils;
type
  { INativeInt }

  INativeInt = interface
    function Getvalue: NativeInt;
    procedure Setvalue(AValue: NativeInt);
    property value : NativeInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  NativeInt) res:  INativeInt;
  operator Explicit(aValue :  NativeInt) res:  INativeInt;
  operator Explicit(aValue :  INativeInt) res:  NativeInt;
  operator + (const Left : INativeInt;const right : INativeInt) res:  NativeInt;
  operator + (const Left : INativeInt;const right : NativeInt) res:  NativeInt;
  operator + (const Left : NativeInt;const right : INativeInt) res:  NativeInt;
  operator + (const Left : INativeInt;const right : INativeInt) res:  INativeInt;
                             
implementation
Uses
  paxtypes;
type
   { TNativeInt }

  TNativeInt = class(TInterfacedObject, INativeInt)
  private
    function GetValue: NativeInt;
    procedure SetValue(AValue: NativeInt);
  protected
    FValue: NativeInt;
  public
    constructor Create(aValue: NativeInt);
    property Value : NativeInt read GetValue write SetValue;
  end;


operator := (aValue: NativeInt)res: INativeInt;
begin
  result := TNativeInt.Create(aValue);
end;

operator Explicit(aValue: NativeInt)res: INativeInt;
begin
  result := TNativeInt.Create(aValue);
end;

operator Explicit(aValue: INativeInt)res: NativeInt;
begin
  result := aValue.Value;
end;

operator+(const Left: INativeInt; const right: INativeInt) res: NativeInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : INativeInt;const right : INativeInt) res:  INativeInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: INativeInt; const right: NativeInt)res: NativeInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: NativeInt; const right: INativeInt)res: NativeInt;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TNativeInt }

function TNativeInt.GetValue: NativeInt;
begin
  result := FValue;
end;

procedure TNativeInt.SetValue(AValue: NativeInt);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TNativeInt.Create(aValue: NativeInt);
begin
  FValue:= aValue;
end;

end.
