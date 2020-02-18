
type
   { TUInt16 }

  TUInt16 = class(TInterfacedObject, IUInt16,ISerializable)
  private
    function GetValue: UInt16;
    procedure SetValue(AValue: UInt16);
  protected
    FValue: UInt16;
  public
    constructor Create(aValue: UInt16);
    property Value : UInt16 read GetValue write SetValue;
  end;


operator := (aValue: UInt16)        : IUInt16;
begin
  result := TUInt16.Create(aValue);
end;

operator Explicit(aValue: UInt16)    : IUInt16;
begin
  result := TUInt16.Create(aValue);
end;

operator Explicit(aValue: IUInt16)   : UInt16;
begin
  result := aValue.Value;
end;

operator+(const Left: IUInt16; const right: IUInt16)    : UInt16;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IUInt16;const right : IUInt16) :  IUInt16;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IUInt16; const right: UInt16)     : UInt16;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: UInt16; const right: IUInt16)     : UInt16;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUInt16 }

function TUInt16.GetValue: UInt16;
begin
  result := FValue;
end;

procedure TUInt16.SetValue(AValue: UInt16);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUInt16.Create(aValue: UInt16);
begin
  FValue:= aValue;
end;
