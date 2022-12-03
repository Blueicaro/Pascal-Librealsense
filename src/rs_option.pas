{
Exposes sensor options functionality
}
unit rs_option;

{$mode ObjFPC}{$H+}

interface

uses
  rs_types;

{
    Defines general configuration controls.
    These can generally be mapped to camera UVC controls, and can be set / queried at any time unless stated otherwise.
}
type
  Trs2_option = (
    RS2_OPTION_BACKLIGHT_COMPENSATION,
    //< Enable / disable color backlight compensation*/
    RS2_OPTION_BRIGHTNESS, //< Color image brightness*/
    RS2_OPTION_CONTRAST, //< Color image contrast*/
    RS2_OPTION_EXPOSURE,
    //< Controls exposure time of color camera. Setting any value will disable auto exposure*/
    RS2_OPTION_GAIN, //< Color image gain*/
    RS2_OPTION_GAMMA, //< Color image gamma setting*/
    RS2_OPTION_HUE, //< Color image hue*/
    RS2_OPTION_SATURATION, //< Color image saturation setting*/
    RS2_OPTION_SHARPNESS, //< Color image sharpness setting*/
    RS2_OPTION_WHITE_BALANCE,
    //< Controls white balance of color image. Setting any value will disable auto white balance*/
    RS2_OPTION_ENABLE_AUTO_EXPOSURE, //< Enable / disable color image auto-exposure*/
    RS2_OPTION_ENABLE_AUTO_WHITE_BALANCE,
    //< Enable / disable color image auto-white-balance*/
    RS2_OPTION_VISUAL_PRESET,
    //< Provide access to several recommend sets of option presets for the depth camera */
    RS2_OPTION_LASER_POWER,
    //< Power of the laser emitter, with 0 meaning projector off*/
    RS2_OPTION_ACCURACY,
    //< Set the number of patterns projected per frame. The higher the accuracy value the more patterns projected. Increasing the number of patterns help to achieve better accuracy. Note that this control is affecting the Depth FPS */
    RS2_OPTION_MOTION_RANGE,
    //< Motion vs. Range trade-off, with lower values allowing for better motion sensitivity and higher values allowing for better depth range*/
    RS2_OPTION_FILTER_OPTION,
    //< Set the filter to apply to each depth frame. Each one of the filter is optimized per the application requirements*/
    RS2_OPTION_CONFIDENCE_THRESHOLD,
    //< The confidence level threshold used by the Depth algorithm pipe to set whether a pixel will get a valid range or will be marked with invalid range*/
    RS2_OPTION_EMITTER_ENABLED,
    //< Emitter select: 0 – disable all emitters. 1 – enable laser. 2 – enable auto laser. 3 – enable LED.*/
    RS2_OPTION_FRAMES_QUEUE_SIZE,
    //< Number of frames the user is allowed to keep per stream. Trying to hold-on to more frames will cause frame-drops.*/
    RS2_OPTION_TOTAL_FRAME_DROPS,
    //< Total number of detected frame drops from all streams */
    RS2_OPTION_AUTO_EXPOSURE_MODE,
    //< Auto-Exposure modes: Static, Anti-Flicker and Hybrid */
    RS2_OPTION_POWER_LINE_FREQUENCY,
    //< Power Line Frequency control for anti-flickering Off/50Hz/60Hz/Auto */
    RS2_OPTION_ASIC_TEMPERATURE, //< Current Asic Temperature */
    RS2_OPTION_ERROR_POLLING_ENABLED, //< disable error handling */
    RS2_OPTION_PROJECTOR_TEMPERATURE, //< Current Projector Temperature */
    RS2_OPTION_OUTPUT_TRIGGER_ENABLED,
    //< Enable / disable trigger to be outputed from the camera to any external device on every depth frame */
    RS2_OPTION_MOTION_MODULE_TEMPERATURE, //< Current Motion-Module Temperature */
    RS2_OPTION_DEPTH_UNITS,
    //< Number of meters represented by a single depth unit */
    RS2_OPTION_ENABLE_MOTION_CORRECTION,
    //< Enable/Disable automatic correction of the motion data */
    RS2_OPTION_AUTO_EXPOSURE_PRIORITY,
    //< Allows sensor to dynamically ajust the frame rate depending on lighting conditions */
    RS2_OPTION_COLOR_SCHEME, //< Color scheme for data visualization */
    RS2_OPTION_HISTOGRAM_EQUALIZATION_ENABLED,
    //< Perform histogram equalization post-processing on the depth data */
    RS2_OPTION_MIN_DISTANCE, //< Minimal distance to the target */
    RS2_OPTION_MAX_DISTANCE, //< Maximum distance to the target */
    RS2_OPTION_TEXTURE_SOURCE, //< Texture mapping stream unique ID */
    RS2_OPTION_FILTER_MAGNITUDE,
    //< The 2D-filter effect. The specific interpretation is given within the context of the filter */
    RS2_OPTION_FILTER_SMOOTH_ALPHA,
    //< 2D-filter parameter controls the weight/radius for smoothing.*/
    RS2_OPTION_FILTER_SMOOTH_DELTA, //< 2D-filter range/validity threshold*/
    RS2_OPTION_HOLES_FILL,
    //< Enhance depth data post-processing with holes filling where appropriate*/
    RS2_OPTION_STEREO_BASELINE,
    //< The distance in mm between the first and the second imagers in stereo-based depth cameras*/
    RS2_OPTION_AUTO_EXPOSURE_CONVERGE_STEP,
    //< Allows dynamically ajust the converge step value of the target exposure in Auto-Exposure algorithm*/
    RS2_OPTION_INTER_CAM_SYNC_MODE,
    //< Impose Inter-camera HW synchronization mode. Applicable for D400/L500/Rolling Shutter SKUs */
    RS2_OPTION_STREAM_FILTER, //< Select a stream to process */
    RS2_OPTION_STREAM_FORMAT_FILTER, //< Select a stream format to process */
    RS2_OPTION_STREAM_INDEX_FILTER, //< Select a stream index to process */
    RS2_OPTION_EMITTER_ON_OFF,
    //< When supported, this option make the camera to switch the emitter state every frame. 0 for disabled, 1 for enabled */
    RS2_OPTION_ZERO_ORDER_POINT_X, //< Deprecated!!! - Zero order point x*/
    RS2_OPTION_ZERO_ORDER_POINT_Y, //< Deprecated!!! - Zero order point y*/
    RS2_OPTION_LLD_TEMPERATURE, //< LDD temperature*/
    RS2_OPTION_MC_TEMPERATURE, //< MC temperature*/
    RS2_OPTION_MA_TEMPERATURE, //< MA temperature*/
    RS2_OPTION_HARDWARE_PRESET, //< Hardware stream configuration */
    RS2_OPTION_GLOBAL_TIME_ENABLED, //< disable global time  */
    RS2_OPTION_APD_TEMPERATURE, //< APD temperature*/
    RS2_OPTION_ENABLE_MAPPING, //< Enable an internal map */
    RS2_OPTION_ENABLE_RELOCALIZATION, //< Enable appearance based relocalization */
    RS2_OPTION_ENABLE_POSE_JUMPING, //< Enable position jumping */
    RS2_OPTION_ENABLE_DYNAMIC_CALIBRATION, //< Enable dynamic calibration */
    RS2_OPTION_DEPTH_OFFSET, //< Offset from sensor to depth origin in millimetrers*/
    RS2_OPTION_LED_POWER,
    //< Power of the LED (light emitting diode), with 0 meaning LED off*/
    RS2_OPTION_ZERO_ORDER_ENABLED, //< DEPRECATED! - Toggle Zero-Order mode */
    RS2_OPTION_ENABLE_MAP_PRESERVATION, //< Preserve previous map when starting */
    RS2_OPTION_FREEFALL_DETECTION_ENABLED,
    //< Enable/disable sensor shutdown when a free-fall is detected (on by default) */
    RS2_OPTION_AVALANCHE_PHOTO_DIODE,
    //< Changes the exposure time of Avalanche Photo Diode in the receiver */
    RS2_OPTION_POST_PROCESSING_SHARPENING,
    //< Changes the amount of sharpening in the post-processed image */
    RS2_OPTION_PRE_PROCESSING_SHARPENING,
    //< Changes the amount of sharpening in the pre-processed image */
    RS2_OPTION_NOISE_FILTERING, //< Control edges and background noise */
    RS2_OPTION_INVALIDATION_BYPASS, //< Enable\disable pixel invalidation */
    RS2_OPTION_AMBIENT_LIGHT,
    //< DEPRECATED! - Use RS2_OPTION_DIGITAL_GAIN instead. */
    RS2_OPTION_DIGITAL_GAIN = RS2_OPTION_AMBIENT_LIGHT,
    //< Change the depth digital gain see rs2_digital_gain for values */
    RS2_OPTION_SENSOR_MODE,
    //< The resolution mode: see rs2_sensor_mode for values */
    RS2_OPTION_EMITTER_ALWAYS_ON, //< Enable Laser On constantly (GS SKU Only) */
    RS2_OPTION_THERMAL_COMPENSATION,
    //< Depth Thermal Compensation for selected D400 SKUs */
    RS2_OPTION_TRIGGER_CAMERA_ACCURACY_HEALTH, //< DEPRECATED as of 2.46! */
    RS2_OPTION_RESET_CAMERA_ACCURACY_HEALTH, //< DEPRECATED as of 2.46! */
    RS2_OPTION_HOST_PERFORMANCE,
    //< Set host performance mode to optimize device settings so host can keep up with workload, for example, USB transaction granularity, setting option to low performance host leads to larger USB transaction size and reduced number of transactions which improves performance and stability if host is relatively weak as compared to workload */
    RS2_OPTION_HDR_ENABLED,  //< Enable / disable HDR */
    RS2_OPTION_SEQUENCE_NAME, //< HDR Sequence name */
    RS2_OPTION_SEQUENCE_SIZE, //< HDR Sequence size */
    RS2_OPTION_SEQUENCE_ID,
    //< HDR Sequence ID - 0 is not HDR; sequence ID for HDR configuration starts from 1 */
    RS2_OPTION_HUMIDITY_TEMPERATURE, //< Humidity temperature [Deg Celsius]*/
    RS2_OPTION_ENABLE_MAX_USABLE_RANGE,
    //< Turn on/off the maximum usable depth sensor range given the amount of ambient light in the scene */
    RS2_OPTION_ALTERNATE_IR,
    //< Turn on/off the alternate IR, When enabling alternate IR, the IR image is holding the amplitude of the depth correlation. */
    RS2_OPTION_NOISE_ESTIMATION,
    //< Noise estimation - indicates the noise on the IR image */
    RS2_OPTION_ENABLE_IR_REFLECTIVITY,
    //< Enables data collection for calculating IR pixel reflectivity  */
    RS2_OPTION_AUTO_EXPOSURE_LIMIT,
    //< Set and get auto exposure limit in microseconds. If the requested exposure limit is greater than frame time, it will be set to frame time at runtime. Setting will not take effect until next streaming session. */
    RS2_OPTION_AUTO_GAIN_LIMIT,
    //< Set and get auto gain limits ranging from 16 to 248. If the requested gain limit is less than 16, it will be set to 16. If the requested gain limit is greater than 248, it will be set to 248. Setting will not take effect until next streaming session. */
    RS2_OPTION_AUTO_RX_SENSITIVITY,
    //< Enable receiver sensitivity according to ambient light, bounded by the Receiver Gain control. */
    RS2_OPTION_TRANSMITTER_FREQUENCY,
    //<changes the transmitter frequencies increasing effective range over sharpness. */
    RS2_OPTION_VERTICAL_BINNING,
    //< Enables vertical binning which increases the maximal sensed distance. */
    RS2_OPTION_RECEIVER_SENSITIVITY,
    //< Control receiver sensitivity to incoming light, both projected and ambient (same as APD on L515). */
    RS2_OPTION_AUTO_EXPOSURE_LIMIT_TOGGLE,
    //< Enable / disable color image auto-exposure*/
    RS2_OPTION_AUTO_GAIN_LIMIT_TOGGLE, //< Enable / disable color image auto-gain*/
    RS2_OPTION_COUNT
    //< Number of enumeration values. Not a valid input: intended to be used in for-loops. */

    );

implementation

end.
