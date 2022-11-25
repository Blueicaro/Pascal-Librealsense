{
Exposes RealSense processing-block functionality
}
unit rs_config;

{$mode ObjFPC}{$H+}

interface

uses rs_types, rs_sensor;

const
  RS2_DEFAULT_TIMEOUT = 15000;

{
  Create a config instance
 The config allows pipeline users to request filters for the pipeline streams and device selection and configuration.
 This is an optional step in pipeline creation, as the pipeline resolves its streaming device internally.
 Config provides its users a way to set the filters and test if there is no conflict with the pipeline requirements
 from the device. It also allows the user to find a matching device for the config filters and the pipeline, in order to
 select a device explicitly, and modify its controls before streaming starts.

 param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
 return rs2_config*  A pointer to a new config instance

}

function rs2_create_config(error: pRS2_error): prs2_config; cdecl;
  external REALSENSE_DLL;

{
     Deletes an instance of a config
     param[in] config    A pointer to an instance of a config

}

procedure rs2_delete_config(config: prs2_config); cdecl; external REALSENSE_DLL;
{

 Enable a device stream explicitly, with selected stream parameters.
 The method allows the application to request a stream with specific configuration. If no stream is explicitly enabled, the pipeline
 configures the device and its streams according to the attached computer vision modules and processing blocks requirements, or
 default configuration for the first available device.
 The application can configure any of the input stream parameters according to its requirement, or set to 0 for don't care value.
 The config accumulates the application calls for enable configuration methods, until the configuration is applied. Multiple enable
 stream calls for the same stream with conflicting parameters override each other, and the last call is maintained.
 Upon calling \c resolve(), the config checks for conflicts between the application configuration requests and the attached computer
 vision modules and processing blocks requirements, and fails if conflicts are found. Before \c resolve() is called, no conflict
 check is done.

 param[in] config    A pointer to an instance of a config
 param[in] stream    Stream type to be enabled
 param[in] index     Stream index, used for multiple streams of the same type. -1 indicates any.
 param[in] width     Stream image width - for images streams. 0 indicates any.
 param[in] height    Stream image height - for images streams. 0 indicates any.
 param[in] format    Stream data format - pixel format for images streams, of data type for other streams. RS2_FORMAT_ANY indicates any.
 param[in] framerate Stream frames per second. 0 indicates any.
 param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored

}

procedure rs2_config_enable_stream(config: pRs2_config; stream: rs2_stream;
  index: integer; Width: integer; Height: integer; format: rs2_format;
  framerate: integer; error: pRS2_error); cdecl; external REALSENSE_DLL;

implementation

end.
