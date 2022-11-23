program testinitlib;

uses
  SysUtils,
  TypInfo,
  rs,
  rs_types,
  rs_context,
  rs_device,
  rs_sensor;

var
  ctx: prs2_context;
  e: Prs2_error;
  list: prs2_device_list;
  NumberDevices, I: integer;
  Device: prs2_device;
  Informacion, y: Trs2_camera_info;
  pData: PChar;
  x: string;
begin

  WriteLn('Api Version:' + RS2_API_VERSION_STR);
  Writeln('Full api version: ' + RS2_API_FULL_VERSION_STR);
  ctx := rs2_create_context(RS2_API_VERSION, e);
  list := rs2_query_devices(ctx, e);
  NumberDevices := rs2_get_device_count(list, e);
  for I := 0 to NumberDevices - 1 do
  begin
    Writeln('Device number: ' + IntToStr(i));
    Device := rs2_create_device(List, 0, e);
    for y := Low(Trs2_camera_info) to High(Trs2_camera_info) do
    begin
      x := GetEnumName(TypeInfo(Trs2_camera_info), Ord(y));
      Informacion := Trs2_camera_info(y);
      pData := rs2_get_device_info(Device, Informacion, e);
      Writeln(#09 + x + ': ' + pData);
    end;
    rs2_delete_device(Device);
  end;


  rs2_delete_context(ctx);
  WriteLn('Number of devices: ' + IntToStr(NumberDevices));
  WriteLn('Press enter to continue.');
  ReadLn;
end.
