<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/rand.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/article_to_html.asp" -->
<!-- #include file="../inc/x_to_html/Article_list_to_html.asp" -->

<% '������ݵ����ݱ�
act=Request("act")
If act="save" and request.form("cid")<>"" Then 
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
'a_index_push=trim(request.form("a_index_push"))
a_index_push=0
a_slide_yes=cint(request.form("slide_yes"))
a_special_yes=cint(request.form("special_yes"))
a_time=now()
juhaoyongEditTime=trim(request.form("juhaoyongEditTime"))

'��ȡ��ǰ����һ������id
juhaoyongGetNewestArticleId=getNewestArticleId(a_cid,a_pid,a_ppid)

'��������
set rs=server.createobject("adodb.recordset")
sql="select * from article"
rs.open(sql),cn,1,3
rs.addnew
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
rs("time")=a_time
rs("edit_time")=juhaoyongEditTime
rs("File_Path")=a7&minute(now)&second(now)&".html"
rs.update
rs.close
set rs=nothing
%>

<% '������ҳ
call index_to_html()
%>
<% '�������¾�̬ҳ,�б�ҳ
set rs2=server.createobject("adodb.recordset")
sql="select top 1 [cid],[pid],[ppid],[id] from [article] where [title]='"&a_title&"' and ArticleType=1 order by [time] desc"
rs2.open(sql),cn,1,1
if not rs2.eof  then

	a_id=rs2("id")
	ClassID=rs2("cid")
	call article_to_html(a_id)
	call article_to_html(juhaoyongGetNewestArticleId)
	call Article_list_to_html(ClassID)
	
	juhaoyongClassPid=rs2("pid")
	if trim(juhaoyongClassPid)<>"" then
	call Article_list_to_html(juhaoyongClassPid)
	end if
	
	juhaoyongClassPpid=rs2("ppid")
	if trim(juhaoyongClassPpid)<>"" then
	call Article_list_to_html(juhaoyongClassPpid)
	end if
	
end if
rs2.close
set rs2=nothing
%>



<%
juhaoyong_cid=request.QueryString("juhaoyong_cid")
juhaoyong_pid=request.QueryString("juhaoyong_pid")
juhaoyong_ppid=request.QueryString("juhaoyong_ppid")
response.Write "<script language='javascript'>alert('��ӳɹ���');location.href='article_list.asp?cid="&juhaoyong_cid&"&pid="&juhaoyong_pid&"&ppid="&juhaoyong_ppid&"&act=search';</script>"

end if 

 %>
 	<script charset="utf-8" src="Keditor/kindeditor.js"></script>
	<script charset="utf-8" src="Keditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="Keditor/editor.js"></script>

 <!-- ���������˵� ��ʼ -->
<script language="JavaScript">
<!--
<%
'�������ݱ��浽����
Dim count2,rsClass2,sqlClass2
set rsClass2=server.createobject("adodb.recordset")
sqlClass2="select id,pid,ppid,name from category where ppid=2 and ClassType=1 order by id " 
rsClass2.open sqlClass2,cn,1,1
%>
var subval2 = new Array();
//����ṹ��һ����ֵ,������ֵ,������ʾֵ
<%
count2 = 0
do while not rsClass2.eof
%>
subval2[<%=count2%>] = new Array('<%=rsClass2("pID")%>','<%=rsClass2("ID")%>','<%=rsClass2("Name")%>')
<%
count2 = count2 + 1
rsClass2.movenext
loop
rsClass2.close
%>

<%
'�������ݱ��浽����
Dim count3,rsClass3,sqlClass3
set rsClass3=server.createobject("adodb.recordset")
sqlClass3="select id,pid,ppid,name from category where ppid=3  and ClassType=1 order by id" 
rsClass3.open sqlClass3,cn,1,1
%>
var subval3 = new Array();
//����ṹ��������ֵ,������ֵ,������ʾֵ
<%
count3 = 0
do while not rsClass3.eof
%>
subval3[<%=count3%>] = new Array('<%=rsClass3("pID")%>','<%=rsClass3("ID")%>','<%=rsClass3("Name")%>')
<%
count3 = count3 + 1
rsClass3.movenext
loop
rsClass3.close
%>

