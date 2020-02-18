unit Int16TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TInt16Tests }

  TInt16Tests = class(TTestCase)
  private
    FGlobal: IInt16;
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

procedure TInt16Tests.Creation;
var
  b: IInt16;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TInt16Tests.AssignamentAndImplicitCast;
var
  B: IInt16;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TInt16Tests.Addition;
begin
  AssertEquals(127 + 127, IInt16(127).Value + 127);
end;

procedure TInt16Tests.ExplicitCast;
var
  B: IInt16;
begin
  B := IInt16(110);
  AssertEquals(110, B.Value);
end;

procedure TInt16Tests.ExceptionTest;
var
  n: IInt16;
  v: IInt16;
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

procedure TInt16Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TInt16Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TInt16Tests);
end.
