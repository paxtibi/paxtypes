unit ExtendedType;
interface
uses
  Interfaces, Classes, SysUtils;
type
  { IExtended }

  IExtended = interface(ISerializable)
    function Getvalue: Extended;
    procedure Setvalue(AValue: Extended);
    property value : Extended read Getvalue write Setvalue;
  end;

  operator := (aValue :  Extended) res:  IExtended;
  operator Explicit(aValue :  Extended) res:  IExtended;
  operator Explicit(aValue :  IExtended) res:  Extended;
  operator + (const Left : IExtended;const right : IExtended) res:  Extended;
  operator + (const Left : IExtended;const right : Extended) res:  Extended;
  operator + (const Left : Extended;const right : IExtended) res:  Extended;
  operator + (const Left : IExtended;const right : IExtended) res:  IExtended;
                             
implementation
Uses
  paxtypes;
type
   { TExtended }

  TExtended = class(TInterfacedObject, IExtended,ISerializable)
  private
    function GetValue: Extended;
    procedure SetValue(AValue: Extended);
  protected
    FValue: Extended;
  public
    constructor Create(aValue: Extended);
    property Value : Extended read GetValue write SetValue;
  end;


operator := (aValue: Extended)res: IExtended;
begin
  result := TExtended.Create(aValue);
end;

operator Explicit(aValue: Extended)res: IExtended;
begin
  result := TExtended.Create(aValue);
end;

operator Explicit(aValue: IExtended)res: Extended;
begin
  result := aValue.Value;
end;

operator+(const Left: IExtended; const right: IExtended) res: Extended;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IExtended;const right : IExtended) res:  IExtended;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IExtended; const right: Extended)res: Extended;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: Extended; const right: IExtended)res: Extended;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TExtended }

function TExtended.GetValue: Extended;
begin
  result := FValue;
end;

procedure TExtended.SetValue(AValue: Extended);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TExtended.Create(aValue: Extended);
begin
  FValue:= aValue;
end;

end.
