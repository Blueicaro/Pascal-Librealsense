{
 Exposes RealSense sensor functionality
}
unit rs_sensor;

{$mode ObjFPC}{$H+}

interface

uses rs_types;

 { brief Read-only strings that can be queried from the device.
   Not all information attributes are available on all camera types.
   This information is mainly available for camera debug and troubleshooting
   and should not be used in applications. }
type
  Trs2_camera_info = (
    RS2_CAMERA_INFO_NAME,//< Friendly name
    RS2_CAMERA_INFO_SERIAL_NUMBER,//< Device serial number
    RS2_CAMERA_INFO_FIRMWARE_VERSION,//< Primary firmware version
    RS2_CAMERA_INFO_RECOMMENDED_FIRMWARE_VERSION,//< Recommended firmware version
    RS2_CAMERA_INFO_PHYSICAL_PORT,
    //< Unique identifier of the port the device is connected to (platform specific)
    RS2_CAMERA_INFO_DEBUG_OP_CODE,
    //< If device supports firmware logging,// this is the command to send to get logs from firmware
    RS2_CAMERA_INFO_ADVANCED_MODE,
    //< True iff the device is in advanced mode
    RS2_CAMERA_INFO_PRODUCT_ID,
    //< Product ID as reported in the USB descriptor
    RS2_CAMERA_INFO_CAMERA_LOCKED,//< True iff EEPROM is locked
    RS2_CAMERA_INFO_USB_TYPE_DESCRIPTOR,
    //< Designated USB specification: USB2/USB3
    RS2_CAMERA_INFO_PRODUCT_LINE,
    //< Device product line D400/SR300/L500/T200
    RS2_CAMERA_INFO_ASIC_SERIAL_NUMBER,//< ASIC serial number
    RS2_CAMERA_INFO_FIRMWARE_UPDATE_ID,//< Firmware update ID
    RS2_CAMERA_INFO_IP_ADDRESS,//< IP address for remote camera.
    RS2_CAMERA_INFO_COUNT
    //<  Number of enumeration values. Not a valid input: intended to be used in for-loops.
    );
  {

  brief Streams are different types of data provided by RealSense devices./

    RS2_STREAM_ANY,
    RS2_STREAM_DEPTH                            , /**< Native stream of depth data produced by RealSense device */
    RS2_STREAM_COLOR                            , /**< Native stream of color data captured by RealSense device */
    RS2_STREAM_INFRARED                         , /**< Native stream of infrared data captured by RealSense device */
    RS2_STREAM_FISHEYE                          , /**< Native stream of fish-eye (wide) data captured from the dedicate motion camera */
    RS2_STREAM_GYRO                             , /**< Native stream of gyroscope motion data produced by RealSense device */
    RS2_STREAM_ACCEL                            , /**< Native stream of accelerometer motion data produced by RealSense device */
    RS2_STREAM_GPIO                             , /**< Signals from external device connected through GPIO */
    RS2_STREAM_POSE                             , /**< 6 Degrees of Freedom pose data, calculated by RealSense device */
    RS2_STREAM_CONFIDENCE                       , /**< 4 bit per-pixel depth confidence level */
    RS2_STREAM_COUNT

  }
type
  rs2_stream = (
    RS2_STREAM_ANY,
    RS2_STREAM_DEPTH,
    //< Native stream of depth data produced by RealSense device */
    RS2_STREAM_COLOR,
    //< Native stream of color data captured by RealSense device */
    RS2_STREAM_INFRARED,
    //< Native stream of infrared data captured by RealSense device */
    RS2_STREAM_FISHEYE,
    //< Native stream of fish-eye (wide) data captured from the dedicate motion camera */
    RS2_STREAM_GYRO,
    //< Native stream of gyroscope motion data produced by RealSense device */
    RS2_STREAM_ACCEL,
    //< Native stream of accelerometer motion data produced by RealSense device */
    RS2_STREAM_GPIO,
    //< Signals from external device connected through GPIO */
    RS2_STREAM_POSE,
    //< 6 Degrees of Freedom pose data, calculated by RealSense device */
    RS2_STREAM_CONFIDENCE,
    //< 4 bit per-pixel depth confidence level */
    RS2_STREAM_COUNT
    );

