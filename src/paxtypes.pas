unit paxtypes;

{$mode objfpc}{$H+}
{$Interfaces COM}
{$ModeSwitch advancedrecords}
{$ModeSwitch typehelpers}

interface

uses
  Classes, SysUtils;

type
  TRadix = 2..36;

type
  ENullPointerException = class(Exception)

  end;


const
  GUID_SERIABLIZABLE = '{EB60281C-A16C-42CD-A376-DC66ED0CFE54}';
  GUID_CLONABLE  = '{F842EFD5-76AA-4128-97B1-9F8D344F0499}';
  GUID_RUNNABLE  = '{C94063EA-987B-4A92-BC15-4DFDA93EE1A6}';
  GUID_Boolean   = '{C4AABCF7-5F46-43F5-A36E-498D3FD146F0}';
  GUID_Int8      = '{F820A271-FD40-4D15-B287-3864622D45A3}';
  GUID_UInt8     = '{AA8F9E77-C879-4352-ABD9-25F1FA0B359A}';
  GUID_Int16     = '{E7ADADF4-D8AD-4FA7-8266-68595AF43C1C}';
  GUID_UInt16    = '{BED23731-D177-4D6F-AB07-94D34279E05A}';
  GUID_Int32     = '{D597E591-8A83-4701-B63E-6F30021CF8AF}';
  GUID_UInt32    = '{CB3BD3E1-67FB-4502-9911-A8039FE236D2}';
  GUID_Int64     = '{FE8D4B49-11B4-423B-A9D5-FA73D3DF3406}';
  GUID_UInt64    = '{DE54EF5B-3A2C-4291-AC98-2684C7E66460}';
  GUID_ShortInt  = '{A37E2296-305B-4E60-BCCA-BE24861E1C7F}';
  GUID_SmallInt  = '{91734F65-1606-44E6-8739-BA1A56923416}';
  GUID_Integer   = '{B8F4A1C4-6B87-447E-B364-13816EB0254D}';
  GUID_NativeInt = '{F92BFB81-850E-402F-ACD7-6EAF9DD46093}';
  GUID_LongInt   = '{987BB264-56F5-4E6D-B3EC-B9C19807529C}';
  GUID_Byte      = '{8BED7E51-4FF8-4915-B9D3-95B641F3E4F2}';
  GUID_Word      = '{00E15ABF-1106-4639-8049-FBA786A8E791}';
  GUID_NativeUInt = '{C7E076D6-7C5B-4062-8403-227DCB8C2F87}';
  GUID_DWord     = '{490A3CBB-9843-4FBE-B660-4807BB52FEC2}';
  GUID_Cardinal  = '{6B3BF7C6-1A66-4BAF-94CF-E436FE57580C}';
  GUID_LongWord  = '{050959C2-3D4D-46AB-A3FB-62EC71F923BC}';
  GUID_QWord     = '{BC521396-9C43-473A-A06A-E18430078BDB}';
  GUID_Single    = '{99D48172-A571-4110-A000-C0DC363DE8CE}';
  GUID_Real      = '{319EA54E-FB34-442E-A144-C3AA592C9737}';
  GUID_Double    = '{50DA80E4-4D68-432B-B7D6-6064C1FDEAB8}';
  GUID_Extended  = '{70DD15A3-3952-434A-BA6F-2F99D7438355}';
  GUID_Comp      = '{E8C4D8C9-E1A0-4276-A59A-B5F3A68A7B7F}';
  GUID_Currency  = '{DDA259DA-4DFA-411A-B62C-E93F2AF5119E}';
  GUID_RawByteString = '{6C5A3AEF-F8F3-41E7-9ABA-B82FC48E4DF1}';
  GUID_String    = '{CEEE06E9-8319-487B-9FE0-708E9BBF273F}';
  GUID_AnsiString = '{1AAB46B7-A4D6-4EFE-BECF-42FA81FCF33F}';
  GUID_WideString = '{118E508E-538B-46B7-A782-D17085D30649}';
  GUID_UTF8String = '{D48FF6D8-F654-4F09-9DA9-C6E13F4BCC52}';
  GUID_UnicodeString = '{E361A0F4-701D-4514-B931-5CD66D54C2EB}';

