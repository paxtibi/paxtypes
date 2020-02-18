type
  { IDouble }

  IDouble = interface(ISerializable)
  [GUID_Double]
    function Getvalue: Double;
    procedure Setvalue(AValue: Double);
    property value : Double read Getvalue write Setvalue;
  end;

  operator := (aValue :  Double) :  IDouble;
  operator Explicit(aValue :  Double) :  IDouble;
  operator Explicit(aValue :  IDouble) :  Double;
  operator + (const Left : IDouble;const right : IDouble) :  Double;
  operator + (const Left : IDouble;const right : Double)  :  Double;
  operator + (const Left : Double;const right : IDouble)  :  Double;
  operator + (const Left : IDouble;const right : IDouble) :  IDouble;
