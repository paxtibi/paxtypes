
type
   { TUInt64 }

  TUInt64 = class(TInterfacedObject, IUInt64,ISerializable)
  private
    function GetValue: UInt64;
    procedure SetValue(AValue: UInt64);
  protected
    FValue: UInt64;
  public
    constructor Create(aValue: UInt64);
    property Value : UInt64 read GetValue write SetValue;
  end;


operator := (aValue: UInt64)        : IUInt64;
begin
  result := TUInt64.Create(aValue);
end;

operator Explicit(aValue: UInt64)    : IUInt64;
begin
  result := TUInt64.Create(aValue);
end;

operator Explicit(aValue: IUInt64)   : UInt64;
begin
  result := aValue.Value;
end;

operator+(const Left: IUInt64; const right: IUInt64)    : UInt64;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IUInt64;const right : IUInt64) :  IUInt64;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IUInt64; const right: UInt64)     : UInt64;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: UInt64; const right: IUInt64)     : UInt64;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUInt64 }

function TUInt64.GetValue: UInt64;
begin
  result := FValue;
end;

procedure TUInt64.SetValue(AValue: UInt64);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUInt64.Create(aValue: UInt64);
begin
  FValue:= aValue;
end;
