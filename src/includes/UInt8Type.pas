unit UInt8Type;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { IUInt8 }

  IUInt8 = interface(ISerializable)
    function Getvalue: UInt8;
    procedure Setvalue(AValue: UInt8);
    property value : UInt8 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt8) :  IUInt8;
  operator Explicit(aValue :  UInt8) :  IUInt8;
  operator Explicit(aValue :  IUInt8) :  UInt8;
  operator + (const Left : IUInt8;const right : IUInt8) :  UInt8;
  operator + (const Left : IUInt8;const right : UInt8)  :  UInt8;
  operator + (const Left : UInt8;const right : IUInt8)  :  UInt8;
  operator + (const Left : IUInt8;const right : IUInt8) :  IUInt8;
                             
implementation
Uses
  paxtypes;
type
   { TUInt8 }

  TUInt8 = class(TInterfacedObject, IUInt8,ISerializable)
  private
    function GetValue: UInt8;
    procedure SetValue(AValue: UInt8);
  protected
    FValue: UInt8;
  public
    constructor Create(aValue: UInt8);
    property Value : UInt8 read GetValue write SetValue;
  end;


operator := (aValue: UInt8)        : IUInt8;
begin
  result := TUInt8.Create(aValue);
end;

operator Explicit(aValue: UInt8)    : IUInt8;
begin
  result := TUInt8.Create(aValue);
end;

operator Explicit(aValue: IUInt8)   : UInt8;
begin
  result := aValue.Value;
end;

operator+(const Left: IUInt8; const right: IUInt8)    : UInt8;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IUInt8;const right : IUInt8) :  IUInt8;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IUInt8; const right: UInt8)     : UInt8;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: UInt8; const right: IUInt8)     : UInt8;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUInt8 }

function TUInt8.GetValue: UInt8;
begin
  result := FValue;
end;

procedure TUInt8.SetValue(AValue: UInt8);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUInt8.Create(aValue: UInt8);
begin
  FValue:= aValue;
end;

end.
