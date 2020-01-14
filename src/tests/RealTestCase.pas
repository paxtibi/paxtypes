unit RealTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,RealType;

type

  { TRealTests }

  TRealTests = class(TTestCase)
  private
    FGlobal: IReal;
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

procedure TRealTests.Creation;
var
  b: IReal;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TRealTests.AssignamentAndImplicitCast;
var
  B: IReal;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TRealTests.Addition;
begin
  AssertEquals(127 + 127, IReal(127).Value + 127);
end;

procedure TRealTests.ExplicitCast;
var
  B: IReal;
begin
  B := IReal(110);
  AssertEquals(110, B.Value);
end;

procedure TRealTests.ExceptionTest;
var
  n: IReal;
  v: IReal;
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

procedure TRealTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TRealTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TRealTests);
end.
