
type
   { TSingle }

  TSingle = class(TInterfacedObject, ISingle,ISerializable)
  private
    function GetValue: Single;
    procedure SetValue(AValue: Single);
  protected
    FValue: Single;
  public
    constructor Create(aValue: Single);
    property Value : Single read GetValue write SetValue;
  end;


operator := (aValue: Single)        : ISingle;
begin
  result := TSingle.Create(aValue);
end;

operator Explicit(aValue: Single)    : ISingle;
begin
  result := TSingle.Create(aValue);
end;

operator Explicit(aValue: ISingle)   : Single;
begin
  result := aValue.Value;
end;

operator+(const Left: ISingle; const right: ISingle)    : Single;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : ISingle;const right : ISingle) :  ISingle;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: ISingle; const right: Single)     : Single;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Single; const right: ISingle)     : Single;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TSingle }

function TSingle.GetValue: Single;
begin
  result := FValue;
end;

procedure TSingle.SetValue(AValue: Single);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TSingle.Create(aValue: Single);
begin
  FValue:= aValue;
end;
