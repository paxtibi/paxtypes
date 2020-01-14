unit Int32TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,Int32Type;

type

  { TInt32Tests }

  TInt32Tests = class(TTestCase)
  private
    FGlobal: IInt32;
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

procedure TInt32Tests.Creation;
var
  b: IInt32;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TInt32Tests.AssignamentAndImplicitCast;
var
  B: IInt32;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TInt32Tests.Addition;
begin
  AssertEquals(127 + 127, IInt32(127).Value + 127);
end;

procedure TInt32Tests.ExplicitCast;
var
  B: IInt32;
begin
  B := IInt32(110);
  AssertEquals(110, B.Value);
end;

procedure TInt32Tests.ExceptionTest;
var
  n: IInt32;
  v: IInt32;
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

procedure TInt32Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TInt32Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TInt32Tests);
end.
