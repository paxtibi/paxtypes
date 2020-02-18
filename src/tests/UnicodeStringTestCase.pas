unit UnicodeStringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TUnicodeStringTests }

  TUnicodeStringTests = class(TTestCase)
  private
    FGlobal: IUnicodeString;
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

procedure TUnicodeStringTests.Creation;
var
  b: IUnicodeString;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TUnicodeStringTests.AssignamentAndImplicitCast;
var
  B: IUnicodeString;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TUnicodeStringTests.Addition;
begin
  AssertEquals(127 + 127, IUnicodeString(127).Value + 127);
end;

procedure TUnicodeStringTests.ExplicitCast;
var
  B: IUnicodeString;
begin
  B := IUnicodeString(110);
  AssertEquals(110, B.Value);
end;

procedure TUnicodeStringTests.ExceptionTest;
var
  n: IUnicodeString;
  v: IUnicodeString;
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

procedure TUnicodeStringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TUnicodeStringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TUnicodeStringTests);
end.
