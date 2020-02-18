type
  { ILongInt }

  ILongInt = interface(ISerializable)
  [GUID_LongInt]
    function Getvalue: LongInt;
    procedure Setvalue(AValue: LongInt);
    property value : LongInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  LongInt) :  ILongInt;
  operator Explicit(aValue :  LongInt) :  ILongInt;
  operator Explicit(aValue :  ILongInt) :  LongInt;
  operator + (const Left : ILongInt;const right : ILongInt) :  LongInt;
  operator + (const Left : ILongInt;const right : LongInt)  :  LongInt;
  operator + (const Left : LongInt;const right : ILongInt)  :  LongInt;
  operator + (const Left : ILongInt;const right : ILongInt) :  ILongInt;
