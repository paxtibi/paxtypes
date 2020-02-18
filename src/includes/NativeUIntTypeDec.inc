type
  { INativeUInt }

  INativeUInt = interface(ISerializable)
  [GUID_NativeUInt]
    function Getvalue: NativeUInt;
    procedure Setvalue(AValue: NativeUInt);
    property value : NativeUInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  NativeUInt) :  INativeUInt;
  operator Explicit(aValue :  NativeUInt) :  INativeUInt;
  operator Explicit(aValue :  INativeUInt) :  NativeUInt;
  operator + (const Left : INativeUInt;const right : INativeUInt) :  NativeUInt;
  operator + (const Left : INativeUInt;const right : NativeUInt)  :  NativeUInt;
  operator + (const Left : NativeUInt;const right : INativeUInt)  :  NativeUInt;
  operator + (const Left : INativeUInt;const right : INativeUInt) :  INativeUInt;
