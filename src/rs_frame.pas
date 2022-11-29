{
Exposes RealSense frame functionality
}

unit rs_frame;

{$mode ObjFPC}{$H+}

interface

uses
  rs_types;

{
Specifies the clock in relation to which the frame timestamp was measured. */

    RS2_TIMESTAMP_DOMAIN_HARDWARE_CLOCK, /**< Frame timestamp was measured in relation to the camera clock */
    RS2_TIMESTAMP_DOMAIN_SYSTEM_TIME,    /**< Frame timestamp was measured in relation to the OS system clock */
    RS2_TIMESTAMP_DOMAIN_GLOBAL_TIME,    /**< Frame timestamp was measured in relation to the camera clock and converted to OS system clock by constantly measure the difference*/
    RS2_TIMESTAMP_DOMAIN_COUNT           /**< Number of enumeration values. Not a valid input: intended to be used in for-loops. */
}

type
  rs2_timestamp_domain = (
    RS2_TIMESTAMP_DOMAIN_HARDWARE_CLOCK,
    //< Frame timestamp was measured in relation to the camera clock
    RS2_TIMESTAMP_DOMAIN_SYSTEM_TIME,
    //< Frame timestamp was measured in relation to the OS system clock
    RS2_TIMESTAMP_DOMAIN_GLOBAL_TIME,
    //< Frame timestamp was measured in relation to the camera clock and converted to OS system clock by constantly measure the difference
    RS2_TIMESTAMP_DOMAIN_COUNT
    //< Number of enumeration values. Not a valid input: intended to be used in for-loops.
    );

function rs2_timestamp_domain_to_string(info: rs2_timestamp_domain): PChar;
  cdecl; external REALSENSE_DLL;
  {
Per-Frame-Metadata is the set of read-only properties that might be exposed for each individual frame. */
  }

type
  rs2_frame_metadata_value = (
    RS2_FRAME_METADATA_FRAME_COUNTER,
    //< A sequential index managed per-stream. Integer value
    RS2_FRAME_METADATA_FRAME_TIMESTAMP,
    //< Timestamp set by device clock when data readout and transmit commence. usec
    RS2_FRAME_METADATA_SENSOR_TIMESTAMP,
    //< Timestamp of the middle of sensor's exposure calculated by device. usec
    RS2_FRAME_METADATA_ACTUAL_EXPOSURE,
    //< Sensor's exposure width. When Auto Exposure (AE) is on the value is controlled by firmware. usec
    RS2_FRAME_METADATA_GAIN_LEVEL,
    //< A relative value increasing which will increase the Sensor's gain fctor. When AE is set On, the value is controlled by firmware. Integer value
    RS2_FRAME_METADATA_AUTO_EXPOSURE,
    //< Auto Exposure Mode indicator. Zero corresponds to AE switched off.
    RS2_FRAME_METADATA_WHITE_BALANCE,
    //< White Balance setting as a color temperature. Kelvin degrees
    RS2_FRAME_METADATA_TIME_OF_ARRIVAL,
    //< Time of arrival in system clock
    RS2_FRAME_METADATA_TEMPERATURE,
    //< Temperature of the device, measured at the time of the frame capture. Celsius degrees
    RS2_FRAME_METADATA_BACKEND_TIMESTAMP,
    //< Timestamp get from uvc driver. usec
    RS2_FRAME_METADATA_ACTUAL_FPS, //< Actual fps
    RS2_FRAME_METADATA_FRAME_LASER_POWER,
    //< Laser power value 0-360.
    RS2_FRAME_METADATA_FRAME_LASER_POWER_MODE,
    //< Laser power mode. Zero corresponds to Laser power switched off and one for switched on. deprecated, replaced by RS2_FRAME_METADATA_FRAME_EMITTER_MODE
    RS2_FRAME_METADATA_EXPOSURE_PRIORITY, //< Exposure priority.
    RS2_FRAME_METADATA_EXPOSURE_ROI_LEFT,
    //< Left region of interest for the auto exposure Algorithm.
    RS2_FRAME_METADATA_EXPOSURE_ROI_RIGHT,
    //< Right region of interest for the auto exposure Algorithm.
    RS2_FRAME_METADATA_EXPOSURE_ROI_TOP,
    //< Top region of interest for the auto exposure Algorithm.
    RS2_FRAME_METADATA_EXPOSURE_ROI_BOTTOM,
    //< Bottom region of interest for the auto exposure Algorithm.
    RS2_FRAME_METADATA_BRIGHTNESS, //< Color image brightness.
    RS2_FRAME_METADATA_CONTRAST, //< Color image contrast.
    RS2_FRAME_METADATA_SATURATION, //< Color image saturation.
    RS2_FRAME_METADATA_SHARPNESS, //< Color image sharpness.
    RS2_FRAME_METADATA_AUTO_WHITE_BALANCE_TEMPERATURE,
    //< Auto white balance temperature Mode indicator. Zero corresponds to automatic mode switched off.
    RS2_FRAME_METADATA_BACKLIGHT_COMPENSATION,
    //< Color backlight compensation. Zero corresponds to switched off.
    RS2_FRAME_METADATA_HUE, //< Color image hue.
    RS2_FRAME_METADATA_GAMMA, //< Color image gamma.
    RS2_FRAME_METADATA_MANUAL_WHITE_BALANCE,
    //< Color image white balance.
    RS2_FRAME_METADATA_POWER_LINE_FREQUENCY,
    //< Power Line Frequency for anti-flickering Off/50Hz/60Hz/Auto.
    RS2_FRAME_METADATA_LOW_LIGHT_COMPENSATION,
    //< Color lowlight compensation. Zero corresponds to switched off.
    RS2_FRAME_METADATA_FRAME_EMITTER_MODE,
    //< Emitter mode: 0 - all emitters disabled. 1 - laser enabled. 2 - auto laser enabled (opt). 3 - LED enabled (opt).
    RS2_FRAME_METADATA_FRAME_LED_POWER, //< Led power value 0-360.
    RS2_FRAME_METADATA_RAW_FRAME_SIZE,
    //< The number of transmitted payload bytes, not including metadata */
    RS2_FRAME_METADATA_GPIO_INPUT_DATA, //< GPIO input data
    RS2_FRAME_METADATA_SEQUENCE_NAME, //< sub-preset id
    RS2_FRAME_METADATA_SEQUENCE_ID, //< sub-preset sequence id
    RS2_FRAME_METADATA_SEQUENCE_SIZE, //< sub-preset sequence size
    RS2_FRAME_METADATA_COUNT

    );


