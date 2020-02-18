type
  { ICurrency }

  ICurrency = interface(ISerializable)
  [GUID_Currency]
    function Getvalue: Currency;
    procedure Setvalue(AValue: Currency);
    property value : Currency read Getvalue write Setvalue;
  end;

  operator := (aValue :  Currency) :  ICurrency;
  operator Explicit(aValue :  Currency) :  ICurrency;
  operator Explicit(aValue :  ICurrency) :  Currency;
  operator + (const Left : ICurrency;const right : ICurrency) :  Currency;
  operator + (const Left : ICurrency;const right : Currency)  :  Currency;
  operator + (const Left : Currency;const right : ICurrency)  :  Currency;
  operator + (const Left : ICurrency;const right : ICurrency) :  ICurrency;
