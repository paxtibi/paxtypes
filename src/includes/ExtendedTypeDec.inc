type
  { IExtended }

  IExtended = interface(ISerializable)
  [GUID_Extended]
    function Getvalue: Extended;
    procedure Setvalue(AValue: Extended);
    property value : Extended read Getvalue write Setvalue;
  end;

  operator := (aValue :  Extended) :  IExtended;
  operator Explicit(aValue :  Extended) :  IExtended;
  operator Explicit(aValue :  IExtended) :  Extended;
  operator + (const Left : IExtended;const right : IExtended) :  Extended;
  operator + (const Left : IExtended;const right : Extended)  :  Extended;
  operator + (const Left : Extended;const right : IExtended)  :  Extended;
  operator + (const Left : IExtended;const right : IExtended) :  IExtended;
