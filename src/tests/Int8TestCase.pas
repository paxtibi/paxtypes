unit Int8TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TInt8Tests }

  TInt8Tests = class(TTestCase)
  private
    FGlobal: IInt8;
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

procedure TInt8Tests.Creation;
var
  b: IInt8;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TInt8Tests.AssignamentAndImplicitCast;
var
  B: IInt8;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TInt8Tests.Addition;
begin
  AssertEquals(127 + 127, IInt8(127).Value + 127);
end;

procedure TInt8Tests.ExplicitCast;
var
  B: IInt8;
begin
  B := IInt8(110);
  AssertEquals(110, B.Value);
end;

procedure TInt8Tests.ExceptionTest;
var
  n: IInt8;
  v: IInt8;
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

procedure TInt8Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TInt8Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TInt8Tests);
end.
