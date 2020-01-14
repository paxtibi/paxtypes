unit ByteTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,ByteType;

type

  { TByteTests }

  TByteTests = class(TTestCase)
  private
    FGlobal: IByte;
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

procedure TByteTests.Creation;
var
  b: IByte;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TByteTests.AssignamentAndImplicitCast;
var
  B: IByte;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TByteTests.Addition;
begin
  AssertEquals(127 + 127, IByte(127).Value + 127);
end;

procedure TByteTests.ExplicitCast;
var
  B: IByte;
begin
  B := IByte(110);
  AssertEquals(110, B.Value);
end;

procedure TByteTests.ExceptionTest;
var
  n: IByte;
  v: IByte;
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

procedure TByteTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TByteTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TByteTests);
end.
