<!-- #include file="../../inc/conn.asp" -->
<%
list_pagesize=17
Sub DBConnEnd()
	On Error Resume Next
	'oRs.Close
	'Set oRs = Nothing
	Cn.Close
	Set Cn = Nothing
End Sub


Sub GoError(str)
	Call DBConnEnd()
	Response.Write "<script language=javascript>alert('" & str & "\n\n������һҳ...');history.back();</script>"
	Response.End
End Sub

Function GetSafeStr(str)
	GetSafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function

Function outHTML(str)
	Dim sTemp
	sTemp = str
	outHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	sTemp = Replace(sTemp, Chr(10), "<br>")
	outHTML = sTemp
End Function

Function inHTML(str)
	Dim sTemp
	sTemp = str
	inHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	inHTML = sTemp
End Function

Function InitSelect(s_FieldName, a_Name, a_Value, v_InitValue, s_Sql, s_AllName)
	Dim i
	InitSelect = "<select name='" & s_FieldName & "' size=1>"
	If s_AllName <> "" Then
		InitSelect = InitSelect & "<option value=''>" & s_AllName & "</option>"
	End If
	If s_Sql <> "" Then
		oRs.Open s_Sql, Cn, 0, 1
		Do While Not oRs.Eof
			InitSelect = InitSelect & "<option value=""" & inHTML(oRs(1)) & """"
			If oRs(1) = v_InitValue Then
				InitSelect = InitSelect & " selected"
			End If
			InitSelect = InitSelect & ">" & outHTML(oRs(0)) & "</option>"
			oRs.MoveNext
		Loop
		oRs.Close
	Else
		For i = 0 To UBound(a_Name)
			InitSelect = InitSelect & "<option value=""" & inHTML(a_Value(i)) & """"
			If a_Value(i) = v_InitValue Then
				InitSelect = InitSelect & " selected"
			End If
			InitSelect = InitSelect & ">" & outHTML(a_Name(i)) & "</option>"
		Next
	End If
	InitSelect = InitSelect & "</select>"
End Function

Function md5en(enstr)
	Dim s1,s2,s3
	s1=md5(Mid(enstr,1,1),16)
	s1=Left(s1,2)
	s2=Mid(enstr,2)
	s3=s1 & s2e
	md5en=md5(s3,16)
End Function



Sub Header()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<STYLE type=text/css>
BODY {
	MARGIN: 0px;  
	FONT-SIZE: 12px;	
	background-color: #F9F9F9;
	font-family: "Microsoft Yahei",Verdana, Arial,Vrinda,Tahoma;
	SCROLLBAR-FACE-COLOR: #8cd6ef; 
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; 
	SCROLLBAR-SHADOW-COLOR: #f5f5f5 ; 
	SCROLLBAR-3DLIGHT-COLOR: #ffffff;
	SCROLLBAR-ARROW-COLOR:#006c90; 
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff; }
	
TD {
	FONT-SIZE: 12px;
	font-family: "Microsoft Yahei",Verdana, Arial,Vrinda,Tahoma;
}
p{
	font-family: "Microsoft Yahei",Verdana, Arial,Vrinda,Tahoma;
	}
INPUT {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px
}
TEXTAREA {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px
}
SELECT {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px
}
SPAN {
	FONT-SIZE: 12px; POSITION: static
}
A {
	COLOR: #000000; TEXT-DECORATION: underline
}
A:hover {
	COLOR: #173857; TEXT-DECORATION: none
}
A.highlight {
	COLOR: red; TEXT-DECORATION: none
}
A.highlight:hover {
	COLOR: red
}
A.thisclass {
	FONT-WEIGHT: bold; TEXT-DECORATION: none
}
A.thisclass:hover {
	FONT-WEIGHT: bold
}
A.navlink {
	COLOR: #000000; TEXT-DECORATION: none
}
A.navlink:hover {
	COLOR: #003399; TEXT-DECORATION: none
}
.twidth {
	WIDTH: 760px
}
.content {
	FONT-SIZE: 14px; MARGIN: 5px 20px; LINE-HEIGHT: 140%;  
}
.aTitle {
	FONT-WEIGHT: bold; FONT-SIZE: 15px
}
TD.forumHeaderBackgroundAlternate {
	BACKGROUND-IMAGE: url(images/admin_top_bg.gif); COLOR: #000000; BACKGROUND-COLOR: #799ae1
}
#TableTitleLink A:link {
	COLOR: #ffffff; TEXT-DECORATION: none
}
#TableTitleLink A:visited {
	COLOR: #ffffff; TEXT-DECORATION: none
}
#TableTitleLink A:active {
	COLOR: #ffffff; TEXT-DECORATION: none
}
#TableTitleLink A:hover {
	COLOR: #ffffff; TEXT-DECORATION: underline
}
TD.forumRow {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #F6F7F8; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}
TH {
	FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/content-bg2.jpg); COLOR: white; BACKGROUND-COLOR: #4455aa
}
TD.bodytitle {
	BACKGROUND-IMAGE: url(images/admin_bg_2.gif)
}
TD.bodytitle1 {
	BACKGROUND-IMAGE: url(images/admin_bg_3.gif)
}
TD.tablebody1 {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #bebbdb; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}
TD.forumRowHighLight {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #E7EBEF; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}

TD.TitleHighlight {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #35a2ee url("images/title_bg1.jpg") repeat left top; PADDING-BOTTOM: 3px; PADDING-TOP: 3px;color:#095363;
}
TD.TitleHighlight2 {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND:#669966; PADDING-BOTTOM: 3px; PADDING-TOP: 3px;color:#fFFFFFF;
}
TD.TitleHighlight3 {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND:#88ba88; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}
TD.TitleHighlight4 {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND:#bcd292; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}
.tableBorder {
	BORDER: #8ec12e 1px solid; WIDTH: 95%;BACKGROUND-COLOR: #ffffff;
}
.tableBorder .tableHeaderText{
	padding:0px;
	margin:0px;
	height:31px;
	color:#009900;
	line-height:25px;
	font-size:14px;
	}
.tableBorder1 {
	WIDTH: 98%
}
.helplink {
	FONT: 10px  ; CURSOR: help; TEXT-DECORATION: none
}
.copyright {
	PADDING-RIGHT: 1px; BORDER-TOP: #6595d6 1px dashed; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; FONT: 11px  f; COLOR: #4455aa; PADDING-TOP: 1px; TEXT-DECORATION: none
}
.menuskin {
	BORDER-RIGHT: #666666 1px solid; BORDER-TOP: #666666 1px solid; BACKGROUND-IMAGE: url(../skins/default/dvmenubg3.gif); VISIBILITY: hidden; FONT: 12px Verdana; BORDER-LEFT: #666666 1px solid; BORDER-BOTTOM: #666666 1px solid; BACKGROUND-REPEAT: repeat-y; POSITION: absolute; BACKGROUND-COLOR: #efefef
}
.menuskin A {
	PADDING-RIGHT: 10px; PADDING-LEFT: 25px; COLOR: black; TEXT-DECORATION: none
}
#mouseoverstyle {
	BORDER-RIGHT: #597db5 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #597db5 1px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 2px; BORDER-LEFT: #597db5 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: #597db5 1px solid; BACKGROUND-COLOR: #c9d5e7
}
#mouseoverstyle A {
	COLOR: black
}
.menuitems {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; MARGIN: 2px; WORD-BREAK: keep-all; PADDING-TOP: 1px
}
.TipWords{
	 padding:5px 10px;
	 color:#990000;
	 border:1px solid #E7EBEF;
	 font-family:arial;
	 font-height:180%;
	 }
.TipWords p{
	margin:0px;
	padding:3px 0px;}	 
.TipTitle{
	background-color:#E7EBEF;
	height:25px;
	font-weight:bold;
	color:#990000;}	 
.PostContent{
	width:600px;
	height:120px;
	overflow-y:scroll;}
.PostReply{
	width:600px;
	height:120px;
	overflow-y:scroll;}
#bodyL{
float:left;
width:84px;
margin-right:2px;
}
a.od{
width:80px;
height:25px;
line-height:25px;
text-align:center;
font-weight:bold;
border: 2px solid #849BCA; 
display:block;
color:#547BC9;
float:left;
text-decoration:none;
margin-top:2px;
}
.fd{ 
width:700px;
height:500px;
background:#EDF1F8; 
border: 2px solid #7391AB;
margin-top:100px;
margin-left:100px;
float:center;
overflow:hidden;
position:absolute;
left:0px;
top:0px;
cursor:move;
float:left;
/*filter:alpha(opacity=50);*/

}
.content_div1{
padding:5px;
}
.div_close{
padding:3px;
height:10px;
float:right;
background:#7391AB;
margin-bottom:5px;
}

.ttarea{
BORDER-BOTTOM:   0px   solid; 
  BORDER-LEFT:   0px   solid; 
    BORDER-RIGHT:   0px   solid; 
	 BORDER-TOP:   0px   solid;
	  overflow-y:auto;
	  line-height::150%;}

.copyrights{
	width:500px;
	text-align:center;
	padding:10px;
	margin:auto;
 	}	
.SystemInfo{
	display:none;}

.ThemeBlock{
	float:left;
	padding:0px 17px;}
.ThemeBlock .inner{
	border:2px solid #ccc;
	padding:0px;
	height:287px;
	overflow:hidden;
	width:205px;
	z-index:40;
	background-color:#FFF;}
.ThemeBlock  .preview{
	position:relative;
	width:100px;
	height:44px;
	background:url("images/pre_bg.png") no-repeat left top;
	left:-10px;
	top:60px;
	z-index:1000;
	line-height:32px;
	font-size:14px;
	filter:alpha(opacity=80);
	-moz-opacity:0.8;
	opacity:0.8;
	padding-left:15px;}
.ThemeBlock  .preview a{
	color:#FFFFFF;
	text-decoration:none;
	font-weight:bold;}	
.ThemeBlock  .img{
	position:relative;
	top:0px;
	width:200px;
	height:225px;
	z-index:50;}
.ThemeBlock .inner .img p{
	padding:0px 20px;
	font-size:10px;
	color:#666;}
.ThemeBlock .inner .img p a{
	text-decoration:none;
	color:#999;}


	/* clearfix */
.clearfix:after{
	content:" ";
	display:block;
	visibility:hidden;
	height:0;
	clear:both;
}
.clearfix {
	clear:both;
}
.clearbox {
	clear:both; 
	width:996px; 
	margin:0 auto; 
	height:0; 
	overflow:hidden;}
.clear { 
	height:1%; 
	overflow:hidden; }
.LowerFolderNameList li{
	list-style-type:none;
	vertical-align:top;
	height:25px;
	line-height:25px;
	padding-left:18px;
}
.LowerFolderNameList li img{
vertical-align:text-bottom;
}

.HoutaiArticleDaohang li{
	list-style-type:none;
	vertical-align:top;
	height:20px;
	line-height:20px;
}
.HoutaiArticleDaohang li img{
vertical-align:text-bottom;
}
</STYLE>
<META content="MSHTML 6.00.3790.2817" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">

 <br />
	<%
End Sub

Sub Footer()
	Call DBConnEnd()
	Response.Write "</BODY></HTML>"
End Sub


Function fixjs(Str)
	If Str <>"" Then
		str = replace(str,"\", "\\")
		Str = replace(str, chr(34), "\""")
		Str = replace(str, chr(39),"\'")
		Str = Replace(str, chr(13), "\n")
		Str = Replace(str, chr(10), "\r")
		str = replace(str,"'", "&#39;")
	End If
	fixjs=Str
End Function
Function enfixjs(Str)
	If Str <>"" Then
		Str = replace(str,"&#39;", "'")
		Str = replace(str,"\""" , chr(34))
		Str = replace(str, "\'",chr(39))
		Str = Replace(str, "\r", chr(10))
		Str = Replace(str, "\n", chr(13))
		Str = replace(str,"\\", "\")
	End If
	enfixjs=Str
End Function

Function IsObjInstalled(strClassString)
    On Error Resume Next
    IsObjInstalled = False
    Err = 0
    Dim xTestObj
    SET xTestObj = Server.CreateObject(strClassString)
    IF(0 = Err)THEN IsObjInstalled = True
    SET xTestObj = Nothing
    Err = 0
End Function


'===============================================================
Function SStr(sel_name, valuelist, textlist, initvalue, other)
	Dim s, Avaluelist, Atextlist, i
	Select Case	other
		Case "r" other=" dataType='Require' msg='ѡ��' "
		Case Else other=" -- "
	End Select

	s= "<select name='"&sel_name&"' "&other&" >"
	s=s & "<option value=''>��ѡ��...</option>"
	Avaluelist=Split(valuelist,"|")
	Atextlist=Split(textlist,"|")
	For i=0 To UBound(Avaluelist)
		s=s & "<option value='" & Avaluelist(i) & "'"
		If CStr(initvalue)=CStr(Avaluelist(i)) Then s=s & " selected "
		s=s & ">" & Atextlist(i) & "</option>"
	Next
	s=s & "</select>"
	Set Avaluelist=Nothing
	Set Atextlist=Nothing
	SStr=s
End Function

'==========================================================
Function SDB(sel_name, sql, initvalue, other)
	'response.Write "<br> " & sql
	Dim s, rs,other2,o
	other2=Left(other,1)
	Select Case other2
	       Case "r" o=" dataType='Require' msg='��ѡ��' "
	End Select

	s="<select name='"& sel_name &"' "& o &">"
	s=s & "<option value=''>��ѡ��...</option>"
	other3=Mid(other,2,1)
	If other3="a" Then	s=s & "<option value='0'>��</option>"
	Set rs=cn.execute(sql)
	Do While Not rs.eof
		s=s & "<option value='" & rs(0) & "'"
		If CStr(rs(0))=CStr(initvalue) Then s=s & " selected "
		s=s & ">" & rs(1) & "</option>"
		rs.MoveNext
	Loop
	rs.close:Set rs=Nothing
	s=s & "</select>"
	SDB=s
End Function

'===============================================================


'===============================================================
Function SMonth(sel_name, initvalue, other)
	Dim s, i, m0, m1
	Select Case	other
		Case "r" other=" dataType='Require' msg='ѡ��' "
		Case Else other=" -- "
	End Select
	s=s & "<select name='"&sel_name&"' " & other & ">"
	s=s & "<option value=''>��ѡ��...</option>"
	For i=-5 To 5
		m0=DateAdd("m", i, Date())
		If CDate(m0)> CDate(Date()) Then Exit For
		m1=Year(m0) & "��" & Month(m0) & "��"
		s=s & "<option value='"&m0&"'"
		If CDate(initvalue)=CDate(m0) Then s=s & " selected "
		s=s & ">" & m1 & "</option>"
	Next
	s=s & "</select>"
	SMonth= s
End Function

'==================================
Function GetUrl() 
	On Error Resume Next 
	Dim strTemp 
	If LCase(Request.ServerVariables("HTTPS")) = "off" Then 
	 strTemp = "http://"
	Else 
	 strTemp = "https://"
	End If 
	strTemp = strTemp & Request.ServerVariables("SERVER_NAME") 
	If Request.ServerVariables("SERVER_PORT") <> 80 Then 
	 strTemp = strTemp & ":" & Request.ServerVariables("SERVER_PORT") 
	end if
	strTemp = strTemp & Request.ServerVariables("URL") 
	If Trim(Request.QueryString) <> "" Then 
	 strTemp = strTemp & "?" & Trim(Request.QueryString) 
	end if
	GetUrl = strTemp 
End Function

'==================================
Function logr()
	Dim s
	If Session("log_role")=9 Then 
		logr=True
	Else 
		logr=False
	End If 
End Function 
'==================================================================
Function GStr(valuelist, textlist, initvalue)
	Dim s, Avaluelist, Atextlist, i
	Avaluelist=Split(valuelist, "|")
	Atextlist=Split(textlist, "|")
	For i=0 To UBound(Avaluelist)
		If CStr(initvalue)=CStr(Avaluelist(i)) Then s=AtextList(i)
	Next
	Set Avaluelist=Nothing
	Set Atextlist=Nothing
	If s<>"" Then
		GStr=s
	Else
		GStr="null"
	End If

End Function

'================================================================
Function GDB(sql)
	Dim s,rs
	'response.Write sql & "<br>"
	Set rs=cn.execute(sql)
	If Not (rs.bof Or rs.eof) Then
		s=rs(0)
	Else
		s=0
	End If
	rs.close:Set rs=Nothing
	If IsNull(s) Then s=0
	GDB=s
End Function


'============================================
Function subids(id,db)
	Dim ids,rs
	If id<>"" Then
		Set rs=cn.execute("select id from "&db&" where ParentId=" & id)
		If Not (rs.bof Or rs.eof) Then
			Do While Not rs.eof
				If ids="" Then
					ids=rs(0)
				Else
					ids=ids & "," & rs(0)
				End If
				rs.MoveNext
			Loop
			rs.close:Set rs=Nothing
		End If
	Else
		subids="0"
	End If
	subids=ids
End Function


Function laststr(s)
	Dim i,a1,s2
	a1=Split(s,",")
	s2=a1(UBound(a1))
	Set a1=Nothing
	laststr=s2
End Function


Function getpathstr(ids,db)
	Dim i,a1,s
	a1=Split(ids,",")
	For i=0 To UBound(a1)
		If s="" Then
			s=GDB("select name from "&db&" where id=" & a1(i) )
		Else
			s=s & "-" & GDB("select name from "&db&" where id=" & a1(i) )
		End If
	Next
	Set a1=Nothing
	getpathstr=s
End Function


Function CreateFolderB(NewFolderDir)
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(NewFolderDir)) Then
response.Write "<script language='javascript'>alert('���ļ����Ѿ�������');history.go(-1);</script>"
else
Fso.CreateFolder(Server.MapPath(NewFolderDir))
end if
set fso=nothing
End Function

Function ModifyFolderB(NewFolderDir,c_folder)
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(NewFolderDir)) Then
set Folder_N=Fso.GetFile(Server.MapPath(NewFolderDir))
Folder_N.name=c_folder
else
Fso.CreateFolder(Server.MapPath(NewFolderDir))
end if
set fso=nothing
End Function

%>


<%
'==================================================
'��������BuildFolder
'��  �ã������ļ���
'��  ����path ----------Ҫ�������ļ���(·��)
'==================================================
function BuildFolder(path)
Set fso = Server.CreateObject("Scripting.FileSystemObject")
    fso.CreateFolder(Server.MapPath(path))
    Set fso=Nothing
End Function
'==================================================
'��������Buildfile
'��  �ã������ļ�
'��  ����Htmlcode ------Ҫ�������ļ���Ϣ
'��  ����filex ----------Ҫ�������ļ���(·��)
'==================================================
function Buildfile(filex,Htmlcode)
Set fso = Server.CreateObject("Scripting.FileSystemObject")
    Set html = fso.CreateTextFile(Server.MapPath(filex))
        html.WriteLine Htmlcode
        html.close
    Set html=Nothing
    Set fso=Nothing
End Function
'==================================================
'��������Savefile
'��  �ã��޸��ļ�
'��  ����file_body ------Ҫ�������ļ���Ϣ
'��  ����file_name ------Ҫ�������ļ���(·��)
'��  ����Cset -----------����Ҫ�������ļ�����
'==================================================
Function Savefile(file_body,file_name,Cset)
Set OS=Server.CreateObject("ADODB.Stream")
        OS.Type=2
        OS.Open
        OS.Charset = Cset
        OS.Position=OS.Size
        OS.WriteText=file_body
        OS.SaveToFile Server.MapPath(file_name),2
        OS.Close
Set OS=Nothing
End Function

'==================================================
'��������ChkFile
'��  �ã������ļ��Ƿ����
'��  ����FilePath ------Ҫ�������ļ�·��
'==================================================
Function ChkFile(FilePath)
    dim path
    path=Server.MapPath(FilePath)
    Set fso=Server.CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(path) then
       ChkFile="OK!"
    Else
       ChkFile="�ļ�������"
    End IF
    Set fso=Nothing
End Function

'MoveFolder
Public Function MoveFolder(Byval sFolder,Byval nFolder)
if sFolder="" or nFolder="" then MoveFolder="��������" : Exit Function
On Error Resume Next
Dim objFSO
err=0
Folder=Server.MapPath(sFolder)
Folder1=Server.MapPath(nFolder)
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
objFSO.MoveFolder Folder,Folder1
Set objFSO = Nothing
MoveFolder = Err.Description

End Function


'�������ļ���
function renamefolder(OldFolderDir,NewFolderDir) 
on error resume next 
dim fso 
set fso = server.createobject("scripting.filesystemobject") 
if fso.folderexists(server.mappath(OldFolderDir)) then 
fso.movefolder server.mappath(OldFolderDir),server.mappath(NewFolderDir) 
renamefolder = true 
else 
renamefolder = false 
set fso = nothing 
end if 
set fso = nothing 
end function 

'------��ȡͬ��Ŀ¼�µ�����һƪ����id(��������ǰ��ȡ��id���Ա����������ɸ�ƪ����)jhyfunction------
function getNewestArticleId(juhaoyongCid,juhaoyongPid,juhaoyongPPid)
sql="select top 1 id,cid,pid,ppid from [article] where cid='"&juhaoyongCid&"' and pid='"&juhaoyongPid&"' and ppid='"&juhaoyongPPid&"'  and view_yes=1 and ArticleType=1 order by [id] desc"
set rs=server.createobject("adodb.recordset")
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
getNewestArticleId=rs("id")
else
getNewestArticleId="0"
end if
rs.close
set rs=nothing
end function


'------��ȡһƪ����ǰ���һƪ����id,jhyfunction------
function juhaoyongGetQianOrHouArticleId(cid,pid,ppid,id,articlePosition)
'On Error Resume Next

if ppid<>"" then
preSql=" from [article] where ppid='"&ppid&"' "
elseif pid<>"" then
preSql=" from [article] where pid='"&pid&"' and ppid='' "
elseif cid<>"" then
preSql=" from [article] where cid='"&cid&"' and pid='' and ppid='' "
end if

if articlePosition="qian" then
sql="select top 1 id "&preSql&" and [id]>"&id&" and view_yes=1 and ArticleType=1 order by [id] asc"
else
sql="select top 1 id "&preSql&" and [id]<"&id&" and view_yes=1 and ArticleType=1 order by [id] desc"
end if

set rs=server.createobject("adodb.recordset")
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
juhaoyongGetQianOrHouArticleId=rs("id")
else
juhaoyongGetQianOrHouArticleId=id
end if
rs.close
set rs=nothing
end function

'------��ȡ�����¼���Ŀ���ƣ����������ӣ����ɴ���------
function juhaoyongGetLowerFolderNameList(ppid,pid,cid)
'On Error Resume Next
set rs=server.createobject("adodb.recordset")
sql="select id,pid,ppid,name,ClassType,[order] from category where ClassType=1 and ppid="&ppid&" and pid="&pid&" order by [order],time"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
	response.Write("<ul class=LowerFolderNameList>")
	do while not rs.eof
		if pid=cid then
		response.Write("<li><a href=Article_list.asp?cid="&cid&"&pid="&rs("id")&"&act=search><img src=images/lowerFolderImg.gif border=0 />"&rs("name")&"</a></li>")
		else
		response.Write("<li><a href=Article_list.asp?cid="&cid&"&pid="&pid&"&ppid="&rs("id")&"&act=search><img src=images/lowerFolderImg.gif border=0 />"&rs("name")&"</a></li>")
		end if
	rs.movenext
	loop
	response.Write("</ul>")
end if
rs.close
set rs=nothing
end function

'------����id��ȡ��Ŀ����------
function juhaoyongGetLanmuName(id)
'On Error Resume Next
set get_lanmu_name_rs=server.createobject("adodb.recordset")
sql="select id,pid,ppid,name from category where id="&id
get_lanmu_name_rs.open(sql),cn,1,1
	if not get_lanmu_name_rs.eof and not get_lanmu_name_rs.bof then
	juhaoyongGetLanmuName=get_lanmu_name_rs("name")
	end if
get_lanmu_name_rs.close
set get_lanmu_name_rs=nothing
end function

'****************************************************
'��  �ã���ȡ�ļ�����ȥ����չ����
'��  �������ļ��л���ַ���ļ���
'****************************************************
function juhaoyongGetUploadFileName(fileName)
if trim(fileName)="" or trim(fileName)="/" then
	ranNum=int(90000*rnd)+10000
	juhaoyongGetUploadFileName=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum
else
    dim pos
    pos=InStrRev(filename,"/")
    if pos>0 and pos<Len(filename) then
        juhaoyongGetUploadFileName=mid(fileName,pos+1)
    elseif pos=Len(filename) then
		juhaoyongGetUploadFileName=left(fileName,InStrRev(fileName,"/")-1)
	else
		juhaoyongGetUploadFileName=filename
    end if
	
	if InStrRev(juhaoyongGetUploadFileName,".")>0 then
	juhaoyongGetUploadFileName=left(juhaoyongGetUploadFileName,InStrRev(juhaoyongGetUploadFileName,".")-1)
	end if
end if
end function

'=================================================
'��  �ã���ȡ�ֲ�ͼƬ����+1
'��  ������
'=================================================
function juhaoyongGetLunboImgTotal()
	dim sqlTotal
	dim rsLunboTotal
	sqlTotal="select Count(*) from web_ads"
	Set rsLunboTotal= Server.CreateObject("ADODB.Recordset")
	rsLunboTotal.open sqlTotal,cn,1,1
	if rsLunboTotal.eof and rsLunboTotal.bof then
		juhaoyongGetLunboImgTotal=1
	else
		juhaoyongGetLunboImgTotal=rsLunboTotal(0)+1
	end if
	rsLunboTotal.close
	set rsLunboTotal=nothing
end function

'=================================================
'��  �ã���ȡ���Ŀ¼����
'��  ������
'=================================================
function juhaoyongGetweb_theme()
set get_web_theme_rs=server.createobject("adodb.recordset")
sql="select web_theme from web_settings"
get_web_theme_rs.open(sql),cn,1,1
	if not get_web_theme_rs.eof and not get_web_theme_rs.bof then
	juhaoyongGetweb_theme=get_web_theme_rs("web_theme")
	else
	juhaoyongGetweb_theme=""
	end if
get_web_theme_rs.close
set get_web_theme_rs=nothing
end function
%>