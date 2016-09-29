<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/rand.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/article_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Article_list_to_html.asp" -->

<% '更新数据到数据表
page=request.querystring("page")
act=request.querystring("act")
keywords=request.querystring("keywords")
article_id=cint(request.querystring("id"))



act1=Request("act1")
If act1="save" Then 
a_id=cint(request.form("a_id"))
a_title=request.form("a_title")
a_cid=trim(request.form("cid"))
a_pid=trim(request.form("pid"))
a_ppid=trim(request.form("ppid"))
a_url=trim(request.form("a_url"))
a_image=trim(request.form("web_image"))
a_Files=trim(request.form("Files"))
a_keywords=trim(request.form("a_keywords"))
a_description=trim(request.form("a_description"))
a_content=request.form("a_content")
a_from_name=trim(request.form("a_from_name"))
a_from_url=trim(request.form("a_from_url"))
a_author=trim(request.form("a_author"))
a_hit=trim(request.form("a_hit"))
a_index_push=0
a_slide_yes=cint(request.form("slide_yes"))
a_special_yes=cint(request.form("special_yes"))
juhaoyongEditTime=trim(request.form("juhaoyongEditTime"))

'修改文章
set rs=server.createobject("adodb.recordset")
sql="select * from [article] where id="&a_id&""
rs.open(sql),cn,1,3
juhaoyong_a_cid=rs("cid")
juhaoyong_a_pid=rs("pid")
juhaoyong_a_ppid=rs("ppid")

rs("title")=a_title
rs("ArticleType")=1
rs("cid")=a_cid
rs("pid")=a_pid
rs("ppid")=a_ppid
rs("url")=a_url
rs("image")=a_image
rs("Files")=a_Files
rs("keywords")=a_keywords
rs("description")=a_description
rs("content")=a_content
rs("from_name")=a_from_name
rs("from_url")=a_from_url
rs("author")=a_author
rs("hit")=a_hit
rs("index_push")=a_index_push
'rs("slide_yes")=a_slide_yes
'rs("special_yes")=a_special_yes
rs("headline")=a_headline
rs("edit_time")=juhaoyongEditTime
rs.update
rs.close
set rs=nothing
%>

<%
'生成文章静态页和首页
call article_to_html(a_id)
call index_to_html()

'根据分类变化情况生成各级别列表页
if juhaoyong_a_cid<>a_cid then
	if a_cid<>"" then call Article_list_to_html(a_cid)
	if juhaoyong_a_cid<>"" then call Article_list_to_html(juhaoyong_a_cid)
else
	if a_cid<>"" then call Article_list_to_html(a_cid)
end if

if juhaoyong_a_pid<>a_pid then
	if a_pid<>"" then call Article_list_to_html(a_pid)
	if juhaoyong_a_pid<>"" then call Article_list_to_html(juhaoyong_a_pid)
else
	if a_pid<>"" then call Article_list_to_html(a_pid)
end if

if juhaoyong_a_ppid<>a_ppid then
	if a_ppid<>"" then call Article_list_to_html(a_ppid)
	if juhaoyong_a_ppid<>"" then call Article_list_to_html(juhaoyong_a_ppid)
else
	if a_ppid<>"" then call Article_list_to_html(a_ppid)
end if

%>

<%
juhaoyong_cid=request.QueryString("juhaoyong_cid")
juhaoyong_pid=request.QueryString("juhaoyong_pid")
juhaoyong_ppid=request.QueryString("juhaoyong_ppid")
response.Write "<script language='javascript'>alert('修改成功！');location.href='article_list.asp?cid="&juhaoyong_cid&"&pid="&juhaoyong_pid&"&ppid="&juhaoyong_ppid&"&page="&page&"&act="&act&"&keywords="&keywords&"';</script>"

end if 
%>
  	<script charset="utf-8" src="Keditor/kindeditor.js"></script>
	<script charset="utf-8" src="Keditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="Keditor/editor.js"></script>

 <!-- 三级联动菜单 开始 -->
