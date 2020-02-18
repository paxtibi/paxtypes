type
  { IUInt32 }

  IUInt32 = interface(ISerializable)
  [GUID_UInt32]
    function Getvalue: UInt32;
    procedure Setvalue(AValue: UInt32);
    property value : UInt32 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt32) :  IUInt32;
  operator Explicit(aValue :  UInt32) :  IUInt32;
  operator Explicit(aValue :  IUInt32) :  UInt32;
  operator + (const Left : IUInt32;const right : IUInt32) :  UInt32;
  operator + (const Left : IUInt32;const right : UInt32)  :  UInt32;
  operator + (const Left : UInt32;const right : IUInt32)  :  UInt32;
  operator + (const Left : IUInt32;const right : IUInt32) :  IUInt32;
