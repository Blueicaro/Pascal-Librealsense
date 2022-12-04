{
 Exposes RealSense internal functionality
}
unit rs_internal;

{$mode ObjFPC}{$H+}

interface

uses
  rs_types,
  rs_context,
  rs_sensor,
  rs_frame,
  rs_option;

{
 Firmware size constants
}
const
  signed_fw_size: integer = $18031C;
  signed_sr300_size: integer = $0C025C;
  unsigned_fw_size: integer = $200000;
  unsigned_sr300_size: integer = $100000;
{
  librealsense Recorder is intended for effective unit-testing
  Currently supports three modes of operation:
}
type
  Trs2_recording_mode = (
    RS2_RECORDING_MODE_BLANK_FRAMES,
    //< frame metadata will be recorded, but pixel data will be replaced with zeros to save space
    RS2_RECORDING_MODE_COMPRESSED,
    //< frames will be encoded using a proprietary lossy encoding, aiming at x5 compression at some CPU expense
    RS2_RECORDING_MODE_BEST_QUALITY,
    //< frames will not be compressed, but rather stored as-is. This gives best quality and low CPU overhead, but you might run out of memory
    RS2_RECORDING_MODE_COUNT);
{
All the parameters required to define a video stream.
}
type
  Trs2_video_stream = record
    aType: Trs2_stream;
    index: integer;
    uid: integer;
    Width: integer;
    Height: integer;
    fps: integer;
    bpp: integer;
    fmt: Trs2_format;
    intrinsics: Trs2_intrinsics;
  end;
{
 All the parameters required to define a motion stream.
}
type
  Trs2_motion_stream = record
    aType: Trs2_stream;
    index: integer;
    uid: integer;
    fps: integer;
    fmt: Trs2_format;
    intrinsics: Trs2_motion_device_intrinsic;
  end;
{
 All the parameters required to define a pose stream.
}
type
  Trs2_pose_stream = record
    aType: Trs2_stream;
    index: integer;
    uid: integer;
    fps: integer;
    fmt: Trs2_format;
  end;

type
  TDeleterProc = procedure(arg: Pointer); cdecl;
  { #todo : Pendiente probar
Preguntado en el foro:
https://forum.lazarus.freepascal.org/index.php/topic,61311.0.html?PHPSESSID=tajqr2m9bi89t347sl80bapj70 }
{
 All the parameters required to define a video frame.
}
type
  Trs2_software_video_frame = record
    pixels: pvoid;
    deleter: TDeleterProc;
    stride: integer;
    timestamp: Trs2_time_t;
    domain: Trs2_timestamp_domain;
    frame_number: integer;
    profile: pRS2_stream_profile;
    depth_units: single;
  end;
{
  brief All the parameters required to define a motion frame.
}
type
  Trs2_software_motion_frame = record
    Data: pvoid;
    deleter: TDeleterProc;
    timestamp: Trs2_time_t;
    domain: Trs2_timestamp_domain;
    frame: integer;
    profile: pRS2_stream_profile;
  end;

type
  Tpose_frame_info = record
    Translation: array [0..2] of single;
    velocity: array [0..2] of single;
    acceleration: array [0..2] of single;
    rotation: array [0..3] of single;
    angular_velocity: array [0..2] of single;
    angular_acceleration: array [0..2] of single;
    tracker_confidence: integer;
    mapper_confidence: integer;
  end;
{
  All the parameters required to define a pose frame.
}

type
  Trs2_software_pose_frame = record
    pose_frame_info: Tpose_frame_info;
    Data: pvoid;
    timestamp: Trs2_time_t;
    frame_number: integer;
    profile: pRS2_stream_profile;
  end;
{
  All the parameters required to define a sensor notification. */
}
type
  Trs2_software_notification = record
    category: Trs2_notification_category;
    aType: integer;
    severity: Trs2_log_severity;
    descripcion: PChar;
    serialize_data: PChar;
  end;

type
  Trs2_software_device_destruction_callback = record
  end;

{
  Create librealsense context that will try to record all operations over librealsense into a file
  param[in] api_version realsense API version as provided by RS2_API_VERSION macro
  param[in] filename string representing the name of the file to record
  param[in] section  string representing the name of the section within existing recording
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
  return            context object, should be released by rs2_delete_context
}
function rs2_create_recording_context(api_version: integer;
  const filename: PChar; const seccion: PChar; mode: Trs2_recording_mode;
  error: pRS2_error): pRS2_context; cdecl; external REALSENSE_DLL;
{
  Create librealsense context that given a file will respond to calls exactly as the recording did
  if the user calls a method that was either not called during recording or violates causality of the recording error will be thrown
  param[in] api_version realsense API version as provided by RS2_API_VERSION macro
  param[in] filename string representing the name of the file to play back from
  param[in] section  string representing the name of the section within existing recording
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
  return            context object, should be released by rs2_delete_context
}
function rs2_create_mock_context(api_version: integer; filename: PChar;
  section: PChar; error: pRS2_error): pRS2_context; cdecl; external REALSENSE_DLL;
{
  Create librealsense context that given a file will respond to calls exactly as the recording did
  if the user calls a method that was either not called during recording or violates causality of the recording error will be thrown
  param[in] api_version realsense API version as provided by RS2_API_VERSION macro
  param[in] filename string representing the name of the file to play back from
  param[in] section  string representing the name of the section within existing recording
  param[in] min_api_version reject any file that was recorded before this version
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
  return            context object, should be released by rs2_delete_context
}
function rs2_create_mock_context_versioned(api_version: integer;
  filename: PChar; secction: PChar; min_api_version: PChar;
  error: pRS2_error): pRS2_context; cdecl; external REALSENSE_DLL;

implementation

end.
