MsgBox( "Сейчас будут скопированы файлы, дождитесь сообщения о завершении!!!")
Const OverwriteExisting = True
Const FOF_CREATEPROGRESSDLG = &H10&
Dim objFSO, strDirectory, datetime
datetime = Date & "_" & Hour(Now) & "_" & Minute(Now) & "_" & Second(Now)
' путь к новой папке куда сольются показаниям на сервере (es-askue5) с клиента 
strDirectory = "Z:\Db_" & datetime 
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.CreateFolder(strDirectory)
Set objShell = CreateObject("shell.application")
Set objFolder = objShell.NameSpace(strDirectory)
' путь к папке Db на клиенте (создан при помощи команды subst)
If objFSO.FileExists("S:\Account.X09") and objFSO.FileExists("S:\Account.X07") Then 
objFSO.DeleteFile "S:\*.*07"
objFSO.MoveFile "S:\Account.X09", "S:\Account.X07"
objFSO.MoveFile "S:\Account.Y09", "S:\Account.Y07"
End If 
objFolder.CopyHere "S:\*.*", 16
MsgBox( "Файлы скопированы!!!")