function changeselect1(locationid)
{
    document.form1.pid.length = 0;
    document.form1.pid.options[0] = new Option('ѡ���������','');
    for (i=0; i<subval2.length; i++)
    {
        if (subval2[i][0] == locationid)
        {document.form1.pid.options[document.form1.pid.length] = new Option(subval2[i][2],subval2[i][1]);}
    }
}


//-->
</script><!-- ���������˵� ���� -->
	<%
Call header()

%>
<%
juhaoyong_cid=request.QueryString("juhaoyong_cid")
juhaoyong_pid=request.QueryString("juhaoyong_pid")
juhaoyong_ppid=request.QueryString("juhaoyong_ppid")

if juhaoyong_cid="" or juhaoyong_cid=null then
juhaoyong_cid=-1
end if

if juhaoyong_pid="" or juhaoyong_pid=null then
juhaoyong_pid=-1
end if

if juhaoyong_ppid="" or juhaoyong_ppid=null then
juhaoyong_ppid=-1
end if

juhaoyong_cid=cint(juhaoyong_cid)
juhaoyong_pid=cint(juhaoyong_pid)
juhaoyong_ppid=cint(juhaoyong_ppid)

juhaoyong_cid_name=""
juhaoyong_pid_name=""
juhaoyong_ppid_name=""


if juhaoyong_cid<>-1 then
juhaoyong_cid_name=juhaoyongGetCategoryName(juhaoyong_cid)
end if

if juhaoyong_pid<>-1 then
juhaoyong_pid_name=juhaoyongGetCategoryName(juhaoyong_pid)
end if

if juhaoyong_ppid<>-1 then
juhaoyong_ppid_name=juhaoyongGetCategoryName(juhaoyong_ppid)
end if


Function juhaoyongGetCategoryName(id)
set juhaoyong_categoryName_rs=server.createobject("adodb.recordset")
juhaoyong_category_sql="select id,pid,ppid,name from category where id="&id 
juhaoyong_categoryName_rs.open juhaoyong_category_sql,cn,1,1

juhaoyongGetCategoryName=juhaoyong_categoryName_rs("name")

juhaoyong_categoryName_rs.close
set juhaoyong_categoryName_rs=nothing
End Function


%>
  <form id="form1" name="form1" method="post" action="?act=save&juhaoyong_cid=<%=juhaoyong_cid%>&juhaoyong_pid=<%=juhaoyong_pid%>&juhaoyong_ppid=<%=juhaoyong_ppid%>">
         <script language='javascript'>
function checksignup1() {
if ( document.form1.a_title.value == '' ) {
window.alert('���������±���^_^');
document.form1.a_title.focus();
return false;}

if ( document.form1.cid.value == '' ) {
window.alert('��ѡ�����^_^');
document.form1.cid.focus();
return false;}
return true;}
</script>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>�������</th>
	<tr>
	  <td height=23 colspan="2" class='forumRow'><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" class='TipTitle'>&nbsp;�� ������ʾ</td>
        </tr>
        <tr>
          <td height="30" valign="top" class="TipWords"><p>1��ͨ����������ʱ�䣨�ڱ༭�������棩�����Ե�����ʾ˳��</p></td>
        </tr>
        <tr>
          <td height="10">&nbsp;</td>
        </tr>
      </table></td>
	  </tr>
	<tr>
	<td width="15%" height=23 class='forumRow'>���±��� (����) </td>
	<td class='forumRow'><input name='a_title' type='text' id='a_title' size='70'>
	  &nbsp;</td>
	</tr>
	<tr>
	<td class='forumRowHighLight' height=23>���·���<span class="forumRow"> (��ѡ) </span></td>
    <td class='forumRowHighLight'><%
Dim count1,rsClass1,sqlClass1
set rsClass1=server.createobject("adodb.recordset")
sqlClass1="select id,pid,ppid,name from category where ppid=1 and ClassType=1 order by id" 
rsClass1.open sqlClass1,cn,1,1
%>
            <select name="cid" id="cid" onChange="changeselect1(this.value)">

             <%
