type
  { IQWord }

  IQWord = interface(ISerializable)
  [GUID_QWord]
    function Getvalue: QWord;
    procedure Setvalue(AValue: QWord);
    property value : QWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  QWord) :  IQWord;
  operator Explicit(aValue :  QWord) :  IQWord;
  operator Explicit(aValue :  IQWord) :  QWord;
  operator + (const Left : IQWord;const right : IQWord) :  QWord;
  operator + (const Left : IQWord;const right : QWord)  :  QWord;
  operator + (const Left : QWord;const right : IQWord)  :  QWord;
  operator + (const Left : IQWord;const right : IQWord) :  IQWord;
