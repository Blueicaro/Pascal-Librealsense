{
Exposes RealSense device functionality
}
unit rs_device;

{$mode ObjFPC}{$H+}

interface

uses rs_sensor, rs_types;

{
Determines number of devices in a list.
param[in]  info_list The list of connected devices captured using rs2_query_devices
param[out] error     If non-null, receives any error that occurs during this call, otherwise, errors are ignored
return               Device count
}
function rs2_get_device_count(Info_List: Prs2_device_list;
  var Error: prs2_error): integer;
  cdecl; external REALSENSE_DLL;
{
Deletes device list, any devices created using this list will remain unaffected.
param[in]  info_list List to delete
}

procedure rs2_delete_device_list(info_list: prs2_device_list); cdecl;
  external REALSENSE_DLL;

{
 Creates a device by index. The device object represents a physical camera and provides the means to manipulate it.
param[in]  info_list the list containing the device to retrieve
param[in]  index     The zero based index of device to retrieve
param[out] error     If non-null, receives any error that occurs during this call, otherwise, errors are ignored
return               The requested device, should be released by rs2_delete_device
}

function rs2_create_device(Info_List: Prs2_device_list; Index: integer;
  var Error: prs2_error): prs2_device; cdecl; external REALSENSE_DLL;

{
Delete RealSense device
param[in]  device  Realsense device to delete
}

procedure rs2_delete_device(Device: prs2_device); cdecl; external REALSENSE_DLL;

{
 Retrieve camera specific information, like versions of various internal components.
param[in]  device    The RealSense device
param[in]  info      Camera info type to retrieve
param[out] error     If non-null, receives any error that occurs during this call, otherwise, errors are ignored
return               The requested camera info string, in a format specific to the device model
}

function rs2_get_device_info(Device: prs2_device; Info: Trs2_camera_info;
  var Error: prs2_error): PChar; cdecl; external REALSENSE_DLL;


implementation

end.
