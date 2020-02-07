unit SingleType;
interface
uses
  Interfaces, Classes, SysUtils;
type
  { ISingle }

  ISingle = interface(ISerializable)
    function Getvalue: Single;
    procedure Setvalue(AValue: Single);
    property value : Single read Getvalue write Setvalue;
  end;

  operator := (aValue :  Single) res:  ISingle;
  operator Explicit(aValue :  Single) res:  ISingle;
  operator Explicit(aValue :  ISingle) res:  Single;
  operator + (const Left : ISingle;const right : ISingle) res:  Single;
  operator + (const Left : ISingle;const right : Single) res:  Single;
  operator + (const Left : Single;const right : ISingle) res:  Single;
  operator + (const Left : ISingle;const right : ISingle) res:  ISingle;
                             
implementation
Uses
  paxtypes;
type
   { TSingle }

  TSingle = class(TInterfacedObject, ISingle,ISerializable)
  private
    function GetValue: Single;
    procedure SetValue(AValue: Single);
  protected
    FValue: Single;
  public
    constructor Create(aValue: Single);
    property Value : Single read GetValue write SetValue;
  end;


operator := (aValue: Single)res: ISingle;
begin
  result := TSingle.Create(aValue);
end;

operator Explicit(aValue: Single)res: ISingle;
begin
  result := TSingle.Create(aValue);
end;

operator Explicit(aValue: ISingle)res: Single;
begin
  result := aValue.Value;
end;

operator+(const Left: ISingle; const right: ISingle) res: Single;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : ISingle;const right : ISingle) res:  ISingle;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: ISingle; const right: Single)res: Single;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: Single; const right: ISingle)res: Single;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TSingle }

function TSingle.GetValue: Single;
begin
  result := FValue;
end;

procedure TSingle.SetValue(AValue: Single);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TSingle.Create(aValue: Single);
begin
  FValue:= aValue;
end;

end.
