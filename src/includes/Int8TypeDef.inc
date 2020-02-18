
type
   { TInt8 }

  TInt8 = class(TInterfacedObject, IInt8,ISerializable)
  private
    function GetValue: Int8;
    procedure SetValue(AValue: Int8);
  protected
    FValue: Int8;
  public
    constructor Create(aValue: Int8);
    property Value : Int8 read GetValue write SetValue;
  end;


operator := (aValue: Int8)        : IInt8;
begin
  result := TInt8.Create(aValue);
end;

operator Explicit(aValue: Int8)    : IInt8;
begin
  result := TInt8.Create(aValue);
end;

operator Explicit(aValue: IInt8)   : Int8;
begin
  result := aValue.Value;
end;

operator+(const Left: IInt8; const right: IInt8)    : Int8;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IInt8;const right : IInt8) :  IInt8;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IInt8; const right: Int8)     : Int8;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Int8; const right: IInt8)     : Int8;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TInt8 }

function TInt8.GetValue: Int8;
begin
  result := FValue;
end;

procedure TInt8.SetValue(AValue: Int8);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TInt8.Create(aValue: Int8);
begin
  FValue:= aValue;
end;
