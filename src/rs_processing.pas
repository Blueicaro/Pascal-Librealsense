{
 Exposes RealSense processing-block functionality
}
unit rs_processing;

{$mode ObjFPC}{$H+}

interface

uses
  rs_types,
  rs_sensor,
  rs_option;

{
  Creates Depth-Colorizer processing block that can be used to quickly visualize the depth data
  This block will accept depth frames as input and replace them by depth frames with format RGB8
  Non-depth frames are passed through
  Further customization will be added soon (format, color-map, histogram equalization control)
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}

function rs2_create_colorizer(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  Creates Sync processing block. This block accepts arbitrary frames and output composite frames of best matches
  Some frames may be released within the syncer if they are waiting for match for too long
  Syncronization is done (mostly) based on timestamps so good hardware timestamps are a pre-condition
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}
function rs2_create_sync_processing_block(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  Creates Point-Cloud processing block. This block accepts depth frames and outputs Points frames
  In addition, given non-depth frame, the block will align texture coordinate to the non-depth stream
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}
function rs2_create_pointcloud(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  Creates YUY decoder processing block. This block accepts raw YUY frames and outputs frames of other formats.
  YUY is a common video format used by a variety of web-cams. It benefits from packing pixels into 2 bytes per pixel
  without signficant quality drop. YUY representation can be converted back to more usable RGB form,
  but this requires somewhat costly conversion.
  The SDK will automatically try to use SSE2 and AVX instructions and CUDA where available to get
  best performance. Other implementations (using GLSL, OpenCL, Neon and NCS) should follow.
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}
function rs2_create_yuy_decoder(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  Creates y411 decoder processing block. This block accepts raw y411 frames and outputs frames in RGB8.
  https://www.fourcc.org/pixel-format/yuv-y411/
  Y411 is disguised as NV12 to allow Linux compatibility. Both are 12bpp encodings that allow high-resolution
  modes in the camera to still fit within the USB3 limits (YUY wasn't enough).

  The SDK will automatically try to use SSE2 and AVX instructions and CUDA where available to get
  best performance. Other implementations (using GLSL, OpenCL, Neon and NCS) should follow.

  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}
function rs2_create_y411_decoder(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  Creates depth thresholding processing block
  By controlling min and max options on the block, one could filter out depth values
  that are either too large or too small, as a software post-processing step
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}
function rs2_create_threshold(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;

{
  Creates depth units transformation processing block
  All of the pixels are transformed from depth units into meters.
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
}
function rs2_create_units_transform(error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  This method creates new custom processing block. This lets the users pass frames between module boundaries for processing
  This is an infrastructure function aimed at middleware developers, and also used by provided blocks such as sync, colorizer, etc..
  param proc       Processing function to be applied to every frame entering the block
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
  return           new processing block, to be released by rs2_delete_processing_block
}
function rs2_create_processing_block(proc: pRS2_frame_processor_callback;
  error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
  This method creates new custom processing block from function pointer. This lets the users pass frames between module boundaries for processing
  This is an infrastructure function aimed at middleware developers, and also used by provided blocks such as sync, colorizer, etc..
  param proc       Processing function pointer to be applied to every frame entering the block
  param context    User context (can be anything or null) to be passed later as ctx param of the callback
  param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
  return           new processing block, to be released by rs2_delete_processing_block
}
function rs2_create_processing_block_fptr(proc: pRS2_frame_processor_callback_ptr;
  context: pvoid; error: pRS2_error): pRS2_processing_block;
  cdecl; external REALSENSE_DLL;
{
* This method adds a custom option to a custom processing block. This is a simple float that can be accessed via rs2_set_option and rs2_get_option
* This is an infrastructure function aimed at middleware developers, and also used by provided blocks such as save_to_ply, etc..
* \param[in] block      Processing block
* \param[in] option_id  an int ID for referencing the option
* \param[in] min     the minimum value which will be accepted for this option
* \param[in] max     the maximum value which will be accepted for this option
* \param[in] step    the granularity of options which accept discrete values, or zero if the option accepts continuous values
* \param[in] def     the default value of the option. This will be the initial value.
* \param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
* \return            true if adding the option succeeds. false if it fails e.g. an option with this id is already registered
*/
int rs2_processing_block_register_simple_option(rs2_processing_block* block, rs2_option option_id, float min, float max, float step, float def, rs2_error** error);
}
function rs2_processing_block_register_simple_option(block: pRS2_processing_block; option: Trs2_option; min: single;
implementation

end.
