<!-- #include file="../juhaoyongConst.asp" -->
<!-- #include file="../access.asp" -->
<!-- #include file="../html_clear.asp" -->
<!-- #include file="../juhaoyongCommonFunction.asp" -->
<!-- #include file="../juhaoyongKefuFunction.asp" -->
<%juhaoyong_kefu_html_code_string=juhaoyongKefuHtmlCode()%>

<%'容错处理
function index_to_html()
On Error Resume Next
%>
<%
'首页基本信息内容读取替换
set rs=server.createobject("adodb.recordset")
sql="select web_name,web_url,web_image,web_title,web_keywords,web_contact,web_tel,web_TopHTML,web_BottomHTML,web_description,web_copyright,web_theme,web_ModelEdit from web_settings"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
web_name=rs("web_name")
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
web_ModelEdit=rs("web_ModelEdit")
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
sql="select FileName,FolderName from web_Models_type where [id]=35"
rs.open(sql),cn,1,1
if not rs.eof and rs("FolderName")<>"" then
Search_FolderName="/"&rs("FolderName")
end if
rs.close

'文章内容文件夹获取
sql="select FileName,FolderName from web_Models_type where [id]=5"
rs.open(sql),cn,1,1
if not rs.eof and rs("FolderName")<>"" then
ArticleContent_FolderName="/"&rs("FolderName")
end if
rs.close

'产品内容文件夹获取
sql="select FileName,FolderName from web_Models_type where [id]=6"
rs.open(sql),cn,1,1
if not rs.eof and rs("FolderName")<>"" then
ProductContent_FolderName="/"&rs("FolderName")
end if
rs.close
%>

<% '读取模板内容
'模板类型获取
sql="select FileName,FolderName from web_Models_type where [id]=1"
rs.open(sql),cn,1,1
if not rs.eof then
Model_FileName=rs("FileName")
if rs("FolderName")<>"" then
Model_FolderName="/"&rs("FolderName")
end if
end if
rs.close

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
replace_code=replace(replace_code,"$web_keywords$",web_keywords)
replace_code=replace(replace_code,"$web_description$",web_description)
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

'首页顶部幻灯广告读取替换
sql="select top 9 name,url,image from web_ads where view_yes=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
	if rs.recordcount>1 then
		web_TopIMGAD=web_TopIMGAD&"<div id='Focus' onmouseover='jhyLunboShowPreNextBut(1)' onmouseout='jhyLunboShowPreNextBut(2)'><ul>"
		for i=1 to rs.recordcount
		web_TopIMGAD=web_TopIMGAD&"<li><a href='"&rs("url")&"' target='_blank'><img src='/css/"&web_theme&"/"&rs("image")&"' /></a></li>"
		rs.movenext
		next
		web_TopIMGAD=web_TopIMGAD&"</ul></div>"
	else
		web_TopIMGAD=web_TopIMGAD&"<div  id='FocusOneImage'><a href='"&rs("url")&"' target='_blank'><img src='/css/"&web_theme&"/"&rs("image")&"' /></a></div>"
	end if
else
	web_TopIMGAD=""
end if
rs.close

replace_code=replace(replace_code,"$web_TopIMGAD$",web_TopIMGAD)

'读取价格列表
sql="select top 1 * from [web_info] where cid='344' and view_yes=1 order by [time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
	rscount=rs.recordcount
    whichpage=j 
    rs.pagesize=666
    totalpage=rs.pagecount
    rs.absolutepage=whichpage
    howmanyrecs=0
    list_block=""
    list_block=list_block&"<ul>"
    do while not rs.eof and howmanyrecs<rs.pagesize

        list_block=list_block&"<table width='100%' border='0' cellpadding='0' cellspacing='0' >"
        list_block=list_block&"<td colspan='2' align='left' class='Rtitle'><strong>&nbsp;"&rs("title")&"</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span>["&rs("time")&"]</span></td></tr>"

        list_block=list_block&"<td align='left' bgcolor='#FCFCFC'><p>"&rs("content")&"</p></td></tr>"
        list_block=list_block&"</table><br>"
        rs.movenext
        howmanyrecs=howmanyrecs+1
    loop
    list_block=list_block&"</ul>"
else
	list_block=list_block&"暂无信息！"
end if
rs.close

replace_code=replace(replace_code,"$webNewestPrice$",list_block)

'企业介绍
sql="select top 1  [name],[folder],[id],[pid],[ppid],[image],[content] from [category] where ClassType=5 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
WebAboutName=rs("name")
WebAboutFolderName=rs("folder")
WebAboutImage=rs("image")
WebAboutContent=left(ClearHtml(rs("content")),108)
end if
rs.close

