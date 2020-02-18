type
  { IUInt64 }

  IUInt64 = interface(ISerializable)
  [GUID_UInt64]
    function Getvalue: UInt64;
    procedure Setvalue(AValue: UInt64);
    property value : UInt64 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt64) :  IUInt64;
  operator Explicit(aValue :  UInt64) :  IUInt64;
  operator Explicit(aValue :  IUInt64) :  UInt64;
  operator + (const Left : IUInt64;const right : IUInt64) :  UInt64;
  operator + (const Left : IUInt64;const right : UInt64)  :  UInt64;
  operator + (const Left : UInt64;const right : IUInt64)  :  UInt64;
  operator + (const Left : IUInt64;const right : IUInt64) :  IUInt64;
