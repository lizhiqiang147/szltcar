<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/rand.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/x_to_html/RentalProcess_to_html.asp" -->

<% '添加数据到数据表
act=Request("act")
If act="save" and request.form("cid")<>"" Then 
a_title=request.form("a_title")
a_author=request.form("a_author")
a_cid=trim(request.form("cid"))
a_pid=trim(request.form("pid"))
a_ppid=trim(request.form("ppid"))
a_image=trim(request.form("web_image"))
a_keywords=trim(request.form("a_keywords"))
a_description=trim(request.form("a_description"))
a_content=request.form("a_content")
a_person=request.form("a_person")
a_address=request.form("a_address")
a_tel=request.form("a_tel")
a_email=request.form("a_email")
a_qq=request.form("a_qq")
a_hit=trim(request.form("a_hit"))
a_index_push=trim(request.form("a_index_push"))
a_time=now()

set rs=server.createobject("adodb.recordset")
sql="select * from web_info"
rs.open(sql),cn,1,3
rs.addnew
rs("title")=a_title
rs("AuthorID")=a_author
rs("cid")=a_cid
rs("pid")=a_pid
rs("ppid")=a_ppid
rs("image")=a_image
rs("keywords")=a_keywords
rs("description")=a_description
rs("content")=a_content
rs("person")=a_person
rs("address")=a_address
rs("tel")=a_tel
rs("email")=a_email
rs("qq")=a_qq
'rs("hit")=a_hit
'rs("index_push")=a_index_push
rs("time")=a_time
rs("edit_time")=a_time
rs("File_Path")=a7&minute(now)&second(now)&".html"
rs.update
rs.close
set rs=nothing
%>
<% 
ClassID=a_cid
call RentalProcess_to_html(ClassID)

juhaoyongClassPid=a_pid
if trim(juhaoyongClassPid)<>"" then
call RentalProcess_to_html(juhaoyongClassPid)
end if

juhaoyongClassPpid=a_ppid
if trim(juhaoyongClassPpid)<>"" then
call RentalProcess_to_html(juhaoyongClassPpid)
end if

%>
<%
juhaoyong_cid=request.QueryString("juhaoyong_cid")
juhaoyong_pid=request.QueryString("juhaoyong_pid")
juhaoyong_ppid=request.QueryString("juhaoyong_ppid")

if juhaoyong_ppid>0 then
response.Write "<script language='javascript'>alert('添加成功！');location.href='RentalProcess_list.asp?ppid="&juhaoyong_ppid&"&act=search';</script>"
elseif juhaoyong_pid>0 then
response.Write "<script language='javascript'>alert('添加成功！');location.href='RentalProcess_list.asp?pid="&juhaoyong_pid&"&act=search';</script>"
elseif juhaoyong_cid>0 then
response.Write "<script language='javascript'>alert('添加成功！');location.href='RentalProcess_list.asp?cid="&juhaoyong_cid&"&act=search';</script>"
end if

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
Dim count2,rsClass2,sqlClass2
set rsClass2=server.createobject("adodb.recordset")
sqlClass2="select id,pid,ppid,name from [category] where ppid=2 and ClassType=7 order by id " 
rsClass2.open sqlClass2,cn,1,1
%>
var subval2 = new Array();
//数组结构：一级根值,二级根值,二级显示值
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
'三级数据保存到数组
Dim count3,rsClass3,sqlClass3
set rsClass3=server.createobject("adodb.recordset")
sqlClass3="select id,pid,ppid,name from [category] where ppid=3  and ClassType=7 order by id" 
rsClass3.open sqlClass3,cn,1,1
%>
var subval3 = new Array();
//数组结构：二级根值,三级根值,三级显示值
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
    document.form1.pid.options[0] = new Option('选择二级分类','');
    document.form1.ppid.length = 0;
    document.form1.ppid.options[0] = new Option('选择三级分类','');
    for (i=0; i<subval2.length; i++)
    {
        if (subval2[i][0] == locationid)
        {document.form1.pid.options[document.form1.pid.length] = new Option(subval2[i][2],subval2[i][1]);}
    }
}

function changeselect2(locationid)
{
    document.form1.ppid.length = 0;
    document.form1.ppid.options[0] = new Option('选择三级分类','');
    for (i=0; i<subval3.length; i++)
    {
        if (subval3[i][0] == locationid)
        {document.form1.ppid.options[document.form1.ppid.length] = new Option(subval3[i][2],subval3[i][1]);}
    }
}
//-->
</script>
<!-- 三级联动菜单 结束 -->
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
if ( document.form1.cid.value == '' ) {
window.alert('请选择分类^_^');
document.form1.cid.focus();
return false;}
	
if ( document.form1.a_title.value == '' ) {
window.alert('请输入标题^_^');
document.form1.a_title.focus();
return false;}



return true;}
    </script>
    <table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align="center">
        <tr>
            <th class='tableHeaderText' colspan="2" height="25">添加租车流程</th>
        </tr>
        <tr style="display:none">
            <td class='forumRowHighLight' height="23">分类<span class="forumRow"> (必选) </span></td>
            <td class='forumRowHighLight'><%
Dim count1,rsClass1,sqlClass1
set rsClass1=server.createobject("adodb.recordset")
sqlClass1="select id,pid,ppid,name from category where ppid=1 and ClassType=7 order by id" 
rsClass1.open sqlClass1,cn,1,1
            %>

                <select name="cid" id="cid" onchange="changeselect1(this.value)">

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
            <select name="pid" id="pid" onchange="changeselect2(this.value)">
                <option value="">选择二级分类</option>
            </select>
                &nbsp;&nbsp;
            <select name="ppid" id="ppid">
                <option value="">选择三级分类</option>
            </select>&nbsp;</td>
        </tr>
        <tr>
            <td width="15%" height="23" class='forumRow'>文章名称 (必填) </td>
            <td class='forumRow'>
                <input name='a_title' type='text' id='a_title' size='70'>
                &nbsp;</td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23">内容</td>
            <td class='forumRowHighLight'>
                <textarea name="a_content" id="a_content" style="width: 100%; height: 400px; visibility: hidden;"></textarea></td>
        </tr>

        <tr>
            <td height="50" colspan="2" class='forumRow'>
                <div align="center">
                    <input type="submit" value='提交' onclick='javascript:return checksignup1()' name="Submit">
                </div>
            </td>
        </tr>
    </table>
</form>
<br />
<br />
<br />
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
changeselect2(juhaoyong_pid_js);
<%end if%>

<%if juhaoyong_pid<>-1 then%>
document.form1.pid.options[0] = new Option(juhaoyong_pid_name_js,juhaoyong_pid_js);
document.form1.pid.options[0].selected=true;
<%end if%>

<%if juhaoyong_ppid<>-1 then%>
document.form1.ppid.options[0] = new Option(juhaoyong_ppid_name_js,juhaoyong_ppid_js);
document.form1.ppid.options[0].selected=true;
<%end if%>
</script>
<%
Call DbconnEnd()
%>