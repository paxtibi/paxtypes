unit DWordType;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { IDWord }

  IDWord = interface(ISerializable)
    function Getvalue: DWord;
    procedure Setvalue(AValue: DWord);
    property value : DWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  DWord) :  IDWord;
  operator Explicit(aValue :  DWord) :  IDWord;
  operator Explicit(aValue :  IDWord) :  DWord;
  operator + (const Left : IDWord;const right : IDWord) :  DWord;
  operator + (const Left : IDWord;const right : DWord)  :  DWord;
  operator + (const Left : DWord;const right : IDWord)  :  DWord;
  operator + (const Left : IDWord;const right : IDWord) :  IDWord;
                             
implementation
Uses
  paxtypes;
type
   { TDWord }

  TDWord = class(TInterfacedObject, IDWord,ISerializable)
  private
    function GetValue: DWord;
    procedure SetValue(AValue: DWord);
  protected
    FValue: DWord;
  public
    constructor Create(aValue: DWord);
    property Value : DWord read GetValue write SetValue;
  end;


operator := (aValue: DWord)        : IDWord;
begin
  result := TDWord.Create(aValue);
end;

operator Explicit(aValue: DWord)    : IDWord;
begin
  result := TDWord.Create(aValue);
end;

operator Explicit(aValue: IDWord)   : DWord;
begin
  result := aValue.Value;
end;

operator+(const Left: IDWord; const right: IDWord)    : DWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IDWord;const right : IDWord) :  IDWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IDWord; const right: DWord)     : DWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: DWord; const right: IDWord)     : DWord;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TDWord }

function TDWord.GetValue: DWord;
begin
  result := FValue;
end;

procedure TDWord.SetValue(AValue: DWord);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TDWord.Create(aValue: DWord);
begin
  FValue:= aValue;
end;

end.
