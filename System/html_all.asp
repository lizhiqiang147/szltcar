<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Article_list_to_html.asp" -->
<!-- #include file="../inc/x_to_html/post_index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Blank_Content_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Recruit_list_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Case_List_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Search_index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/SiteMap_index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Article_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Product_to_html.asp" -->
<!-- #include file="../inc/x_to_html/order_index_to_html.asp" -->

	<%
Call header()
%>

<%'����
'������ҳ
call index_to_html()

'������Ŀ
sql="select [id],ppid,ClassType,Html_Yes,index_push from [category]  order by [time] desc"
set rs_create=server.createobject("adodb.recordset")
rs_create.open(sql),cn,1,1
if not rs_create.eof then
do while not rs_create.eof
ClassID=rs_create("id")

'����
if rs_create("ClassType")=1 then
call Article_list_to_html(ClassID)
end if

'��Ʒ
if rs_create("ClassType")=2 then
call Case_List_to_html(ClassID)
end if

'��Ƹ
if rs_create("ClassType")=4 then
call Recruit_list_to_html(ClassID)
end if

'��ҳ
if rs_create("ClassType")=5  then
call Blank_Content_to_html(ClassID)
end if

rs_create.movenext
loop
end if
rs_create.close
set rs_create=nothing

'����������ҳ���б�
call post_index_to_html()

'��������ҳ
call search_index_to_html()

'������վ��ͼ
call SiteMap_to_html()

'���ɶ���ҳ��
call order_index_to_html()


'������Ѷ����
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
response.Write "	  <th width=100% height=25 class='tableHeaderText'>��������ҳ�棨���ɺ��뵽ǰ̨&nbsp;��F5ˢ��&nbsp;�鿴Ч����</th>"
response.Write "	<tr><td height=400 valign=top  class='forumRow'><br>"
response.Write "	    <table width=90% border=0 align=center cellpadding=0 cellspacing=0>"
response.Write "          <tr>"
response.Write "            <td height=25 class=TitleHighlight3></td>"
response.Write "          </tr>"
response.Write "          <tr>"
response.Write "            <td height=100><div align=center>"
response.Write "              <font color=red><b>����ҳ�����ɳɹ���&nbsp;�뵽ǰ̨&nbsp;��F5&nbsp;ˢ�²鿴��</b></font>"
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