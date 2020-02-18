unit ShortIntTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TShortIntTests }

  TShortIntTests = class(TTestCase)
  private
    FGlobal: IShortInt;
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

procedure TShortIntTests.Creation;
var
  b: IShortInt;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TShortIntTests.AssignamentAndImplicitCast;
var
  B: IShortInt;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TShortIntTests.Addition;
begin
  AssertEquals(127 + 127, IShortInt(127).Value + 127);
end;

procedure TShortIntTests.ExplicitCast;
var
  B: IShortInt;
begin
  B := IShortInt(110);
  AssertEquals(110, B.Value);
end;

procedure TShortIntTests.ExceptionTest;
var
  n: IShortInt;
  v: IShortInt;
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

procedure TShortIntTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TShortIntTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TShortIntTests);
end.