<script language="JavaScript">
<!--
<%
'二级数据保存到数组
Dim count2,rsc2,sqlClass2
set rsc2=server.createobject("adodb.recordset")
sqlClass2="select id,pid,ppid,name from category where ppid=2 and ClassType=1 order by id " 
rsc2.open sqlClass2,cn,1,1
%>
var subval2 = new Array();
//数组结构：一级根值,二级根值,二级显示值
<%
count2 = 0
do while not rsc2.eof
%>
subval2[<%=count2%>] = new Array('<%=rsc2("pID")%>','<%=rsc2("ID")%>','<%=rsc2("Name")%>')
<%
count2 = count2 + 1
rsc2.movenext
loop
rsc2.close
%>

<%
'三级数据保存到数组
Dim count3,rsc3,sqlClass3
set rsc3=server.createobject("adodb.recordset")
sqlClass3="select id,pid,ppid,name from category where ppid=3 and ClassType=1 order by id" 
rsc3.open sqlClass3,cn,1,1
%>
var subval3 = new Array();
//数组结构：二级根值,三级根值,三级显示值
<%
count3 = 0
do while not rsc3.eof
%>
subval3[<%=count3%>] = new Array('<%=rsc3("pID")%>','<%=rsc3("ID")%>','<%=rsc3("Name")%>')
<%
count3 = count3 + 1
rsc3.movenext
loop
rsc3.close
%>

function changeselect1(locationid)
{
    document.form1.pid.length = 0;
    document.form1.pid.options[0] = new Option('选择二级分类','');
    for (i=0; i<subval2.length; i++)
    {
        if (subval2[i][0] == locationid)
        {document.form1.pid.options[document.form1.pid.length] = new Option(subval2[i][2],subval2[i][1]);}
    }
}

//-->
</script><!-- 三级联动菜单 结束 -->
	<%
Call header()

%>

         <script language='javascript'>
function checksignup1() {
if ( document.form1.a_title.value == '' ) {
window.alert('请输入文章标题^_^');
document.form1.a_title.focus();
return false;}

if ( document.form1.cid.value == '' ) {
window.alert('请选择分类^_^');
document.form1.cid.focus();
return false;}
return true;}
</script>
<%
juhaoyong_cid=request.QueryString("juhaoyong_cid")
juhaoyong_pid=request.QueryString("juhaoyong_pid")
juhaoyong_ppid=request.QueryString("juhaoyong_ppid")
%>
<%
      
			set rs=server.createobject("adodb.recordset")
sql="select * from [article] where id="&article_id&""
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
%>  <form id="form1" name="form1" method="post" action="?act1=save&juhaoyong_cid=<%=juhaoyong_cid%>&juhaoyong_pid=<%=juhaoyong_pid%>&juhaoyong_ppid=<%=juhaoyong_ppid%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">

	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>修改文章</th>
	<tr>
	  <td height=23 colspan="2" class='forumRow'><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" class='TipTitle'>&nbsp;√ 操作提示</td>
        </tr>
        <tr>
          <td height="30" valign="top" class="TipWords"><p>1、通过调整更新时间（在编辑框最下面），可以调整显示顺序。</p>
            </td>
        </tr>
        <tr>
          <td height="10">&nbsp;</td>
        </tr>
      </table></td>
	  </tr>
	<tr>
	<td width="15%" height=23 class='forumRow'>文章标题 (必填) </td>
	<td class='forumRow'><input name='a_title' type='text' id='a_title' value="<%=rs("title")%>" size='70'>
	<input name='a_id' type='hidden' id='a_id' value="<%=rs("id")%>" size='70'>
	  &nbsp;</td>
	</tr>
	<tr>
	<td class='forumRowHighLight' height=23>文章分类<span class="forumRow"> (必选) </span></td>
    <td class='forumRowHighLight'><%
set rsc1=server.createobject("adodb.recordset")
sqlClass1="select id,pid,ppid,name from category where ppid=1 and ClassType=1 order by id" 
rsc1.open sqlClass1,cn,1,1
%>
            <select name="cid" id="cid" onChange="changeselect1(this.value)">
              <% '输出一级分类，并选定当前分类
