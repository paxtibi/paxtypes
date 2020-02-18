type
  { ISingle }

  ISingle = interface(ISerializable)
  [GUID_Single]
    function Getvalue: Single;
    procedure Setvalue(AValue: Single);
    property value : Single read Getvalue write Setvalue;
  end;

  operator := (aValue :  Single) :  ISingle;
  operator Explicit(aValue :  Single) :  ISingle;
  operator Explicit(aValue :  ISingle) :  Single;
  operator + (const Left : ISingle;const right : ISingle) :  Single;
  operator + (const Left : ISingle;const right : Single)  :  Single;
  operator + (const Left : Single;const right : ISingle)  :  Single;
  operator + (const Left : ISingle;const right : ISingle) :  ISingle;
