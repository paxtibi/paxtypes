unit BooleanTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TBooleanTests }

  TBooleanTests = class(TTestCase)
  private
    FGlobal: IBoolean;
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

procedure TBooleanTests.Creation;
var
  b: IBoolean;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TBooleanTests.AssignamentAndImplicitCast;
var
  B: IBoolean;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TBooleanTests.Addition;
begin
  AssertEquals(127 + 127, IBoolean(127).Value + 127);
end;

procedure TBooleanTests.ExplicitCast;
var
  B: IBoolean;
begin
  B := IBoolean(110);
  AssertEquals(110, B.Value);
end;

procedure TBooleanTests.ExceptionTest;
var
  n: IBoolean;
  v: IBoolean;
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

procedure TBooleanTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TBooleanTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TBooleanTests);
end.