type
  ISerializable = interface
    [GUID_SERIABLIZABLE]
  end;

  IClonable = interface
    [GUID_CLONABLE]
  end;


  IRunnable = interface
    [GUID_RUNNABLE]
    procedure run;
  end;

{$include BooleanTypeDec.inc}
{$include RawByteStringTypeDec.inc}
{$include StringTypeDec.inc}
{$include AnsiStringTypeDec.inc}
{$include WideStringTypeDec.inc}
{$include UTF8StringTypeDec.inc}
{$include UnicodeStringTypeDec.inc}
{$include Int8TypeDec.inc}
{$include UInt8TypeDec.inc}
{$include Int16TypeDec.inc}
{$include UInt16TypeDec.inc}
{$include Int32TypeDec.inc}
{$include UInt32TypeDec.inc}
{$include Int64TypeDec.inc}
{$include UInt64TypeDec.inc}
{$include ShortIntTypeDec.inc}
{$include SmallIntTypeDec.inc}
{$include IntegerTypeDec.inc}
{$include NativeIntTypeDec.inc}
{$include LongIntTypeDec.inc}
{$include ByteTypeDec.inc}
{$include WordTypeDec.inc}
{$include NativeUIntTypeDec.inc}
{$include DWordTypeDec.inc}
{$include CardinalTypeDec.inc}
{$include LongWordTypeDec.inc}
{$include QWordTypeDec.inc}
{$include SingleTypeDec.inc}
{$include RealTypeDec.inc}
{$include DoubleTypeDec.inc}
{$include ExtendedTypeDec.inc}
{$include CompTypeDec.inc}
{$include CurrencyTypeDec.inc}
function itoa(Value: Uint64; radix: TRadix; maxLength: byte = 8): string;



implementation

{$include BooleanTypeDef.inc}
{$include RawByteStringTypeDef.inc}
{$include StringTypeDef.inc}
{$include AnsiStringTypeDef.inc}
{$include WideStringTypeDef.inc}
{$include UTF8StringTypeDef.inc}
{$include UnicodeStringTypeDef.inc}
{$include Int8TypeDef.inc}
{$include UInt8TypeDef.inc}
{$include Int16TypeDef.inc}
{$include UInt16TypeDef.inc}
{$include Int32TypeDef.inc}
{$include UInt32TypeDef.inc}
{$include Int64TypeDef.inc}
{$include UInt64TypeDef.inc}
{$include ShortIntTypeDef.inc}
{$include SmallIntTypeDef.inc}
{$include IntegerTypeDef.inc}
{$include NativeIntTypeDef.inc}
{$include LongIntTypeDef.inc}
{$include ByteTypeDef.inc}
{$include WordTypeDef.inc}
{$include NativeUIntTypeDef.inc}
{$include DWordTypeDef.inc}
{$include CardinalTypeDef.inc}
{$include LongWordTypeDef.inc}
{$include QWordTypeDef.inc}
{$include SingleTypeDef.inc}
{$include RealTypeDef.inc}
{$include DoubleTypeDef.inc}
{$include ExtendedTypeDef.inc}
{$include CompTypeDef.inc}
{$include CurrencyTypeDef.inc}


function itoa(Value: Uint64; radix: TRadix; maxLength: byte): string;
var
  resto: Uint64;
const
  symbolDictionary          : string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  Result := '';
  if Value = 0 then
    exit('0');
  while (Value > 0) do
  begin
    resto  := Value mod radix;
    Result := symbolDictionary.Chars[resto] + Result;
    Value  := Value div radix;
  end;
  if Result.Length > maxLength then
  begin
    Result := Result.Substring(Result.Length - maxLength);
  end;
end;


end.
