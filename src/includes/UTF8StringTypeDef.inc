
type
   { TUTF8String }

  TUTF8String = class(TInterfacedObject, IUTF8String,ISerializable)
  private
    function GetValue: UTF8String;
    procedure SetValue(AValue: UTF8String);
  protected
    FValue: UTF8String;
  public
    constructor Create(aValue: UTF8String);
    property Value : UTF8String read GetValue write SetValue;
  end;


operator := (aValue: UTF8String)        : IUTF8String;
begin
  result := TUTF8String.Create(aValue);
end;

operator Explicit(aValue: UTF8String)    : IUTF8String;
begin
  result := TUTF8String.Create(aValue);
end;

operator Explicit(aValue: IUTF8String)   : UTF8String;
begin
  result := aValue.Value;
end;

operator+(const Left: IUTF8String; const right: IUTF8String)    : UTF8String;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IUTF8String;const right : IUTF8String) :  IUTF8String;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IUTF8String; const right: UTF8String)     : UTF8String;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: UTF8String; const right: IUTF8String)     : UTF8String;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TUTF8String }

function TUTF8String.GetValue: UTF8String;
begin
  result := FValue;
end;

procedure TUTF8String.SetValue(AValue: UTF8String);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TUTF8String.Create(aValue: UTF8String);
begin
  FValue:= aValue;
end;
