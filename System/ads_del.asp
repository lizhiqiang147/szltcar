<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->

	<%
Call header()
%>


	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th width="100%" height=25 class='tableHeaderText'>ɾ��ͼƬ</th>
	
	<tr><td height="400" valign="top"  class='forumRow'><br>
	    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" bgcolor="#B1CFF8"><div align="center"></div></td>
          </tr>
          <tr>
            <td height="100">
			<%page=request.querystring("page")
			act=request.querystring("act")
			keywords=request.querystring("keywords")
			article_id=cint(request.querystring("id"))
			set rs=server.createobject("adodb.recordset")
sql="select id,image from web_ads where id="&article_id&""
rs.open(sql),cn,1,3
imageName=rs("image")
rs.delete
rs.close
set rs=nothing

'���ж�ͼƬ�Ƿ���ڣ�����ɾ��
FilePath=Server.MapPath("../css/juhaoyongfgstyle/"&imageName)
Set fso=Server.CreateObject("Scripting.FileSystemObject")
If fso.FileExists(FilePath) then fso.DeleteFile(FilePath)
set fso=nothing

call index_to_html()
response.Write "<script language='javascript'>alert('ɾ���ɹ���');location.href='ads_list.asp?page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
			%></td>
          </tr>
        </table>
	    </td>
	</tr>
	</table>


<%
Call DbconnEnd()
 %>