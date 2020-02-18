type
  { ISmallInt }

  ISmallInt = interface(ISerializable)
  [GUID_SmallInt]
    function Getvalue: SmallInt;
    procedure Setvalue(AValue: SmallInt);
    property value : SmallInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  SmallInt) :  ISmallInt;
  operator Explicit(aValue :  SmallInt) :  ISmallInt;
  operator Explicit(aValue :  ISmallInt) :  SmallInt;
  operator + (const Left : ISmallInt;const right : ISmallInt) :  SmallInt;
  operator + (const Left : ISmallInt;const right : SmallInt)  :  SmallInt;
  operator + (const Left : SmallInt;const right : ISmallInt)  :  SmallInt;
  operator + (const Left : ISmallInt;const right : ISmallInt) :  ISmallInt;
