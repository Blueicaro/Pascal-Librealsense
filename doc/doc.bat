@Echo off

SETLOCAL

SET CDir=%~dp0%
SET PasDoc=d:\Lazarus\pasdoc\bin\
SET Src=D:\github\LibreSensePascal\src
CALL "%PasDoc%pasdoc.exe" "--use-tipue-search" "%Src%\rs_types.pas" "%Src%\rs_context.pas" "%Src%\rs.pas" "%Src%\rs_device.pas" "%Src%\rs_sensor.pas" || PAUSE