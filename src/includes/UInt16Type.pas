unit UInt16Type;
interface
uses
  Classes, SysUtils;
type
  { IUInt16 }

  IUInt16 = interface
    function Getvalue: UInt16;
    procedure Setvalue(AValue: UInt16);
    property value : UInt16 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt16) res:  IUInt16;
  operator Explicit(aValue :  UInt16) res:  IUInt16;
  operator Explicit(aValue :  IUInt16) res:  UInt16;
  operator + (const Left : IUInt16;const right : IUInt16) res:  UInt16;
  operator + (const Left : IUInt16;const right : UInt16) res:  UInt16;
  operator + (const Left : UInt16;const right : IUInt16) res:  UInt16;
  operator + (const Left : IUInt16;const right : IUInt16) res:  IUInt16;
                             
implementation
Uses
  paxtypes;
type
   { TUInt16 }

  TUInt16 = class(TInterfacedObject, IUInt16)
  private
    function GetValue: UInt16;
    procedure SetValue(AValue: UInt16);
  protected
    FValue: UInt16;
  public
    constructor Create(aValue: UInt16);
    property Value : UInt16 read GetValue write SetValue;
  end;


operator := (aValue: UInt16)res: IUInt16;
begin
  result := TUInt16.Create(aValue);
end;

operator Explicit(aValue: UInt16)res: IUInt16;
begin
  result := TUInt16.Create(aValue);
end;

operator Explicit(aValue: IUInt16)res: UInt16;
begin
  result := aValue.Value;
end;

operator+(const Left: IUInt16; const right: IUInt16) res: UInt16;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IUInt16;const right : IUInt16) res:  IUInt16;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IUInt16; const right: UInt16)res: UInt16;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: UInt16; const right: IUInt16)res: UInt16;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUInt16 }

function TUInt16.GetValue: UInt16;
begin
  result := FValue;
end;

procedure TUInt16.SetValue(AValue: UInt16);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUInt16.Create(aValue: UInt16);
begin
  FValue:= aValue;
end;

end.
