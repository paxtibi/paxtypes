
type
   { TBoolean }

  TBoolean = class(TInterfacedObject, IBoolean,ISerializable)
  private
    function GetValue: Boolean;
    procedure SetValue(AValue: Boolean);
  protected
    FValue: Boolean;
  public
    constructor Create(aValue: Boolean);
    property Value : Boolean read GetValue write SetValue;
  end;


operator := (aValue: Boolean)        : IBoolean;
begin
  result := TBoolean.Create(aValue);
end;

operator Explicit(aValue: Boolean)    : IBoolean;
begin
  result := TBoolean.Create(aValue);
end;

operator Explicit(aValue: IBoolean)   : Boolean;
begin
  result := aValue.Value;
end;

{ TBoolean }

function TBoolean.GetValue: Boolean;
begin
  result := FValue;
end;

procedure TBoolean.SetValue(AValue: Boolean);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TBoolean.Create(aValue: Boolean);
begin
  FValue:= aValue;
end;
