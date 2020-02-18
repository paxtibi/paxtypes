
type
   { TUnicodeString }

  TUnicodeString = class(TInterfacedObject, IUnicodeString,ISerializable)
  private
    function GetValue: UnicodeString;
    procedure SetValue(AValue: UnicodeString);
  protected
    FValue: UnicodeString;
  public
    constructor Create(aValue: UnicodeString);
    property Value : UnicodeString read GetValue write SetValue;
  end;


operator := (aValue: UnicodeString)        : IUnicodeString;
begin
  result := TUnicodeString.Create(aValue);
end;

operator Explicit(aValue: UnicodeString)    : IUnicodeString;
begin
  result := TUnicodeString.Create(aValue);
end;

operator Explicit(aValue: IUnicodeString)   : UnicodeString;
begin
  result := aValue.Value;
end;

operator+(const Left: IUnicodeString; const right: IUnicodeString)    : UnicodeString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IUnicodeString;const right : IUnicodeString) :  IUnicodeString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IUnicodeString; const right: UnicodeString)     : UnicodeString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: UnicodeString; const right: IUnicodeString)     : UnicodeString;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUnicodeString }

function TUnicodeString.GetValue: UnicodeString;
begin
  result := FValue;
end;

procedure TUnicodeString.SetValue(AValue: UnicodeString);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUnicodeString.Create(aValue: UnicodeString);
begin
  FValue:= aValue;
end;
