#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
; #Warn  ; Enable warnings to assist with detecting common errors.

; Ctrl + Alt + R でスクリプトを再読み込み.
; Ctrl + Alt + E でスクリプトを編集.
^!R::Reload
^!E::Edit

; 今日の日付(YYYY/MM/DD形式)
::ds::
FormatTime,TimeString,,yyyy:MM:dd
Send,%TimeString%{Space}
Return

; 現在時刻(HH:MM形式)
::ns::
FormatTime,TimeString,,HH:mm
Send,%TimeString%{Space}
Return
