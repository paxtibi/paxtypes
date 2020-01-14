unit LongIntTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,LongIntType;

type

  { TLongIntTests }

  TLongIntTests = class(TTestCase)
  private
    FGlobal: ILongInt;
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

procedure TLongIntTests.Creation;
var
  b: ILongInt;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TLongIntTests.AssignamentAndImplicitCast;
var
  B: ILongInt;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TLongIntTests.Addition;
begin
  AssertEquals(127 + 127, ILongInt(127).Value + 127);
end;

procedure TLongIntTests.ExplicitCast;
var
  B: ILongInt;
begin
  B := ILongInt(110);
  AssertEquals(110, B.Value);
end;

procedure TLongIntTests.ExceptionTest;
var
  n: ILongInt;
  v: ILongInt;
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

procedure TLongIntTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TLongIntTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TLongIntTests);
end.
