@Echo off

SETLOCAL

SET CDir=%~dp0%
SET PasDoc=d:\Lazarus\pasdoc\bin\
SET Src=D:\github\LibreSensePascal\src
CALL "%PasDoc%pasdoc.exe" "--use-tipue-search" "--title=Intel RealSense SDK 2.0" %Src%\*.pas