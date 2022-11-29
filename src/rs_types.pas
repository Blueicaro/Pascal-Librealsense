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
  pRS2_error = POpaqueData;
  pRS2_context = POpaqueData;
  pRS2_device_list = POpaqueData;
  pRS2_device_info = POpaqueData;
  pRS2_device = POpaqueData;
  //pUser = POpaqueData; //?? void*
  pvoid = POpaqueData;
  pRS2_device_hub = POpaqueData;
  pRS2_pipeline = POpaqueData;
  pRS2_exception_type = POpaqueData;
  pRS2_config = POpaqueData;
  pRS2_pipeline_profile = POpaqueData;
  pRS2_frame = POpaqueData;
  prs2_raw_data_buffer = POpaqueData;
  prs2_sensor_list = POpaqueData;

type
  Rs2_time_t = double;     //< Timestamp format. units are milliseconds
  Rs2_metadata_type = uint64;
//< Metadata attribute type is defined as 64 bit signed integer


{
Specifies advanced interfaces (capabilities) objects may implement.
}
type
  rs2_extension = (
    RS2_EXTENSION_UNKNOWN,
    RS2_EXTENSION_DEBUG,
    RS2_EXTENSION_INFO,
    RS2_EXTENSION_MOTION,
    RS2_EXTENSION_OPTIONS,
    RS2_EXTENSION_VIDEO,
    RS2_EXTENSION_ROI,
    RS2_EXTENSION_DEPTH_SENSOR,
    RS2_EXTENSION_VIDEO_FRAME,
    RS2_EXTENSION_MOTION_FRAME,
    RS2_EXTENSION_COMPOSITE_FRAME,
    RS2_EXTENSION_POINTS,
    RS2_EXTENSION_DEPTH_FRAME,
    RS2_EXTENSION_ADVANCED_MODE,
    RS2_EXTENSION_RECORD,
    RS2_EXTENSION_VIDEO_PROFILE,
    RS2_EXTENSION_PLAYBACK,
    RS2_EXTENSION_DEPTH_STEREO_SENSOR,
    RS2_EXTENSION_DISPARITY_FRAME,
    RS2_EXTENSION_MOTION_PROFILE,
    RS2_EXTENSION_POSE_FRAME,
    RS2_EXTENSION_POSE_PROFILE,
    RS2_EXTENSION_TM2,
    RS2_EXTENSION_SOFTWARE_DEVICE,
    RS2_EXTENSION_SOFTWARE_SENSOR,
    RS2_EXTENSION_DECIMATION_FILTER,
    RS2_EXTENSION_THRESHOLD_FILTER,
    RS2_EXTENSION_DISPARITY_FILTER,
    RS2_EXTENSION_SPATIAL_FILTER,
    RS2_EXTENSION_TEMPORAL_FILTER,
    RS2_EXTENSION_HOLE_FILLING_FILTER,
    RS2_EXTENSION_ZERO_ORDER_FILTER,
    RS2_EXTENSION_RECOMMENDED_FILTERS,
    RS2_EXTENSION_POSE,
    RS2_EXTENSION_POSE_SENSOR,
    RS2_EXTENSION_WHEEL_ODOMETER,
    RS2_EXTENSION_GLOBAL_TIMER,
    RS2_EXTENSION_UPDATABLE,
    RS2_EXTENSION_UPDATE_DEVICE,
    RS2_EXTENSION_L500_DEPTH_SENSOR,
    RS2_EXTENSION_TM2_SENSOR,
    RS2_EXTENSION_AUTO_CALIBRATED_DEVICE,
    RS2_EXTENSION_COLOR_SENSOR,
    RS2_EXTENSION_MOTION_SENSOR,
    RS2_EXTENSION_FISHEYE_SENSOR,
    RS2_EXTENSION_DEPTH_HUFFMAN_DECODER,
    RS2_EXTENSION_SERIALIZABLE,
    RS2_EXTENSION_FW_LOGGER,
    RS2_EXTENSION_AUTO_CALIBRATION_FILTER,
    RS2_EXTENSION_DEVICE_CALIBRATION,
    RS2_EXTENSION_CALIBRATED_SENSOR,
    RS2_EXTENSION_HDR_MERGE,
    RS2_EXTENSION_SEQUENCE_ID_FILTER,
    RS2_EXTENSION_MAX_USABLE_RANGE_SENSOR,
    RS2_EXTENSION_DEBUG_STREAM_SENSOR,
    RS2_EXTENSION_CALIBRATION_CHANGE_DEVICE,
    RS2_EXTENSION_COUNT);


function rs2_extension_type_to_string(atype: rs2_extension): PChar;
  cdecl; external REALSENSE_DLL;

function rs2_extension_to_string(aType: rs2_extension): PChar;
  cdecl; external REALSENSE_DLL;


type
  pRS2_devices_changed_callback = ^RS2_devices_changed_callback;

  RS2_devices_changed_callback = procedure(DeviceList1: pRS2_Device_List;
    DeviceList2: pRS2_Device_List); cdecl;


type
  prs2_update_progress_callback_ptr = ^rs2_update_progress_callback_ptr;
  rs2_update_progress_callback_ptr = procedure(const Value: double;
    aPointer: pVoid); cdecl;

 {
  Exception types are the different categories of errors that RealSense API might return. */
}

