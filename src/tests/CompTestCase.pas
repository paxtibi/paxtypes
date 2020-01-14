unit CompTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,CompType;

type

  { TCompTests }

  TCompTests = class(TTestCase)
  private
    FGlobal: IComp;
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

procedure TCompTests.Creation;
var
  b: IComp;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TCompTests.AssignamentAndImplicitCast;
var
  B: IComp;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TCompTests.Addition;
begin
  AssertEquals(127 + 127, IComp(127).Value + 127);
end;

procedure TCompTests.ExplicitCast;
var
  B: IComp;
begin
  B := IComp(110);
  AssertEquals(110, B.Value);
end;

procedure TCompTests.ExceptionTest;
var
  n: IComp;
  v: IComp;
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

procedure TCompTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TCompTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TCompTests);
end.
