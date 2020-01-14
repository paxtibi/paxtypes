unit SmallIntType;
interface
uses
  Classes, SysUtils;
type
  { ISmallInt }

  ISmallInt = interface
    function Getvalue: SmallInt;
    procedure Setvalue(AValue: SmallInt);
    property value : SmallInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  SmallInt) res:  ISmallInt;
  operator Explicit(aValue :  SmallInt) res:  ISmallInt;
  operator Explicit(aValue :  ISmallInt) res:  SmallInt;
  operator + (const Left : ISmallInt;const right : ISmallInt) res:  SmallInt;
  operator + (const Left : ISmallInt;const right : SmallInt) res:  SmallInt;
  operator + (const Left : SmallInt;const right : ISmallInt) res:  SmallInt;
  operator + (const Left : ISmallInt;const right : ISmallInt) res:  ISmallInt;
                             
implementation
Uses
  paxtypes;
type
   { TSmallInt }

  TSmallInt = class(TInterfacedObject, ISmallInt)
  private
    function GetValue: SmallInt;
    procedure SetValue(AValue: SmallInt);
  protected
    FValue: SmallInt;
  public
    constructor Create(aValue: SmallInt);
    property Value : SmallInt read GetValue write SetValue;
  end;


operator := (aValue: SmallInt)res: ISmallInt;
begin
  result := TSmallInt.Create(aValue);
end;

operator Explicit(aValue: SmallInt)res: ISmallInt;
begin
  result := TSmallInt.Create(aValue);
end;

operator Explicit(aValue: ISmallInt)res: SmallInt;
begin
  result := aValue.Value;
end;

operator+(const Left: ISmallInt; const right: ISmallInt) res: SmallInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : ISmallInt;const right : ISmallInt) res:  ISmallInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: ISmallInt; const right: SmallInt)res: SmallInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: SmallInt; const right: ISmallInt)res: SmallInt;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TSmallInt }

function TSmallInt.GetValue: SmallInt;
begin
  result := FValue;
end;

procedure TSmallInt.SetValue(AValue: SmallInt);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TSmallInt.Create(aValue: SmallInt);
begin
  FValue:= aValue;
end;

end.