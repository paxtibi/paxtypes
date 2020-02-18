
type
   { TUInt32 }

  TUInt32 = class(TInterfacedObject, IUInt32,ISerializable)
  private
    function GetValue: UInt32;
    procedure SetValue(AValue: UInt32);
  protected
    FValue: UInt32;
  public
    constructor Create(aValue: UInt32);
    property Value : UInt32 read GetValue write SetValue;
  end;


operator := (aValue: UInt32)        : IUInt32;
begin
  result := TUInt32.Create(aValue);
end;

operator Explicit(aValue: UInt32)    : IUInt32;
begin
  result := TUInt32.Create(aValue);
end;

operator Explicit(aValue: IUInt32)   : UInt32;
begin
  result := aValue.Value;
end;

operator+(const Left: IUInt32; const right: IUInt32)    : UInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IUInt32;const right : IUInt32) :  IUInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IUInt32; const right: UInt32)     : UInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: UInt32; const right: IUInt32)     : UInt32;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUInt32 }

function TUInt32.GetValue: UInt32;
begin
  result := FValue;
end;

procedure TUInt32.SetValue(AValue: UInt32);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUInt32.Create(aValue: UInt32);
begin
  FValue:= aValue;
end;
