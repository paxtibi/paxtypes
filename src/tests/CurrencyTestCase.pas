unit CurrencyTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TCurrencyTests }

  TCurrencyTests = class(TTestCase)
  private
    FGlobal: ICurrency;
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

procedure TCurrencyTests.Creation;
var
  b: ICurrency;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TCurrencyTests.AssignamentAndImplicitCast;
var
  B: ICurrency;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TCurrencyTests.Addition;
begin
  AssertEquals(127 + 127, ICurrency(127).Value + 127);
end;

procedure TCurrencyTests.ExplicitCast;
var
  B: ICurrency;
begin
  B := ICurrency(110);
  AssertEquals(110, B.Value);
end;

procedure TCurrencyTests.ExceptionTest;
var
  n: ICurrency;
  v: ICurrency;
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

procedure TCurrencyTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TCurrencyTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TCurrencyTests);
end.
