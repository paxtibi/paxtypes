
type
   { TComp }

  TComp = class(TInterfacedObject, IComp,ISerializable)
  private
    function GetValue: Comp;
    procedure SetValue(AValue: Comp);
  protected
    FValue: Comp;
  public
    constructor Create(aValue: Comp);
    property Value : Comp read GetValue write SetValue;
  end;


operator := (aValue: Comp)        : IComp;
begin
  result := TComp.Create(aValue);
end;

operator Explicit(aValue: Comp)    : IComp;
begin
  result := TComp.Create(aValue);
end;

operator Explicit(aValue: IComp)   : Comp;
begin
  result := aValue.Value;
end;

operator+(const Left: IComp; const right: IComp)    : Comp;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IComp;const right : IComp) :  IComp;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IComp; const right: Comp)     : Comp;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: Comp; const right: IComp)     : Comp;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TComp }

function TComp.GetValue: Comp;
begin
  result := FValue;
end;

procedure TComp.SetValue(AValue: Comp);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TComp.Create(aValue: Comp);
begin
  FValue:= aValue;
end;
