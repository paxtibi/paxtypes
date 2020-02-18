unit URTF8StringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TURTF8StringTests }

  TURTF8StringTests = class(TTestCase)
  private
    FGlobal: IURTF8String;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Creation;
    procedure AssignamentAndImplicitCast;
    procedure Addition;
    procedure ExplicitCast;
    procedure ExceptionTest;
  end;

implementation

procedure TURTF8StringTests.Creation;
var
  b: IURTF8String;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TURTF8StringTests.AssignamentAndImplicitCast;
var
  B: IURTF8String;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TURTF8StringTests.Addition;
begin
  AssertEquals(127 + 127, IURTF8String(127).Value + 127);
end;

procedure TURTF8StringTests.ExplicitCast;
var
  B: IURTF8String;
begin
  B := IURTF8String(110);
  AssertEquals(110, B.Value);
end;

procedure TURTF8StringTests.ExceptionTest;
var
  n: IURTF8String;
  v: IURTF8String;
begin
  try
    v := 127;
    n := nil;
    n := v + n;
  except
    on E: Exception do
    begin
      Assert(E is ENullPointerException, 'ok');
    end;
  end;
  try
    v := nil;
    n := 127;
    n := v + n;
  except
    on E: Exception do
    begin
      Assert(E is ENullPointerException, 'ok');
    end;
  end;
end;

procedure TURTF8StringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TURTF8StringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TURTF8StringTests);
end.
