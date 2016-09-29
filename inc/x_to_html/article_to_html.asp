<!-- #include file="../juhaoyongConst.asp" -->
<!-- #include file="../html_clear.asp" -->
<!-- #include file="../juhaoyongCommonFunction.asp" -->
<!-- #include file="../juhaoyongKefuFunction.asp" -->
<%juhaoyong_kefu_html_code_string=juhaoyongKefuHtmlCode()%>

<%'容错处理
function article_to_html(a_id)
On Error Resume Next
%>
<!--common use start-->
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
<% 
'搜索文件夹获取
sql="select FileName,FolderName from web_Models_type where [id]=35"
rs.open(sql),cn,1,1
if not rs.eof and rs("FolderName")<>"" then
Search_FolderName="/"&rs("FolderName")
end if
rs.close

'模板类型获取
sql="select FileName,FolderName from web_Models_type where [id]=5"
rs.open(sql),cn,1,1
if not rs.eof then
Model_FileName=rs("FileName")
if rs("FolderName")<>"" then
Model_FolderName="/"&rs("FolderName")
ArticleContent_FolderName="/"&rs("FolderName")
end if
end if
rs.close
%>
<%
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

'新闻动态获取一级栏目id
sql="select top 1  [id] from [category] where ClassType=1 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
NewsID=rs("id")
end if
rs.close

'读取新闻列表
sql="select top 8 title,content,file_path,[url],edit_time from [article]  where  cid='"&NewsID&"'  and view_yes=1  and ArticleType=1 order by [edit_time] desc"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
Block01_LeftItem=Block01_LeftItem&"<dl>"
for i=1 to rs.recordcount
rs_url=""
if rs("url")<>"" then
rs_url=rs("url")
else
rs_url=ArticleContent_FolderName&"/"&rs("file_path")
end if 

Block01_LeftItem=Block01_LeftItem&"<dd><a href='"&rs_url&"' target='_blank' title='"&rs("title")&"'>"&left(rs("title"),14)&"</a></dd>"

rs.movenext
next
Block01_LeftItem=Block01_LeftItem&"</dl>"
else
Block01_LeftItem=Block01_LeftItem&"暂无信息。"
end if
rs.close


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
%>
<!--common use end-->


<% '---------------- 文章内容读取替换开始 ------------------------------
sql="select * from [article] where view_yes=1 and [id]="&a_id&""
rs.open(sql),cn,1,1
if not rs.eof then
juhaoyongArticleContentCid=rs("cid")
juhaoyongArticleContentPid=rs("pid")
if juhaoyongArticleContentCid="" then juhaoyongArticleContentCid="0"
if juhaoyongArticleContentPid="" then juhaoyongArticleContentPid="0"
article_title=rs("title")
ArticleContent=rs("content")
article_keywords=rs("keywords")
article_description=rs("description")
article_from_url=rs("from_url")
article_from_name=rs("from_name")
if trim(article_from_name)<>"" then
	if article_from_url="" then article_from_url=web_url
	juhaoyong_article_from="<a href='"&article_from_url&"' target='_blank'>"&article_from_name&"</a>&nbsp;&nbsp;"
	else
	juhaoyong_article_from=""
end if
article_time=rs("edit_time")
article_count=rs("comment")
Article_FilePath=rs("file_path")

'下载内容
if rs("Files")<>"" then
DownloadFiles=split(rs("Files"),",")
dc=ubound(DownloadFiles)
for ii=0 to dc
Article_Downloads=Article_Downloads&"<div class='download ColorLink'><b>文件下载：</b>"
Article_Downloads=Article_Downloads&"<a href='/attachmentUploadFile/"&DownloadFiles(ii)&"' target='_blank'>"&DownloadFiles(ii)&"</a> <span class='ListDate'>(点击右键可另存)</span></div> "
next
end if

end if
rs.close

'您现在的位置读取替换
if juhaoyongArticleContentCid<>"" then
sql="select [id],[pid],[ppid],[name],[folder] from [category] where [id]="&juhaoyongArticleContentCid&" and ppid=1"
rs.open(sql),cn,1,1
ClassName1=rs("name")
ClassFolder1=rs("folder")
ClassID=rs("id")

folder_path="/"&ClassFolder1&"/"
category_position="<a href='"&folder_path&"'>"&ClassName1&"</a>"
rs.close
end if

