<!-- #include file="../juhaoyongConst.asp" -->
<!-- #include file="../html_clear.asp" -->
<!-- #include file="../juhaoyongKefuFunction.asp" -->
<%juhaoyong_kefu_html_code_string=juhaoyongKefuHtmlCode()%>

<%'容错处理
function Product_to_html(a_id)
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

'文章内容文件夹获取
sql="select FileName,FolderName from web_Models_type where [id]=5"
rs.open(sql),cn,1,1
if not rs.eof and rs("FolderName")<>"" then
ArticleContent_FolderName="/"&rs("FolderName")
end if
rs.close

'模板类型获取
sql="select FileName,FolderName from web_Models_type where [id]=6"
rs.open(sql),cn,1,1
if not rs.eof then
Model_FileName=rs("FileName")
if rs("FolderName")<>"" then
Model_FolderName="/"&rs("FolderName")
ProductContent_FolderName="/"&rs("FolderName")
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

'热点产品
sql="select top 1  [id] from [category] where ClassType=2 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
NewsID=rs("id")
end if
rs.close

sql="select top 8 title,content,file_path,[url],time from [article]  where  cid='"&NewsID&"'  and view_yes=1  and ArticleType=2 order by [Hit] desc"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
Block01_LeftItem=Block01_LeftItem&"<dl>"
for i=1 to 8
rs_url=""
if rs("url")<>"" then
rs_url=rs("url")
else
rs_url=ProductContent_FolderName&"/"&rs("file_path")
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


<%
'文章内容读取开始
sql="select * from [article] where [id]="&a_id&" and view_yes=1"
rs.open(sql),cn,1,1
if not rs.eof then
juhaoyongArticleContentCid=rs("cid")
juhaoyongArticleContentPid=rs("pid")
juhaoyongArticleContentPPid=rs("ppid")
if juhaoyongArticleContentCid="" then juhaoyongArticleContentCid="0"
if juhaoyongArticleContentPid="" then juhaoyongArticleContentPid="0"
if juhaoyongArticleContentPPid="" then juhaoyongArticleContentPPid="0"
article_title=rs("title")
ArticleContent=rs("content")
article_keywords=rs("keywords")
article_description=rs("description")
article_short=left(rs("description"),100)&"..."
article_from_url=rs("from_url")
article_time=rs("time")
article_from_name=rs("from_name")
article_time=rs("edit_time")
article_count=rs("comment")

article_date=rs("SalePrice")
if trim(article_date)="" or IsNull(article_date)=true then
article_date=""
else
article_date="<li><span>品牌：</span>"&article_date&"</li>"
end if

article_place=rs("SaleCount")
if trim(article_place)="" or IsNull(article_place)=true then
article_place=""
else
article_place="<li><span>型号：</span>"&article_place&"</li>"
end if

article_wine=rs("wine")
if trim(article_wine)="" or IsNull(article_wine)=true then
article_wine=""
else
article_wine="<li class='MPrice'><span>市场价：</span>"&article_wine&" 元</li>"
end if

article_net=rs("net")
if trim(article_net)="" or IsNull(article_net)=true then
article_net=""
else
article_net="<li class='NPrice'><span>优惠价：</span>"&article_net&" 元</li>"
end if

product_order_show=rs("product_order_show")
if product_order_show=1 then
HTML_product_order_show="<a onclick="&Chr(34)&"showPopWin('/order/index.asp?id="&a_id&"', 800, 500, null);"&Chr(34)&" href='#'><img src='/css/"&web_theme&"/order_img.gif' alt='提交订单' border=0></a>&nbsp;&nbsp;&nbsp;&nbsp;"
else
HTML_product_order_show=""
end if

product_tbbuy_url=rs("product_tbbuy_url")
if trim(product_tbbuy_url)="" or IsNull(product_tbbuy_url)=true then
HTML_product_tbbuy_url=""
else
HTML_product_tbbuy_url="<a href="&product_tbbuy_url&" target=_blank><img src='/css/"&web_theme&"/tb_to_buy.gif' alt='去淘宝拍' border=0></a>"
end if

Article_FilePath=rs("file_path")
article_url=ProductContent_FolderName&"/"&rs("file_path")
if rs("image")<>"" then
article_image=rs("image")
else
article_image="nophoto.jpg"
end if

juhaoyongMoreCid=rs("cid")'用于下面的“更多产品”

end if 
rs.close
'文章内容读取结束

'您现在的位置开始
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

if juhaoyongArticleContentPPid<>"" then
sql="select [id],[pid],[ppid],[name],[folder] from [category] where [id]="&juhaoyongArticleContentPPid&" and ppid=3"
rs.open(sql),cn,1,1
folder_path=folder_path&rs("folder")&"/"
category_position=category_position&" > <a href='"&folder_path&"'>"&rs("name")&"</a>"
rs.close
end if
'您现在的位置结束


