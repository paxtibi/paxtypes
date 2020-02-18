type
  { ILongWord }

  ILongWord = interface(ISerializable)
  [GUID_LongWord]
    function Getvalue: LongWord;
    procedure Setvalue(AValue: LongWord);
    property value : LongWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  LongWord) :  ILongWord;
  operator Explicit(aValue :  LongWord) :  ILongWord;
  operator Explicit(aValue :  ILongWord) :  LongWord;
  operator + (const Left : ILongWord;const right : ILongWord) :  LongWord;
  operator + (const Left : ILongWord;const right : LongWord)  :  LongWord;
  operator + (const Left : LongWord;const right : ILongWord)  :  LongWord;
  operator + (const Left : ILongWord;const right : ILongWord) :  ILongWord;
