program Tests;

{$mode objfpc}{$H+}

uses
  Classes,
  consoletestrunner,
  paxtypes,
  Int8TestCase,
  UInt8TestCase,
  Int16TestCase,
  UInt16TestCase,
  Int32TestCase,
  UInt32TestCase,
  Int64TestCase,
  UInt64TestCase,
  ShortIntTestCase,
  SmallIntTestCase,
  IntegerTestCase,
  NativeIntTestCase,
  LongIntTestCase,
  ByteTestCase,
  WordTestCase,
  NativeUIntTestCase,
  DWordTestCase,
  CardinalTestCase,
  LongWordTestCase,
  QWordTestCase,
  SingleTestCase,
  RealTestCase,
  DoubleTestCase,
  ExtendedTestCase,
  CompTestCase,
  CurrencyTestCase;

type

  { TMyTestRunner }

  TMyTestRunner = class(TTestRunner)
  protected
    // override the protected methods of TTestRunner to customize its behavior
  end;

var
  Application: TMyTestRunner;

begin
  Application := TMyTestRunner.Create(nil);
  Application.Initialize;
  Application.Title := 'Tests';
  Application.Run;
  Application.Free;
end.
