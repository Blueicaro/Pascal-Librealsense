unit rs;

{$mode ObjFPC}{$H+}

interface

uses rs_types, SysUtils;
{typedef double      rs2_time_t;     /**< Timestamp format. units are milliseconds */
typedef long long   rs2_metadata_type; /**< Metadata attribute type is defined as 64 bit signed integer*/}

const

  RS2_API_MAJOR_VERSION = 2;
  RS2_API_MINOR_VERSION = 51;
  RS2_API_PATCH_VERSION = 1;
  RS2_API_BUILD_VERSION = 4348;
  RS2_API_VERSION = (((RS2_API_MAJOR_VERSION) * 10000) +
    ((RS2_API_MINOR_VERSION) * 100) + (RS2_API_PATCH_VERSION));



function RS2_API_VERSION_STR: string;
function RS2_API_FULL_VERSION_STR: string;

//int rs2_get_api_version(rs2_error** error);
//function rs2_get_api_version(error: prs2_error): integer; cdecl; external REALSENSE_DLL;

implementation

function RS2_API_VERSION_STR: string;
begin
  Result := Format('%d.%d.%d', [RS2_API_MAJOR_VERSION, RS2_API_MINOR_VERSION,
    RS2_API_PATCH_VERSION]);
end;

function RS2_API_FULL_VERSION_STR: string;
begin
  Result := Format('%d.%d.%d.%d',  [RS2_API_MAJOR_VERSION, RS2_API_MINOR_VERSION,
    RS2_API_PATCH_VERSION,RS2_API_BUILD_VERSION]);
end;

end.