count1 = 0
do while not rsClass1.eof

	if rsClass1("ID")=juhaoyong_cid then
	response.write"<option value="&rsClass1("ID")&" selected>"&rsClass1("Name")&"</option>"
	else
	response.write"<option value="&rsClass1("ID")&">"&rsClass1("Name")&"</option>"
	end if

count1 = count1 + 1
rsClass1.movenext
loop
rsClass1.close
%>
            </select>
            &nbsp;&nbsp;
            <select name="pid" id="pid">
              <option value="">ѡ���������</option>
            </select>
            &nbsp;&nbsp;
            <input type='hidden' name='ppid' id='ppid' value="">
			&nbsp;</td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23>������ת��ַ</td>
	    <td class='forumRow'><input name='a_url' type='text' id='a_url' size='70'>
        &nbsp;��http://��ͷ</td>
      </tr>
	  
	  <input name="web_image" type="hidden" id="web_image" value="">

	<tr>
        <td  class='forumRowHighLight' height=23>���¹ؼ���</td>
	    <td class='forumRowHighLight'><input type='text' id='a_keywords' name='a_keywords' size='100'>&nbsp;�������Ķ��š���������</td>
	</tr>
	
	<tr>
	  <td class='forumRow' height=11>��������</td>
	  <td class='forumRow'><textarea name='a_description'  cols="100" rows="4" id="a_description" ></textarea></td>
	</tr>
	
	<tr>
	    <td class='forumRowHighLight' height=50>���¸���</td>
	    <td width="85%" class='forumRowHighLight'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%" ><input name="Files" type="text" id="Files"  size="30"></td>
           <td width="78%"  ><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=3"></iframe></td>
         </tr>
       </table></td>
    </tr>
	
	<tr>
	  <td class='forumRow' height=23>�������� (����) </td>
	  <td class='forumRow'><textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea></td>
	</tr>
	
	<tr>
	  <td class='forumRowHighLight' height=23>������Դ</td>
	  <td class='forumRowHighLight'>
	    <input name='a_from_name' type='text' id='a_from_name' size='30'></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23>��Դ��ַ</td>
	  <td class='forumRowHighLight'><span class="forumRow">
	    <input name='a_from_url' type='text' id='a_from_url' size='40'>&nbsp;��http://��ͷ</span></td>
	</tr>
	
	<input name='a_author' type='hidden' id='a_author' value="<%=Session("log_name")%>" size='40'>
	
	<tr>
	  <td class='forumRow' height=23>�����������</td>
	  <td class='forumRow'><input name='a_hit' type='text' id='a_hit' value="0" size='40'>
      &nbsp;ֻ��������</td>
	  </tr>
  
	<tr>
	  <td class='forumRowHighLight' height=23>����ʱ��</td>
	  <td class='forumRowHighLight'><span class="forumRow">
	    <input name="juhaoyongEditTime" type="text" value="<%=now()%>" size="30"></span>��<strong><font color="#FF0000">*ע�Ᵽ��ԭ��ʱ���ʽ*��ʽ�����磺2018-5-8 9:09:09</font>��ͨ������ʱ�䣬���Ե���ǰ̨��ʾ˳��ʱ��Խ��Խ��ǰ��</strong>
	  </td>
	</tr>
  
  
	  
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='�ύ' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form><br /><br /><br />

<script language="JavaScript">
juhaoyong_cid_js=<%=juhaoyong_cid%>;
juhaoyong_pid_js=<%=juhaoyong_pid%>;
juhaoyong_ppid_js=<%=juhaoyong_ppid%>;

juhaoyong_cid_name_js="<%=juhaoyong_cid_name%>";
juhaoyong_pid_name_js="<%=juhaoyong_pid_name%>";
juhaoyong_ppid_name_js="<%=juhaoyong_ppid_name%>";


<%if juhaoyong_cid<>-1 then%>
changeselect1(juhaoyong_cid_js);
<%end if%>


<%if juhaoyong_pid<>-1 then%>
document.form1.pid.options[0] = new Option(juhaoyong_pid_name_js,juhaoyong_pid_js);
document.form1.pid.options[0].selected=true;
<%end if%>

</script>

<%
Call DbconnEnd()
 %>