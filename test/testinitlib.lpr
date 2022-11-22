program testinitlib;

uses
  rs,
  rs_types,
  rs_context;

type
  rs2_camera_info = (
    RS2_CAMERA_INFO_NAME,
    RS2_CAMERA_INFO_SERIAL_NUMBER);
var
  e: Pointer;
  f: prs2_context;
begin

  WriteLn(RS2_API_VERSION_STR);
  Writeln(RS2_API_FULL_VERSION_STR);
  ReadLn;
  f := rs2_create_context(RS2_API_VERSION, e);
  rs2_delete_context(f);

end.
