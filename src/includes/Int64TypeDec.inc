type
  { IInt64 }

  IInt64 = interface(ISerializable)
  [GUID_Int64]
    function Getvalue: Int64;
    procedure Setvalue(AValue: Int64);
    property value : Int64 read Getvalue write Setvalue;
  end;

  operator := (aValue :  Int64) :  IInt64;
  operator Explicit(aValue :  Int64) :  IInt64;
  operator Explicit(aValue :  IInt64) :  Int64;
  operator + (const Left : IInt64;const right : IInt64) :  Int64;
  operator + (const Left : IInt64;const right : Int64)  :  Int64;
  operator + (const Left : Int64;const right : IInt64)  :  Int64;
  operator + (const Left : IInt64;const right : IInt64) :  IInt64;
