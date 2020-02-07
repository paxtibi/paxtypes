unit ShortIntType;
interface
uses
  Interfaces, Classes, SysUtils;
type
  { IShortInt }

  IShortInt = interface(ISerializable)
    function Getvalue: ShortInt;
    procedure Setvalue(AValue: ShortInt);
    property value : ShortInt read Getvalue write Setvalue;
  end;

  operator := (aValue :  ShortInt) res:  IShortInt;
  operator Explicit(aValue :  ShortInt) res:  IShortInt;
  operator Explicit(aValue :  IShortInt) res:  ShortInt;
  operator + (const Left : IShortInt;const right : IShortInt) res:  ShortInt;
  operator + (const Left : IShortInt;const right : ShortInt) res:  ShortInt;
  operator + (const Left : ShortInt;const right : IShortInt) res:  ShortInt;
  operator + (const Left : IShortInt;const right : IShortInt) res:  IShortInt;
                             
implementation
Uses
  paxtypes;
type
   { TShortInt }

  TShortInt = class(TInterfacedObject, IShortInt,ISerializable)
  private
    function GetValue: ShortInt;
    procedure SetValue(AValue: ShortInt);
  protected
    FValue: ShortInt;
  public
    constructor Create(aValue: ShortInt);
    property Value : ShortInt read GetValue write SetValue;
  end;


operator := (aValue: ShortInt)res: IShortInt;
begin
  result := TShortInt.Create(aValue);
end;

operator Explicit(aValue: ShortInt)res: IShortInt;
begin
  result := TShortInt.Create(aValue);
end;

operator Explicit(aValue: IShortInt)res: ShortInt;
begin
  result := aValue.Value;
end;

operator+(const Left: IShortInt; const right: IShortInt) res: ShortInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IShortInt;const right : IShortInt) res:  IShortInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IShortInt; const right: ShortInt)res: ShortInt;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: ShortInt; const right: IShortInt)res: ShortInt;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TShortInt }

function TShortInt.GetValue: ShortInt;
begin
  result := FValue;
end;

procedure TShortInt.SetValue(AValue: ShortInt);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TShortInt.Create(aValue: ShortInt);
begin
  FValue:= aValue;
end;

end.
