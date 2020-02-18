type
  { IWideString }

  IWideString = interface(ISerializable)
  [GUID_WideString]
    function Getvalue: WideString;
    procedure Setvalue(AValue: WideString);
    property value : WideString read Getvalue write Setvalue;
  end;

  operator := (aValue :  WideString) :  IWideString;
  operator Explicit(aValue :  WideString) :  IWideString;
  operator Explicit(aValue :  IWideString) :  WideString;
  operator + (const Left : IWideString;const right : IWideString) :  WideString;
  operator + (const Left : IWideString;const right : WideString)  :  WideString;
  operator + (const Left : WideString;const right : IWideString)  :  WideString;
  operator + (const Left : IWideString;const right : IWideString) :  IWideString;
