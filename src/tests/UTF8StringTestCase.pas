unit UTF8StringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TUTF8StringTests }

  TUTF8StringTests = class(TTestCase)
  private
    FGlobal: IUTF8String;
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

procedure TUTF8StringTests.Creation;
var
  b: IUTF8String;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TUTF8StringTests.AssignamentAndImplicitCast;
var
  B: IUTF8String;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TUTF8StringTests.Addition;
begin
  AssertEquals(127 + 127, IUTF8String(127).Value + 127);
end;

procedure TUTF8StringTests.ExplicitCast;
var
  B: IUTF8String;
begin
  B := IUTF8String(110);
  AssertEquals(110, B.Value);
end;

procedure TUTF8StringTests.ExceptionTest;
var
  n: IUTF8String;
  v: IUTF8String;
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

procedure TUTF8StringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TUTF8StringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TUTF8StringTests);
end.
