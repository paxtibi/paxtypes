unit SmallIntTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,SmallIntType;

type

  { TSmallIntTests }

  TSmallIntTests = class(TTestCase)
  private
    FGlobal: ISmallInt;
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

procedure TSmallIntTests.Creation;
var
  b: ISmallInt;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TSmallIntTests.AssignamentAndImplicitCast;
var
  B: ISmallInt;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TSmallIntTests.Addition;
begin
  AssertEquals(127 + 127, ISmallInt(127).Value + 127);
end;

procedure TSmallIntTests.ExplicitCast;
var
  B: ISmallInt;
begin
  B := ISmallInt(110);
  AssertEquals(110, B.Value);
end;

procedure TSmallIntTests.ExceptionTest;
var
  n: ISmallInt;
  v: ISmallInt;
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

procedure TSmallIntTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TSmallIntTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TSmallIntTests);
end.
