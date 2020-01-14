unit WordTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, paxtypes,WordType;

type

  { TWordTests }

  TWordTests = class(TTestCase)
  private
    FGlobal: IWord;
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

procedure TWordTests.Creation;
var
  b: IWord;
begin
  b := 110;
  AssertEquals(110, B.Value);
  b := nil;
end;

procedure TWordTests.AssignamentAndImplicitCast;
var
  B: IWord;
begin
  B := 110;
  AssertEquals(110, B.Value);
end;

procedure TWordTests.Addition;
begin
  AssertEquals(127 + 127, IWord(127).Value + 127);
end;

procedure TWordTests.ExplicitCast;
var
  B: IWord;
begin
  B := IWord(110);
  AssertEquals(110, B.Value);
end;

procedure TWordTests.ExceptionTest;
var
  n: IWord;
  v: IWord;
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

procedure TWordTests.SetUp;
begin
  FGlobal := 127;
end;

procedure TWordTests.TearDown;
begin
  FGlobal := nil;
end;


initialization
  RegisterTest(TWordTests);
end.
