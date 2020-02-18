unit StringType;

{$mode objfpc}{$H+}

interface

uses
  paxInterfaces, Classes, SysUtils;

type
  { IString }

  IString = interface(ISerializable)
    function Getvalue: String;
    procedure Setvalue(AValue: String);
    property value : String read Getvalue write Setvalue;
  end;

  operator := (aValue :  String) :  IString;
  operator Explicit(aValue :  String) :  IString;
  operator Explicit(aValue :  IString) :  String;
  operator + (const Left : IString;const right : IString) :  String;
  operator + (const Left : IString;const right : String)  :  String;
  operator + (const Left : String;const right : IString)  :  String;
  operator + (const Left : IString;const right : IString) :  IString;

implementation
Uses
  paxtypes;
type
   { TString }

  TString = class(TInterfacedObject, IString,ISerializable)
  private
    function GetValue: String;
    procedure SetValue(AValue: String);
  protected
    FValue: String;
  public
    constructor Create(aValue: String);
    property Value : String read GetValue write SetValue;
  end;


operator := (aValue: String)        : IString;
begin
  result := TString.Create(aValue);
end;

operator Explicit(aValue: String)    : IString;
begin
  result := TString.Create(aValue);
end;

operator Explicit(aValue: IString)   : String;
begin
  result := aValue.Value;
end;

operator+(const Left: IString; const right: IString)    : String;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;
operator + (const Left : IString;const right : IString) :  IString;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left.value + right.value;
end;

operator+(const Left: IString; const right: String)     : String;
begin
  if not assigned(left) then Raise ENullPointerException.Create('Addition :Left parameter is nil');
  result := left.value + right;
end;

operator+(const Left: String; const right: IString)     : String;
begin
  if not assigned(right)then Raise ENullPointerException.Create('Addition :Right parameter is nil');
  result := left+ right.value;
end;

{ TString }

function TString.GetValue: String;
begin
  result := FValue;
end;

procedure TString.SetValue(AValue: String);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
end;

constructor TString.Create(aValue: String);
begin
  FValue:= aValue;
end;

end.