{
brief A stream's format identifies how binary data is encoded within a frame. */
typedef enum rs2_format

    RS2_FORMAT_ANY             , //< When passed to enable stream, librealsense will try to provide best suited format */
    RS2_FORMAT_Z16             , //< 16-bit linear depth values. The depth is meters is equal to depth scale * pixel value. */
    RS2_FORMAT_DISPARITY16     , //< 16-bit float-point disparity values. Depth->Disparity conversion : Disparity = Baseline*FocalLength/Depth. */
    RS2_FORMAT_XYZ32F          , //< 32-bit floating point 3D coordinates. */
    RS2_FORMAT_YUYV            , //< 32-bit y0, u, y1, v data for every two pixels. Similar to YUV422 but packed in a different order - https://en.wikipedia.org/wiki/YUV */
    RS2_FORMAT_RGB8            , //< 8-bit red, green and blue channels */
    RS2_FORMAT_BGR8            , //< 8-bit blue, green, and red channels -- suitable for OpenCV */
    RS2_FORMAT_RGBA8           , //< 8-bit red, green and blue channels + constant alpha channel equal to FF */
    RS2_FORMAT_BGRA8           , //< 8-bit blue, green, and red channels + constant alpha channel equal to FF */
    RS2_FORMAT_Y8              , //< 8-bit per-pixel grayscale image */
    RS2_FORMAT_Y16             , //< 16-bit per-pixel grayscale image */
    RS2_FORMAT_RAW10           , //< Four 10 bits per pixel luminance values packed into a 5-byte macropixel */
    RS2_FORMAT_RAW16           , //< 16-bit raw image */
    RS2_FORMAT_RAW8            , //< 8-bit raw image */
    RS2_FORMAT_UYVY            , //< Similar to the standard YUYV pixel format, but packed in a different order */
    RS2_FORMAT_MOTION_RAW      , //< Raw data from the motion sensor */
    RS2_FORMAT_MOTION_XYZ32F   , //< Motion data packed as 3 32-bit float values, for X, Y, and Z axis */
    RS2_FORMAT_GPIO_RAW        , //< Raw data from the external sensors hooked to one of the GPIO's */
    RS2_FORMAT_6DOF            , //< Pose data packed as floats array, containing translation vector, rotation quaternion and prediction velocities and accelerations vectors */
    RS2_FORMAT_DISPARITY32     , //< 32-bit float-point disparity values. Depth->Disparity conversion : Disparity = Baseline*FocalLength/Depth */
    RS2_FORMAT_Y10BPACK        , //< 16-bit per-pixel grayscale image unpacked from 10 bits per pixel packed ([8:8:8:8:2222]) grey-scale image. The data is unpacked to LSB and padded with 6 zero bits */
    RS2_FORMAT_DISTANCE        , //< 32-bit float-point depth distance value.  */
    RS2_FORMAT_MJPEG           , //< Bitstream encoding for video in which an image of each frame is encoded as JPEG-DIB   */
    RS2_FORMAT_Y8I             , //< 8-bit per pixel interleaved. 8-bit left, 8-bit right.  */
    RS2_FORMAT_Y12I            , //< 12-bit per pixel interleaved. 12-bit left, 12-bit right. Each pixel is stored in a 24-bit word in little-endian order. */
    RS2_FORMAT_INZI            , //< multi-planar Depth 16bit + IR 10bit.  */
    RS2_FORMAT_INVI            , //< 8-bit IR stream.  */
    RS2_FORMAT_W10             , //< Grey-scale image as a bit-packed array. 4 pixel data stream taking 5 bytes */
    RS2_FORMAT_Z16H            , //< Variable-length Huffman-compressed 16-bit depth values. */
    RS2_FORMAT_FG              , //< 16-bit per-pixel frame grabber format. */
    RS2_FORMAT_Y411            , //< 12-bit per-pixel. */
    RS2_FORMAT_COUNT             //< Number of enumeration values. Not a valid input: intended to be used in for-loops. */
}


