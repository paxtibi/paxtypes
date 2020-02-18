type
  { IUnicodeString }

  IUnicodeString = interface(ISerializable)
  [GUID_UnicodeString]
    function Getvalue: UnicodeString;
    procedure Setvalue(AValue: UnicodeString);
    property value : UnicodeString read Getvalue write Setvalue;
  end;

  operator := (aValue :  UnicodeString) :  IUnicodeString;
  operator Explicit(aValue :  UnicodeString) :  IUnicodeString;
  operator Explicit(aValue :  IUnicodeString) :  UnicodeString;
  operator + (const Left : IUnicodeString;const right : IUnicodeString) :  UnicodeString;
  operator + (const Left : IUnicodeString;const right : UnicodeString)  :  UnicodeString;
  operator + (const Left : UnicodeString;const right : IUnicodeString)  :  UnicodeString;
  operator + (const Left : IUnicodeString;const right : IUnicodeString) :  IUnicodeString;
