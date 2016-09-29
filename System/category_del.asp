<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->

<%
Call header()
%>

	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th width="100%" height=25 class='tableHeaderText'>删除栏目</th>
	
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
sql="select [id],[folder],image from [category] where id="&article_id
rs.open(sql),cn,1,1
if not rs.eof then
imageName=rs("image")
end if
rs.close
set rs=nothing

'如果该栏目下有子栏目需要先删除该栏目下的下级栏目

'判断文章
set rs_jhyDeleteArticle_rs=server.createobject("adodb.recordset")
sql_jhyDeleteArticle_sql="select [id] from [article] where cid='"&article_id&"' or pid='"&article_id&"' or ppid='"&article_id&"'"
rs_jhyDeleteArticle_rs.open(sql_jhyDeleteArticle_sql),cn,1,1

'判断招聘
set rs_jhyDeleteWebinfo_rs=server.createobject("adodb.recordset")
sql_jhyDeleteWebinfo_sql="select [id] from [web_info] where cid='"&article_id&"' or pid='"&article_id&"' or ppid='"&article_id&"'"
rs_jhyDeleteWebinfo_rs.open(sql_jhyDeleteWebinfo_sql),cn,1,1

'判断子目录
set rs=server.createobject("adodb.recordset")
sql="select [id] from [category] where pid="&article_id
rs.open(sql),cn,1,1

if not rs.eof then

	rs_jhyDeleteArticle_rs.close
	set rs_jhyDeleteArticle_rs=nothing
	
	rs_jhyDeleteWebinfo_rs.close
	set rs_jhyDeleteWebinfo_rs=nothing
	
	rs.close
	set rs=nothing
	
	response.Write "<script language='javascript'>alert('该栏目下存在子栏目，请先删除子栏目！');history.go(-1);</script>"

elseif not rs_jhyDeleteArticle_rs.eof then

	rs_jhyDeleteArticle_rs.close
	set rs_jhyDeleteArticle_rs=nothing
	
	rs_jhyDeleteWebinfo_rs.close
	set rs_jhyDeleteWebinfo_rs=nothing
	
	rs.close
	set rs=nothing
	
	response.Write "<script language='javascript'>alert('该栏目下存在内容，请先删除内容！');history.go(-1);</script>"
	
elseif not rs_jhyDeleteWebinfo_rs.eof then

	rs_jhyDeleteArticle_rs.close
	set rs_jhyDeleteArticle_rs=nothing
	
	rs_jhyDeleteWebinfo_rs.close
	set rs_jhyDeleteWebinfo_rs=nothing
	
	rs.close
	set rs=nothing
	
	response.Write "<script language='javascript'>alert('该栏目下存在内容，请先删除内容！');history.go(-1);</script>"
	
else
	rs_jhyDeleteArticle_rs.close
	set rs_jhyDeleteArticle_rs=nothing
	
	rs_jhyDeleteWebinfo_rs.close
	set rs_jhyDeleteWebinfo_rs=nothing
	
	rs.close
	
	sql="select [id],[folder],pid,ppid from [category] where id="&article_id
	rs.open(sql),cn,1,3

	if rs("ppid")=1 then
	FolderPath="/"&rs("folder")
	end if

	if rs("ppid")=2 then
	set rs2=server.createobject("adodb.recordset")
	sql="select [folder] from [category] where id="&rs("pid")
	rs2.open(sql),cn,1,1
	if not rs2.eof then
	FolderPath="/"&rs2("folder")&"/"&rs("folder")
	end if
	rs2.close 
	set rs2=nothing
	end if
	
	if rs("ppid")=3 then
	set rs3=server.createobject("adodb.recordset")
	sql="select [folder],pid from [category] where id="&rs("pid")
	rs3.open(sql),cn,1,1
	if not rs3.eof then
	set rs2=server.createobject("adodb.recordset")
	sql="select [folder] from [category] where id="&rs3("pid")
	rs2.open(sql),cn,1,1
	if not rs2.eof then
	
	FolderPath="/"&rs2("folder")&"/"&rs3("folder")&"/"&rs("folder")
	end if
	rs2.close 
	set rs2=nothing
	end if
	rs3.close 
	set rs3=nothing
	end if
	
	Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
	If Fso.FolderExists(Server.MapPath(FolderPath)) Then Fso.DeleteFolder(Server.MapPath(FolderPath))
	set fso=nothing
	
	rs.delete
	
	'先判断图片是否存在，否则删除
	FilePath=Server.MapPath("../css/juhaoyongfgstyle/"&imageName)
	Set fso=Server.CreateObject("Scripting.FileSystemObject")
	If fso.FileExists(FilePath) then fso.DeleteFile(FilePath)
	set fso=nothing
	
	response.Write "<script language='javascript'>alert('删除成功！');location.href='category_list.asp?page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
	rs.close
	set rs=nothing
end if
			%></td>
          </tr>
        </table>
	    </td>
	</tr>
	</table>


<%
Call DbconnEnd()
 %>