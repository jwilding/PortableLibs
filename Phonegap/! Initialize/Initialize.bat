@ECHO ON
PUSHD ".."
CALL npm install -g phonegap cordova-gen pgbuild
CALL "%~dp0overrides\override.bat"
POPD
PAUSE