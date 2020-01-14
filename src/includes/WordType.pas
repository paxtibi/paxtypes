unit WordType;
interface
uses
  Classes, SysUtils;
type
  { IWord }

  IWord = interface
    function Getvalue: Word;
    procedure Setvalue(AValue: Word);
    property value : Word read Getvalue write Setvalue;
  end;

  operator := (aValue :  Word) res:  IWord;
  operator Explicit(aValue :  Word) res:  IWord;
  operator Explicit(aValue :  IWord) res:  Word;
  operator + (const Left : IWord;const right : IWord) res:  Word;
  operator + (const Left : IWord;const right : Word) res:  Word;
  operator + (const Left : Word;const right : IWord) res:  Word;
  operator + (const Left : IWord;const right : IWord) res:  IWord;
                             
implementation
Uses
  paxtypes;
type
   { TWord }

  TWord = class(TInterfacedObject, IWord)
  private
    function GetValue: Word;
    procedure SetValue(AValue: Word);
  protected
    FValue: Word;
  public
    constructor Create(aValue: Word);
    property Value : Word read GetValue write SetValue;
  end;


operator := (aValue: Word)res: IWord;
begin
  result := TWord.Create(aValue);
end;

operator Explicit(aValue: Word)res: IWord;
begin
  result := TWord.Create(aValue);
end;

operator Explicit(aValue: IWord)res: Word;
begin
  result := aValue.Value;
end;

operator+(const Left: IWord; const right: IWord) res: Word;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IWord;const right : IWord) res:  IWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IWord; const right: Word)res: Word;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: Word; const right: IWord)res: Word;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TWord }

function TWord.GetValue: Word;
begin
  result := FValue;
end;

procedure TWord.SetValue(AValue: Word);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TWord.Create(aValue: Word);
begin
  FValue:= aValue;
end;

end.
