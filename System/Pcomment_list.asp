<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="page_next.asp" -->
<%
'��Ʒ�ļ��л�ȡ
set rs_1=server.createobject("adodb.recordset")
sql="select FolderName from web_Models_type where [id]=6"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Product_FolderName=rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing%>

<% '����ģ��
act=request.querystring("act")
keywords=trim(request.form("keywords"))
if act="search" then
if keywords<>"" then
s_sql="select * from web_Product_comment where [content] like '%"&keywords&"%'  and article_id<>0 order by [time] desc "
else
s_sql="select * from web_Product_comment where [content] like '%"&keywords&"%' and article_id<>0 order by [time] desc"
end if
else
s_sql="select * from web_Product_comment where [content] like '%"&keywords&"%' and article_id<>0 order by [time] desc "

end if 
%>
<script language="javascript">

//ȫѡJS
function unselectall(){
if(document.form2.chkAll.checked){
document.form2.chkAll.checked = document.form2.chkAll.checked&0;
}
}
function CheckAll(form){
for (var i=0;i<form.elements.length;i++){
var e = form.elements[i];
if (e.Name != 'chkAll'&&e.disabled==false)
e.checked = form.chkAll.checked;
}
}
</script>
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
	<tr>
	  <th width="100%" height=25 class='tableHeaderText'>��Ʒ�����б�</th>
	
	<tr><td height="400" valign="top"  class='forumRow'><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" class='TipTitle'>&nbsp;�� ������ʾ</td>
      </tr>
      <tr>
        <td height="30" valign="top" class="TipWords"><p>1�������б���ʾ���в�Ʒ�����ۣ��ɶ����۽��лظ���</p>
            <p>2������ɾ�����ۺ������ɲ�Ʒ����ҳ���ܿ������¡�</p></td>
      </tr>
      <tr>
        <td height="10" ></td>
      </tr>
    </table>
	  <br>
 <form name="form2" method="post" action="PComment_Del.asp?action=AllDel&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="2">
          <tr>
            <td width="2%" height="30" class="TitleHighlight">&nbsp;</td>
            <td width="4%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">���</div></td>
            <td width="54%" height="30" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">��������</div></td>
            <td width="8%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">������</div></td>
            <td width="7%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">���</div></td>
            <td width="18%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">����ʱ��</div></td>
            <td width="9%" class="TitleHighlight"><div align="center" style="font-weight: bold;color:#ffffff">�������</div></td>
          </tr>
<% '��Ʒ�б�ģ��
strFileName="Pcomment_list.asp" 
pageno=20
set rs = server.CreateObject("adodb.recordset")
rs.Open (s_sql),cn,1,1
rscount=rs.recordcount
if not rs.eof and not rs.bof then
call showsql(pageno)
rs.move(rsno)
for p_i=1 to loopno
%>

          <tr >
            <td rowspan="2" class='forumRowHighLight'><div align="center"><input type="checkbox" name="Selectitem" id="Selectitem" value="<%=rs("id")%>"></div></td>
            <td rowspan="2" class='forumRowHighLight'><div align="center"><%=rs("id")%></div></td>
            <td class='forumRowHighLight' ><span style="color: #FF0000">���£�</span>
			
			<%
			set rst=server.createobject("adodb.recordset")
			sql="select [title],file_path from [Article] where id="&rs("article_id")&""
			rst.open(sql),cn,1,1
			if not rst.eof and not rst.bof then
			response.write "<a href='/"&Product_FolderName&"/"&rst("file_path")&"' target='_blank'>"&rst("title")&"</a>"
			end if
			rst.close
			set rst=nothing
			%></td>
            <td class='forumRowHighLight' ><div align="center"><%=rs("name")%>
            </div></td>
            <td class='forumRowHighLight'><div align="center"><a href="Pcomment_view_yes.asp?id=<%=rs("id")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>"><%if rs("view_yes")=1 then%>�����<%else%><span style="color: #FF0000">δ���</span><% end if%></a></div></td>
            <td class='forumRowHighLight' ><div align="center"><%=rs("time")%></div></td>
            <td class='forumRowHighLight' >
            <div align="center"><a href="javascript:if(ask('���棺ɾ���󽫲��ɻָ���ȷ��Ҫɾ����')) location.href='Pcomment_del.asp?id=<%=rs("id")%>&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>';">ɾ��</a></div>				</td>
          </tr>
		            <tr >
            <td   height="50" class='forumRow'>&nbsp;</td>
            <td colspan="5" valign="top" class='forumRow'  style="line-height:180%"><span style="color: #FF0000">���ۣ�</span><%=rs("content")%></td>
          </tr>

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
		            <td height="35"  colspan="9" >&nbsp;<input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form)' value='checkbox'>
                    ȫѡ/ȫ��ѡ&nbsp;<input type="submit" name="Submit" value="ɾ��ѡ��"></td>
          </tr>
		    <tr  >
              <td height="35"  colspan="6" ><div align="center">
                <%call showpage(strFileName,rscount,pageno,false,true,"")%>
           </div></td>
		    </tr>
      </table></form>
	    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" class='forumRow'>&nbsp;</td>
          </tr>
          <tr>
            <td height="25" class='forumRowHighLight'>&nbsp;| ������������</td>
          </tr>
          <tr>
            <td height="70"><form name="form1" method="post" action="?act=search">
                <div align="center">
               
                  <label>
                    <input name="keywords" type="text"  size="35" maxlength="40">
                  </label>
                  <label> &nbsp;
                    <input type="submit" name="Submit" value="�� ��">
                  </label>
                </div>
            </form></td>
          </tr>
        </table>
	    <br></td>
	</tr>
	</table>

<%
Call DbconnEnd()
 %>