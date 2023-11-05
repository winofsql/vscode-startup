Dim java : java_sdk = "c:\java"

Set objShellApplication = CreateObject("Shell.Application")
If WScript.Arguments.Count = 0 Then
    objShellApplication.ShellExecute "cscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " dummy", "", "runas", 1
	Wscript.Quit
End If

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

objShell.Environment("System").Item("JAVA_HOME") = java_sdk
objShell.RegWrite "HKLM\SOFTWARE\JavaSoft\Java Development Kit\JavaHome", java_sdk, "REG_SZ"

target1 = "c:\app"
target2 = "c:\app\workspace"

If not objFSO.FolderExists(target1) Then

	objFSO.CreateFolder(target1)

End If
If not objFSO.FolderExists(target2) Then

	objFSO.CreateFolder(target2)

End If
