; run-emacs.ahk — portable launcher for Varhammer
SetWorkingDir %A_ScriptDir%
EnvSet, PATH, %A_ScriptDir%\sbcl\bin;%PATH%
EnvSet, HOME, %A_ScriptDir%
EnvSet, USER_EMACS_DIRECTORY, %A_ScriptDir%\.emacs.d
Run, "%A_ScriptDir%\emacs\bin\runemacs.exe" -q --load "%A_ScriptDir%\.emacs.d\init.el"
ExitApp