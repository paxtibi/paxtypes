
type
   { TCurrency }

  TCurrency = class(TInterfacedObject, ICurrency,ISerializable)
  private
    function GetValue: Currency;
    procedure SetValue(AValue: Currency);
  protected
    FValue: Currency;
  public
    constructor Create(aValue: Currency);
    property Value : Currency read GetValue write SetValue;
  end;


operator := (aValue: Currency)        : ICurrency;
begin
  result := TCurrency.Create(aValue);
end;

operator Explicit(aValue: Currency)    : ICurrency;
begin
  result := TCurrency.Create(aValue);
end;

operator Explicit(aValue: ICurrency)   : Currency;
begin
  result := aValue.Value;
end;

operator+(const Left: ICurrency; const right: ICurrency)    : Currency;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : ICurrency;const right : ICurrency) :  ICurrency;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: ICurrency; const right: Currency)     : Currency;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Currency; const right: ICurrency)     : Currency;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TCurrency }

function TCurrency.GetValue: Currency;
begin
  result := FValue;
end;

procedure TCurrency.SetValue(AValue: Currency);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TCurrency.Create(aValue: Currency);
begin
  FValue:= aValue;
end;
