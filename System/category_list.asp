<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="page_next.asp" -->
<%
'栏目文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FolderName from web_Models_type where [id]=2"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
if rs_1("FolderName")<>"" then
MainClass_FolderName="/"&rs_1("FolderName")
else
MainClass_FolderName=""
end if
end if
rs_1.close
set rs_1=nothing%>
	<%
Call header()
%>
<script language="JavaScript">
<!--
function ask(msg) {
	if( msg=='' ) {
		msg='警告：删除后将不可恢复，确定要删除吗？';
	}
	if (confirm(msg)) {
		return true;
	} else {
		return false;
	}
}
//-->
</script>

<SCRIPT language=javascript>
<!--
function class_show(meval)
{

}
-->
</SCRIPT>
<style>
.TitleHighlight2{
	color:#CCC;}
	
.TitleHighlight2 a{
	color:#FFF;
	font-weight:bold;
	text-decoration:none;}
	
.TitleHighlight3 a{
	text-decoration:none;}
	
.contenttable a:hover{
	color:#FF0000;
	text-decoration:underline;}
.jhyBuildHtmlAlertTxt a{
	color:#009900;}
	
.TitleHighlight4 a{
	text-decoration:none;}
</style>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th width="100%" height=25 class='tableHeaderText'>管理栏目</th>
	
	<tr><td height="400" valign="top"  class='forumRow'><br>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
		 <!-- <tr><td width="100%" align="right" class="jhyBuildHtmlAlertTxt"><a href="html_items.asp"><strong>增加修改删除栏目后，请点击这里，去生成栏目静态>>></strong></a></td></tr>-->
          <tr>
            <td height="25" class='TipTitle'>&nbsp;√ 操作提示</td>
          </tr>
          <tr>
            <td height="30" valign="top" class="TipWords">
              <p>1、点击栏目后面的<font color="#03d8d8" size="+2"><strong>“栏目下内容管理”</strong></font>打开后，可以<font color="#000000" size="+2"><strong>“添加”</strong></font>、删除、修改相应的的内容；
			  
			  </td>
          </tr>
          <tr>
            <td height="10" ></td>
          </tr>
        </table>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
           <!-- <td height="25" class='forumRowHighLight'>&nbsp;| <a href="category_add.asp?ppid=1&juhaoyongClassType=0">添加新的一级栏目</a></td>-->
          </tr>
          <tr>
            <td height="10"></td>
          </tr>
      </table>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="2" class="contenttable">
          <tr>
          <!--  <td width="8%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">开合</div></td>-->
			<td width="5%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目ID</div></td>
            <td width="13%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目名称</div></td>
			<td width="12%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">文件夹名称</div></td>
            <td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目排序</div></td>
            <td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目类别</div></td>
			<td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目级别</div></td>
  
			<!--<td width="9%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">推荐为首页栏目</div></td>-->
			<td width="9%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目下内容管理</div></td>
			<!--<td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">栏目删除</div></td>-->
			
          </tr>
		  <%'输出一级栏目
strFileName="category_list.asp" 
pageno=20
		set rs=server.createobject("adodb.recordset")
sql="select id,pid,ppid,name,folder,ClassType,[order] from category where ppid=1 order by [order],time"
rs.open(sql),cn,1,1
rscount=rs.recordcount
if not rs.eof and not rs.bof then
call showsql(pageno)
rs.move(rsno)
for p_i=1 to loopno
		  %>
          <tr >
   <!--         <td height="30" class="TitleHighlight2"  onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><div align="center"><img src="images/tree_folder1.gif">点击开合</div></td>-->
			<td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><%=rs("id")%></td>
            <td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><a href="<%=MainClass_FolderName&"/"&rs("folder")%>" target="_blank"><%=rs("name")%></a></td>
            <td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><%=rs("folder")%></td>
			<td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');">
              <div align="center"><%=rs("order")%></div></td>
            <td class="TitleHighlight2" >
            <div align="center">
			<% select case rs("ClassType")
			case 1
			response.write "文章"
			ListName="Article_list.asp"
			case 2
			response.write "产品"
			ListName="Product_list.asp"
			case 4
			response.write "价格"
			ListName="Info_list.asp"			
			case 5
			response.write "单页"
			ListName="#"
            case 6
			response.write "酒后代驾"
			ListName="DrinkDrive_list.asp"	
            case 7
			response.write "租车流程"
			ListName="RentalProcess_list.asp"						
			end select%>
			</div></td>
			<td class="TitleHighlight2" align="center">一级栏目</td>
    
			
			<!--<td width="9%" class="TitleHighlight2" align="center">---</td>-->
			
			<td class="TitleHighlight2" align="center">
			<%if rs("ClassType")=5 then%>
			---
			<%else%>
			<a href="<%=ListName%>?cid=<%=rs("id")%>&act=search"><font color="#00ffff">栏目下内容管理</font></a>
			<%end if%>
			</td>
		<!--	<td class="TitleHighlight2" align="center">
			<a href="javascript:if(ask('警告：删除后将不可恢复，确定要删除吗？')) location.href='category_del.asp?id=<%=rs("id")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>';">删除栏目</a>
			</td>-->
          </tr>
		    <tr id="class_<%=rs("id")%>" style="DISPLAY: none">
            <td height="35"  colspan="12">
			
			 </td>
          </tr>
		  		  <%
		  rs.movenext
		  next
		  else
response.write "<div align='center'><span style='color: #FF0000'>暂无数据！</span></div>"
		  end if
		  
		  rs2.close
		  set rs2=nothing
		  
		  rs3.close
		  set rs3=nothing
		  
		  rs.close
		  set rs=nothing
		  %>
		  		    <tr  >
              <td height="35"  colspan="5" ><div align="center">
                <%call showpage(strFileName,rscount,pageno,false,true,"")%>
           </div></td>
		    </tr>
      </table>
	    <br></td>
	</tr>
	</table><br /><br /><br /><br />

<%
Call DbconnEnd()
 %>