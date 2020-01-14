unit NativeIntTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,NativeIntType;

type

  { TNativeIntTests }

  TNativeIntTests = class(TTestCase)
  private
    FGlobal: INativeInt;
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

procedure TNativeIntTests.Creation;
var
  b: INativeInt;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TNativeIntTests.AssignamentAndImplicitCast;
var
  B: INativeInt;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TNativeIntTests.Addition;
begin
  AssertEquals(127 + 127, INativeInt(127).Value + 127);
end;

procedure TNativeIntTests.ExplicitCast;
var
  B: INativeInt;
begin
  B := INativeInt(110);
  AssertEquals(110, B.Value);
end;

procedure TNativeIntTests.ExceptionTest;
var
  n: INativeInt;
  v: INativeInt;
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

procedure TNativeIntTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TNativeIntTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TNativeIntTests);
end.
