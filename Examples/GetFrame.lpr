program GetFrame;

uses
  SysUtils,
  rs,
  rs_types,
  rs_device,
  rs_context,
  rs_sensor,
  rs_pipeline;

var
  e: PRS2_error;
  ctx: pRS2_context;
  device_list: pRS2_device_list;
  dev_count: integer;
  dev: pRS2_device;
  pipeline: prs2_pipeline;

  procedure CheckError(var aError: pRS2_error);
  var
    Cadena: string;
  begin
    if aError <> nil then
    begin
      Cadena := format('Function: %s, Arguments: %s, message: %s',
        [rs2_get_failed_function(aError), rs2_get_failed_args(aError),
        rs2_get_error_message(aError)]);
      WriteLn(Cadena);
      rs2_free_error(aError);
    end;
  end;

  procedure PrintDevice(dev: pRS2_device);
  begin
    WriteLn(Format('Using device 0, an %s', [rs2_get_device_info(
      dev, RS2_CAMERA_INFO_NAME, e)]));
    CheckError(e);
    Writeln(Format('     Serial number: %s',
      [rs2_get_device_info(dev, RS2_CAMERA_INFO_SERIAL_NUMBER, e)]));
    CheckError(e);
    Writeln(Format('     Firmware version: %s', [rs2_get_device_info(
      dev, RS2_CAMERA_INFO_FIRMWARE_VERSION, e)]));
    CheckError(e);
  end;

begin
  // Create a context object. This object owns the handles to all connected realsense devices.
  // The returned object should be released with rs2_delete_context(...)
  ctx := rs2_create_context(RS2_API_VERSION, e);
  CheckError(e);

  // Get a list of all the connected devices.
  // The returned object should be released with rs2_delete_device_list(...)
  device_list := rs2_query_devices(ctx, e);
  CheckError(e);

  dev_count := rs2_get_device_count(device_list, e);
  writeln(Format('There are %d connected RealSense devices.', [dev_count]));

  if dev_count = 0 then
  begin
    Exit;
  end;

  // Get the first connected device
  // The returned object should be released with rs2_delete_device(...)
  dev := rs2_create_device(device_list, 0, e);
  CheckError(e);
  PrintDevice(dev);

  // Create a pipeline to configure, start and stop camera streaming
  // The returned object should be released with rs2_delete_pipeline(...)
  pipeline := rs2_create_pipeline(ctx, e);
  CheckError(e);



  rs2_delete_pipeline(pipeline);
  rs2_delete_device(dev);
  rs2_delete_context(ctx);
  writeln('Press any key to continue');
  ReadLn;
end.
