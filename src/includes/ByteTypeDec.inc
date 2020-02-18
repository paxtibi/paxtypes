type
  { IByte }

  IByte = interface(ISerializable)
  [GUID_Byte]
    function Getvalue: Byte;
    procedure Setvalue(AValue: Byte);
    property value : Byte read Getvalue write Setvalue;
  end;

  operator := (aValue :  Byte) :  IByte;
  operator Explicit(aValue :  Byte) :  IByte;
  operator Explicit(aValue :  IByte) :  Byte;
  operator + (const Left : IByte;const right : IByte) :  Byte;
  operator + (const Left : IByte;const right : Byte)  :  Byte;
  operator + (const Left : Byte;const right : IByte)  :  Byte;
  operator + (const Left : IByte;const right : IByte) :  IByte;
