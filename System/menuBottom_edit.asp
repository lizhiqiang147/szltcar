<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<% '添加数据到数据表
page=request.querystring("page")
act=request.querystring("act")
keywords=request.querystring("keywords")
article_id=cint(request.querystring("id"))


act1=Request("act1")
If act1="save" Then 
l_id=trim(request.form("l_id"))
l_name=trim(request.form("name"))
l_url=trim(request.form("url"))
l_order=trim(request.form("order"))
l_BottomNav=1


set rs=server.createobject("adodb.recordset")
sql="select * from web_menu_type where id="&l_id&""
rs.open(sql),cn,1,3
rs("name")=l_name
rs("url")=l_url
rs("number")=1
if l_order<>"" then
rs("order")=l_order
end if
rs("TopNav")=l_TopNav
rs("BottomNav")=l_BottomNav
rs("OtherNav")=l_OtherNav
rs.update
rs.close
set rs=nothing
call index_to_html()
response.Write "<script language='javascript'>alert('修改成功！');location.href='menuBottom_list.asp?page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
end if 
 %>
 

	<%
Call header()

%>
<% set rs=server.createobject("adodb.recordset")
sql="select * from web_menu_type where id="&article_id&""
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then%>
  <form id="form1" name="form1" method="post" action="?act1=save&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">
         <script language='javascript'>
function checksignup1() {
if ( document.form1.name.value == '' ) {
window.alert('请输入分类名称^_^');
document.form1.name.focus();
return false;}

if(document.form1.order.value.search(/^([0-9]*)([.]?)([0-9]*)$/)   ==   -1){   
window.alert("排序只能是数字^_^");   
document.form1.order.focus();
return false;}

return true;}
</script>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>修改底部导航</th>
	<tr>
	<td width="15%" height=23 class='forumRowHighLight'>导航名称（必填）</td>
	<td width="85%" class='forumRowHighLight'><input name='name' type='text' id='name'  value="<%=rs("name")%>" size='70'>
	 <input name='l_id' type='hidden' id='l_id' value="<%=rs("id")%>" size='70'>
	  &nbsp;</td>
	</tr>

	  <tr>
	    <td class='forumRowHighLight' height=23>导航链接（必填）</td>
	    <td class='forumRowHighLight'><input name='url' type='text' id='url' value="<%=rs("url")%>" size='70'>
		<br />
		<font color="#FF0000"><strong>（1）格式如：/About/（要同“内容管理>>栏目内容管理”中的栏目层级以及“栏目文件夹名称”保持一致）</strong></font><br />
		小窍门：先在“内容管理>>栏目内容管理”中，点击对应的栏目名称，在打开的网址中，把域名后面的部分拷贝到这里即可。<br />
		如：http://www.baidu.com/About/  拷贝/About/到这里（不要带空格）。<br />
		<font color="#FF0000"><strong>（2）如果是外链（即：导航链接到其他网站），填写格式如：http://www.baidu.com</strong></font><br /><br />
		</td>
      </tr>

	<tr>
	  <td class='forumRowHighLight' height=11>排序</td>
	  <td class='forumRowHighLight'><input name='order' type='text' id='order' size='20' maxlength="2" value="<%=rs("order")%>">
只能是数字，数字越小排名越靠前</td>
	  </tr>
	<tr>

	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form>
<%
else
response.write"未找到数据"
end if%>
<%
Call DbconnEnd()
 %>