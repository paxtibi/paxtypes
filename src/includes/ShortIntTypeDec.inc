type
  { IShortInt }

  IShortInt = interface(ISerializable)
  [GUID_ShortInt]
    function Getvalue: ShortInt;
    procedure Setvalue(AValue: ShortInt);
    property value : ShortInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  ShortInt) :  IShortInt;
  operator Explicit(aValue :  ShortInt) :  IShortInt;
  operator Explicit(aValue :  IShortInt) :  ShortInt;
  operator + (const Left : IShortInt;const right : IShortInt) :  ShortInt;
  operator + (const Left : IShortInt;const right : ShortInt)  :  ShortInt;
  operator + (const Left : ShortInt;const right : IShortInt)  :  ShortInt;
  operator + (const Left : IShortInt;const right : IShortInt) :  IShortInt;
