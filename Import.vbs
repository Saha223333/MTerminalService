MsgBox( "������ ����� ����������� �����, ��������� ��������� � ����������!!!")
Const OverwriteExisting = True
Const FOF_CREATEPROGRESSDLG = &H10&
Dim objFSO, strDirectory, datetime
datetime = Date & "_" & Hour(Now) & "_" & Minute(Now) & "_" & Second(Now)
' ���� � ����� ����� ���� �������� ���������� �� ������� (es-askue5) � ������� 
strDirectory = "Z:\Db_" & datetime 
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.CreateFolder(strDirectory)
Set objShell = CreateObject("shell.application")
Set objFolder = objShell.NameSpace(strDirectory)
' ���� � ����� Db �� ������� (������ ��� ������ ������� subst)
If objFSO.FileExists("S:\Account.X09") and objFSO.FileExists("S:\Account.X07") Then 
objFSO.DeleteFile "S:\*.*07"
objFSO.MoveFile "S:\Account.X09", "S:\Account.X07"
objFSO.MoveFile "S:\Account.Y09", "S:\Account.Y07"
End If 
objFolder.CopyHere "S:\*.*", 16
MsgBox( "����� �����������!!!")