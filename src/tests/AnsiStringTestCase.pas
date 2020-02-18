unit AnsiStringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TAnsiStringTests }

  TAnsiStringTests = class(TTestCase)
  private
    FGlobal: IAnsiString;
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

procedure TAnsiStringTests.Creation;
var
  b: IAnsiString;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TAnsiStringTests.AssignamentAndImplicitCast;
var
  B: IAnsiString;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TAnsiStringTests.Addition;
begin
  AssertEquals(127 + 127, IAnsiString(127).Value + 127);
end;

procedure TAnsiStringTests.ExplicitCast;
var
  B: IAnsiString;
begin
  B := IAnsiString(110);
  AssertEquals(110, B.Value);
end;

procedure TAnsiStringTests.ExceptionTest;
var
  n: IAnsiString;
  v: IAnsiString;
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

procedure TAnsiStringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TAnsiStringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TAnsiStringTests);
end.
