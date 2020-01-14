unit DoubleTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,DoubleType;

type

  { TDoubleTests }

  TDoubleTests = class(TTestCase)
  private
    FGlobal: IDouble;
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

procedure TDoubleTests.Creation;
var
  b: IDouble;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TDoubleTests.AssignamentAndImplicitCast;
var
  B: IDouble;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TDoubleTests.Addition;
begin
  AssertEquals(127 + 127, IDouble(127).Value + 127);
end;

procedure TDoubleTests.ExplicitCast;
var
  B: IDouble;
begin
  B := IDouble(110);
  AssertEquals(110, B.Value);
end;

procedure TDoubleTests.ExceptionTest;
var
  n: IDouble;
  v: IDouble;
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

procedure TDoubleTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TDoubleTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TDoubleTests);
end.
