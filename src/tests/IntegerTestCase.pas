unit IntegerTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,IntegerType;

type

  { TIntegerTests }

  TIntegerTests = class(TTestCase)
  private
    FGlobal: IInteger;
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

procedure TIntegerTests.Creation;
var
  b: IInteger;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TIntegerTests.AssignamentAndImplicitCast;
var
  B: IInteger;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TIntegerTests.Addition;
begin
  AssertEquals(127 + 127, IInteger(127).Value + 127);
end;

procedure TIntegerTests.ExplicitCast;
var
  B: IInteger;
begin
  B := IInteger(110);
  AssertEquals(110, B.Value);
end;

procedure TIntegerTests.ExceptionTest;
var
  n: IInteger;
  v: IInteger;
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

procedure TIntegerTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TIntegerTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TIntegerTests);
end.
