unit DWordTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,DWordType;

type

  { TDWordTests }

  TDWordTests = class(TTestCase)
  private
    FGlobal: IDWord;
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

procedure TDWordTests.Creation;
var
  b: IDWord;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TDWordTests.AssignamentAndImplicitCast;
var
  B: IDWord;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TDWordTests.Addition;
begin
  AssertEquals(127 + 127, IDWord(127).Value + 127);
end;

procedure TDWordTests.ExplicitCast;
var
  B: IDWord;
begin
  B := IDWord(110);
  AssertEquals(110, B.Value);
end;

procedure TDWordTests.ExceptionTest;
var
  n: IDWord;
  v: IDWord;
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

procedure TDWordTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TDWordTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TDWordTests);
end.