replace_code=replace(replace_code,"$WebAboutName$",WebAboutName)
replace_code=replace(replace_code,"$WebAboutFolderName$",WebAboutFolderName)
replace_code=replace(replace_code,"$WebAboutImage$",web_theme&"/"&WebAboutImage)
replace_code=replace(replace_code,"$WebAboutContent$",WebAboutContent)

'联系我们
sql="select id,pid,ppid,name,[image],ClassType,folder from category where folder='Contactus'"
rs.open(sql),cn,1,1
if not rs.eof then
	JuhaoyongIndexContactusName=rs("name")
	JuhaoyongIndexContactusUrl="/"&rs("folder")
	JuhaoyongIndexContactusImage=rs("image")
	JuhaoyongIndexContactusPid=rs("pid")
	JuhaoyongIndexContactusPPid=rs("ppid")
end if
rs.close

if JuhaoyongIndexContactusPPid=2 then
	sql="select id,pid,ppid,name,ClassType,folder from category where id="&JuhaoyongIndexContactusPid
	rs.open(sql),cn,1,1
	if not rs.eof then
		JuhaoyongIndexContactusUrl="/"&rs("folder")&JuhaoyongIndexContactusUrl
	end if
	rs.close
end if
replace_code=replace(replace_code,"$JuhaoyongIndexContactusName$",JuhaoyongIndexContactusName)
replace_code=replace(replace_code,"$JuhaoyongIndexContactusUrl$",JuhaoyongIndexContactusUrl)
replace_code=replace(replace_code,"$JuhaoyongIndexContactusImage$",web_theme&"/"&JuhaoyongIndexContactusImage)

'新闻动态
sql="select top 1  [name],[folder],[id],[pid],[ppid] from [category] where ClassType=1 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebNewNewsName=rs("name")
WebNewNewsFolderName=rs("folder")
end if
rs.close

'content
set rs=server.createobject("adodb.recordset")
sql="select top 9 title,content,file_path,[url],edit_time from [article]  where cid='"&ItemID&"'  and view_yes=1  and ArticleType=1 order by [edit_time] desc"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
juhaoyongDoWhilei=0
do while not rs.eof
	rs_url=""
	if rs("url")<>"" then
	rs_url=rs("url")
	else
	rs_url=ArticleContent_FolderName&"/"&rs("file_path")
	end if 
	WebNewNewsList=WebNewNewsList&"<tr><td width='80%' class='ListTitle'><a href='"&rs_url&"' target='_blank' title='"&rs("title")&"'>"&left(rs("title"),25)&"</a></td>"
	WebNewNewsList=WebNewNewsList&"<td width='20%'><span>"&year(rs("edit_time"))&"-"&month(rs("edit_time"))&"-"&day(rs("edit_time"))&"</span></td></tr>"
	rs.movenext
juhaoyongDoWhilei=juhaoyongDoWhilei+1
if juhaoyongDoWhilei=9 then exit do
loop
else
WebNewNewsList=WebNewNewsList&"暂无信息。"
end if
rs.close


replace_code=replace(replace_code,"$WebNewNewsList$",WebNewNewsList)
replace_code=replace(replace_code,"$WebNewNewsName$",WebNewNewsName)
replace_code=replace(replace_code,"$WebNewNewsFolderName$",WebNewNewsFolderName)
replace_code=replace(replace_code,"$WebNewNewsFolder$",WebNewNewsFolder)



'产品推荐标题
sql="select top 1  [name],[folder],[id],[pid],[ppid] from [category] where ClassType=2 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebProductName=rs("name")
WebProductFolderName=rs("folder")
end if
rs.close

Block03_LeftItem=Block03_LeftItem&"<div class='productIndexTuijian'>"
Block03_LeftItem=Block03_LeftItem&"<div class='topic'>"
Block03_LeftItem=Block03_LeftItem&"<div class='TopicTitle'><a href='/"&WebProductFolderName&"'>"&WebProductName&"</a></div>"
Block03_LeftItem=Block03_LeftItem&"<div class='TopicMore'> <a href='/"&WebProductFolderName&"'><img src='images/more.png'></a></div>"
Block03_LeftItem=Block03_LeftItem&"</div>"
Block03_LeftItem=Block03_LeftItem&"</div>"

'产品推荐
Block03_LeftItem=Block03_LeftItem&"<!--MainBlock3 start-->"
Block03_LeftItem=Block03_LeftItem&"<div class='MainBlock3'>"
Block03_LeftItem=Block03_LeftItem&"<!--left start-->"
Block03_LeftItem=Block03_LeftItem&"<div class='left'>"
Block03_LeftItem=Block03_LeftItem&"<div class='TabBlock'>"

