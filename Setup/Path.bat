@ECHO OFF

CALL :%*
GOTO :EOF

:: ---------------------------------

:APPEND
FOR %%A IN (%*) DO CALL :_ADDPATHCHECK %%~A _APPEND
GOTO :EOF

:PREPEND
FOR %%A IN (%*) DO CALL :_ADDPATHCHECK %%~A _PREPEND
GOTO :EOF

:SET
IF "%LIBS_VERBOSE%"=="1" ( ECHO. )
FOR %%A IN (%*) DO CALL :_SET %%A
GOTO :EOF

:PRINT
FOR %%A IN ("%PATH:;=";"%") DO ECHO.  %%~A
GOTO :EOF

:: ---------------------------------

:_ADDPATHCHECK
FOR %%A IN ("%PATH:;=";"%") DO (
	IF /I "%%~A"=="%~1" (
		ECHO x %~1
		GOTO :EOF
	)
)
IF "%LIBS_VERBOSE%"=="1" (
	ECHO + %~1
	IF NOT EXIST "%~1" ECHO.    [WARNING] The path does not exist!
)
CALL :%2 "%~1"
GOTO :EOF

:_APPEND
SET PATH=%PATH%;%~1
GOTO :EOF

:_PREPEND
SET PATH=%~1;%PATH%
GOTO :EOF

:_SET
IF "%LIBS_VERBOSE%"=="1" ( ECHO = %~1 )
SET %1
GOTO :EOF

:: ---------------------------------
