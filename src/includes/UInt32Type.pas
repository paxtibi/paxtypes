unit UInt32Type;
interface
uses
  Classes, SysUtils;
type
  { IUInt32 }

  IUInt32 = interface
    function Getvalue: UInt32;
    procedure Setvalue(AValue: UInt32);
    property value : UInt32 read Getvalue write Setvalue;
  end;

  operator := (aValue :  UInt32) res:  IUInt32;
  operator Explicit(aValue :  UInt32) res:  IUInt32;
  operator Explicit(aValue :  IUInt32) res:  UInt32;
  operator + (const Left : IUInt32;const right : IUInt32) res:  UInt32;
  operator + (const Left : IUInt32;const right : UInt32) res:  UInt32;
  operator + (const Left : UInt32;const right : IUInt32) res:  UInt32;
  operator + (const Left : IUInt32;const right : IUInt32) res:  IUInt32;
                             
implementation
Uses
  paxtypes;
type
   { TUInt32 }

  TUInt32 = class(TInterfacedObject, IUInt32)
  private
    function GetValue: UInt32;
    procedure SetValue(AValue: UInt32);
  protected
    FValue: UInt32;
  public
    constructor Create(aValue: UInt32);
    property Value : UInt32 read GetValue write SetValue;
  end;


operator := (aValue: UInt32)res: IUInt32;
begin
  result := TUInt32.Create(aValue);
end;

operator Explicit(aValue: UInt32)res: IUInt32;
begin
  result := TUInt32.Create(aValue);
end;

operator Explicit(aValue: IUInt32)res: UInt32;
begin
  result := aValue.Value;
end;

operator+(const Left: IUInt32; const right: IUInt32) res: UInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IUInt32;const right : IUInt32) res:  IUInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IUInt32; const right: UInt32)res: UInt32;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: UInt32; const right: IUInt32)res: UInt32;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUInt32 }

function TUInt32.GetValue: UInt32;
begin
  result := FValue;
end;

procedure TUInt32.SetValue(AValue: UInt32);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUInt32.Create(aValue: UInt32);
begin
  FValue:= aValue;
end;

end.
