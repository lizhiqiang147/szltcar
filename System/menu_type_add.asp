<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->

<% '�������ݵ����ݱ�
act=Request("act")
If act="save" Then 
l_name=trim(request.form("name"))
l_url=trim(request.form("url"))
l_order=trim(request.form("order"))
l_TopNav=1
l_time=now()



set rs=server.createobject("adodb.recordset")
sql="select * from web_menu_type"
rs.open(sql),cn,1,3
rs.addnew
rs("name")=l_name
rs("url")=l_url
rs("number")=1
if l_order<>"" then
rs("order")=l_order
end if
rs("TopNav")=l_TopNav
rs("BottomNav")=l_BottomNav
rs("OtherNav")=l_OtherNav
rs("time")=l_time

rs.update
rs.close
set rs=nothing
call index_to_html()
response.Write "<script language='javascript'>alert('���ӳɹ���');location.href='menu_type_list.asp';</script>"
end if 
 %>
 

	<%
Call header()

%>

  <form id="form1" name="form1" method="post" action="?act=save">
         <script language='javascript'>
function checksignup1() {
if ( document.form1.name.value == '' ) {
window.alert('�������������^_^');
document.form1.name.focus();
return false;}

if(document.form1.order.value.search(/^([0-9]*)([.]?)([0-9]*)$/)   ==   -1){   
window.alert("����ֻ��������^_^");   
document.form1.order.focus();
return false;}

return true;}
</script>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>����һ������</th>
	<tr>
	<td width="15%" height=23 class='forumRowHighLight'>�������ƣ����</td>
	<td width="85%" class='forumRowHighLight'><input name='name' type='text' id='name' size='70' maxlength="30">
	  &nbsp;</td>
	</tr>

	  <tr>
	    <td class='forumRowHighLight' height=23>�������ӣ����</td>
	    <td class='forumRowHighLight'><input name='url' type='text' id='url' size='70'>
		<br />
		<font color="#FF0000"><strong>��1����ʽ�磺/About/��Ҫͬ�����ݹ���>>��Ŀ���ݹ������е���Ŀ�㼶�Լ�����Ŀ�ļ������ơ�����һ�£�</strong></font><br />
		С���ţ����ڡ����ݹ���>>��Ŀ���ݹ������У������Ӧ����Ŀ���ƣ��ڴ򿪵���ַ�У�����������Ĳ��ֿ��������Ｔ�ɡ�<br />
		�磺http://www.baidu.com/About/  ����/About/�������Ҫ���ո񣩡�<br />
		<font color="#FF0000"><strong>��2������������������������ӵ�������վ������д��ʽ�磺http://www.baidu.com</strong></font><br /><br />
		</td>
      </tr>
	  
	  <tr>
	  <td class='forumRowHighLight' height=11>����</td>
	  <td class='forumRowHighLight'><input name='order' type='text' id='order' value="1" size='20' maxlength="2">
ֻ�������֣�����ԽС����Խ��ǰ</td>
	  </tr>

	<tr><td height="50" colspan=2  class='forumRow'>
	<div align="center">
	  <INPUT type=submit value='�ύ' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form>

<%
Call DbconnEnd()
 %>