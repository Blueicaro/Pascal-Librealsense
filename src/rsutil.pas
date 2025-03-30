unit rsutil;

{$mode ObjFPC}{$H+}

interface

uses rs_types;

type
  TPixels = array [0..1] of Trs2_pixel;

type
  TPoints = array [0..2] of single;

type
  Tto_fov = array [0..1] of single;

{
 Given a point in 3D space, compute the corresponding pixel coordinates in an image
 with no distortion or forward distortion coefficients produced by the same camera
}

procedure rs2_project_pooint_to_pixel(var pixel: TPixels; intrin: pRS2_intrinsics;
  var Points: TPoints); cdecl; external REALSENSE_DLL;

{
 Given pixel coordinates and depth in an image with no distortion or inverse distortion coefficients,
 compute the corresponding point in 3D space relative to the same camera
}
procedure rs2_deproject_pixel_to_point(var point: TPoints; intrin: pRS2_intrinsics;
   var pixels: TPixels; depth: single); cdecl; external REALSENSE_DLL;

{
 Transform 3D coordinates relative to one sensor to 3D coordinates relative to another viewpoint
}
procedure rs2_transform_point_to_point(var Point: TPoints; extrin: pRS2_intrinsics;
  var From_point: TPoints); cdecl; external REALSENSE_DLL;

{
 Calculate horizontal and vertical feild of view, based on video intrinsics
}
procedure rs2_fov(intrin: pRS2_intrinsics; var float_to_fov: Tto_fov);
  cdecl; external REALSENSE_DLL;

{
/* Find projected pixel with unknown depth search along line. */
void rs2_project_color_pixel_to_depth_pixel(float to_pixel[2],
    const uint16_t* data, float depth_scale,
    float depth_min, float depth_max,
    const struct rs2_intrinsics* depth_intrin,
    const struct rs2_intrinsics* color_intrin,
    const struct rs2_extrinsics* color_to_depth,
    const struct rs2_extrinsics* depth_to_color,
    const float from_pixel[2]);

}

procedure rs2_project_color_pixel_to_depth_pixel(var to_pixel: TPoints;
  Data: PUInt16; depth_scale: single; depth_min: single; depth_max: single;
  depth_intrin: pRS2_intrinsics; color_intrin: pRS2_intrinsics;
  color_to_depth: pRS2_intrinsics; depth_color: pRS2_intrinsics;
  var from_pixel: TPixels); cdecl; external REALSENSE_DLL;

implementation

end.
