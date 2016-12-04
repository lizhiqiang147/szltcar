<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Article_list_to_html.asp" -->
<!-- #include file="../inc/x_to_html/post_index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Blank_Content_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Recruit_list_to_html.asp" -->
<!-- #include file="../inc/x_to_html/DrinkDrive_to_html.asp" -->
<!-- #include file="../inc/x_to_html/RentalProcess_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Case_List_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Search_index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/SiteMap_index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Article_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Product_to_html.asp" -->
<!-- #include file="../inc/x_to_html/order_index_to_html.asp" -->

	<%
Call header()
%>

<%'生成
'生成首页
call index_to_html()

'生成栏目
sql="select [id],ppid,ClassType,Html_Yes,index_push from [category]  order by [time] desc"
set rs_create=server.createobject("adodb.recordset")
rs_create.open(sql),cn,1,1
if not rs_create.eof then
do while not rs_create.eof
ClassID=rs_create("id")

'文章
if rs_create("ClassType")=1 then
call Article_list_to_html(ClassID)
end if

'产品
if rs_create("ClassType")=2 then
call Case_List_to_html(ClassID)
end if

'招聘
if rs_create("ClassType")=4 then
call Recruit_list_to_html(ClassID)
end if

'酒后代驾
if rs_create("ClassType")=6 then
call DrinkDrive_to_html(ClassID)
end if

'租车流程
if rs_create("ClassType")=7 then
call RentalProcess_to_html(ClassID)
end if



rs_create.movenext
loop
end if
rs_create.close
set rs_create=nothing

'生成留言首页及列表
call post_index_to_html()

'生成搜索页
call search_index_to_html()

'生成网站地图
call SiteMap_to_html()

'生成订单页面
call order_index_to_html()


'生成资讯文章
sql="select [id],[ArticleType] from [article]  where view_yes=1 order by [time] desc"
set rs_create=server.createobject("adodb.recordset")
rs_create.open(sql),cn,1,1
do while not rs_create.eof 
a_id=rs_create("id")
select case rs_create("ArticleType")
case 1
call article_to_html(a_id)
case 2
call Product_to_html(a_id)
end select
rs_create.movenext
loop
rs_create.close
set rs_create=nothing



response.Write "	<table cellpadding=3 cellspacing=1 border=0 class=tableBorder align=center>"
response.Write "	<tr>"
response.Write "	  <th width=100% height=25 class='tableHeaderText'>生成所有页面（生成后，请到前台&nbsp;按F5刷新&nbsp;查看效果）</th>"
response.Write "	<tr><td height=400 valign=top  class='forumRow'><br>"
response.Write "	    <table width=90% border=0 align=center cellpadding=0 cellspacing=0>"
response.Write "          <tr>"
response.Write "            <td height=25 class=TitleHighlight3></td>"
response.Write "          </tr>"
response.Write "          <tr>"
response.Write "            <td height=100><div align=center>"
response.Write "              <font color=red><b>所有页面生成成功！&nbsp;请到前台&nbsp;按F5&nbsp;刷新查看。</b></font>"
response.Write "           </div></td>"
response.Write "          </tr>"
response.Write "        </table>"
response.Write "	    </td>"
response.Write "	</tr>"
response.Write "	</table>"

%>



<%
Call DbconnEnd()
 %>