type
  rs2_format = (
    RS2_FORMAT_ANY,
    //< When passed to enable stream, librealsense will try to provide best suited format */
    RS2_FORMAT_Z16,
    //< 16-bit linear depth values. The depth is meters is equal to depth scale * pixel value. */
    RS2_FORMAT_DISPARITY16,
    //< 16-bit float-point disparity values. Depth->Disparity conversion : Disparity = Baseline*FocalLength/Depth. */
    RS2_FORMAT_XYZ32F, //< 32-bit floating point 3D coordinates. */
    RS2_FORMAT_YUYV,
    //< 32-bit y0, u, y1, v data for every two pixels. Similar to YUV422 but packed in a different order - https://en.wikipedia.org/wiki/YUV */
    RS2_FORMAT_RGB8, //< 8-bit red, green and blue channels */
    RS2_FORMAT_BGR8,
    //< 8-bit blue, green, and red channels -- suitable for OpenCV */
    RS2_FORMAT_RGBA8,
    //< 8-bit red, green and blue channels + constant alpha channel equal to FF */
    RS2_FORMAT_BGRA8,
    //< 8-bit blue, green, and red channels + constant alpha channel equal to FF */
    RS2_FORMAT_Y8, //< 8-bit per-pixel grayscale image */
    RS2_FORMAT_Y16, //< 16-bit per-pixel grayscale image */
    RS2_FORMAT_RAW10,
    //< Four 10 bits per pixel luminance values packed into a 5-byte macropixel */
    RS2_FORMAT_RAW16, //< 16-bit raw image */
    RS2_FORMAT_RAW8, //< 8-bit raw image */
    RS2_FORMAT_UYVY,
    //< Similar to the standard YUYV pixel format, but packed in a different order */
    RS2_FORMAT_MOTION_RAW, //< Raw data from the motion sensor */
    RS2_FORMAT_MOTION_XYZ32F,
    //< Motion data packed as 3 32-bit float values, for X, Y, and Z axis */
    RS2_FORMAT_GPIO_RAW,
    //< Raw data from the external sensors hooked to one of the GPIO's */
    RS2_FORMAT_6DOF,
    //< Pose data packed as floats array, containing translation vector, rotation quaternion and prediction velocities and accelerations vectors */
    RS2_FORMAT_DISPARITY32,
    //< 32-bit float-point disparity values. Depth->Disparity conversion : Disparity = Baseline*FocalLength/Depth */
    RS2_FORMAT_Y10BPACK,
    //< 16-bit per-pixel grayscale image unpacked from 10 bits per pixel packed ([8:8:8:8:2222]) grey-scale image. The data is unpacked to LSB and padded with 6 zero bits */
    RS2_FORMAT_DISTANCE, //< 32-bit float-point depth distance value.  */
    RS2_FORMAT_MJPEG,
    //< Bitstream encoding for video in which an image of each frame is encoded as JPEG-DIB   */
    RS2_FORMAT_Y8I,
    //< 8-bit per pixel interleaved. 8-bit left, 8-bit right.  */
    RS2_FORMAT_Y12I,
    //< 12-bit per pixel interleaved. 12-bit left, 12-bit right. Each pixel is stored in a 24-bit word in little-endian order. */
    RS2_FORMAT_INZI, //< multi-planar Depth 16bit + IR 10bit.  */
    RS2_FORMAT_INVI, //< 8-bit IR stream.  */
    RS2_FORMAT_W10,
    //< Grey-scale image as a bit-packed array. 4 pixel data stream taking 5 bytes */
    RS2_FORMAT_Z16H,
    //< Variable-length Huffman-compressed 16-bit depth values. */
    RS2_FORMAT_FG, //< 16-bit per-pixel frame grabber format. */
    RS2_FORMAT_Y411, //< 12-bit per-pixel. */
    RS2_FORMAT_COUNT
    //< Number of enumeration values. Not a valid input: intended to be used in for-loops. */

    );

function rs2_stream_to_string(stream: rs2_stream): PChar; cdecl; external REALSENSE_DLL;

function rs2_format_to_string(format: rs2_format): PChar; cdecl; external REALSENSE_DLL;

implementation

end.
