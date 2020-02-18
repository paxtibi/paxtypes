
type
   { TWideString }

  TWideString = class(TInterfacedObject, IWideString,ISerializable)
  private
    function GetValue: WideString;
    procedure SetValue(AValue: WideString);
  protected
    FValue: WideString;
  public
    constructor Create(aValue: WideString);
    property Value : WideString read GetValue write SetValue;
  end;


operator := (aValue: WideString)        : IWideString;
begin
  result := TWideString.Create(aValue);
end;

operator Explicit(aValue: WideString)    : IWideString;
begin
  result := TWideString.Create(aValue);
end;

operator Explicit(aValue: IWideString)   : WideString;
begin
  result := aValue.Value;
end;

operator+(const Left: IWideString; const right: IWideString)    : WideString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IWideString;const right : IWideString) :  IWideString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IWideString; const right: WideString)     : WideString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: WideString; const right: IWideString)     : WideString;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TWideString }

function TWideString.GetValue: WideString;
begin
  result := FValue;
end;

procedure TWideString.SetValue(AValue: WideString);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TWideString.Create(aValue: WideString);
begin
  FValue:= aValue;
end;
