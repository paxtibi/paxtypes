unit LongWordType;
interface
uses
  Classes, SysUtils;
type
  { ILongWord }

  ILongWord = interface
    function Getvalue: LongWord;
    procedure Setvalue(AValue: LongWord);
    property value : LongWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  LongWord) res:  ILongWord;
  operator Explicit(aValue :  LongWord) res:  ILongWord;
  operator Explicit(aValue :  ILongWord) res:  LongWord;
  operator + (const Left : ILongWord;const right : ILongWord) res:  LongWord;
  operator + (const Left : ILongWord;const right : LongWord) res:  LongWord;
  operator + (const Left : LongWord;const right : ILongWord) res:  LongWord;
  operator + (const Left : ILongWord;const right : ILongWord) res:  ILongWord;
                             
implementation
Uses
  paxtypes;
type
   { TLongWord }

  TLongWord = class(TInterfacedObject, ILongWord)
  private
    function GetValue: LongWord;
    procedure SetValue(AValue: LongWord);
  protected
    FValue: LongWord;
  public
    constructor Create(aValue: LongWord);
    property Value : LongWord read GetValue write SetValue;
  end;


operator := (aValue: LongWord)res: ILongWord;
begin
  result := TLongWord.Create(aValue);
end;

operator Explicit(aValue: LongWord)res: ILongWord;
begin
  result := TLongWord.Create(aValue);
end;

operator Explicit(aValue: ILongWord)res: LongWord;
begin
  result := aValue.Value;
end;

operator+(const Left: ILongWord; const right: ILongWord) res: LongWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : ILongWord;const right : ILongWord) res:  ILongWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: ILongWord; const right: LongWord)res: LongWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: LongWord; const right: ILongWord)res: LongWord;
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
