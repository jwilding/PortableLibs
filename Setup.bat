@ECHO OFF

CALL :CHECK_CONSOLE "%~0" %1
TITLE Libs Prompt
MODE CON: COLS=116 LINES=1000

SET "PATH_APPEND=CALL "%~dp0Setup\Path.bat" APPEND"
SET "PATH_PREPEND=CALL "%~dp0Setup\Path.bat" PREPEND"
SET "PATH_SET=CALL "%~dp0Setup\Path.bat" SET"
SET "PATH_PRINT=CALL "%~dp0Setup\Path.bat" PRINT"


IF "%LIBS_VERBOSE%"=="1" (
	CALL :MENUHEAD PATH
	%PATH_PRINT%
	ECHO.
)

%PATH_APPEND% "%~dp0\Tools" "%~dp0\Phonegap"

FOR /F "delims=" %%X IN ('DIR %~dp0 /A:D /B') DO ( CALL :SETUP "%%~X" )

SET "PATH_APPEND="
SET "PATH_PREPEND="
SET "PATH_SET="
SET "PATH_PRINT="

GOTO :EOF

:: ---------------------------------


:MENUHEAD
ECHO.------------------------------------------------------------------------
ECHO. %*
ECHO.------------------------------------------------------------------------
GOTO :EOF


:SETUP
IF EXIST "%~dp0%~1\Init.bat" (
	CALL :MENUHEAD %~1
	CALL %~dp0%1\Init.bat
	IF "%LIBS_VERBOSE%"=="1" ( ECHO. )
	GOTO :EOF
)
GOTO :EOF


:CHECK_CONSOLE
IF "%MAXIMIZED%" == "1" GOTO :EOF

ECHO %CMDCMDLINE% | FINDSTR /IRC:"cmd.*/C." >NUL 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO :EOF

SET MAXIMIZED=1

ECHO %CMDCMDLINE% | FINDSTR /IC:%1 >NUL 2>&1
IF %ERRORLEVEL% == 0 (
	START "" /MAX %CMDCMDLINE:/C=/K%
) ELSE (
	START "" /MAX %CMDCMDLINE%
)
EXIT
GOTO :EOF


:: ---------------------------------
