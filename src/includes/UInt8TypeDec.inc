type
  { IUInt8 }

  IUInt8 = interface(ISerializable)
  [GUID_UInt8]
    function Getvalue: UInt8;
    procedure Setvalue(AValue: UInt8);
    property value : UInt8 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt8) :  IUInt8;
  operator Explicit(aValue :  UInt8) :  IUInt8;
  operator Explicit(aValue :  IUInt8) :  UInt8;
  operator + (const Left : IUInt8;const right : IUInt8) :  UInt8;
  operator + (const Left : IUInt8;const right : UInt8)  :  UInt8;
  operator + (const Left : UInt8;const right : IUInt8)  :  UInt8;
  operator + (const Left : IUInt8;const right : IUInt8) :  IUInt8;
