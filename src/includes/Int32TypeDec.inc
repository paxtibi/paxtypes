type
  { IInt32 }

  IInt32 = interface(ISerializable)
  [GUID_Int32]
    function Getvalue: Int32;
    procedure Setvalue(AValue: Int32);
    property value : Int32 read Getvalue write Setvalue;
  end;

  operator := (aValue :  Int32) :  IInt32;
  operator Explicit(aValue :  Int32) :  IInt32;
  operator Explicit(aValue :  IInt32) :  Int32;
  operator + (const Left : IInt32;const right : IInt32) :  Int32;
  operator + (const Left : IInt32;const right : Int32)  :  Int32;
  operator + (const Left : Int32;const right : IInt32)  :  Int32;
  operator + (const Left : IInt32;const right : IInt32) :  IInt32;
