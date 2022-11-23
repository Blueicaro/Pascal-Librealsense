{
Exposes RealSense structs
}
unit rs_types;

interface



const
{$IFDEF MSWINDOWS}
  REALSENSE_DLL = 'realsense2.dll';
{$ENDIF}
{$IFDEF LINUX}
  REALSENSE_DLL = 'realsense2.so';
{$ENDIF}



type

  Trs2_error = integer;
  pRS2_error = ^Trs2_error;

type
  Trs2_context = record
  end;
  pRS2_context = ^Trs2_context;

{typedef struct rs2_device_list rs2_device_list;}
type
  Trs2_device_list = record
  end;
  //Trs2_device_list = integer;
  pRS2_device_list = ^Trs2_device_list;

{typedef struct rs2_device_info rs2_device_info;}
type
  Trs2_device_info = record
  end;
  pRS2_device_info = ^Trs2_device_info;

{typedef struct rs2_device rs2_device;}
type
  Trs2_device = record
  end;
  pRS2_device = ^Trs2_device;


{typedef void (*rs2_devices_changed_callback_ptr)(rs2_device_list*, rs2_device_list*, void*);}
type
  pRS2_devices_changed_callback = ^RS2_devices_changed_callback;

  RS2_devices_changed_callback = procedure(DeviceList1: pRS2_Device_List;
    DeviceList2: pRS2_Device_List); cdecl;

type
  TUser = record
  end;
  pUser = ^TUser;

{typedef struct rs2_device_hub rs2_device_hub;}
type
  Trs2_device_hub = record
  end;
  pRs2_device_hub = ^Trs2_device_hub;

const
  RS2_EXTENSION_UNKNOWN = 0;
  RS2_EXTENSION_DEBUG = 1;
  RS2_EXTENSION_INFO = 2;
  RS2_EXTENSION_MOTION = 3;
  RS2_EXTENSION_OPTIONS = 4;
  RS2_EXTENSION_VIDEO = 5;
  RS2_EXTENSION_ROI = 6;
  RS2_EXTENSION_DEPTH_SENSOR = 7;
  RS2_EXTENSION_VIDEO_FRAME = 8;
  RS2_EXTENSION_MOTION_FRAME = 9;
  RS2_EXTENSION_COMPOSITE_FRAME = 10;
  RS2_EXTENSION_POINTS = 11;
  RS2_EXTENSION_DEPTH_FRAME = 12;
  RS2_EXTENSION_ADVANCED_MODE = 13;
  RS2_EXTENSION_RECORD = 14;
  RS2_EXTENSION_VIDEO_PROFILE = 15;
  RS2_EXTENSION_PLAYBACK = 16;
  RS2_EXTENSION_DEPTH_STEREO_SENSOR = 17;
  RS2_EXTENSION_DISPARITY_FRAME = 18;
  RS2_EXTENSION_MOTION_PROFILE = 19;
  RS2_EXTENSION_POSE_FRAME = 20;
  RS2_EXTENSION_POSE_PROFILE = 21;
  RS2_EXTENSION_TM2 = 22;
  RS2_EXTENSION_SOFTWARE_DEVICE = 23;
  RS2_EXTENSION_SOFTWARE_SENSOR = 24;
  RS2_EXTENSION_DECIMATION_FILTER = 25;
  RS2_EXTENSION_THRESHOLD_FILTER = 26;
  RS2_EXTENSION_DISPARITY_FILTER = 27;
  RS2_EXTENSION_SPATIAL_FILTER = 28;
  RS2_EXTENSION_TEMPORAL_FILTER = 29;
  RS2_EXTENSION_HOLE_FILLING_FILTER = 30;
  RS2_EXTENSION_ZERO_ORDER_FILTER = 31;
  RS2_EXTENSION_RECOMMENDED_FILTERS = 32;
  RS2_EXTENSION_POSE = 33;
  RS2_EXTENSION_POSE_SENSOR = 34;
  RS2_EXTENSION_WHEEL_ODOMETER = 35;
  RS2_EXTENSION_GLOBAL_TIMER = 36;
  RS2_EXTENSION_UPDATABLE = 37;
  RS2_EXTENSION_UPDATE_DEVICE = 38;
  RS2_EXTENSION_L500_DEPTH_SENSOR = 39;
  RS2_EXTENSION_TM2_SENSOR = 40;
  RS2_EXTENSION_AUTO_CALIBRATED_DEVICE = 41;
  RS2_EXTENSION_COLOR_SENSOR = 42;
  RS2_EXTENSION_MOTION_SENSOR = 43;
  RS2_EXTENSION_FISHEYE_SENSOR = 44;
  RS2_EXTENSION_DEPTH_HUFFMAN_DECODER = 45;
  RS2_EXTENSION_SERIALIZABLE = 46;
  RS2_EXTENSION_FW_LOGGER = 47;
  RS2_EXTENSION_AUTO_CALIBRATION_FILTER = 48;
  RS2_EXTENSION_DEVICE_CALIBRATION = 49;
  RS2_EXTENSION_CALIBRATED_SENSOR = 50;
  RS2_EXTENSION_HDR_MERGE = 51;
  RS2_EXTENSION_SEQUENCE_ID_FILTER = 52;
  RS2_EXTENSION_MAX_USABLE_RANGE_SENSOR = 53;
  RS2_EXTENSION_DEBUG_STREAM_SENSOR = 54;
  RS2_EXTENSION_CALIBRATION_CHANGE_DEVICE = 55;
  RS2_EXTENSION_COUNT = 56;


function rs2_get_error_message(var error: prs2_error): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_get_error_message';

procedure rs2_free_error(var error: prs2_error); cdecl;
  external REALSENSE_DLL Name 'rs2_free_error';



implementation


end.