count1 = 0
do while not rsc1.eof
%><option value="<%=rsc1("ID")%>"  <%if cint(rs("cid"))=rsc1("id") then
response.write "selected"
end if%>><%=rsc1("Name")%></option>
<%count1 = count1 + 1
rsc1.movenext
loop
rsc1.close
%>
            </select>
            &nbsp;&nbsp;
	
            <select name="pid" id="pid">
              <option value="">选择二级分类</option>
			 		<%'输出二级分类，并选定当前分类
			
set rsc2=server.createobject("adodb.recordset")
sqlClass2="select id,pid,ppid,name from category where ppid=2 and ClassType=1 and pid="&cint(rs("cid"))&" order by id" 
rsc2.open sqlClass2,cn,1,1

count1 = 0
do while not rsc2.eof
%><option value="<%=rsc2("ID")%>"  <%
if rs("pid")<>"" then
if cint(rs("pid"))=rsc2("id") then
response.write "selected"
end if
end if%>><%=rsc2("Name")%></option>
<%count1 = count1 + 1
rsc2.movenext
loop
rsc2.close

%>
            </select>
            &nbsp;&nbsp;
			<input type='hidden' name='ppid' id='ppid' value="">
			&nbsp;</td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23>文章跳转地址</td>
	    <td class='forumRow'><input name='a_url' type='text' id='c_name'  value="<%=rs("url")%>" size='70'>
        &nbsp;以http://开头</td>
      </tr>

	  <input name="web_image" type="hidden" id="web_image" value="">
	  
	<tr>
        <td  class='forumRowHighLight' height=23>文章关键字</td>
	      <td class='forumRowHighLight'><input type='text' id='v3' name='a_keywords'  value="<%=rs("keywords")%>" size='100'>&nbsp;请以中文逗号“，”隔开</td>
	</tr><tr>
	  <td class='forumRow' height=11>文章描述</td>
	  <td class='forumRow'><textarea name='a_description'  cols="100" rows="4" id="a_description" ><%=rs("description")%></textarea></td>
	</tr>
	
	<tr>
	    <td class='forumRowHighLight' height=50>文章附件</td>
	    <td width="85%" class='forumRowHighLight'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%"  ><input name="Files" type="text" id="Files"  value="<%=rs("files")%>" size="30"></td>
           <td width="78%" ><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=3&uploadFileOldName=<%=rs("files")%>"></iframe></td>
         </tr>
       </table></td>
    </tr>
	
	<tr>
	  <td class='forumRow' height=23>文章内容 (必填) </td>
	  <td class='forumRow'> <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"><%=rs("content")%></textarea>
	</td>
	</tr>
	
	<tr>
	  <td class='forumRowHighLight' height=23>文章来源</td>
	  <td class='forumRowHighLight'>
	    <input name='a_from_name' type='text' id='c_name2' value="<%=rs("from_name")%>" size='30'>
	  </td>
	  </tr>
	<tr>
	  <td class='forumRowHighLight' height=23>来源网址</td>
	  <td class='forumRowHighLight'><span class="forumRow">
	    <input name='a_from_url' type='text' id='c_name3' value="<%=rs("from_url")%>" size='40'>
      &nbsp;以http://开头</span></td>
	</tr>
	
	<input name='a_author' type='hidden' id='c_name32' value="<%=rs("author")%>" size='40'>
	
	<tr>
	  <td class='forumRow' height=23>文章浏览次数</td>
	  <td class='forumRow'><input name='a_hit' type='text' id='a_hit' value="<%=rs("hit")%>" size='40'>
      &nbsp;只能是数字</td>
	  </tr>

	<tr>
	  <td class='forumRowHighLight' height=23>更新时间</td>
	  <td class='forumRowHighLight'><span class="forumRow">
	    <input name="juhaoyongEditTime" type="text" value="<%=rs("edit_time")%>" size="30"></span>　<strong><font color="#FF0000">*注意保持原有时间格式*格式必须如：2018-5-8 9:09:09</font>（通过调整时间，可以调整前台显示顺序，时间越大越靠前）</strong>
	  </td>
	</tr>
	    
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form><br /><br /><br />
<%
else
response.write"未找到数据"
end if%>
<%
Call DbconnEnd()
 %>