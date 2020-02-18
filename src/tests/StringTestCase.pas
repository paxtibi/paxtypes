unit StringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TStringTests }

  TStringTests = class(TTestCase)
  private
    FGlobal: IString;
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

procedure TStringTests.Creation;
var
  b: IString;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TStringTests.AssignamentAndImplicitCast;
var
  B: IString;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TStringTests.Addition;
begin
  AssertEquals(127 + 127, IString(127).Value + 127);
end;

procedure TStringTests.ExplicitCast;
var
  B: IString;
begin
  B := IString(110);
  AssertEquals(110, B.Value);
end;

procedure TStringTests.ExceptionTest;
var
  n: IString;
  v: IString;
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

procedure TStringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TStringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TStringTests);
end.
