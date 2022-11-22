unit rs_context;

{$mode ObjFPC}{$H+}

interface

uses rs_types;

type
  rs2_context = integer;
  prs2_context = ^rs2_context;

{
/**
* \brief Creates RealSense context that is required for the rest of the API.
* \param[in] api_version Users are expected to pass their version of \c RS2_API_VERSION to make sure they are running the correct librealsense version.
* \param[out] error  If non-null, receives any error that occurs during this call, otherwise, errors are ignored.
* \return            Context object
*/
}
function rs2_create_context(api_version: integer; aerror: Pointer): prs2_context;
  cdecl; external REALSENSE_DLL;

{/**
* \brief Frees the relevant context object.
* \param[in] context Object that is no longer needed
*/
 }
procedure rs2_delete_context(context: prs2_context); cdecl; external REALSENSE_DLL;


implementation

end.
