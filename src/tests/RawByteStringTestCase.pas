unit RawByteStringTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TRawByteStringTests }

  TRawByteStringTests = class(TTestCase)
  private
    FGlobal: IRawByteString;
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

procedure TRawByteStringTests.Creation;
var
  b: IRawByteString;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TRawByteStringTests.AssignamentAndImplicitCast;
var
  B: IRawByteString;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TRawByteStringTests.Addition;
begin
  AssertEquals(127 + 127, IRawByteString(127).Value + 127);
end;

procedure TRawByteStringTests.ExplicitCast;
var
  B: IRawByteString;
begin
  B := IRawByteString(110);
  AssertEquals(110, B.Value);
end;

procedure TRawByteStringTests.ExceptionTest;
var
  n: IRawByteString;
  v: IRawByteString;
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

procedure TRawByteStringTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TRawByteStringTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TRawByteStringTests);
end.
