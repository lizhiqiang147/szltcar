<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="page_next.asp" -->
<%
'��Ŀ�ļ��л�ȡ
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
		msg='���棺ɾ���󽫲��ɻָ���ȷ��Ҫɾ����';
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
  var left_n=eval(meval);
  if (left_n.style.display=="none")
  { eval(meval+".style.display='';"); }
  else
  { eval(meval+".style.display='none';"); }
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
	  <th width="100%" height=25 class='tableHeaderText'>������Ŀ</th>
	
	<tr><td height="400" valign="top"  class='forumRow'><br>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr><td width="100%" align="right" class="jhyBuildHtmlAlertTxt"><a href="html_items.asp"><strong>�����޸�ɾ����Ŀ���������ȥ������Ŀ��̬>>></strong></a></td></tr>
          <tr>
            <td height="25" class='TipTitle'>&nbsp;�� ������ʾ</td>
          </tr>
          <tr>
            <td height="30" valign="top" class="TipWords">
              <p>1�������Ŀ�����<font color="#03d8d8" size="+2"><strong>����Ŀ�����ݹ���</strong></font>�򿪺󣬿���<font color="#000000" size="+2"><strong>����ӡ�</strong></font>��ɾ�����޸���Ӧ�ĵ����ݣ�<b>����ҳ��</b>������Ŀ�����<b>����Ŀ���á�</b>�޸����ݡ�</p>
			  <p>2����Ŀ������<font color="#009900"><strong>��1���������Ŀ�����Աߵ�ɫ�顱</strong></font>��ǰ��ġ�<img src="images/tree_folder1.gif"> ��������չ���¼���Ŀ��&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0099ff"><strong>��2��ֻ�С����¡����͵Ķ�����Ŀ���ſ��ԡ��Ƽ�Ϊ��ҳ��Ŀ��</strong></font></p>

              <p>4��<font color="#FF0000">�ر����ѣ�</font>���ӡ��޸ġ�ɾ������Ŀ�����뵽�������������޸Ķ�Ӧ�ĵ������������������о�̬��Ȼ��ǰ̨<font color="#339900">&nbsp;<b>��F5ˢ��</b>&nbsp;</font>�鿴Ч����</p>
			  </td>
          </tr>
          <tr>
            <td height="10" ></td>
          </tr>
        </table>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" class='forumRowHighLight'>&nbsp;| <a href="category_add.asp?ppid=1&juhaoyongClassType=0">����µ�һ����Ŀ</a></td>
          </tr>
          <tr>
            <td height="10"></td>
          </tr>
      </table>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="2" class="contenttable">
          <tr>
            <td width="8%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">����</div></td>
			<td width="5%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��ĿID</div></td>
            <td width="13%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀ����</div></td>
			<td width="12%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">�ļ�������</div></td>
            <td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀ����</div></td>
            <td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀ���</div></td>
			<td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀ����</div></td>
            <td width="8%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">����¼���Ŀ</div></td>
			<td width="8%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀ����</div></td>
			<td width="9%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">�Ƽ�Ϊ��ҳ��Ŀ</div></td>
			<td width="9%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀ�����ݹ���</div></td>
			<td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��Ŀɾ��</div></td>
			
          </tr>
		  <%'���һ����Ŀ
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
            <td height="30" class="TitleHighlight2"  onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><div align="center"><img src="images/tree_folder1.gif">�������</div></td>
			<td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><%=rs("id")%></td>
            <td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><a href="<%=MainClass_FolderName&"/"&rs("folder")%>" target="_blank"><%=rs("name")%></a></td>
            <td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');" style=" cursor:pointer;"><%=rs("folder")%></td>
			<td class="TitleHighlight2" onClick="javascript:class_show('class_<%=rs("id")%>');">
              <div align="center"><%=rs("order")%></div></td>
            <td class="TitleHighlight2" >
            <div align="center">
			<% select case rs("ClassType")
			case 1
			response.write "����"
			ListName="Article_list.asp"
			case 2
			response.write "��Ʒ"
			ListName="Product_list.asp"
			case 4
			response.write "��Ƹ"
			ListName="Info_list.asp"			
			case 5
			response.write "��ҳ"
			ListName="#"
            case 6
			response.write "�ƺ����"
			ListName="DrinkDrive_list.asp"						
			end select%>
			</div></td>
			<td class="TitleHighlight2" align="center">һ����Ŀ</td>
            <td class="TitleHighlight2" align="center">
			
            <a href="category_add.asp?pid_name=<%=rs("name")%>&pid=<%=rs("id")%>&ppid=2&juhaoyongClassType=<%=rs("ClassType")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">��Ӷ�����Ŀ</a>
			
			</td>
			<td class="TitleHighlight2" align="center">
			<a href="category_edit.asp?id=<%=rs("id")%>&ppid=1&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">��Ŀ����</a>
			</td>
			
			<td width="9%" class="TitleHighlight2" align="center">---</td>
			
			<td class="TitleHighlight2" align="center">
			<%if rs("ClassType")=5 then%>
			---
			<%else%>
			<a href="<%=ListName%>?cid=<%=rs("id")%>&act=search"><font color="#00ffff">��Ŀ�����ݹ���</font></a>
			<%end if%>
			</td>
			<td class="TitleHighlight2" align="center">
			<a href="javascript:if(ask('���棺ɾ���󽫲��ɻָ���ȷ��Ҫɾ����')) location.href='category_del.asp?id=<%=rs("id")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>';">ɾ����Ŀ</a>
			</td>
          </tr>
		    <tr id="class_<%=rs("id")%>" style="DISPLAY: none">
            <td height="35"  colspan="12">
			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
					  <%'���������Ŀ
		  set rs2=server.createobject("adodb.recordset")
