<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<!-- #include file="page_next.asp" -->


<% '�޸�˳��ģ��
action1=request.querystring("action")
id1=request.querystring("id")
order1=trim(request.form("order"))
if action1="edit" then
if isnumeric(order1)=false then
response.Write "<script language='javascript'>alert('������Ĳ������֣�');location.href='?page="&page&"&act="&act&"&keywords="&keywords&"';</script>"
else
set rs1=server.createobject("adodb.recordset")
sql="select id,order from web_menu_type where id="&id1&""
rs1.open(sql),cn,1,3
rs1("order")=order1
rs1.update
rs1.close
set rs1=nothing
call index_to_html()
end if
end if

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
	<%
Call header()
%>

	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr><th width="100%" height=25 class='tableHeaderText'>һ������</th></tr>

	
	<tr><td height="400" valign="top"  class='forumRow'><br>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr><td width="100%" align="right"><a href="html_all_alert.asp"><font color="#009900"><strong>�����޸�ɾ���������������ȥ����ȫվ��̬>>></strong></font></a></td></tr>
          <tr>
            <td height="25" class='TipTitle'>&nbsp;�� ������ʾ</td>
          </tr>
          <tr>
            <td height="30" valign="top" class="TipWords">
<p>1���ر����ѣ����ӡ��޸ġ�ɾ���������������������о�̬��Ȼ��ǰ̨&nbsp;<font color="#FF0000"><strong>��F5ˢ��</strong></font>&nbsp;�鿴Ч����</p>
<p>2����Ҫ���ù��ർ�������ܻᵼ��ҳ����Ρ�</p>
            </td>
          </tr>
          <tr>
            <td height="10" ></td>
          </tr>
        </table>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class='forumRowHighLight'>&nbsp;| <a href="menu_type_add.asp">�����µ�һ������</a></td>
          </tr>
          <tr>
            <td height="10"></td>
          </tr>
      </table>
	   
	  
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="2">
          <tr>
            <td width="7%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">���</div></td>
            <td width="17%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��������</div></td>
            <td width="21%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��������</div></td>
            <td width="16%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��ʾ����</div></td>
            <td width="13%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">����ʱ��</div></td>
            <td width="17%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">����</div></td>
          </tr>
<% '�б�ģ��
strFileName="menu_type_list.asp" 
pageno=50
set rs = server.CreateObject("adodb.recordset")
s_sql="select * from web_menu_type where TopNav=1 order by  [order]"
rs.Open (s_sql),cn,1,1
rscount=rs.recordcount
if not rs.eof and not rs.bof then
call showsql(pageno)
rs.move(rsno)
for p_i=1 to loopno
%>
<% if p_i mod 2 =0 then
class_style="forumRow"
else
class_style="forumRowHighLight"
end if%>
            <form name="form1" method="post" action="?action=edit&id=<%=rs("id")%>">
          <tr >
            <td   height="40" class='<%=class_style%>'><div align="center"><%=rs("id")%></div></td>
            <td class='<%=class_style%>' ><div align="center"><%=rs("name")%></div></td>          
            <td class='<%=class_style%>' ><div align="left"><%=rs("url")%></div></td>
            <td class='<%=class_style%>' ><div align="center">
              <label>
              <input name="order" type="text" value="<%=rs("order")%>" size="5">
              <input type="submit" name="Submit" value="�޸�����">
              </label>
            </div></td>
            <td class='<%=class_style%>' ><div align="center"><%=rs("time")%></div></td>
            <td class='<%=class_style%>' >
            <div align="center"><a href="menu_type_edit.asp?id=<%=rs("id")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">�޸�</a> | <a href="javascript:if(ask('���棺ɾ���󽫲��ɻָ���ȷ��Ҫɾ����')) location.href='menu_type_del.asp?id=<%=rs("id")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>';">ɾ��</a>            </div></td>
          </tr></form>
		  		  <%
		  rs.movenext
		  next
		  else
response.write "<div align='center'><span style='color: #FF0000'>�������ݣ�</span></div>"
		  end if 
		  rs.close
		  set rs=nothing
		  %>
		    <tr  >
              <td height="35"  colspan="11" ><div align="center">
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