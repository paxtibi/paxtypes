type
  { IDWord }

  IDWord = interface(ISerializable)
  [GUID_DWord]
    function Getvalue: DWord;
    procedure Setvalue(AValue: DWord);
    property value : DWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  DWord) :  IDWord;
  operator Explicit(aValue :  DWord) :  IDWord;
  operator Explicit(aValue :  IDWord) :  DWord;
  operator + (const Left : IDWord;const right : IDWord) :  DWord;
  operator + (const Left : IDWord;const right : DWord)  :  DWord;
  operator + (const Left : DWord;const right : IDWord)  :  DWord;
  operator + (const Left : IDWord;const right : IDWord) :  IDWord;
