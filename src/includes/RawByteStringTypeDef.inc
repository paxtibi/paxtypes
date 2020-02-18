
type
   { TRawByteString }

  TRawByteString = class(TInterfacedObject, IRawByteString,ISerializable)
  private
    function GetValue: RawByteString;
    procedure SetValue(AValue: RawByteString);
  protected
    FValue: RawByteString;
  public
    constructor Create(aValue: RawByteString);
    property Value : RawByteString read GetValue write SetValue;
  end;


operator := (aValue: RawByteString)        : IRawByteString;
begin
  result := TRawByteString.Create(aValue);
end;

operator Explicit(aValue: RawByteString)    : IRawByteString;
begin
  result := TRawByteString.Create(aValue);
end;

operator Explicit(aValue: IRawByteString)   : RawByteString;
begin
  result := aValue.Value;
end;

operator+(const Left: IRawByteString; const right: IRawByteString)    : RawByteString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IRawByteString;const right : IRawByteString) :  IRawByteString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IRawByteString; const right: RawByteString)     : RawByteString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: RawByteString; const right: IRawByteString)     : RawByteString;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TRawByteString }

function TRawByteString.GetValue: RawByteString;
begin
  result := FValue;
end;

procedure TRawByteString.SetValue(AValue: RawByteString);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TRawByteString.Create(aValue: RawByteString);
begin
  FValue:= aValue;
end;
