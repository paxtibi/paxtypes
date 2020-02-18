unit QWordTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes;

type

  { TQWordTests }

  TQWordTests = class(TTestCase)
  private
    FGlobal: IQWord;
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

procedure TQWordTests.Creation;
var
  b: IQWord;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TQWordTests.AssignamentAndImplicitCast;
var
  B: IQWord;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TQWordTests.Addition;
begin
  AssertEquals(127 + 127, IQWord(127).Value + 127);
end;

procedure TQWordTests.ExplicitCast;
var
  B: IQWord;
begin
  B := IQWord(110);
  AssertEquals(110, B.Value);
end;

procedure TQWordTests.ExceptionTest;
var
  n: IQWord;
  v: IQWord;
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

procedure TQWordTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TQWordTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TQWordTests);
end.
