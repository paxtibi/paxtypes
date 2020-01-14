unit LongWordTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,LongWordType;

type

  { TLongWordTests }

  TLongWordTests = class(TTestCase)
  private
    FGlobal: ILongWord;
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

procedure TLongWordTests.Creation;
var
  b: ILongWord;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TLongWordTests.AssignamentAndImplicitCast;
var
  B: ILongWord;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TLongWordTests.Addition;
begin
  AssertEquals(127 + 127, ILongWord(127).Value + 127);
end;

procedure TLongWordTests.ExplicitCast;
var
  B: ILongWord;
begin
  B := ILongWord(110);
  AssertEquals(110, B.Value);
end;

procedure TLongWordTests.ExceptionTest;
var
  n: ILongWord;
  v: ILongWord;
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

procedure TLongWordTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TLongWordTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TLongWordTests);
end.
