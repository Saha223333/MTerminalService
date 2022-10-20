Const OverwriteExisting = True
Const FOF_CREATEPROGRESSDLG = &H10&
Set objShell = CreateObject("shell.application")
Set objFolder = objShell.NameSpace("")
objFolder.CopyHere "", 16
MsgBox( "Файлы скопированы!!!")