
unit rs_types;

interface

{
  Automatically converted by H2Pas 1.0.0 from D:\github\LibreSensePascal\test\include\rs_types.tmp.h
  The following command line parameters were used:
    -e
    -p
    -D
    -w
    -o
    D:\github\LibreSensePascal\test\include\rs_types.pas
    D:\github\LibreSensePascal\test\include\rs_types.tmp.h
}

const
    {$IFDEF MSWINDOWS}
     REALSENSE_DLL = 'realsense2.dll';
    {$ENDIF}
    {$IFDEF LINUX}
        REALSENSE_DLL='realsense2.so';
    {$ENDIF}


{ Pointers to basic pascal types, inserted by h2pas conversion program.}
type
  PLongint = ^longint;
  PSmallInt = ^smallint;
  pbyte = ^byte;
  PWord = ^word;
  PDWord = ^DWord;
  PDouble = ^double;

type
  PChar = ^char;
  //Prs2_device_list  = ^rs2_device_list;
  //Prs2_distortion  = ^rs2_distortion;
  //Prs2_dsm_correction_model  = ^rs2_dsm_correction_model;
  //Prs2_dsm_params  = ^rs2_dsm_params;
  rs2_error = integer;
  Prs2_error = ^rs2_error;
//Prs2_exception_type  = ^rs2_exception_type;
//Prs2_extension  = ^rs2_extension;
//Prs2_frame  = ^rs2_frame;
//Prs2_intrinsics  = ^rs2_intrinsics;
//Prs2_log_message  = ^rs2_log_message;
//Prs2_log_severity  = ^rs2_log_severity;
//Prs2_matchers  = ^rs2_matchers;
//Prs2_metadata_type  = ^rs2_metadata_type;
//Prs2_motion_device_intrinsic  = ^rs2_motion_device_intrinsic;
//Prs2_notification  = ^rs2_notification;
//Prs2_notification_category  = ^rs2_notification_category;
//Prs2_pixel  = ^rs2_pixel;
//Prs2_pose  = ^rs2_pose;
//Prs2_quaternion  = ^rs2_quaternion;
//Prs2_source  = ^rs2_source;
//Prs2_time_t  = ^rs2_time_t;
//Prs2_vector  = ^rs2_vector;
//Prs2_vertex  = ^rs2_vertex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  { License: Apache 2.0. See LICENSE file in root directory.
     Copyright(c) 2017 Intel Corporation. All Rights Reserved.  }
  {* \file rs_types.h
  * \brief
  * Exposes RealSense structs
   }
{$ifndef LIBREALSENSE_RS2_TYPES_H}
{$define LIBREALSENSE_RS2_TYPES_H}
{ C++ extern C conditionnal removed }
{* \brief Category of the librealsense notification.  }
{*< Frames didn't arrived within 5 seconds  }
{*< Received partial/incomplete frame  }
{*< Error reported from the device  }
{*< General Hardeware notification that is not an error  }
{*< Received unknown error from the device  }
{*< Current firmware version installed is not the latest available  }
{*< A relocalization event has updated the pose provided by a pose sensor  }
{*< Number of enumeration values. Not a valid input: intended to be used in for-loops.  }

type
  Prs2_notification_category = ^rs2_notification_category;
  rs2_notification_category = longint;

const
  RS2_NOTIFICATION_CATEGORY_FRAMES_TIMEOUT = 0;
  RS2_NOTIFICATION_CATEGORY_FRAME_CORRUPTED = 1;
  RS2_NOTIFICATION_CATEGORY_HARDWARE_ERROR = 2;
  RS2_NOTIFICATION_CATEGORY_HARDWARE_EVENT = 3;
  RS2_NOTIFICATION_CATEGORY_UNKNOWN_ERROR = 4;
  RS2_NOTIFICATION_CATEGORY_FIRMWARE_UPDATE_RECOMMENDED = 5;
  RS2_NOTIFICATION_CATEGORY_POSE_RELOCALIZATION = 6;
  RS2_NOTIFICATION_CATEGORY_COUNT = 7;

(* Const before type ignored *)

function rs2_notification_category_to_string(category: rs2_notification_category): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_notification_category_to_string';

{* \brief Exception types are the different categories of errors that RealSense API might return.  }
{*< Device was disconnected, this can be caused by outside intervention, by internal firmware error or due to insufficient power  }
{*< Error was returned from the underlying OS-specific layer  }
{*< Invalid value was passed to the API  }
{*< Function precondition was violated  }
{*< The method is not implemented at this point  }
{*< Device is in recovery mode and might require firmware update  }
{*< IO Device failure  }
{*< Number of enumeration values. Not a valid input: intended to be used in for-loops.  }

type
  Prs2_exception_type = ^rs2_exception_type;
  rs2_exception_type = longint;

const
  RS2_EXCEPTION_TYPE_UNKNOWN = 0;
  RS2_EXCEPTION_TYPE_CAMERA_DISCONNECTED = 1;
  RS2_EXCEPTION_TYPE_BACKEND = 2;
  RS2_EXCEPTION_TYPE_INVALID_VALUE = 3;
  RS2_EXCEPTION_TYPE_WRONG_API_CALL_SEQUENCE = 4;
  RS2_EXCEPTION_TYPE_NOT_IMPLEMENTED = 5;
  RS2_EXCEPTION_TYPE_DEVICE_IN_RECOVERY_MODE = 6;
  RS2_EXCEPTION_TYPE_IO = 7;
  RS2_EXCEPTION_TYPE_COUNT = 8;

(* Const before type ignored *)

function rs2_exception_type_to_string(_type: rs2_exception_type): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_exception_type_to_string';

{* \brief Distortion model: defines how pixel coordinates should be mapped to sensor coordinates.  }
{*< Rectilinear images. No distortion compensation required.  }
{*< Equivalent to Brown-Conrady distortion, except that tangential distortion is applied to radially distorted points  }
{*< Equivalent to Brown-Conrady distortion, except undistorts image instead of distorting it  }
{*< F-Theta fish-eye distortion model  }
{*< Unmodified Brown-Conrady distortion model  }
{*< Four parameter Kannala Brandt distortion model  }
{*< Number of enumeration values. Not a valid input: intended to be used in for-loops.  }

type
  Prs2_distortion = ^rs2_distortion;
  rs2_distortion = longint;

const
  RS2_DISTORTION_NONE = 0;
  RS2_DISTORTION_MODIFIED_BROWN_CONRADY = 1;
  RS2_DISTORTION_INVERSE_BROWN_CONRADY = 2;
  RS2_DISTORTION_FTHETA = 3;
  RS2_DISTORTION_BROWN_CONRADY = 4;
  RS2_DISTORTION_KANNALA_BRANDT4 = 5;
  RS2_DISTORTION_COUNT = 6;

(* Const before type ignored *)

function rs2_distortion_to_string(distortion: rs2_distortion): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_distortion_to_string';

{* \brief Video stream intrinsics.  }
{*< Width of the image in pixels  }
{*< Height of the image in pixels  }
{*< Horizontal coordinate of the principal point of the image, as a pixel offset from the left edge  }
{*< Vertical coordinate of the principal point of the image, as a pixel offset from the top edge  }
{*< Focal length of the image plane, as a multiple of pixel width  }
{*< Focal length of the image plane, as a multiple of pixel height  }
{*< Distortion model of the image  }
{*< Distortion coefficients. Order for Brown-Conrady: [k1, k2, p1, p2, k3]. Order for F-Theta Fish-eye: [k1, k2, k3, k4, 0]. Other models are subject to their own interpretations  }

type
  Prs2_intrinsics = ^rs2_intrinsics;

  rs2_intrinsics = record
    Width: longint;
    Height: longint;
    ppx: single;
    ppy: single;
    fx: single;
    fy: single;
    model: rs2_distortion;
    coeffs: array[0..4] of single;
  end;
  {* \brief Video DSM (Digital Sync Module) parameters for calibration (same layout as in FW ac_depth_params)
      This is the block in MC that converts angles to dimensionless integers reported to MA (using "DSM coefficients").
   }
(** unsupported pragma#pragma pack( push, 1 )*)
{*< system_clock::time_point::time_since_epoch().count()  }
{*< MAJOR<<12 | MINOR<<4 | PATCH  }
{*< rs2_dsm_correction_model  }
{*< TBD, now 0s  }
{*< the scale factor to horizontal DSM scale thermal results  }
{*< the scale factor to vertical DSM scale thermal results  }
{*< the offset to horizontal DSM offset thermal results  }
{*< the offset to vertical DSM offset thermal results  }
{*< the offset to the Round-Trip-Distance delay thermal results  }
{*< the temperature recorded times 2 (ldd for depth; hum for rgb)  }
{*< the scale factor to horizontal LOS coefficients in MC  }
{*< the scale factor to vertical LOS coefficients in MC  }
{*< time (in weeks) since factory calibration  }
{*< time (in weeks) between factory calibration and last AC event  }

type
  Prs2_dsm_params = ^rs2_dsm_params;

  rs2_dsm_params = record
    timestamp: qword;
    version: word;
    model: byte;
    flags: array[0..4] of byte;
    h_scale: single;
    v_scale: single;
    h_offset: single;
    v_offset: single;
    rtd_offset: single;
    temp_x2: byte;
    mc_h_scale: single;
    mc_v_scale: single;
    weeks_since_calibration: byte;
    ac_weeks_since_calibaration: byte;
    reserved: array[0..0] of byte;
  end;
(** unsupported pragma#pragma pack( pop )*)
{*< hFactor and hOffset are not used, and no artificial error is induced  }
{*< Aging-over-thermal (default); aging-induced error is uniform across temperature  }
{*< Thermal-over-aging; aging-induced error changes alongside temperature  }

type
  Prs2_dsm_correction_model = ^rs2_dsm_correction_model;
  rs2_dsm_correction_model = longint;

const
  RS2_DSM_CORRECTION_NONE = 0;
  RS2_DSM_CORRECTION_AOT = 1;
  RS2_DSM_CORRECTION_TOA = 2;
  RS2_DSM_CORRECTION_COUNT = 3;

{* \brief Motion device intrinsics: scale, bias, and variances.  }
  { \internal
      * Scale X       cross axis  cross axis  Bias X \n
      * cross axis    Scale Y     cross axis  Bias Y \n
      * cross axis    cross axis  Scale Z     Bias Z  }
{*< Interpret data array values  }
{*< Variance of noise for X, Y, and Z axis  }
{*< Variance of bias for X, Y, and Z axis  }

type
  Prs2_motion_device_intrinsic = ^rs2_motion_device_intrinsic;

  rs2_motion_device_intrinsic = record
    Data: array[0..2] of array[0..3] of single;
    noise_variances: array[0..2] of single;
    bias_variances: array[0..2] of single;
  end;
  {* \brief 3D coordinates with origin at topmost left corner of the lense,
       with positive Z pointing away from the camera, positive X pointing camera right and positive Y pointing camera down  }

  Prs2_vertex = ^rs2_vertex;

  rs2_vertex = record
    xyz: array[0..2] of single;
  end;
  {* \brief Pixel location within 2D image. (0,0) is the topmost, left corner. Positive X is right, positive Y is down  }

  Prs2_pixel = ^rs2_pixel;

  rs2_pixel = record
    ij: array[0..1] of longint;
  end;
  {* \brief 3D vector in Euclidean coordinate space  }

  Prs2_vector = ^rs2_vector;

  rs2_vector = record
    x: single;
    y: single;
    z: single;
  end;
  {* \brief Quaternion used to represent rotation   }

  Prs2_quaternion = ^rs2_quaternion;

  rs2_quaternion = record
    x: single;
    y: single;
    z: single;
    w: single;
  end;
  {*< X, Y, Z values of translation, in meters (relative to initial position)                                     }
  {*< X, Y, Z values of velocity, in meters/sec                                                                   }
  {*< X, Y, Z values of acceleration, in meters/sec^2                                                             }
  {*< Qi, Qj, Qk, Qr components of rotation as represented in quaternion rotation (relative to initial position)  }
  {*< X, Y, Z values of angular velocity, in radians/sec                                                          }
  {*< X, Y, Z values of angular acceleration, in radians/sec^2                                                    }
  {*< Pose confidence 0x0 - Failed, 0x1 - Low, 0x2 - Medium, 0x3 - High                                           }
  {*< Pose map confidence 0x0 - Failed, 0x1 - Low, 0x2 - Medium, 0x3 - High                                       }

  Prs2_pose = ^rs2_pose;

  rs2_pose = record
    translation: rs2_vector;
    velocity: rs2_vector;
    acceleration: rs2_vector;
    rotation: rs2_quaternion;
    angular_velocity: rs2_vector;
    angular_acceleration: rs2_vector;
    tracker_confidence: dword;
    mapper_confidence: dword;
  end;
  {* \brief Severity of the librealsense logger.  }
  {*< Detailed information about ordinary operations  }
  {*< Terse information about ordinary operations  }
  {*< Indication of possible failure  }
  {*< Indication of definite failure  }
  {*< Indication of unrecoverable failure  }
  {*< No logging will occur  }
  {*< Number of enumeration values. Not a valid input: intended to be used in for-loops.  }
  {*< Include any/all log messages  }

  Prs2_log_severity = ^rs2_log_severity;
  rs2_log_severity = longint;

const
  RS2_LOG_SEVERITY_DEBUG = 0;
  RS2_LOG_SEVERITY_INFO = 1;
  RS2_LOG_SEVERITY_WARN = 2;
  RS2_LOG_SEVERITY_ERROR = 3;
  RS2_LOG_SEVERITY_FATAL = 4;
  RS2_LOG_SEVERITY_NONE = 5;
  RS2_LOG_SEVERITY_COUNT = 6;
  RS2_LOG_SEVERITY_ALL = RS2_LOG_SEVERITY_DEBUG;

(* Const before type ignored *)

function rs2_log_severity_to_string(info: rs2_log_severity): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_log_severity_to_string';

{* \brief Specifies advanced interfaces (capabilities) objects may implement.  }

type
  Prs2_extension = ^rs2_extension;
  rs2_extension = longint;

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

(* Const before type ignored *)

function rs2_extension_type_to_string(_type: rs2_extension): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_extension_type_to_string';

(* Const before type ignored *)
function rs2_extension_to_string(_type: rs2_extension): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_extension_to_string';

{* \brief Specifies types of different matchers  }
{compare depth and ir based on frame number }
{compare depth and ir based on frame number, }
{compare the pair of corresponding depth and ir with color based on closest timestamp, }
{commonly used by SR300 }
{compare depth, left and right ir based on frame number, }
{compare the set of corresponding depth, left and right with color based on closest timestamp, }
{commonly used by RS415, RS435 }
{compare depth, left and right ir based on frame number, }
{commonly used by RS400, RS405, RS410, RS420, RS430 }
{compare depth, ir and confidence based on frame number used by RS500 }
{compare depth, ir and confidence based on frame number, }
{compare the set of corresponding depth, ir and confidence with color based on closest timestamp, }
{commonly used by RS515 }
{the default matcher compare all the streams based on closest timestamp }

type
  Prs2_matchers = ^rs2_matchers;
  rs2_matchers = longint;

const
  RS2_MATCHER_DI = 0;
  RS2_MATCHER_DI_C = 1;
  RS2_MATCHER_DLR_C = 2;
  RS2_MATCHER_DLR = 3;
  RS2_MATCHER_DIC = 4;
  RS2_MATCHER_DIC_C = 5;
  RS2_MATCHER_DEFAULT = 6;
  RS2_MATCHER_COUNT = 7;

(* Const before type ignored *)

function rs2_matchers_to_string(stream: rs2_matchers): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_matchers_to_string';


//  type
//(* Const before abstract_declarator ignored *)

//    rs2_log_callback_ptr = procedure (_para1:rs2_log_severity; _para2:Prs2_log_message; arg:pointer);cdecl;

//    rs2_notification_callback_ptr = procedure (_para1:Prs2_notification; _para2:pointer);cdecl;

//    rs2_software_device_destruction_callback_ptr = procedure (_para1:pointer);cdecl;

//    rs2_devices_changed_callback_ptr = procedure (_para1:Prs2_device_list; _para2:Prs2_device_list; _para3:pointer);cdecl;

//    rs2_frame_callback_ptr = procedure (_para1:Prs2_frame; _para2:pointer);cdecl;

//    rs2_frame_processor_callback_ptr = procedure (_para1:Prs2_frame; _para2:Prs2_source; _para3:pointer);cdecl;
//(* Const before type ignored *)

//    rs2_update_progress_callback_ptr = procedure (_para1:single; _para2:pointer);cdecl;

//    Prs2_time_t = ^rs2_time_t;
//    rs2_time_t = double;
//  {*< Timestamp format. units are milliseconds  }

//    Prs2_metadata_type = ^rs2_metadata_type;
//    rs2_metadata_type = int64;
//  {*< Metadata attribute type is defined as 64 bit signed integer }
//(* Const before type ignored *)
//(* Const before type ignored *)
//(* Const before type ignored *)

//  function rs2_create_error(what:Pchar; name:Pchar; args:Pchar; _type:rs2_exception_type):Prs2_error;cdecl;external External_library name 'rs2_create_error';

//(* Const before type ignored *)
//  function rs2_get_librealsense_exception_type(var error:rs2_error):rs2_exception_type;cdecl;external External_library name 'rs2_get_librealsense_exception_type';

//(* Const before type ignored *)
//(* Const before type ignored *)
//  function rs2_get_failed_function(var error:rs2_error):Pchar;cdecl;external External_library name 'rs2_get_failed_function';

//(* Const before type ignored *)
//(* Const before type ignored *)
//  function rs2_get_failed_args(var error:rs2_error):Pchar;cdecl;external External_library name 'rs2_get_failed_args';

//(* Const before type ignored *)
//(* Const before type ignored *)
function rs2_get_error_message(var error: rs2_error): PChar;
  cdecl; external REALSENSE_DLL Name 'rs2_get_error_message';

procedure rs2_free_error(var error: rs2_error); cdecl;
  external REALSENSE_DLL Name 'rs2_free_error';

{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
