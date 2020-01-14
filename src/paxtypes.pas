unit paxtypes;

{$mode objfpc}{$H+}
{$Interfaces COM}
{$ModeSwitch advancedrecords}
{$ModeSwitch typehelpers}

interface

uses
  Classes, SysUtils,
  Int8Type, UInt8Type, Int16Type, UInt16Type, Int32Type, UInt32Type, Int64Type, UInt64Type, ShortIntType, SmallIntType, IntegerType, NativeIntType, LongIntType, ByteType, WordType, NativeUIntType, DWordType, CardinalType, LongWordType, QWordType, SingleType, RealType, DoubleType, ExtendedType, CompType, CurrencyType;

type
  TRadix     = 2..36;
  IInt8      = Int8Type.IInt8;
  IUInt8     = UInt8Type.IUInt8;
  IInt16     = Int16Type.IInt16;
  IUInt16    = UInt16Type.IUInt16;
  IInt32     = Int32Type.IInt32;
  IUInt32    = UInt32Type.IUInt32;
  IInt64     = Int64Type.IInt64;
  IUInt64    = UInt64Type.IUInt64;
  IShortInt  = ShortIntType.IShortInt;
  ISmallInt  = SmallIntType.ISmallInt;
  IInteger   = IntegerType.IInteger;
  INativeInt = NativeIntType.INativeInt;
  ILongInt   = LongIntType.ILongInt;
  IByte      = ByteType.IByte;
  IWord      = WordType.IWord;
  INativeUInt = NativeUIntType.INativeUInt;
  IDWord     = DWordType.IDWord;
  ICardinal  = CardinalType.ICardinal;
  ILongWord  = LongWordType.ILongWord;
  IQWord     = QWordType.IQWord;
  ISingle    = SingleType.ISingle;
  IReal      = RealType.IReal;
  IDouble    = DoubleType.IDouble;
  IExtended  = ExtendedType.IExtended;
  IComp      = CompType.IComp;
  ICurrency  = CurrencyType.ICurrency;


type
  ENullPointerException = class(Exception)

  end;


function itoa(Value: Uint64; radix: TRadix; maxLength: byte = 8): string;



implementation


function itoa(Value: Uint64; radix: TRadix; maxLength: byte): string;
var
  resto: Uint64;
const
  dizionarioSimboli          : string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  Result := '';
  if Value = 0 then
    exit('0');
  while (Value > 0) do
  begin
    resto  := Value mod radix;
    Result := dizionarioSimboli.Chars[resto] + Result;
    Value  := Value div radix;
  end;
  if Result.Length > maxLength then
  begin
    Result := Result.Substring(Result.Length - maxLength);

  end;

end;


end.
