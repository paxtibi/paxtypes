unit LongWordType;
interface
uses
  paxInterfaces, Classes, SysUtils;
type
  { ILongWord }

  ILongWord = interface(ISerializable)
    function Getvalue: LongWord;
    procedure Setvalue(AValue: LongWord);
    property value : LongWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  LongWord) :  ILongWord;
  operator Explicit(aValue :  LongWord) :  ILongWord;
  operator Explicit(aValue :  ILongWord) :  LongWord;
  operator + (const Left : ILongWord;const right : ILongWord) :  LongWord;
  operator + (const Left : ILongWord;const right : LongWord)  :  LongWord;
  operator + (const Left : LongWord;const right : ILongWord)  :  LongWord;
  operator + (const Left : ILongWord;const right : ILongWord) :  ILongWord;
                             
implementation
Uses
  paxtypes;
type
   { TLongWord }

  TLongWord = class(TInterfacedObject, ILongWord,ISerializable)
  private
    function GetValue: LongWord;
    procedure SetValue(AValue: LongWord);
  protected
    FValue: LongWord;
  public
    constructor Create(aValue: LongWord);
    property Value : LongWord read GetValue write SetValue;
  end;


operator := (aValue: LongWord)        : ILongWord;
begin
  result := TLongWord.Create(aValue);
end;

operator Explicit(aValue: LongWord)    : ILongWord;
begin
  result := TLongWord.Create(aValue);
end;

operator Explicit(aValue: ILongWord)   : LongWord;
begin
  result := aValue.Value;
end;

operator+(const Left: ILongWord; const right: ILongWord)    : LongWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : ILongWord;const right : ILongWord) :  ILongWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: ILongWord; const right: LongWord)     : LongWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: LongWord; const right: ILongWord)     : LongWord;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TLongWord }

function TLongWord.GetValue: LongWord;
begin
  result := FValue;
end;

procedure TLongWord.SetValue(AValue: LongWord);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TLongWord.Create(aValue: LongWord);
begin
  FValue:= aValue;
end;

end.