type
  rs2_exception_type = (
    RS2_EXCEPTION_TYPE_UNKNOWN,
    RS2_EXCEPTION_TYPE_CAMERA_DISCONNECTED,
    //< Device was disconnected, this can be caused by outside intervention, by internal firmware error or due to insufficient power
    RS2_EXCEPTION_TYPE_BACKEND,
    //< Error was returned from the underlying OS-specific layer
    RS2_EXCEPTION_TYPE_INVALID_VALUE,            //< Invalid value was passed to the API
    RS2_EXCEPTION_TYPE_WRONG_API_CALL_SEQUENCE,  //< Function precondition was violated
    RS2_EXCEPTION_TYPE_NOT_IMPLEMENTED,
    //< The method is not implemented at this point
    RS2_EXCEPTION_TYPE_DEVICE_IN_RECOVERY_MODE,
    //< Device is in recovery mode and might require firmware update
    RS2_EXCEPTION_TYPE_IO,                       //< IO Device failure
    RS2_EXCEPTION_TYPE_COUNT
    //< Number of enumeration values. Not a valid input: intended to be used in for-loops.
    );

//const
//  RS2_EXTENSION_UNKNOWN = 0;
//  RS2_EXTENSION_DEBUG = 1;
//  RS2_EXTENSION_INFO = 2;
//  RS2_EXTENSION_MOTION = 3;
//  RS2_EXTENSION_OPTIONS = 4;
//  RS2_EXTENSION_VIDEO = 5;
//  RS2_EXTENSION_ROI = 6;
//  RS2_EXTENSION_DEPTH_SENSOR = 7;
//  RS2_EXTENSION_VIDEO_FRAME = 8;
//  RS2_EXTENSION_MOTION_FRAME = 9;
//  RS2_EXTENSION_COMPOSITE_FRAME = 10;
//  RS2_EXTENSION_POINTS = 11;
//  RS2_EXTENSION_DEPTH_FRAME = 12;
//  RS2_EXTENSION_ADVANCED_MODE = 13;
//  RS2_EXTENSION_RECORD = 14;
//  RS2_EXTENSION_VIDEO_PROFILE = 15;
//  RS2_EXTENSION_PLAYBACK = 16;
//  RS2_EXTENSION_DEPTH_STEREO_SENSOR = 17;
//  RS2_EXTENSION_DISPARITY_FRAME = 18;
//  RS2_EXTENSION_MOTION_PROFILE = 19;
//  RS2_EXTENSION_POSE_FRAME = 20;
//  RS2_EXTENSION_POSE_PROFILE = 21;
//  RS2_EXTENSION_TM2 = 22;
//  RS2_EXTENSION_SOFTWARE_DEVICE = 23;
//  RS2_EXTENSION_SOFTWARE_SENSOR = 24;
//  RS2_EXTENSION_DECIMATION_FILTER = 25;
//  RS2_EXTENSION_THRESHOLD_FILTER = 26;
//  RS2_EXTENSION_DISPARITY_FILTER = 27;
//  RS2_EXTENSION_SPATIAL_FILTER = 28;
//  RS2_EXTENSION_TEMPORAL_FILTER = 29;
//  RS2_EXTENSION_HOLE_FILLING_FILTER = 30;
//  RS2_EXTENSION_ZERO_ORDER_FILTER = 31;
//  RS2_EXTENSION_RECOMMENDED_FILTERS = 32;
//  RS2_EXTENSION_POSE = 33;
//  RS2_EXTENSION_POSE_SENSOR = 34;
//  RS2_EXTENSION_WHEEL_ODOMETER = 35;
//  RS2_EXTENSION_GLOBAL_TIMER = 36;
//  RS2_EXTENSION_UPDATABLE = 37;
//  RS2_EXTENSION_UPDATE_DEVICE = 38;
//  RS2_EXTENSION_L500_DEPTH_SENSOR = 39;
//  RS2_EXTENSION_TM2_SENSOR = 40;
//  RS2_EXTENSION_AUTO_CALIBRATED_DEVICE = 41;
//  RS2_EXTENSION_COLOR_SENSOR = 42;
//  RS2_EXTENSION_MOTION_SENSOR = 43;
//  RS2_EXTENSION_FISHEYE_SENSOR = 44;
//  RS2_EXTENSION_DEPTH_HUFFMAN_DECODER = 45;
//  RS2_EXTENSION_SERIALIZABLE = 46;
//  RS2_EXTENSION_FW_LOGGER = 47;
//  RS2_EXTENSION_AUTO_CALIBRATION_FILTER = 48;
//  RS2_EXTENSION_DEVICE_CALIBRATION = 49;
//  RS2_EXTENSION_CALIBRATED_SENSOR = 50;
//  RS2_EXTENSION_HDR_MERGE = 51;
//  RS2_EXTENSION_SEQUENCE_ID_FILTER = 52;
//  RS2_EXTENSION_MAX_USABLE_RANGE_SENSOR = 53;
//  RS2_EXTENSION_DEBUG_STREAM_SENSOR = 54;
//  RS2_EXTENSION_CALIBRATION_CHANGE_DEVICE = 55;
//  RS2_EXTENSION_COUNT = 56;

function rs2_get_error_message(error: prs2_error): PChar;
  cdecl; external REALSENSE_DLL;
function rs2_get_failed_function(Error: pRS2_error): PChar;
  cdecl; external REALSENSE_DLL;
function rs2_get_failed_args(Error: pRS2_error): PChar; cdecl
  external REALSENSE_DLL;
procedure rs2_free_error(error: prs2_error); cdecl;
  external REALSENSE_DLL;

function rs2_exception_type_to_string(TypeException: prs2_exception_type): PChar;
  cdecl; external REALSENSE_DLL;



implementation


end.
