
type
   { TInteger }

  TInteger = class(TInterfacedObject, IInteger,ISerializable)
  private
    function GetValue: Integer;
    procedure SetValue(AValue: Integer);
  protected
    FValue: Integer;
  public
    constructor Create(aValue: Integer);
    property Value : Integer read GetValue write SetValue;
  end;


operator := (aValue: Integer)        : IInteger;
begin
  result := TInteger.Create(aValue);
end;

operator Explicit(aValue: Integer)    : IInteger;
begin
  result := TInteger.Create(aValue);
end;

operator Explicit(aValue: IInteger)   : Integer;
begin
  result := aValue.Value;
end;

operator+(const Left: IInteger; const right: IInteger)    : Integer;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IInteger;const right : IInteger) :  IInteger;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IInteger; const right: Integer)     : Integer;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Integer; const right: IInteger)     : Integer;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TInteger }

function TInteger.GetValue: Integer;
begin
  result := FValue;
end;

procedure TInteger.SetValue(AValue: Integer);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TInteger.Create(aValue: Integer);
begin
  FValue:= aValue;
end;
