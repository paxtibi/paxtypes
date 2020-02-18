unit UInt16TestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TUInt16Tests }

  TUInt16Tests = class(TTestCase)
  private
    FGlobal: IUInt16;
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

procedure TUInt16Tests.Creation;
var
  b: IUInt16;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TUInt16Tests.AssignamentAndImplicitCast;
var
  B: IUInt16;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TUInt16Tests.Addition;
begin
  AssertEquals(127 + 127, IUInt16(127).Value + 127);
end;

procedure TUInt16Tests.ExplicitCast;
var
  B: IUInt16;
begin
  B := IUInt16(110);
  AssertEquals(110, B.Value);
end;

procedure TUInt16Tests.ExceptionTest;
var
  n: IUInt16;
  v: IUInt16;
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

procedure TUInt16Tests.SetUp;
begin
  FGlobal := 127;
end;

procedure TUInt16Tests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TUInt16Tests);
end.
