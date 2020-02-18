
type
   { TWord }

  TWord = class(TInterfacedObject, IWord,ISerializable)
  private
    function GetValue: Word;
    procedure SetValue(AValue: Word);
  protected
    FValue: Word;
  public
    constructor Create(aValue: Word);
    property Value : Word read GetValue write SetValue;
  end;


operator := (aValue: Word)        : IWord;
begin
  result := TWord.Create(aValue);
end;

operator Explicit(aValue: Word)    : IWord;
begin
  result := TWord.Create(aValue);
end;

operator Explicit(aValue: IWord)   : Word;
begin
  result := aValue.Value;
end;

operator+(const Left: IWord; const right: IWord)    : Word;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IWord;const right : IWord) :  IWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IWord; const right: Word)     : Word;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Word; const right: IWord)     : Word;
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
