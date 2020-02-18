type
  { INativeInt }

  INativeInt = interface(ISerializable)
  [GUID_NativeInt]
    function Getvalue: NativeInt;
    procedure Setvalue(AValue: NativeInt);
    property value : NativeInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  NativeInt) :  INativeInt;
  operator Explicit(aValue :  NativeInt) :  INativeInt;
  operator Explicit(aValue :  INativeInt) :  NativeInt;
  operator + (const Left : INativeInt;const right : INativeInt) :  NativeInt;
  operator + (const Left : INativeInt;const right : NativeInt)  :  NativeInt;
  operator + (const Left : NativeInt;const right : INativeInt)  :  NativeInt;
  operator + (const Left : INativeInt;const right : INativeInt) :  INativeInt;
