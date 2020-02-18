
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


operator := (aValue: NativeUInt)        : INativeUInt;
begin
  result := TNativeUInt.Create(aValue);
end;

operator Explicit(aValue: NativeUInt)    : INativeUInt;
begin
  result := TNativeUInt.Create(aValue);
end;

operator Explicit(aValue: INativeUInt)   : NativeUInt;
begin
  result := aValue.Value;
end;

operator+(const Left: INativeUInt; const right: INativeUInt)    : NativeUInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : INativeUInt;const right : INativeUInt) :  INativeUInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: INativeUInt; const right: NativeUInt)     : NativeUInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: NativeUInt; const right: INativeUInt)     : NativeUInt;
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
