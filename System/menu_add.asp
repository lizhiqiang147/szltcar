<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<% '添加数据到数据表
act=Request("act")
If act="save" Then 
l_name=trim(request.form("name"))
l_url=trim(request.form("url"))
l_position=trim(request.form("position"))
l_order=trim(request.form("order"))
l_time=now()

set rs=server.createobject("adodb.recordset")
sql="select * from web_menu"
rs.open(sql),cn,1,3
rs.addnew
rs("name")=l_name
rs("url")=l_url
rs("position")=l_position
if l_order<>"" then
rs("order")=cint(l_order)
end if
rs("time")=l_time

rs.update
rs.close
set rs=nothing
call index_to_html()
response.Write "<script language='javascript'>alert('添加成功！');location.href='menu_list.asp';</script>"
end if 
 %>
 

	<%
Call header()

%>

  <form id="form1" name="form1" method="post" action="?act=save">
         <script language='javascript'>
function checksignup1() {
if ( document.form1.name.value == '' ) {
window.alert('请输入导航名称^_^');
document.form1.name.focus();
return false;}

if ( document.form1.position.value == '' ) {
window.alert('请选择一级导航^_^');
document.form1.position.focus();
return false;}

if(document.form1.order.value.search(/^([0-9]*)([.]?)([0-9]*)$/)   ==   -1)   
      {   
  window.alert("排序只能是数字^_^");   
document.form1.order.focus();
return false;}

return true;}
</script>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>添加二级导航</th>
	
	<tr>
	    <td class='forumRowHighLight' height=23>所属一级导航<span class="forumRowHighLight"> (必选) </span></td>
	    <td class='forumRowHighLight'><label>
	      <select name="position" id="position">
	       <% set rsp=server.createobject("adodb.recordset")
		   sql="select id,name from web_menu_type where TopNav=1 order by [order]"
		   rsp.open(sql),cn,1,1
		   if not rsp.eof and not rsp.bof then
		   do while not rsp.eof 
		   %> <option value="<%=rsp("id")%>"><%=rsp("name")%></option>
            <%
			rsp.movenext
			loop
			end if
			rsp.close
			set rsp=nothing%></select>
	    </label></td>
    </tr>
	<tr>
	<td width="15%" height=23 class='forumRowHighLight'>导航名称（必填）</td>
	<td class='forumRowHighLight'><input name='name' type='text' id='name' size='70'>
	  &nbsp;</td>
	</tr>
	  <tr>
	    <td class='forumRowHighLight' height=23>导航链接（必填）</td>
	    <td class='forumRowHighLight'><input name='url' type='text' id='url' size='70'>
		<br />
		<font color="#FF0000"><strong>（1）格式如：/About/Intro/（要同“内容管理>>栏目内容管理”中的栏目层级以及“栏目文件夹名称”保持一致）</strong></font><br />
		小窍门：先在“内容管理>>栏目内容管理”中，点击对应的栏目名称，在打开的网址中，把域名后面的部分拷贝到这里即可。<br />
		如：http://www.baidu.com/About/Intro/  拷贝/About/Intro/到这里（不要带空格）。<br />
		<font color="#FF0000"><strong>（2）如果是外链（即：导航链接到其他网站），填写格式如：http://www.baidu.com</strong></font><br /><br />
		</td>
      </tr>
	  
	  
	  <tr>
	    <td class='forumRowHighLight' height=23>排序</td>
	    <td class='forumRowHighLight'><span class="forumRow">
	      <input name='order' type='text' id='order' value="1" size='20'>
	    &nbsp;只能是数字，数字越小排名越靠前</span></td>
      </tr>
	  
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form>

<%
Call DbconnEnd()
 %>