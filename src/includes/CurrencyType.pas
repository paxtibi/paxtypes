unit CurrencyType;
interface
uses
  Classes, SysUtils;
type
  { ICurrency }

  ICurrency = interface
    function Getvalue: Currency;
    procedure Setvalue(AValue: Currency);
    property value : Currency read Getvalue write Setvalue;
  end;

  operator := (aValue :  Currency) res:  ICurrency;
  operator Explicit(aValue :  Currency) res:  ICurrency;
  operator Explicit(aValue :  ICurrency) res:  Currency;
  operator + (const Left : ICurrency;const right : ICurrency) res:  Currency;
  operator + (const Left : ICurrency;const right : Currency) res:  Currency;
  operator + (const Left : Currency;const right : ICurrency) res:  Currency;
  operator + (const Left : ICurrency;const right : ICurrency) res:  ICurrency;
                             
implementation
Uses
  paxtypes;
type
   { TCurrency }

  TCurrency = class(TInterfacedObject, ICurrency)
  private
    function GetValue: Currency;
    procedure SetValue(AValue: Currency);
  protected
    FValue: Currency;
  public
    constructor Create(aValue: Currency);
    property Value : Currency read GetValue write SetValue;
  end;


operator := (aValue: Currency)res: ICurrency;
begin
  result := TCurrency.Create(aValue);
end;

operator Explicit(aValue: Currency)res: ICurrency;
begin
  result := TCurrency.Create(aValue);
end;

operator Explicit(aValue: ICurrency)res: Currency;
begin
  result := aValue.Value;
end;

operator+(const Left: ICurrency; const right: ICurrency) res: Currency;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : ICurrency;const right : ICurrency) res:  ICurrency;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: ICurrency; const right: Currency)res: Currency;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: Currency; const right: ICurrency)res: Currency;
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

end.
