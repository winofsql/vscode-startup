Crun()

MsgBox("�������J�n���܂��B���s��A���b�Z�[�W�{�b�N�X���\�������܂ł��΂炭���҂����������B")

Set fso = Wscript.CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
path_base = WshShell.ExpandEnvironmentStrings("%APPDATA%") & "\Code\User"
Set f = fso.GetFolder(path_base)
Set fc = f.SubFolders
on error resume next
fc.Add("script")
fc.Add("bat")
on error goto 0
path = path_base & "\script"
path_bat = path_base & "\bat"

Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")

Call lightbox_download( path, "build-dir.vbs",                    "https://github.com/winofsql/vscode-template/raw/main/script/build-dir.vbs" )
Call lightbox_download( path, "download.vbs",                     "https://github.com/winofsql/vscode-template/raw/main/script/download.vbs" )
Call lightbox_download( path, "sworc-settings-download.vbs",      "https://github.com/winofsql/vscode-template/raw/main/script/sworc-settings-download.vbs" )
Call lightbox_download( path, "workspace-build-download.vbs",     "https://github.com/winofsql/vscode-template/raw/main/script/workspace-build-download.vbs" )
Call lightbox_download( path, "build-xampp-alias.vbs",            "https://github.com/winofsql/vscode-template/raw/main/script/build-xampp-alias.vbs" )
Call lightbox_download( path, "start-localhost.vbs",              "https://github.com/winofsql/vscode-template/raw/main/script/start-localhost.vbs" )
Call lightbox_download( path, "folder-vscode-settings-setup.vbs", "https://github.com/winofsql/vscode-template/raw/main/folder-vscode-settings-setup.vbs" )
Call lightbox_download( path, "build-tomcat-path.vbs",            "https://github.com/winofsql/vscode-template/raw/main/script/build-tomcat-path.vbs" )
Call lightbox_download( path, "git-clone.vbs",                    "https://github.com/winofsql/vscode-template/raw/main/script/git-clone.vbs" )
Call lightbox_download( path, "gitd.vbs",                         "https://github.com/winofsql/vscode-template/raw/main/script/gitd.vbs" )
Call lightbox_download( path, "php-folder.vbs",                   "https://github.com/winofsql/vscode-template/raw/main/script/php-folder.vbs" )
Call lightbox_download( path, "xampp-settings.vbs",               "https://github.com/winofsql/vscode-template/raw/main/script/xampp-settings.vbs" )
Call lightbox_download( path, "java-settings.vbs",                "https://github.com/winofsql/vscode-template/raw/main/script/java-settings.vbs" )

Call lightbox_download( path, "start-root-localhost.vbs",         "https://github.com/winofsql/vscode-template/raw/main/script/start-root-localhost.vbs" )
Call lightbox_download( path, "setup-vscode-user.vbs",            "https://github.com/winofsql/subject-2022/raw/main/zz-workspace/download/setup-vscode-user.vbs" )

Call lightbox_download( path_bat, "cs-startup.bat", "https://github.com/winofsql/vscode-template/raw/main/bat/cs-startup.bat" )
Call lightbox_download( path_bat, "cs-subject2.bat", "https://github.com/winofsql/vscode-template/raw/main/bat/cs-subject2.bat" )
Call lightbox_download( path_bat, "cs-subject3.bat", "https://github.com/winofsql/vscode-template/raw/main/bat/cs-subject3.bat" )
Call lightbox_download( path_bat, "settings.bat", "https://github.com/winofsql/vscode-template/raw/main/bat/settings.bat" )

ActionPath = "C:\Users\%USERNAME%\AppData\Roaming\Code\User\bat\settings.bat"
Call WshShell.Run(ActionPath, 0, True)
Wscript.Echo "���݂� settings.json ��ۑ����܂���"

Call lightbox_download( path_base, "settings.json", "https://github.com/winofsql/vscode-template/raw/main/settings.json" )
Wscript.Echo "�ŐV�� settings.json ���_�E�����[�h���܂���"

Wscript.Echo "keybindings.json �ƁA���[�U�X�j�y�b�g�ƁAmy.bat ���_�E�����[�h���Ă��܂�....."
ActionPath = "cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\sworc-settings-download.vbs"
Call WshShell.Run(ActionPath, 0, True)

MsgBox( "���[�U�ݒ�̃L�[�{�[�h�V���[�g�J�b�g�ƁA���[�U�ݒ�̃X�j�y�b�g�ƁAMySQL �R�}���h�v�����v�g���_�E�����[�h���܂���" )

Function lightbox_download( target_path, file_name, url )

    Call objSrvHTTP.Open("GET", url & "?dummy=" & Timer, False )
    objSrvHTTP.Send
    Stream.Open
    Stream.Type = 1
    Stream.Write objSrvHTTP.responseBody
    Stream.SaveToFile target_path & "\" & file_name, 2
    Stream.Close
    
    Wscript.Echo file_name & " ���_�E�����[�h���܂���"

End Function

' **********************************************************
' Cscript.exe �Ŏ��s������
' Cscript.exe �̎��s�I���� pause �ňꎞ��~
' **********************************************************
Function Crun( )

	Dim str,WshShell

	' ���s���� WSH �̃t���p�X
	str = WScript.FullName
	' �E����11�����擾
	str = Right( str, 11 )
	' �S�đ啶���ɕύX
	str = Ucase( str )
	' CSCRIPT.EXE �łȂ���Ώ������s��
	if str <> "CSCRIPT.EXE" then
		' ���s���̎������g(�X�N���v�g)�̃t���p�X���擾
		str = WScript.ScriptFullName

		Set WshShell = CreateObject( "WScript.Shell" )

		' ���s���̎������g(�X�N���v�g)�ւ̈����������p���ׂ̕�������쐬
		strParam = " "
		For I = 0 to Wscript.Arguments.Count - 1
			if instr(Wscript.Arguments(I), " ") < 1 then
				strParam = strParam & Wscript.Arguments(I) & " "
			else
				strParam = strParam & Dd(Wscript.Arguments(I)) & " "
			end if
		Next
		' cscript.exe �Ŏ��s���Ȃ����ׂ̃R�}���h���C�������s
		Call WshShell.Run( "cmd.exe /c cscript.exe " & Dd(str) & strParam, 1 )
		' ���s���̎������g(�X�N���v�g)���I��
		WScript.Quit
	end if

End Function
' **********************************************************
' ������� " �ň͂ފ֐�
' **********************************************************
Function Dd( strValue )

	Dd = """" & strValue & """"

End function
