type
  { IUTF8String }

  IUTF8String = interface(ISerializable)
  [GUID_UTF8String]
    function Getvalue: UTF8String;
    procedure Setvalue(AValue: UTF8String);
    property value : UTF8String read Getvalue write Setvalue;
  end;

  operator := (aValue :  UTF8String) :  IUTF8String;
  operator Explicit(aValue :  UTF8String) :  IUTF8String;
  operator Explicit(aValue :  IUTF8String) :  UTF8String;
  operator + (const Left : IUTF8String;const right : IUTF8String) :  UTF8String;
  operator + (const Left : IUTF8String;const right : UTF8String)  :  UTF8String;
  operator + (const Left : UTF8String;const right : IUTF8String)  :  UTF8String;
  operator + (const Left : IUTF8String;const right : IUTF8String) :  IUTF8String;