'更多产品
sql="select top 6 [title],file_path,[net],[image] from [article] where ArticleType=2 and cid='"&juhaoyongMoreCid&"' and id<>"&a_id&" and view_yes=1 order by [edit_time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
juhaoyongi=0

MorePro_List=MorePro_List&"<div class='MorePro'>"
do while not rs.eof 
rs_url=""
rs_url=ProductContent_FolderName&"/"&rs("file_path")

	if (juhaoyongi mod 3 =0) and juhaoyongi>0 then
	MorePro_List=MorePro_List&"</DIV><div class='clearfix'></div><DIV class=MorePro>"
	end if

	MorePro_List=MorePro_List&"<div class='albumblock'>"
	MorePro_List=MorePro_List&"<div class='inner'><a href='"&rs_url&"' target='_blank'><img src='/images/up_images/"&rs("image")&"' /></a></div>"
	MorePro_List=MorePro_List&"<div class='albumtitle'><a href='"&rs_url&"' target='_blank'>"&rs("title")&"</a></div>"
	if rs("net")<>"" then
	MorePro_List=MorePro_List&"<DIV class='boxPrice'>&#165;"&rs("net")&"</DIV>"
	end if
	MorePro_List=MorePro_List&"</div>"

rs.movenext
juhaoyongi=juhaoyongi+1
loop
MorePro_List=MorePro_List&"</div>"

else
MorePro_List=MorePro_List&"暂无更多。"
end if 
rs.close

'侧边栏当前栏目列表
Block_LeftClassList=""
sql="select [name],[folder],[id],[pid],[ppid] from [category] where pid="&ClassID&" order by [order] "
rs.open(sql),cn,1,1
Block_LeftClassList=Block_LeftClassList&"<ul id='suckertree1'>"
if not rs.eof then
for i=1 to rs.recordcount

if rs("id")=cint(juhaoyongArticleContentPid) then
Block_LeftClassList=Block_LeftClassList&"<li class='current'><A href='/"&ClassFolder1&"/"&rs("Folder")&"'>"&rs("name")&"</A> "
else
Block_LeftClassList=Block_LeftClassList&"<li><A href='/"&ClassFolder1&"/"&rs("Folder")&"'>"&rs("name")&"</A> "
end if

	set rs002=server.createobject("adodb.recordset")
	sql="select [id],[name],[folder] from [category] where ppid=3 and pid="&rs("id")&" order by [order] "
	rs002.open(sql),cn,1,1
	if not rs002.eof then
	Block_LeftClassList=Block_LeftClassList&"<ul>"
	do while not rs002.eof
		if rs002("id")=cint(juhaoyongArticleContentPPid) then
		Block_LeftClassList=Block_LeftClassList&"<li class='current3juhaoyong'><a href='/"&ClassFolder1&"/"&rs("Folder")&"/"&rs002("folder")&"/' target='_blank' >"&rs002("name")&"</a></li> "
		else
		Block_LeftClassList=Block_LeftClassList&"<li><a href='/"&ClassFolder1&"/"&rs("Folder")&"/"&rs002("folder")&"/' target='_blank' >"&rs002("name")&"</a></li> "
		end if
	rs002.movenext
	loop
	Block_LeftClassList=Block_LeftClassList&"</ul>"
	end if
	rs002.close
	set rs002=nothing
	
Block_LeftClassList=Block_LeftClassList&"</li> "
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

replace_code=replace(replace_code,"$article_kw$",article_kw)
replace_code=replace(replace_code,"$article_refer$",article_refer)
replace_code=replace(replace_code,"$category_position$",category_position)
replace_code=replace(replace_code,"$MorePro_List$",MorePro_List)
replace_code=replace(replace_code,"$Block_LeftClassList$",Block_LeftClassList)
replace_code=replace(replace_code,"$ClassName1$",ClassName1)
replace_code=replace(replace_code,"$ClassFolder1$",ClassFolder1)

replace_code=replace(replace_code,"$article_id$",a_id) 
replace_code=replace(replace_code,"$article_title$",article_title)
replace_code=replace(replace_code,"$article_keywords$",article_keywords)
replace_code=replace(replace_code,"$article_description$",article_description)
replace_code=replace(replace_code,"$article_image$",article_image)
replace_code=replace(replace_code,"$article_time$",article_time)
replace_code=replace(replace_code,"$article_from_name$",article_from_name)
replace_code=replace(replace_code,"$article_content$",ArticleContent)
replace_code=replace(replace_code,"$PageList$","")
replace_code=replace(replace_code,"$article_date$",article_date)
replace_code=replace(replace_code,"$article_place$",article_place)
replace_code=replace(replace_code,"$article_short$",article_short)
replace_code=replace(replace_code,"$article_wine$",article_wine)
replace_code=replace(replace_code,"$article_net$",article_net)
replace_code=replace(replace_code,"$HTML_product_order_show$",HTML_product_order_show)
replace_code=replace(replace_code,"$HTML_product_tbbuy_url$",HTML_product_tbbuy_url)
replace_code=replace(replace_code,"$article_url$",article_url)

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