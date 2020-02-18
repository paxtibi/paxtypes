type
  { IUInt16 }

  IUInt16 = interface(ISerializable)
  [GUID_UInt16]
    function Getvalue: UInt16;
    procedure Setvalue(AValue: UInt16);
    property value : UInt16 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt16) :  IUInt16;
  operator Explicit(aValue :  UInt16) :  IUInt16;
  operator Explicit(aValue :  IUInt16) :  UInt16;
  operator + (const Left : IUInt16;const right : IUInt16) :  UInt16;
  operator + (const Left : IUInt16;const right : UInt16)  :  UInt16;
  operator + (const Left : UInt16;const right : IUInt16)  :  UInt16;
  operator + (const Left : IUInt16;const right : IUInt16) :  IUInt16;
