@ECHO ON
PUSHD ".."
CALL npm cache clean
CALL npm cache clean
CALL npm install -g
CALL "%~dp0overrides\override.bat"
POPD
PAUSE