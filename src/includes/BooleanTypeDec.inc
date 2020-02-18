type
  { IBoolean }

  IBoolean = interface(ISerializable)
  [GUID_Boolean]
    function Getvalue: Boolean;
    procedure Setvalue(AValue: Boolean);
    property value : Boolean read Getvalue write Setvalue;
  end;

  operator := (aValue :  Boolean) :  IBoolean;
  operator Explicit(aValue :  Boolean) :  IBoolean;
  operator Explicit(aValue :  IBoolean) :  Boolean;