function rs2_frame_metadata_to_string(metadata: rs2_frame_metadata_value): PChar;
  cdecl; external REALSENSE_DLL;
function rs2_frame_metadata_value_to_string(metadata: rs2_frame_metadata_value): PChar;
  external REALSENSE_DLL;




{

 Extract frame from within a composite frame
 param[in] composite   Composite frame
 param[in] index       Index of the frame to extract within the composite frame
 param[out] error      If non-null, receives any error that occurs during this call, otherwise, errors are ignored
 return                returns reference to a frame existing within the composite frame
                        If you wish to keep this frame after the composite is released, you need to call acquire_ref
                        Otherwise the resulting frame lifetime is bound by owning composite frame

}

function rs2_extract_frame(composite: pRS2_frame; index: integer;
  error: pRS2_error): pRS2_frame; cdecl; external REALSENSE_DLL;
{

Get number of frames embedded within a composite frame
param[in] composite   Composite input frame
param[out] error      If non-null, receives any error that occurs during this call, otherwise, errors are ignored
return                Number of embedded frames

}

function rs2_embedded_frames_count(frame: pRS2_frame; error: pRS2_error): integer;
  cdecl; external REALSENSE_DLL;
{

 relases the frame handle
 param[in] frame handle returned from a callback

}

procedure rs2_release_frame(frame: pRS2_frame); cdecl; external REALSENSE_DLL;

{
 retrieve data size from frame handle
 param[in] frame      handle returned from a callback
 param[out] error     if non-null, receives any error that occurs during this call, otherwise, errors are ignored
 return               the size of the frame data

}

function rs2_get_frame_data_size(const frame: pRS2_frame; error: pRS2_error): integer;
  cdecl; external REALSENSE_DLL;
 {

  retrieve data from frame handle
  param[in] frame      handle returned from a callback
  param[out] error     if non-null, receives any error that occurs during this call, otherwise, errors are ignored
  return               the pointer to the start of the frame data

 }

function rs2_get_frame_data(const frame: pRS2_frame; error: pRS2_error): pVoid; cdecl;
  external REALSENSE_DLL;

{

retrieve frame number from frame handle
param[in] frame      handle returned from a callback
param[out] error     if non-null, receives any error that occurs during this call, otherwise, errors are ignored
return               the frame nubmer of the frame, in milliseconds since the device was started

}

function rs2_get_frame_number(const frame: pRS2_frame; error: pRS2_error): uint64;
  cdecl; external REALSENSE_DLL;

{
 retrieve timestamp domain from frame handle. timestamps can only be comparable if they are in common domain
 (for example, depth timestamp might come from system time while color timestamp might come from the device)
 this method is used to check if two timestamp values are comparable (generated from the same clock)
 param[in] frameset   handle returned from a callback
 param[out] error     if non-null, receives any error that occurs during this call, otherwise, errors are ignored
 return               the timestamp domain of the frame (camera / microcontroller / system time)

}
function rs2_get_frame_timestamp_domain(const frame: pRS2_frame;
  error: pRS2_error): rs2_timestamp_domain; cdecl; external REALSENSE_DLL;
{
 retrieve timestamp from frame handle in milliseconds
 param[in] frame      handle returned from a callback
 param[out] error     if non-null, receives any error that occurs during this call, otherwise, errors are ignored
 return               the timestamp of the frame in milliseconds

}

function rs2_get_frame_timestamp(const frame: pRS2_frame; error: pRS2_error): Rs2_time_t;
  cdecl; external REALSENSE_DLL;
 {
 /**
* retrieve metadata from frame handle
* \param[in] frame      handle returned from a callback
* \param[in] frame_metadata  the rs2_frame_metadata whose latest frame we are interested in
* \param[out] error         if non-null, receives any error that occurs during this call, otherwise, errors are ignored
* \return            the metadata value
*/
rs2_metadata_type rs2_get_frame_metadata(const rs2_frame* frame, rs2_frame_metadata_value frame_metadata, rs2_error** error);
 }
function rs2_get_frame_metadata(const frame: pRS2_frame;
  frame_metadata: rs2_frame_metadata_value; error: pRS2_error): rs2_metadata_type;
  cdecl; external REALSENSE_DLL;

implementation

end.
