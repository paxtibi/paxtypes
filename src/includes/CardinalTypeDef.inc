
type
   { TCardinal }

  TCardinal = class(TInterfacedObject, ICardinal,ISerializable)
  private
    function GetValue: Cardinal;
    procedure SetValue(AValue: Cardinal);
  protected
    FValue: Cardinal;
  public
    constructor Create(aValue: Cardinal);
    property Value : Cardinal read GetValue write SetValue;
  end;


operator := (aValue: Cardinal)        : ICardinal;
begin
  result := TCardinal.Create(aValue);
end;

operator Explicit(aValue: Cardinal)    : ICardinal;
begin
  result := TCardinal.Create(aValue);
end;

operator Explicit(aValue: ICardinal)   : Cardinal;
begin
  result := aValue.Value;
end;

operator+(const Left: ICardinal; const right: ICardinal)    : Cardinal;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : ICardinal;const right : ICardinal) :  ICardinal;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: ICardinal; const right: Cardinal)     : Cardinal;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Cardinal; const right: ICardinal)     : Cardinal;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TCardinal }

function TCardinal.GetValue: Cardinal;
begin
  result := FValue;
end;

procedure TCardinal.SetValue(AValue: Cardinal);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TCardinal.Create(aValue: Cardinal);
begin
  FValue:= aValue;
end;
