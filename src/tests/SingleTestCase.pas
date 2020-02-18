unit SingleTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TSingleTests }

  TSingleTests = class(TTestCase)
  private
    FGlobal: ISingle;
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

procedure TSingleTests.Creation;
var
  b: ISingle;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TSingleTests.AssignamentAndImplicitCast;
var
  B: ISingle;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TSingleTests.Addition;
begin
  AssertEquals(127 + 127, ISingle(127).Value + 127);
end;

procedure TSingleTests.ExplicitCast;
var
  B: ISingle;
begin
  B := ISingle(110);
  AssertEquals(110, B.Value);
end;

procedure TSingleTests.ExceptionTest;
var
  n: ISingle;
  v: ISingle;
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

procedure TSingleTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TSingleTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TSingleTests);
end.
