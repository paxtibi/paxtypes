type
  { IWord }

  IWord = interface(ISerializable)
  [GUID_Word]
    function Getvalue: Word;
    procedure Setvalue(AValue: Word);
    property value : Word read Getvalue write Setvalue;
  end;

  operator := (aValue :  Word) :  IWord;
  operator Explicit(aValue :  Word) :  IWord;
  operator Explicit(aValue :  IWord) :  Word;
  operator + (const Left : IWord;const right : IWord) :  Word;
  operator + (const Left : IWord;const right : Word)  :  Word;
  operator + (const Left : Word;const right : IWord)  :  Word;
  operator + (const Left : IWord;const right : IWord) :  IWord;
