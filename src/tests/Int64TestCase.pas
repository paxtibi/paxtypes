unit Int64TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,Int64Type;

type

  { TInt64Tests }

  TInt64Tests = class(TTestCase)
  private
    FGlobal: IInt64;
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

procedure TInt64Tests.Creation;
var
  b: IInt64;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TInt64Tests.AssignamentAndImplicitCast;
var
  B: IInt64;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TInt64Tests.Addition;
begin
  AssertEquals(127 + 127, IInt64(127).Value + 127);
end;

procedure TInt64Tests.ExplicitCast;
var
  B: IInt64;
begin
  B := IInt64(110);
  AssertEquals(110, B.Value);
end;

procedure TInt64Tests.ExceptionTest;
var
  n: IInt64;
  v: IInt64;
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

procedure TInt64Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TInt64Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TInt64Tests);
end.
