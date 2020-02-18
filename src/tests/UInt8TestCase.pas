unit UInt8TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TUInt8Tests }

  TUInt8Tests = class(TTestCase)
  private
    FGlobal: IUInt8;
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

procedure TUInt8Tests.Creation;
var
  b: IUInt8;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TUInt8Tests.AssignamentAndImplicitCast;
var
  B: IUInt8;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TUInt8Tests.Addition;
begin
  AssertEquals(127 + 127, IUInt8(127).Value + 127);
end;

procedure TUInt8Tests.ExplicitCast;
var
  B: IUInt8;
begin
  B := IUInt8(110);
  AssertEquals(110, B.Value);
end;

procedure TUInt8Tests.ExceptionTest;
var
  n: IUInt8;
  v: IUInt8;
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

procedure TUInt8Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TUInt8Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TUInt8Tests);
end.
