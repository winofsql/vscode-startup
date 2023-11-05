Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
Dim path
path = WshShell.CurrentDirectory
Dim fname
Dim work
dim text
work = Split(path, "\")
fname = work(Ubound(work))

Set lightbox = fso.OpenTextFile("\xampp\apache\conf\extra\httpd-lightbox.conf", 2, True)

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/httpd-lightbox.conf"  & "?dummy=" & Timer, False )
objSrvHTTP.Send
text = objSrvHTTP.responseText
text = Replace(text, "/lightbox", "/" & fname )
text = Replace(text, "CURPATH", path )

lightbox.Write(text)
lightbox.close

Set lightbox = fso.OpenTextFile("\xampp\apache\conf\httpd.conf", 1)
text = lightbox.ReadAll
text = Replace(text, vbCrLf, vbLf)
text = Replace(text, "Include ""conf/extra/httpd-lightbox.conf""" & vbLf ,"")
text = Replace(text, "Include ""conf/extra/httpd-xampp.conf""" & vbLf ,"Include ""conf/extra/httpd-xampp.conf""" & vbLf & "Include ""conf/extra/httpd-lightbox.conf""" & vbCrLf )
lightbox.close

Set lightbox = fso.OpenTextFile("\xampp\apache\conf\httpd.conf", 2, True)
lightbox.Write(text)
lightbox.close
