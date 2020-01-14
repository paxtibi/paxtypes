unit NativeUIntTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,NativeUIntType;

type

  { TNativeUIntTests }

  TNativeUIntTests = class(TTestCase)
  private
    FGlobal: INativeUInt;
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

procedure TNativeUIntTests.Creation;
var
  b: INativeUInt;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TNativeUIntTests.AssignamentAndImplicitCast;
var
  B: INativeUInt;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TNativeUIntTests.Addition;
begin
  AssertEquals(127 + 127, INativeUInt(127).Value + 127);
end;

procedure TNativeUIntTests.ExplicitCast;
var
  B: INativeUInt;
begin
  B := INativeUInt(110);
  AssertEquals(110, B.Value);
end;

procedure TNativeUIntTests.ExceptionTest;
var
  n: INativeUInt;
  v: INativeUInt;
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

procedure TNativeUIntTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TNativeUIntTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TNativeUIntTests);
end.
