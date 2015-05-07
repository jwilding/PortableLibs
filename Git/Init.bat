SET "LIBS_GIT=%~dp0PortableGit-1.9.5"

%PATH_APPEND% "%LIBS_GIT%\bin" "%LIBS_GIT%\mingw\bin" "%LIBS_GIT%\cmd"
%PATH_SET% "PLINK_PROTOCOL=ssh" "TERM=msys"