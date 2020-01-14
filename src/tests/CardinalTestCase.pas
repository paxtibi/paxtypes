unit CardinalTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,CardinalType;

type

  { TCardinalTests }

  TCardinalTests = class(TTestCase)
  private
    FGlobal: ICardinal;
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

procedure TCardinalTests.Creation;
var
  b: ICardinal;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TCardinalTests.AssignamentAndImplicitCast;
var
  B: ICardinal;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TCardinalTests.Addition;
begin
  AssertEquals(127 + 127, ICardinal(127).Value + 127);
end;

procedure TCardinalTests.ExplicitCast;
var
  B: ICardinal;
begin
  B := ICardinal(110);
  AssertEquals(110, B.Value);
end;

procedure TCardinalTests.ExceptionTest;
var
  n: ICardinal;
  v: ICardinal;
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

procedure TCardinalTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TCardinalTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TCardinalTests);
end.
