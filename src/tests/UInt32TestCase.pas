unit UInt32TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TUInt32Tests }

  TUInt32Tests = class(TTestCase)
  private
    FGlobal: IUInt32;
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

procedure TUInt32Tests.Creation;
var
  b: IUInt32;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TUInt32Tests.AssignamentAndImplicitCast;
var
  B: IUInt32;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TUInt32Tests.Addition;
begin
  AssertEquals(127 + 127, IUInt32(127).Value + 127);
end;

procedure TUInt32Tests.ExplicitCast;
var
  B: IUInt32;
begin
  B := IUInt32(110);
  AssertEquals(110, B.Value);
end;

procedure TUInt32Tests.ExceptionTest;
var
  n: IUInt32;
  v: IUInt32;
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

procedure TUInt32Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TUInt32Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TUInt32Tests);
end.
