<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/RentalProcess_to_html.asp" -->
	<%
Call header()
%>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th width="100%" height=25 class='tableHeaderText'>删除文章</th>
	
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

juhaoyongListDelStringPid=""
juhaoyongListDelStringPpid=""

if request("action")="AllDel" then
	Num=request.form("Selectitem").count 
	if Num=0 then 
	response.Write "<script language='javascript'>alert('请选择要删除的数据！');location.href='RentalProcess_list.asp?page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
	Response.End 
	end if 
	Selectitem=request.Form("Selectitem") 
	article_id=split(Selectitem,",")
	c=ubound(article_id)
	for i=0 to c		
	set rs=server.createobject("adodb.recordset")
	sql="select id,cid,pid,ppid from web_info where id="&cint(article_id(i))&""
	rs.open(sql),cn,1,3
	ClassID=rs("cid")
	
	if trim(rs("pid"))<>"" and rs("pid")<>tempJuhaoyongPid then
	juhaoyongListDelStringPid=juhaoyongListDelStringPid&rs("pid")&","
	end if
	
	if trim(rs("ppid"))<>"" and rs("ppid")<>tempJuhaoyongPpid then
	juhaoyongListDelStringPpid=juhaoyongListDelStringPpid&rs("ppid")&","
	end if
	
	tempJuhaoyongPid=rs("pid")
	tempJuhaoyongPpid=rs("ppid")
	
	rs.delete
	rs.close
	set rs=nothing
	
	next

else
	article_id=cint(request.querystring("id"))
	set rs=server.createobject("adodb.recordset")
	sql="select id,cid,pid,ppid from web_info where id="&article_id&""
	rs.open(sql),cn,1,3
	ClassID=rs("cid")
	juhaoyongClassPid=rs("pid")
	juhaoyongClassPpid=rs("ppid")
	rs.delete
	rs.close
	set rs=nothing
end if

'重新生成列表页开始

'重新生成一级列表页
call RentalProcess_to_html(ClassID)

'批量删除，重新生成二级目录列表
if trim(juhaoyongListDelStringPid)<>"" then
jhyListDelArrayPid=split(juhaoyongListDelStringPid,",")
	for juhaoyong_ii=0 to ubound(jhyListDelArrayPid)
		if trim(jhyListDelArrayPid(juhaoyong_ii))<>"" then
		call RentalProcess_to_html(jhyListDelArrayPid(juhaoyong_ii))
		end if
	next	
end if

'批量删除，重新生成三级目录列表
if trim(juhaoyongListDelStringPpid)<>"" then
jhyListDelArrayPpid=split(juhaoyongListDelStringPpid,",")
	for juhaoyong_ii=0 to ubound(jhyListDelArrayPpid)
		if trim(jhyListDelArrayPpid(juhaoyong_ii))<>"" then
		call RentalProcess_to_html(jhyListDelArrayPpid(juhaoyong_ii))
		end if
	next	
end if

'单个删除，判断二级目录id是否重复或空，并生成二级目录列表
if trim(juhaoyongClassPid)<>"" then
call RentalProcess_to_html(juhaoyongClassPid)
end if

'单个删除，判断三级目录id是否重复或空，并生成三级目录列表
if trim(juhaoyongClassPpid)<>"" then
call RentalProcess_to_html(juhaoyongClassPpid)
end if

'重新生成列表页结束

juhaoyong_cid=request.QueryString("juhaoyong_cid")
juhaoyong_pid=request.QueryString("juhaoyong_pid")
juhaoyong_ppid=request.QueryString("juhaoyong_ppid")

if juhaoyong_ppid>0 then
response.Write "<script language='javascript'>alert('删除成功！');location.href='RentalProcess_list.asp?ppid="&juhaoyong_ppid&"&page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
elseif juhaoyong_pid>0 then
response.Write "<script language='javascript'>alert('删除成功！');location.href='RentalProcess_list.asp?pid="&juhaoyong_pid&"&page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
elseif juhaoyong_cid>0 then
response.Write "<script language='javascript'>alert('删除成功！');location.href='RentalProcess_list.asp?cid="&juhaoyong_cid&"&page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
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