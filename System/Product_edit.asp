<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->
<%
page=request.querystring("page")
act=request.querystring("act")
keywords=request.querystring("keywords")
product_id=cint(request.querystring("id"))

act1=Request("act1")
If act1="save" Then 
l_id=trim(request.form("l_id"))
a_title=trim(request.form("title"))
a_wine=trim(request.form("wine"))
a_net=trim(request.form("a_net"))
end if
     %>

	<%
Call header()

%>
<% set rs=server.createobject("adodb.recordset")
sql="select * from article where id="&product_id&""
rs.open sql,cn,1,1
if not rs.eof and not rs.bof then%>
<form id="form1" name="form1" method="post" action="?act1=save&page=<%=page%>&act=<%=act%>&keywords=<%=keywords%>">
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25><font size="2">�༭��Ʒ</font></th>
	<tr>
	<td width="15%" height=23 class='forumRow'><font size="2">���� (����) </font> </td>
	<td class='forumRow'><input name='a_title' type='text' id='a_title' value="<%=rs("title") %>" size='70'><font size="2">
	  &nbsp;</font></td>
	</tr>
	<tr>
	<td class='forumRowHighLight' height=23><font size="2">����</font><span class="forumRow"><font size="2"> (��ѡ) 
	</font> </span></td>
    <td class='forumRowHighLight'>
            <font size="2">
            </select>
            &nbsp;&nbsp;
            </font>
            <select name="pid" id="pid"  onchange="changeselect2(this.value)">
              <option value="">ѡ���������</option>
            </select><font size="2">
            &nbsp;&nbsp;
            </font>
            <select name="ppid" id="ppid">
              <option value="">ѡ����������</option>
            </select><font size="2">&nbsp;</font></td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23><font size="2">Ʒ�� </font> </td>
	    <td class='forumRow'><input name='SalePrice' type='text' id='SalePrice' size='30'><font size="2" color="#FF0000">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font><font size="2">
		</font>
        </td>
      </tr>
	  <tr>
	    <td class='forumRowHighLight' height=23><font size="2">�ͺ�</font></td>
	    <td class='forumRowHighLight'><input name='SaleCount' type='text' id='SaleCount' size='30'><font color="#FF0000" size="2">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font></td>
      </tr>
	  <tr>
	    <td class='forumRow' height=23><font size="2">�г���</font></td>
	    <td class='forumRow'><input name='a_wine' type='text' id='a_wine' size='30'><font color="#FF0000" size="2">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font></td>
      </tr>
	  <tr>
	    <td class='forumRowHighLight' height=23><font size="2">�Żݼ�</font></td>
	    <td class='forumRowHighLight'><input name='a_net' type='text' id='a_net' size='30'><font color="#FF0000" size="2">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font></td>
      </tr>      
	  <tr>
	    <td class='forumRowHighLight' height=23><font size="2">��ƷͼƬ</font></td>
	    <td width="85%" class='forumRowHighLight'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%" ><input name="web_image" type="text" id="web_image"  size="30"></td>
           <td width="78%"  ><font size="2"><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=2"></iframe>
			</font></td>
         </tr>
       </table></td>
      </tr>

        <td  class='forumRowHighLight' height=23><font size="2">�ؼ���</font></td>
	      <td class='forumRowHighLight'><input type='text' id='a_keywords' name='a_keywords' size='100'><font size="2">&nbsp;�������Ķ��š���������</font></td>
	</tr><tr>
	  <td class='forumRowHighLight' height=11><font size="2">���� </font> </td>
	  <td class='forumRowHighLight'><textarea name='a_description'  cols="100" rows="4" id="a_description" ></textarea></td>
	</tr>
	<tr>
	  <td class='forumRow' height=23><font size="2">���� (����) </font> </td>
	  <td class='forumRow'> <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea></td>
	</tr>
	
	<input name='a_author' type='hidden' id='a_author' value="<%=Session("log_name")%>" size='40'>
	
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">�Ƿ���ʾ���ύ��������ť</font></td>
	  <td class='forumRowHighLight'>
	  <input type="radio" name="product_order_show" value="1" checked><font size="2">��&nbsp;
	  </font>
	  <input type="radio" name="product_order_show" value="0"><font size="2">��
	   
		</font>
	  </td>
	</tr>
	
	<tr>
	  <td class='forumRow' height=23><font size="2">�Ա�������ַ</font></td>
	  <td class='forumRow'><span class="forumRow">
	    <input name='product_tbbuy_url' type='text' id='product_tbbuy_url' size='120'><font size="2">
		</font>
	  </span><font size="2">��Ϊ������ʾ��ȥ�Ա��ġ���ť��</font></td>
	</tr>
	
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">�������</font></td>
	  <td class='forumRowHighLight'><input name='a_hit' type='text' id='a_hit' value="0" size='40'><font size="2">
      &nbsp;ֻ��������</font></td>
	  </tr>
	<tr>
	  <td class='forumRow' height=23><font size="2">�Ƽ�����ҳ</font></td>
	  <td class='forumRow'><input type="radio" name="a_index_push" value="1"><font size="2">��&nbsp;</font><input name="a_index_push" type="radio" value="0" checked><font size="2">��</font></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">����ʱ��</font></td>
	  <td class='forumRowHighLight'><span class="forumRow">
	    <input name="juhaoyongEditTime" type="text" value="<%=now()%>" size="30"></span><font size="2">��<strong><font color="#FF0000">*ע�Ᵽ��ԭ��ʱ���ʽ*��ʽ�����磺2018-5-8 9:09:09</font>��ͨ������ʱ�䣬���Ե���ǰ̨��ʾ˳��ʱ��Խ��Խ��ǰ��</strong>
	  </font>
	  </td>
	</tr>

	  
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='�ύ' onClick='javascript:return checksignup1()' name=Submit><font size="2">
		</font>
	  </div></td></tr>
	</table>
</form>
<%
else
response.write"δ�ҵ�����"
end if%>
<%
Call DbconnEnd()
 %>