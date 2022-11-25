{
Exposes RealSense processing-block functionality
}
unit rs_pipeline;

{$mode ObjFPC}{$H+}

interface

{
Exposes RealSense processing-block functionality
}

uses rs_types;

{

    Create a pipeline instance
    The pipeline simplifies the user interaction with the device and computer vision processing modules.
    The class abstracts the camera configuration and streaming, and the vision modules triggering and threading.
    It lets the application focus on the computer vision output of the modules, or the device output data.
    The pipeline can manage computer vision modules, which are implemented as a processing blocks.
    The pipeline is the consumer of the processing block interface, while the application consumes the
    computer vision interface.
    param[in]  ctx    context
    param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored

}
function rs2_create_pipeline(ctx: prs2_context; error: Prs2_error): prs2_pipeline;
  cdecl; external REALSENSE_DLL;
{
    Stop the pipeline streaming.
    The pipeline stops delivering samples to the attached computer vision modules and processing blocks, stops the device streaming
    and releases the device resources used by the pipeline. It is the application's responsibility to release any frame reference it owns.
    The method takes effect only after \c start() was called, otherwise an exception is raised.
    param[in] pipe  pipeline
    param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored

}
procedure rs2_pipeline_stop(pipe: prs2_pipeline; error: pRS2_error);
  cdecl; external REALSENSE_DLL;
   {

     Delete a pipeline instance.
    Upon destruction, the pipeline will implicitly stop itself
    param[in] pipe to delete
}
procedure rs2_delete_pipeline(pipe: prs2_pipeline); cdecl; external REALSENSE_DLL;
{

 Start the pipeline streaming according to the configuraion.
 The pipeline streaming loop captures samples from the device, and delivers them to the attached computer vision modules
 and processing blocks, according to each module requirements and threading model.
 During the loop execution, the application can access the camera streams by calling \c wait_for_frames() or \c poll_for_frames().
 The streaming loop runs until the pipeline is stopped.
 Starting the pipeline is possible only when it is not started. If the pipeline was started, an exception is raised.
 The pipeline selects and activates the device upon start, according to configuration or a default configuration.
 When the rs2::config is provided to the method, the pipeline tries to activate the config \c resolve() result. If the application
 requests are conflicting with pipeline computer vision modules or no matching device is available on the platform, the method fails.
 Available configurations and devices may change between config \c resolve() call and pipeline start, in case devices are connected
 or disconnected, or another application acquires ownership of a device.

 param[in] pipe    a pointer to an instance of the pipeline
 param[in] config   A rs2::config with requested filters on the pipeline configuration. By default no filters are applied.
 param[out] error  if non-null, receives any error that occurs during this call, otherwise, errors are ignored
 return             The actual pipeline device and streams profile, which was successfully configured to the streaming device.

}

function rs2_pipeline_start_with_config(pipe: pRs2_pipeline;
  config: pRs2_config; error: pRS2_error): pRS2_pipeline_profile; cdecl;
  external REALSENSE_DLL;
 {

     Wait until a new set of frames becomes available.
     The frames set includes time-synchronized frames of each enabled stream in the pipeline.
     The method blocks the calling thread, and fetches the latest unread frames set.
     Device frames, which were produced while the function wasn't called, are dropped. To avoid frame drops, this method should be called
     as fast as the device frame rate.
     The application can maintain the frames handles to defer processing. However, if the application maintains too long history, the device
     may lack memory resources to produce new frames, and the following call to this method shall fail to retrieve new frames, until resources
     are retained.
     param[in] pipe the pipeline
     param[in] timeout_ms   Max time in milliseconds to wait until an exception will be thrown
     param[out] error         if non-null, receives any error that occurs during this call, otherwise, errors are ignored
     return Set of coherent frames

 }

function rs2_pipeline_wait_for_frames(pipe: pRS2_pipeline; timeout_ms: integer;
  error: pRS2_error): pRS2_frame; cdecl; external REALSENSE_DLL;
{
   Deletes an instance of a pipeline profile

   param[in] profile    A pointer to an instance of a pipeline profile

}

procedure rs2_delete_pipeline_profile(profile: pRS2_pipeline_profile);
  cdecl; external REALSENSE_DLL;

implementation

end.
