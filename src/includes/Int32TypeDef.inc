
type
   { TInt32 }

  TInt32 = class(TInterfacedObject, IInt32,ISerializable)
  private
    function GetValue: Int32;
    procedure SetValue(AValue: Int32);
  protected
    FValue: Int32;
  public
    constructor Create(aValue: Int32);
    property Value : Int32 read GetValue write SetValue;
  end;


operator := (aValue: Int32)        : IInt32;
begin
  result := TInt32.Create(aValue);
end;

operator Explicit(aValue: Int32)    : IInt32;
begin
  result := TInt32.Create(aValue);
end;

operator Explicit(aValue: IInt32)   : Int32;
begin
  result := aValue.Value;
end;

operator+(const Left: IInt32; const right: IInt32)    : Int32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IInt32;const right : IInt32) :  IInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IInt32; const right: Int32)     : Int32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Int32; const right: IInt32)     : Int32;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TInt32 }

function TInt32.GetValue: Int32;
begin
  result := FValue;
end;

procedure TInt32.SetValue(AValue: Int32);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TInt32.Create(aValue: Int32);
begin
  FValue:= aValue;
end;
