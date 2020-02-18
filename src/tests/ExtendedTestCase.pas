unit ExtendedTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TExtendedTests }

  TExtendedTests = class(TTestCase)
  private
    FGlobal: IExtended;
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

procedure TExtendedTests.Creation;
var
  b: IExtended;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TExtendedTests.AssignamentAndImplicitCast;
var
  B: IExtended;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TExtendedTests.Addition;
begin
  AssertEquals(127 + 127, IExtended(127).Value + 127);
end;

procedure TExtendedTests.ExplicitCast;
var
  B: IExtended;
begin
  B := IExtended(110);
  AssertEquals(110, B.Value);
end;

procedure TExtendedTests.ExceptionTest;
var
  n: IExtended;
  v: IExtended;
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

procedure TExtendedTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TExtendedTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TExtendedTests);
end.
