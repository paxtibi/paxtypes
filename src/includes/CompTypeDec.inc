type
  { IComp }

  IComp = interface(ISerializable)
  [GUID_Comp]
    function Getvalue: Comp;
    procedure Setvalue(AValue: Comp);
    property value : Comp read Getvalue write Setvalue;
  end;

  operator := (aValue :  Comp) :  IComp;
  operator Explicit(aValue :  Comp) :  IComp;
  operator Explicit(aValue :  IComp) :  Comp;
  operator + (const Left : IComp;const right : IComp) :  Comp;
  operator + (const Left : IComp;const right : Comp)  :  Comp;
  operator + (const Left : Comp;const right : IComp)  :  Comp;
  operator + (const Left : IComp;const right : IComp) :  IComp;
