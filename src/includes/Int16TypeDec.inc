type
  { IInt16 }

  IInt16 = interface(ISerializable)
  [GUID_Int16]
    function Getvalue: Int16;
    procedure Setvalue(AValue: Int16);
    property value : Int16 read Getvalue write Setvalue;
  end;

  operator := (aValue :  Int16) :  IInt16;
  operator Explicit(aValue :  Int16) :  IInt16;
  operator Explicit(aValue :  IInt16) :  Int16;
  operator + (const Left : IInt16;const right : IInt16) :  Int16;
  operator + (const Left : IInt16;const right : Int16)  :  Int16;
  operator + (const Left : Int16;const right : IInt16)  :  Int16;
  operator + (const Left : IInt16;const right : IInt16) :  IInt16;
