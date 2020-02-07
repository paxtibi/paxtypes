unit interfaces;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  GUID_SERIABLIZABLE ='{EB60281C-A16C-42CD-A376-DC66ED0CFE54}';
  GUID_CLONABLE ='{F842EFD5-76AA-4128-97B1-9F8D344F0499}';

type
  ISerializable = interface
    [GUID_SERIABLIZABLE]
  end;

  IClonable = interface
    [GUID_CLONABLE]
  end;

implementation

end.

