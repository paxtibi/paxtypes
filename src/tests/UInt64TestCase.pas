unit UInt64TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,UInt64Type;

type

  { TUInt64Tests }

  TUInt64Tests = class(TTestCase)
  private
    FGlobal: IUInt64;
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

procedure TUInt64Tests.Creation;
var
  b: IUInt64;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TUInt64Tests.AssignamentAndImplicitCast;
var
  B: IUInt64;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TUInt64Tests.Addition;
begin
  AssertEquals(127 + 127, IUInt64(127).Value + 127);
end;

procedure TUInt64Tests.ExplicitCast;
var
  B: IUInt64;
begin
  B := IUInt64(110);
  AssertEquals(110, B.Value);
end;

procedure TUInt64Tests.ExceptionTest;
var
  n: IUInt64;
  v: IUInt64;
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

procedure TUInt64Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TUInt64Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TUInt64Tests);
end.
