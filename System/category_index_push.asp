<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->

	<%
Call header()
%>


	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th width="100%" height=25 class='tableHeaderText'>首页栏目推荐</th>
	
	<tr><td height="400" valign="top"  class='forumRow'><br>
	    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" bgcolor="#B1CFF8"><div align="center"></div></td>
          </tr>
          <tr>
            <td height="100">
<%
category_id=cint(request.querystring("id"))
set rs=server.createobject("adodb.recordset")
sql="select id,index_push from category where id="&category_id&""
rs.open(sql),cn,1,3
	if rs("index_push")=1 then
	rs("index_push")=0
	else
	rs("index_push")=1
	end if
rs.update
rs.close
set rs=nothing

call index_to_html()
response.Write "<script language='javascript'>alert('修改成功！');location.href='category_list.asp?page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
			%></td>
          </tr>
        </table>
	    </td>
	</tr>
	</table>


<%
Call DbconnEnd()
 %>