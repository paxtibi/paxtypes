type
  { IRawByteString }

  IRawByteString = interface(ISerializable)
  [GUID_RawByteString]
    function Getvalue: RawByteString;
    procedure Setvalue(AValue: RawByteString);
    property value : RawByteString read Getvalue write Setvalue;
  end;

  operator := (aValue :  RawByteString) :  IRawByteString;
  operator Explicit(aValue :  RawByteString) :  IRawByteString;
  operator Explicit(aValue :  IRawByteString) :  RawByteString;
  operator + (const Left : IRawByteString;const right : IRawByteString) :  RawByteString;
  operator + (const Left : IRawByteString;const right : RawByteString)  :  RawByteString;
  operator + (const Left : RawByteString;const right : IRawByteString)  :  RawByteString;
  operator + (const Left : IRawByteString;const right : IRawByteString) :  IRawByteString;
