{
 Exposes RealSense sensor functionality
}
unit rs_sensor;

{$mode ObjFPC}{$H+}

interface

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


implementation

end.