Block03_LeftItem=Block03_LeftItem&"<div id='tabcontent1'>"
Block03_LeftItem=Block03_LeftItem&"<DIV class='blk_29'>"
Block03_LeftItem=Block03_LeftItem&"<DIV class='LeftBotton' id='LeftArr1'></DIV>"
Block03_LeftItem=Block03_LeftItem&"<DIV class='Cont' id='ISL_Cont_1'>"

'sql="select top 8 [title],file_path,[image] from [article] where ArticleType=2 and cid='"&ItemID&"' and index_push=1 and view_yes=1 order by [edit_time] desc"
sql="select top 20 [title],file_path,[image] from [article] where ArticleType=2 and index_push=1 and view_yes=1 order by [edit_time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
do while not rs.eof 
rs_url=""
rs_url=ProductContent_FolderName&"/"&rs("file_path")
Block03_LeftItem=Block03_LeftItem&"<DIV class='box'><A class='imgBorder'  href='"&rs_url&"' target='_blank' title='"&rs("title")&"'><IMG alt='"&rs("title")&"' src='/images/up_images/"&rs("image")&"'>"&left(rs("title"),14)&"</A> </DIV>"
rs.movenext
loop
else
Block03_LeftItem_kaiguan="0"
end if
rs.close


Block03_LeftItem=Block03_LeftItem&"</DIV>"
Block03_LeftItem=Block03_LeftItem&"<DIV class='RightBotton' id='RightArr1'></DIV></DIV>"
Block03_LeftItem=Block03_LeftItem&"<SCRIPT language='javascript' type='text/javascript'>"
Block03_LeftItem=Block03_LeftItem&"var scrollPic_02 = new ScrollPic();"
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.scrollContId   = 'ISL_Cont_1';"
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.arrLeftId      = 'LeftArr1';"
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.arrRightId     = 'RightArr1'; "
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.frameWidth     = 888;"
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.pageWidth      = 888; "
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.speed          = 3; "
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.space          = 50; "
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.autoPlay       = true; "
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.autoPlayTime   = 3; "
Block03_LeftItem=Block03_LeftItem&"scrollPic_02.initialize(); "
Block03_LeftItem=Block03_LeftItem&"</SCRIPT>"
Block03_LeftItem=Block03_LeftItem&"<div class='clearfix'></div> </div> "


Block03_LeftItem=Block03_LeftItem&"</div>"
Block03_LeftItem=Block03_LeftItem&"</div>"
Block03_LeftItem=Block03_LeftItem&"<!--left end-->"
Block03_LeftItem=Block03_LeftItem&"<div class='clearfix'></div>"
Block03_LeftItem=Block03_LeftItem&"</div>"
Block03_LeftItem=Block03_LeftItem&"<!--MainBlock end-->"

if Block03_LeftItem_kaiguan="0" then Block03_LeftItem=""
replace_code=replace(replace_code,"$Block03_LeftItem$",Block03_LeftItem)