if juhaoyongArticleContentPid<>"" then
sql="select [id],[pid],[ppid],[name],[folder] from [category] where [id]="&juhaoyongArticleContentPid&" and ppid=2"
rs.open(sql),cn,1,1
folder_path=folder_path&rs("folder")&"/"
category_position=category_position&" > <a href='"&folder_path&"'>"&rs("name")&"</a>"
rs.close
end if

'---------------- 文章内容读取替换结束 ------------------------------

'侧边栏当前栏目列表
Block_LeftClassList=""
sql="select [name],[folder],[id],[pid],[ppid] from [category] where pid="&ClassID&" order by [order] "
rs.open(sql),cn,1,1
Block_LeftClassList=Block_LeftClassList&"<ul>"
if not rs.eof then
for i=1 to rs.recordcount
if rs("id")=cint(juhaoyongArticleContentPid) then
Block_LeftClassList=Block_LeftClassList&"<li class='current'><A href='/"&ClassFolder1&"/"&rs("Folder")&"'>"&rs("name")&"</A></li> "
else
Block_LeftClassList=Block_LeftClassList&"<li><A href='/"&ClassFolder1&"/"&rs("Folder")&"'>"&rs("name")&"</A></li> "
end if
rs.movenext
next
else
Block_LeftClassList=Block_LeftClassList&"无分类"
end if
Block_LeftClassList=Block_LeftClassList&"</ul>"
rs.close
set rs=nothing
%>
<%
'上一篇，下一篇读取替换
article_next=juhaoyongArticleNextCodeHtml(a_id,ArticleContent_FolderName)
%>

<%
'读取模板内容
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
replace_code=replace(replace_code,"$PageNO$","")
replace_code=replace(replace_code,"$web_BottomHTML$",juhaoyong_web_BottomNav&web_BottomHTML)
replace_code=replace(replace_code,"$juhaoyong_kefu_html_code_string$",juhaoyong_kefu_html_code_string)
replace_code=replace(replace_code,"$web_tel$",web_tel)
replace_code=replace(replace_code,"$web_tel_title$",web_tel_title)
replace_code=replace(replace_code,"$search_FolderName$",search_FolderName)

replace_code=replace(replace_code,"$article_comment$",article_comment)
replace_code=replace(replace_code,"$article_kw$",article_kw)
replace_code=replace(replace_code,"$article_refer$",article_refer)
replace_code=replace(replace_code,"$category_position$",category_position)
replace_code=replace(replace_code,"$CategoryName$",CategoryName)
replace_code=replace(replace_code,"$Block_LeftClassList$",Block_LeftClassList)
replace_code=replace(replace_code,"$ClassName1$",ClassName1)
replace_code=replace(replace_code,"$ClassFolder1$",ClassFolder1)

replace_code=replace(replace_code,"$article_id$",a_id) 
replace_code=replace(replace_code,"$article_title$",article_title)
replace_code=replace(replace_code,"$article_keywords$",article_keywords)
replace_code=replace(replace_code,"$article_description$",article_description)
replace_code=replace(replace_code,"$article_short$",article_short)
replace_code=replace(replace_code,"$article_time$",article_time)
replace_code=replace(replace_code,"$juhaoyong_article_from$",juhaoyong_article_from)
replace_code=replace(replace_code,"$article_content$",ArticleContent)
replace_code=replace(replace_code,"$PageList$","")
replace_code=replace(replace_code,"$article_count$",article_count)
replace_code=replace(replace_code,"$article_next$",article_next)
replace_code=replace(replace_code,"$Article_Downloads$",Article_Downloads)

replace_code=replace(replace_code,"$web_TopMenu$",web_TopMenu)
replace_code=replace(replace_code,"$Block01_LeftItem$",Block01_LeftItem)
replace_code=replace(replace_code,"$Block02_LeftItem$",Block02_LeftItem)
replace_code=replace(replace_code,"$Inner_BannerTop$",Inner_BannerTop)

%>
<% '判断文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>
<%'声明HTML文件名,指定文件路径
filepath=Model_FolderName&"/"&Article_FilePath
%>
<% '生成静态文件
Set fout = fso.CreateTextFile(Server.MapPath(filepath))
fout.WriteLine replace_code
fout.close
set fso=nothing
%>

<%
end function
%>