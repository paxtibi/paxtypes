
type
   { TQWord }

  TQWord = class(TInterfacedObject, IQWord,ISerializable)
  private
    function GetValue: QWord;
    procedure SetValue(AValue: QWord);
  protected
    FValue: QWord;
  public
    constructor Create(aValue: QWord);
    property Value : QWord read GetValue write SetValue;
  end;


operator := (aValue: QWord)        : IQWord;
begin
  result := TQWord.Create(aValue);
end;

operator Explicit(aValue: QWord)    : IQWord;
begin
  result := TQWord.Create(aValue);
end;

operator Explicit(aValue: IQWord)   : QWord;
begin
  result := aValue.Value;
end;

operator+(const Left: IQWord; const right: IQWord)    : QWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IQWord;const right : IQWord) :  IQWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IQWord; const right: QWord)     : QWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: QWord; const right: IQWord)     : QWord;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TQWord }

function TQWord.GetValue: QWord;
begin
  result := FValue;
end;

procedure TQWord.SetValue(AValue: QWord);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TQWord.Create(aValue: QWord);
begin
  FValue:= aValue;
end;
