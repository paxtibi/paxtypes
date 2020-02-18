type
  { IAnsiString }

  IAnsiString = interface(ISerializable)
  [GUID_AnsiString]
    function Getvalue: AnsiString;
    procedure Setvalue(AValue: AnsiString);
    property value : AnsiString read Getvalue write Setvalue;
  end;

  operator := (aValue :  AnsiString) :  IAnsiString;
  operator Explicit(aValue :  AnsiString) :  IAnsiString;
  operator Explicit(aValue :  IAnsiString) :  AnsiString;
  operator + (const Left : IAnsiString;const right : IAnsiString) :  AnsiString;
  operator + (const Left : IAnsiString;const right : AnsiString)  :  AnsiString;
  operator + (const Left : AnsiString;const right : IAnsiString)  :  AnsiString;
  operator + (const Left : IAnsiString;const right : IAnsiString) :  IAnsiString;
