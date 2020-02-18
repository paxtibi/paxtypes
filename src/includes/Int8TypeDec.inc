type
  { IInt8 }

  IInt8 = interface(ISerializable)
  [GUID_Int8]
    function Getvalue: Int8;
    procedure Setvalue(AValue: Int8);
    property value : Int8 read Getvalue write Setvalue;
  end;

  operator := (aValue :  Int8) :  IInt8;
  operator Explicit(aValue :  Int8) :  IInt8;
  operator Explicit(aValue :  IInt8) :  Int8;
  operator + (const Left : IInt8;const right : IInt8) :  Int8;
  operator + (const Left : IInt8;const right : Int8)  :  Int8;
  operator + (const Left : Int8;const right : IInt8)  :  Int8;
  operator + (const Left : IInt8;const right : IInt8) :  IInt8;
