<!-- #include file="../juhaoyongConst.asp" -->
<!-- #include file="../access.asp" -->
<!-- #include file="../html_clear.asp" -->
<!-- #include file="../juhaoyongKefuFunction.asp" -->
<%juhaoyong_kefu_html_code_string=juhaoyongKefuHtmlCode()%>

<%'容错处理
function order_index_to_html()
On Error Resume Next
%>
<%
'首页基本信息内容读取替换
set rs=server.createobject("adodb.recordset")
sql="select web_name,web_url,web_image,web_title,web_keywords,web_contact,web_tel,web_TopHTML,web_BottomHTML,web_description,web_copyright,web_theme from web_settings"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
web_theme=rs("web_theme")
end if
rs.close
set rs=nothing
%>

<% '读取模板内容
'模板类型获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=47"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Model_FileName=rs_1("FileName")
if rs_1("FolderName")<>"" then
Model_FolderName="/"&rs_1("FolderName")
end if
end if
rs_1.close
set rs_1=nothing

Set fso=Server.CreateObject("Scripting.FileSystemObject") 
Set htmlwrite=fso.OpenTextFile(Server.MapPath("/templates/"&web_theme&"/"&Model_FileName)) 
replace_code=htmlwrite.ReadAll() 
htmlwrite.close 

replace_code=replace(replace_code,"$web_theme$",web_theme)

%>

<% '判断模板文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if

filepath_index=Model_FolderName&"/index.asp"	

Set f=fso.CreateTextFile(Server.MapPath(filepath_index),true)
f.WriteLine replace_code
f.close

end function
%>