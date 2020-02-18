type
  { IReal }

  IReal = interface(ISerializable)
  [GUID_Real]
    function Getvalue: Real;
    procedure Setvalue(AValue: Real);
    property value : Real read Getvalue write Setvalue;
  end;

  operator := (aValue :  Real) :  IReal;
  operator Explicit(aValue :  Real) :  IReal;
  operator Explicit(aValue :  IReal) :  Real;
  operator + (const Left : IReal;const right : IReal) :  Real;
  operator + (const Left : IReal;const right : Real)  :  Real;
  operator + (const Left : Real;const right : IReal)  :  Real;
  operator + (const Left : IReal;const right : IReal) :  IReal;
