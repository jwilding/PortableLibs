@PUSHD "%~dp0..\.."
@CALL XCOPY "%~dp0node_modules\*" ".\node_modules\" /S /Y
@CALL NODE "%~dp0phonegap-fix.js"
@POPD