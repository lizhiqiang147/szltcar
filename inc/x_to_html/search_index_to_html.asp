<!-- #include file="../juhaoyongConst.asp" -->
<!-- #include file="../access.asp" -->
<!-- #include file="../html_clear.asp" -->
<!-- #include file="../juhaoyongKefuFunction.asp" -->
<%juhaoyong_kefu_html_code_string=juhaoyongKefuHtmlCode()%>

<%'容错处理
function search_index_to_html()
On Error Resume Next
%>
<%
'首页基本信息内容读取替换
set rs=server.createobject("adodb.recordset")
sql="select web_name,web_url,web_image,web_title,web_keywords,web_contact,web_tel,web_TopHTML,web_BottomHTML,web_description,web_copyright,web_theme from web_settings"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
web_name=rs("web_name")
if web_name<>"" then web_name="_"&web_name
web_url=rs("web_url")
web_image=rs("web_image")
web_title=rs("web_title")
web_keywords=rs("web_keywords")
web_description=rs("web_description")
web_copyright=rs("web_copyright")
web_theme=rs("web_theme")
web_consult=rs("web_contact")
web_TopHTML=rs("web_TopHTML")
web_BottomHTML=rs("web_BottomHTML")
web_tel=rs("web_tel")
	if trim(web_tel)="" then
	web_tel_title=""
	else
	web_tel_title=JUHAOYONG_CONST_REXIANDIANHUA
	end if
end if
rs.close
%>
<% '文件夹获取

'搜索文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=35"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
Search_FolderName="/"&rs_1("FolderName")
end if
rs_1.close

'读取模板内容
'模板类型获取
sql="select FileName,FolderName from web_Models_type where [id]=35"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Model_FileName=rs_1("FileName")
if rs_1("FolderName")<>"" then
Model_FolderName="/"&rs_1("FolderName")
end if
end if
rs_1.close
set rs_1=nothing

Set fso=Server.CreateObject("Scripting.FileSystemObject") 
Set htmlwrite=fso.OpenTextFile(Server.MapPath("/templates/"&web_theme&"/"&Model_FileName)) 
replace_code=htmlwrite.ReadAll() 
htmlwrite.close 
%>
<%
replace_code=replace(replace_code,"$web_name$",web_name)
replace_code=replace(replace_code,"$web_url$",web_url)
replace_code=replace(replace_code,"$web_image$",web_image)
replace_code=replace(replace_code,"$web_title$",web_title)
replace_code=replace(replace_code,"$web_copyright$",web_copyright)
replace_code=replace(replace_code,"$web_theme$",web_theme)
replace_code=replace(replace_code,"$web_consult$",web_consult)
replace_code=replace(replace_code,"$web_TopHTML$",web_TopHTML)
replace_code=replace(replace_code,"$juhaoyong_kefu_html_code_string$",juhaoyong_kefu_html_code_string)
replace_code=replace(replace_code,"$web_tel$",web_tel)
replace_code=replace(replace_code,"$web_tel_title$",web_tel_title)
replace_code=replace(replace_code,"$search_FolderName$",search_FolderName)


'顶部导航
sql="select * from web_menu_type where TopNav=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
web_TopMenu=web_TopMenu&"<ul id='sddm'>"
for i=1 to rs.recordcount

	if instr(rs("url"),"://")>0 then
	juhaoyongMenuOutLinkBlank1=" target=_blank"
	else
	juhaoyongMenuOutLinkBlank1=""
	end if
	
	set rss=server.createobject("adodb.recordset")
	sql="select * from web_menu where view_yes=1 and [position]="&rs("id")&" order by [order]"
	rss.open(sql),cn,1,1
	if not rss.eof then
		web_TopMenu=web_TopMenu&"<li id='aaabbb"&i&"' onmouseover=juhaoyongNavBgaColor('aaabbb"&i&"') onmouseout=style.background=''><a href='"&rs("url")&"' onmouseover=mopen('m"&i&"') onmouseout='mclosetime()'"&juhaoyongMenuOutLinkBlank1&">"&rs("name")&"</a> "
		web_TopMenu=web_TopMenu&"<div id='m"&i&"' onmouseover='mcancelclosetime()' onmouseout='mclosetime()'>"
		do while not rss.eof
		
		if instr(rss("url"),"://")>0 then
		juhaoyongMenuOutLinkBlank2=" target=_blank"
		else
		juhaoyongMenuOutLinkBlank2=""
		end if
		
		web_TopMenu=web_TopMenu&"<a href='"&rss("url")&"'"&juhaoyongMenuOutLinkBlank2&">"&rss("name")&"</a> "
		
		rss.movenext
		loop
		web_TopMenu=web_TopMenu&"</div></li> "
	else
		web_TopMenu=web_TopMenu&"<li><a href='"&rs("url")&"'"&juhaoyongMenuOutLinkBlank1&">"&rs("name")&"</a></li> "
	end if
	rss.close
	set rss=nothing
	
rs.movenext
next
web_TopMenu=web_TopMenu&"</ul>"
end if
rs.close

replace_code=replace(replace_code,"$web_TopMenu$",web_TopMenu)

'底部导航
sql="select * from web_menu_type where BottomNav=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
juhaoyong_web_BottomNav=juhaoyong_web_BottomNav&"<div class='BottomNav'>"
for i=1 to rs.recordcount
	
	if instr(rs("url"),"://")>0 then
	juhaoyongMenuOutLinkBlank1=" target=_blank"
	else
	juhaoyongMenuOutLinkBlank1=""
	end if
	
	if i=1 then
	juhaoyong_web_BottomNav=juhaoyong_web_BottomNav&"<a href='"&rs("url")&"'"&juhaoyongMenuOutLinkBlank1&">"&rs("name")&"</a>"
	else
	juhaoyong_web_BottomNav=juhaoyong_web_BottomNav&" | <a href='"&rs("url")&"'"&juhaoyongMenuOutLinkBlank1&">"&rs("name")&"</a>"
	end if
	
	rs.movenext
next
juhaoyong_web_BottomNav=juhaoyong_web_BottomNav&"</div>"
juhaoyong_web_BottomNav=juhaoyong_web_BottomNav&"<div class='HeightTab'></div>"
end if
rs.close

replace_code=replace(replace_code,"$web_BottomHTML$",juhaoyong_web_BottomNav&web_BottomHTML)

'顶部广告读取
sql="select top 1 [id],ADtype,[ADcode] from web_ads  where [position]=35 and view_yes=1 order by [time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
if rs("ADtype")=4 then
Inner_BannerTop=Inner_BannerTop&rs("ADcode")
else
Inner_BannerTop=Inner_BannerTop&"<script src='/ADs/"&rs("id")&".js' type='text/javascript'></script>"
end if 
else
Inner_BannerTop=Inner_BannerTop&""
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$Inner_BannerTop$",Inner_BannerTop)

%>

<% '判断模板文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>
<% 
filepath_index=Model_FolderName&"/index.asp"	
%>
<%
Set f=fso.CreateTextFile(Server.MapPath(filepath_index),true)
f.WriteLine replace_code
f.close
%>

<% 
end function
%>