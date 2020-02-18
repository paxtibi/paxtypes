{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit paxtypes_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  paxtypes, paxInterfaces, ByteType, CardinalType, CompType, CurrencyType, 
  DoubleType, DWordType, ExtendedType, Int8Type, Int16Type, Int32Type, 
  Int64Type, IntegerType, LongIntType, LongWordType, NativeIntType, 
  NativeUIntType, QWordType, RealType, ShortIntType, SingleType, SmallIntType, 
  UInt8Type, UInt16Type, UInt32Type, UInt64Type, WordType, StringType, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('paxtypes_package', @Register);
end.
