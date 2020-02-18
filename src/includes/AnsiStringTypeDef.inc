
type
   { TAnsiString }

  TAnsiString = class(TInterfacedObject, IAnsiString,ISerializable)
  private
    function GetValue: AnsiString;
    procedure SetValue(AValue: AnsiString);
  protected
    FValue: AnsiString;
  public
    constructor Create(aValue: AnsiString);
    property Value : AnsiString read GetValue write SetValue;
  end;


operator := (aValue: AnsiString)        : IAnsiString;
begin
  result := TAnsiString.Create(aValue);
end;

operator Explicit(aValue: AnsiString)    : IAnsiString;
begin
  result := TAnsiString.Create(aValue);
end;

operator Explicit(aValue: IAnsiString)   : AnsiString;
begin
  result := aValue.Value;
end;

operator+(const Left: IAnsiString; const right: IAnsiString)    : AnsiString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IAnsiString;const right : IAnsiString) :  IAnsiString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IAnsiString; const right: AnsiString)     : AnsiString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: AnsiString; const right: IAnsiString)     : AnsiString;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TAnsiString }

function TAnsiString.GetValue: AnsiString;
begin
  result := FValue;
end;

procedure TAnsiString.SetValue(AValue: AnsiString);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TAnsiString.Create(aValue: AnsiString);
begin
  FValue:= aValue;
end;
