type
  { IInteger }

  IInteger = interface(ISerializable)
  [GUID_Integer]
    function Getvalue: Integer;
    procedure Setvalue(AValue: Integer);
    property value : Integer read Getvalue write Setvalue;
  end;

  operator := (aValue :  Integer) :  IInteger;
  operator Explicit(aValue :  Integer) :  IInteger;
  operator Explicit(aValue :  IInteger) :  Integer;
  operator + (const Left : IInteger;const right : IInteger) :  Integer;
  operator + (const Left : IInteger;const right : Integer)  :  Integer;
  operator + (const Left : Integer;const right : IInteger)  :  Integer;
  operator + (const Left : IInteger;const right : IInteger) :  IInteger;