'底部文章块列表（嵌套循环）开始
'外部循环开始
sql="select [name],[folder],[id],[pid],[ppid] from [category] where ClassType=1 and ppid=2 and index_push=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
	juhaoyongi=0
	jhyArticleListHtml=jhyArticleListHtml&"<!--jhyArticleListMainBlock start-->"
	jhyArticleListHtml=jhyArticleListHtml&"<div class='jhyArticleListMainBlock'>"
	
	do while not rs.eof
	
	if (juhaoyongi mod 3 =0) and juhaoyongi>0 then
	jhyArticleListHtml=jhyArticleListHtml&"</div><div class='juhaoyongHeightTab clearfix'></div><div class='jhyArticleListMainBlock'>"
	end if
	
	if (juhaoyongi+2) mod 3 =0 or (juhaoyongi+1) mod 3 =0 then
	jhyArticleListHtml=jhyArticleListHtml&"<div class='WidthTab2'></div>"
	end if
	
	jhyArticleListHtml=jhyArticleListHtml&"<!--列表单元开始-->"
	if (juhaoyongi+2) mod 3 =0 then
	jhyArticleListHtml=jhyArticleListHtml&"<div class='juhaoyongALCommonUnit1'>"
	else
	jhyArticleListHtml=jhyArticleListHtml&"<div class='juhaoyongALCommonUnit2'>"
	end if
	jhyArticleListHtml=jhyArticleListHtml&"<div class='topic'>"
	jhyArticleListHtml=jhyArticleListHtml&"<div class='TopicTitle'><a  href='/"&juhaoyongGetTopCategoryFolderName(rs("pid"))&"/"&rs("folder")&"' target='_blank'>"&rs("name")&"</a></div>"
	jhyArticleListHtml=jhyArticleListHtml&"<div class='TopicMore'> <a  href='/"&juhaoyongGetTopCategoryFolderName(rs("pid"))&"/"&rs("folder")&"' target='_blank'><img src='images/more.png'></a></div>"
	jhyArticleListHtml=jhyArticleListHtml&"</div>"
	jhyArticleListHtml=jhyArticleListHtml&"<div class='juhaoyongCommonUnitArticleList'>"
	jhyArticleListHtml=jhyArticleListHtml&"<table class='JHYBlockTable' width='100%' border='0' cellspacing='0' cellpadding='0'>"
		'内部循环（获取文章列表）开始
		set rs01=server.createobject("adodb.recordset")
		sql="select top "&web_ModelEdit&" title,file_path,[url],edit_time from [article]  where pid='"&rs("id")&"'  and view_yes=1  and ArticleType=1 order by [edit_time] desc"
		rs01.open(sql),cn,1,1
		if not rs01.eof then
			for i=1 to web_ModelEdit
				
				if rs01("url")<>"" then
				rs_url=rs01("url")
				else
				rs_url=ArticleContent_FolderName&"/"&rs01("file_path")
				end if
				
				if (juhaoyongi+2) mod 3 =0 then
				jhyArticleListHtml=jhyArticleListHtml&"<tr><td width='81%' class='ListTitle'><a href='"&rs_url&"' target='_blank' title='"&rs01("title")&"'>"&left(rs01("title"),25)&"</a></td>"
				jhyArticleListHtml=jhyArticleListHtml&"<td width='19%'><span>"&year(rs01("edit_time"))&"-"&month(rs01("edit_time"))&"-"&day(rs01("edit_time"))&"</span></td></tr>"
				else
				jhyArticleListHtml=jhyArticleListHtml&"<tr><td width='70%' class='ListTitle'><a href='"&rs_url&"' target='_blank' title='"&rs01("title")&"'>"&left(rs01("title"),12)&"</a></td>"
				jhyArticleListHtml=jhyArticleListHtml&"<td width='30%'><span>"&year(rs01("edit_time"))&"-"&month(rs01("edit_time"))&"-"&day(rs01("edit_time"))&"</span></td></tr>"
				end if
				rs01.movenext
			if rs01.eof then exit for
			next
		else
			jhyArticleListHtml=jhyArticleListHtml&"<tr><td>暂无信息。</td></tr>"
		end if
		rs01.close
		set rs01=nothing
		'内部循环（获取文章列表）结束
	jhyArticleListHtml=jhyArticleListHtml&"</table>"
	jhyArticleListHtml=jhyArticleListHtml&"</div>"
	jhyArticleListHtml=jhyArticleListHtml&"</div>"
	jhyArticleListHtml=jhyArticleListHtml&"<!--列表单元结束-->"
	rs.movenext
		juhaoyongi=juhaoyongi+1
	loop
	
	jhyArticleListHtml=jhyArticleListHtml&"</div>"
	jhyArticleListHtml=jhyArticleListHtml&"<!--jhyArticleListMainBlock end-->"
end if
rs.close
'外部循环结束

replace_code=replace(replace_code,"$jhyArticleListHtml$",jhyArticleListHtml)
'底部文章块列表（嵌套循环）结束

'友情链接
sql="select  [name],[url],[image],follow_yes from [web_link] where view_yes=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
	web_link=web_link&"<div class='HeightTab2 clearfix'></div>"
	web_link=web_link&"<div id='Links'>"
	web_link=web_link&"<span>友情链接：</span>"
	do while not rs.eof
		if rs("follow_yes")=1 then
		NoFollow="rel='nofollow'"
		else
		NoFollow=""
		end if 
		web_link=web_link&"<a href='"&rs("url")&"' target='_blank' "&NoFollow&">"&rs("name")&"</a>"
		rs.movenext
	loop
	web_link=web_link&"</div>"
else
	web_link=""
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$web_link$",web_link)
%>

<% '判断文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>

<%'声明HTML文件名,指定文件路径
filepath=Model_FolderName&"/index.html"
%>

<% '生成首页静态文件
Set fout = fso.CreateTextFile(Server.MapPath(filepath))
fout.WriteLine replace_code
fout.close
set fso=nothing
end function
%>