sql="select id,pid,ppid,name,folder,index_push,ClassType,[order] from category where ppid=2 and pid="&rs("id")&" order by [order],time"
rs2.open(sql),cn,1,1
if not rs2.eof and not rs2.bof then
		  do while not rs2.eof
		  %>
			<tr>
			<%if rs2("ClassType")=2 then%>
			<td width="8%" height="27" class="TitleHighlight3"  onClick="javascript:class_show('class_<%=rs2("id")%>');" style=" cursor:pointer;"><div align="center"><img src="images/tree_folder1.gif">�������</div></td>
			<%else%>
			<td width="8%" height="27" class="TitleHighlight3"> </td>
			<%end if%>
			<td width="5%" class="TitleHighlight3"  onClick="javascript:class_show('class_<%=rs2("id")%>');"  style=" cursor:pointer;"><%=rs2("id")%></td>
            <td width="13%" class="TitleHighlight3"  onClick="javascript:class_show('class_<%=rs2("id")%>');"  style=" cursor:pointer;"><a href="<%=MainClass_FolderName&"/"&rs("folder")&"/"&rs2("folder")%>" target="_blank"><%=rs2("name")%></a></td>
            <td width="12%" class="TitleHighlight3"  onClick="javascript:class_show('class_<%=rs2("id")%>');"  style=" cursor:pointer;"><%=rs2("folder")%></td>
			<td width="7%" class="TitleHighlight3"  onClick="javascript:class_show('class_<%=rs2("id")%>');" ><div align="center"><%=rs2("order")%></div></td>
            <td width="7%" class="TitleHighlight3"  >
              <div align="center">
			<% select case rs2("ClassType")
			case 1
			response.write "����"
			ListName="Article_list.asp"
			case 2
			response.write "��Ʒ"
			ListName="Product_list.asp"
			case 4
			response.write "��Ƹ"
			ListName="Info_list.asp"				
			case 5
			response.write "��ҳ"
			ListName="#"
            case 6
			response.write "�ƺ����"
			ListName="DrinkDrive_list.asp"							
			end select%>
			</div></td>
			<td width="7%" class="TitleHighlight3" align="center">������Ŀ</td>
            <td width="8%" class="TitleHighlight3" align="center">
			
              <%if rs2("ClassType")=2 then%>
			  <a href="category_add.asp?pid_name=<%=rs("name")%>&pid_name2=<%=rs2("name")%>&pid=<%=rs2("id")%>&ppid=3&juhaoyongClassType=<%=rs2("ClassType")%>">���������Ŀ</a>
			  <%else%>
			  ---
			  <%end if%>
			  
			  </td>
			  <td width="8%" class="TitleHighlight3" align="center">
			  <a href="category_edit.asp?id=<%=rs2("id")%>&pid_name=<%=rs("name")%>&ppid=2">��Ŀ����</a>
			  </td>
			  
			  <td width="9%" class="TitleHighlight3" align="center">
			  <%if rs2("ClassType")=1 then%>
				  <%if rs2("index_push")=1 then%>
				  <font color="#ffffff">[���Ƽ�]</font> <a href="category_index_push.asp?id=<%=rs2("id")%>"><font color="#ffff00">ȡ��</font></a>
				  <%else%>
				  <font color="#000000">[δ�Ƽ�]</font> <a href="category_index_push.asp?id=<%=rs2("id")%>"><font color="#ffff00">�Ƽ�</font></a>
				  <%end if%>
			  <%else%>
			  ---
			  <%end if%>
			  </td>
			  
			  <td width="9%" class="TitleHighlight3" align="center">
			  <%if rs2("ClassType")=5 then%>
			  ---
			  <%else%>
			  <a href="<%=ListName%>?cid=<%=rs("id")%>&pid=<%=rs2("id")%>&act=search"><font color="#00ffff">��Ŀ�����ݹ���</font></a>
			  <%end if%>
			  </td>
			  <td width="7%" class="TitleHighlight3" align="center">
			  <%if rs2("folder")="Contactus" then%>
			  ϵͳ������Ŀ
			  <%else%>
			  <a href="javascript:if(ask('���棺ɾ���󽫲��ɻָ���ȷ��Ҫɾ����')) location.href='category_del.asp?id=<%=rs2("id")%>';">ɾ����Ŀ</a>
			  <%end if%>
			  </td>
			  </tr>
			  
			     <tr id="class_<%=rs2("id")%>" style="DISPLAY: none">
            <td height="35"  colspan="12">
			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
					  <%'���������Ŀ
		  set rs3=server.createobject("adodb.recordset")
