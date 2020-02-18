unit WideStringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TWideStringTests }

  TWideStringTests = class(TTestCase)
  private
    FGlobal: IWideString;
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

procedure TWideStringTests.Creation;
var
  b: IWideString;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TWideStringTests.AssignamentAndImplicitCast;
var
  B: IWideString;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TWideStringTests.Addition;
begin
  AssertEquals(127 + 127, IWideString(127).Value + 127);
end;

procedure TWideStringTests.ExplicitCast;
var
  B: IWideString;
begin
  B := IWideString(110);
  AssertEquals(110, B.Value);
end;

procedure TWideStringTests.ExceptionTest;
var
  n: IWideString;
  v: IWideString;
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

procedure TWideStringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TWideStringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TWideStringTests);
end.
