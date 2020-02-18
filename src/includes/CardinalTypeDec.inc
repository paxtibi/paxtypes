type
  { ICardinal }

  ICardinal = interface(ISerializable)
  [GUID_Cardinal]
    function Getvalue: Cardinal;
    procedure Setvalue(AValue: Cardinal);
    property value : Cardinal read Getvalue write Setvalue;
  end;

  operator := (aValue :  Cardinal) :  ICardinal;
  operator Explicit(aValue :  Cardinal) :  ICardinal;
  operator Explicit(aValue :  ICardinal) :  Cardinal;
  operator + (const Left : ICardinal;const right : ICardinal) :  Cardinal;
  operator + (const Left : ICardinal;const right : Cardinal)  :  Cardinal;
  operator + (const Left : Cardinal;const right : ICardinal)  :  Cardinal;
  operator + (const Left : ICardinal;const right : ICardinal) :  ICardinal;
