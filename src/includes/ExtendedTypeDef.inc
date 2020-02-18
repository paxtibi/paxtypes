
type
   { TExtended }

  TExtended = class(TInterfacedObject, IExtended,ISerializable)
  private
    function GetValue: Extended;
    procedure SetValue(AValue: Extended);
  protected
    FValue: Extended;
  public
    constructor Create(aValue: Extended);
    property Value : Extended read GetValue write SetValue;
  end;


operator := (aValue: Extended)        : IExtended;
begin
  result := TExtended.Create(aValue);
end;

operator Explicit(aValue: Extended)    : IExtended;
begin
  result := TExtended.Create(aValue);
end;

operator Explicit(aValue: IExtended)   : Extended;
begin
  result := aValue.Value;
end;

operator+(const Left: IExtended; const right: IExtended)    : Extended;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IExtended;const right : IExtended) :  IExtended;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IExtended; const right: Extended)     : Extended;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Extended; const right: IExtended)     : Extended;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TExtended }

function TExtended.GetValue: Extended;
begin
  result := FValue;
end;

procedure TExtended.SetValue(AValue: Extended);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TExtended.Create(aValue: Extended);
begin
  FValue:= aValue;
end;
