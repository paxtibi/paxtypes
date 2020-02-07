unit DWordType;
interface
uses
  Interfaces, Classes, SysUtils;
type
  { IDWord }

  IDWord = interface(ISerializable)
    function Getvalue: DWord;
    procedure Setvalue(AValue: DWord);
    property value : DWord read Getvalue write Setvalue;
  end;

  operator := (aValue :  DWord) res:  IDWord;
  operator Explicit(aValue :  DWord) res:  IDWord;
  operator Explicit(aValue :  IDWord) res:  DWord;
  operator + (const Left : IDWord;const right : IDWord) res:  DWord;
  operator + (const Left : IDWord;const right : DWord) res:  DWord;
  operator + (const Left : DWord;const right : IDWord) res:  DWord;
  operator + (const Left : IDWord;const right : IDWord) res:  IDWord;
                             
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


operator := (aValue: DWord)res: IDWord;
begin
  result := TDWord.Create(aValue);
end;

operator Explicit(aValue: DWord)res: IDWord;
begin
  result := TDWord.Create(aValue);
end;

operator Explicit(aValue: IDWord)res: DWord;
begin
  result := aValue.Value;
end;

operator+(const Left: IDWord; const right: IDWord) res: DWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;
operator + (const Left : IDWord;const right : IDWord) res:  IDWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  res := left.value + right.value;
end;


operator+(const Left: IDWord; const right: DWord)res: DWord;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  res := left.value + right;
end;

operator+(const Left: DWord; const right: IDWord)res: DWord;
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
