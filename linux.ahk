#SingleInstance Force
SetWorkingDir %A_ScriptDir%
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%" ;

Capslock::Esc
Esc::Capslock

#+c::WinClose, A
#+Enter::Run, wt
#^h::#^Left
#^l::#^Right
#x::#l
#+k::Send {Volume_Up}
#+j::Send {Volume_Down}
#+h::Send {Media_Prev}
#+l::Send {Media_Next}
#+i::Send {Media_Play_Pause}