sql="select id,pid,ppid,name,folder,ClassType,[order] from category where ppid=3 and pid="&rs2("id")&" order by [order],time"
rs3.open(sql),cn,1,1
if not rs3.eof and not rs3.bof then
		  do while not rs3.eof
		  %>
			<tr><td width="8%" height="23" class='TitleHighlight4'></td>
			<td width="5%" class='TitleHighlight4'><%=rs3("id")%></td>
            <td width="13%" class='TitleHighlight4'><a href="<%=MainClass_FolderName&"/"&rs("folder")&"/"&rs2("folder")&"/"&rs3("folder")%>" target="_blank"><%=rs3("name")%></a></td>
            <td width="12%" class='TitleHighlight4'><%=rs3("folder")%></td>
			<td width="7%" class='TitleHighlight4'><div align="center"><%=rs3("order")%></div></td>
            <td width="7%" class='TitleHighlight4'>
            <div align="center">
			<% select case rs3("ClassType")
			case 6
			response.write "�ƺ����"
			ListName="DrinkDrive_list.asp"
			case 2
			response.write "��Ʒ"
			ListName="Product_list.asp"
			case 4
			response.write "��Ƹ"
			ListName="Info_list.asp"				
			case 5
			response.write "��ҳ"
			ListName="#"						
			end select%>
			</div></td>
			<td width="7%" class='TitleHighlight4' align="center">������Ŀ</td>
            <td width="8%" class='TitleHighlight4' align="center">
			
              ---
			  
			  </td>
			  <td width="8%" class='TitleHighlight4' align="center">
			  <a href="category_edit.asp?id=<%=rs3("id")%>&pid_name=<%=rs("name")%>&pid_name2=<%=rs2("name")%>&ppid=3">��Ŀ����</a>
			  </td>
			  
			  <td width="9%" class="TitleHighlight4" align="center">---</td>
			  
			  <td width="9%" class='TitleHighlight4' align="center">
			  <%if rs3("ClassType")=5 then%>
			  ---
			  <%else%>
			  <a href="<%=ListName%>?cid=<%=rs("id")%>&pid=<%=rs2("id")%>&ppid=<%=rs3("id")%>&act=search"><font color="#00ffff">��Ŀ�����ݹ���</font></a>
			  <%end if%>
			  </td>
			  <td width="7%" class='TitleHighlight4' align="center">
			  <a href="javascript:if(ask('���棺ɾ���󽫲��ɻָ���ȷ��Ҫɾ����')) location.href='category_del.asp?id=<%=rs3("id")%>';">ɾ����Ŀ</a>
			  </td>			  
			  </tr>
					  <%
		  rs3.movenext
		  loop 
else
response.write "<div align='center'><span style='color: #FF0000'>���¼���Ŀ��</span></div>"
end if 
		  rs3.close
		  set rs3=nothing
		  %> </table> </td>
          </tr>
					  <%
		  rs2.movenext
		  loop 
else
response.write "<div align='center'><span style='color: #FF0000'>���¼���Ŀ��</span></div>"
end if 
		  rs2.close
		  set rs2=nothing
		  %> </table> </td>
          </tr>
		  		  <%
		  rs.movenext
		  next
		  else
response.write "<div align='center'><span style='color: #FF0000'>�������ݣ�</span></div>"
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