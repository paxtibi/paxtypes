
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


operator := (aValue: LongInt)        : ILongInt;
begin
  result := TLongInt.Create(aValue);
end;

operator Explicit(aValue: LongInt)    : ILongInt;
begin
  result := TLongInt.Create(aValue);
end;

operator Explicit(aValue: ILongInt)   : LongInt;
begin
  result := aValue.Value;
end;

operator+(const Left: ILongInt; const right: ILongInt)    : LongInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : ILongInt;const right : ILongInt) :  ILongInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: ILongInt; const right: LongInt)     : LongInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: LongInt; const right: ILongInt)     : LongInt;
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
