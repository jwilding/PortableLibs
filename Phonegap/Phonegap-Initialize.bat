@ECHO ON
::CALL npm cache clean
::CALL npm cache clean
CALL npm install
CALL XCOPY "%~dp0node_modules\.bin\*.cmd" ".\" /S /Y
CALL "%~dp0overrides\override.bat"
PAUSE