type
  { IString }

  IString = interface(ISerializable)
  [GUID_String]
    function Getvalue: String;
    procedure Setvalue(AValue: String);
    property value : String read Getvalue write Setvalue;
  end;

  operator := (aValue :  String) :  IString;
  operator Explicit(aValue :  String) :  IString;
  operator Explicit(aValue :  IString) :  String;
  operator + (const Left : IString;const right : IString) :  String;
  operator + (const Left : IString;const right : String)  :  String;
  operator + (const Left : String;const right : IString)  :  String;
  operator + (const Left : IString;const right : IString) :  IString;
