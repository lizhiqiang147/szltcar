<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->

<% '������ݵ����ݱ�
act=Request("act")
If act="save" Then 
a_id=trim(request.form("a_id"))
a_title=trim(request.form("a_title"))
a_wine=trim(request.form("a_wine"))
a_net=trim(request.form("a_net"))
SalePrice=trim(request.form("SalePrice"))
SaleCount=trim(request.form("SaleCount"))
l_image=trim(request.form("web_image"))
a_content=trim(request.form("a_content"))
index_push=trim(request.form("index_push"))

set rs=server.createobject("adodb.recordset")
sql="select * from article"
rs.open(sql),cn,1,3
rs.addnew
rs("title")=a_title
rs("SalePrice")=SalePrice
rs("SaleCount")=SaleCount
rs("wine")=a_wine
rs("net")=a_net
rs("image")=l_image
rs("content")=a_content
rs("articletype")=2
rs("cid")=232
rs("index_push")=cint(index_push)
rs("time")=now()
rs.update
rs.close
set rs=nothing
%>

<%
call index_to_html()
response.Write "<script language='javascript'>alert('��ӳɹ���');location.href='product_list.asp';</script>"
end if 
%>


<%
Call header()
%>

<script charset="utf-8" src="Keditor/kindeditor.js"></script>
<script charset="utf-8" src="Keditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="Keditor/editor.js"></script>


<form id="form1" name="form1" method="post" action="?act=save">
    <table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align="center">
        <tr>
            <th class='tableHeaderText' colspan="2" height="25"><font size="2">��ӳ���</font></th>
            <tr>
                <td width="15%" height="23" class='forumRowHighLight'><font size="2">���� (����) </font></td>
                <td class='forumRowHighLight'>
                    <input name='a_title' type='text' id='a_title' size='70'><font size="2">
	  &nbsp;</font></td>
            </tr>

        <tr>
            <td class='forumRow' height="23"><font size="2">Ʒ�� </font></td>
            <td class='forumRow'>
                <input name='SalePrice' type='text' id='SalePrice' size='30'><font size="2" color="#FF0000">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font><font size="2">
		</font>
            </td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">�ͺ�</font></td>
            <td class='forumRowHighLight'>
                <input name='SaleCount' type='text' id='SaleCount' size='30'><font color="#FF0000" size="2">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font></td>
        </tr>
        <tr>
            <td class='forumRow' height="23"><font size="2">�г���</font></td>
            <td class='forumRow'>
                <input name='a_wine' type='text' id='a_wine' size='30'><font color="#FF0000" size="2">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font></td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">�Żݼ�</font></td>
            <td class='forumRowHighLight'>
                <input name='a_net' type='text' id='a_net' size='30'><font color="#FF0000" size="2">����Ϊ�գ���ǰ̨����ҳ����ʾ���</font></td>
        </tr>
        <tr>
            <td class='forumRow' height="23"><font size="2">����ͼƬ</font></td>
            <td width="85%" class='forumRow'>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="22%">
                            <input name="web_image" type="text" id="web_image" size="30"></td>
                        <td width="78%"><font size="2"><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=2&uploadFileOldName=<%=rs("image")%>""></iframe>
			</font></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">���� (����) </font></td>
            <td class='forumRowHighLight'>
                <textarea name="a_content" id="a_content" style="width: 100%; height: 400px; visibility: hidden;"></textarea></td>
        </tr>

        <input name='a_author' type='hidden' id='a_author' value="<%=Session("log_name")%>" size='40'>




        <tr>
            <td class='forumRow' height="23"><font size="2">�Ƽ�����ҳ</font></td>
            <td class='forumRow'>
                <input type="radio" name="index_push" value="1" checked><font size="2">��&nbsp;</font><input name="index_push" type="radio" value="0"><font size="2">��</font></td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">����ʱ��</font></td>
            <td class='forumRowHighLight'><span class="forumRow">
                <input name="juhaoyongEditTime" type="text" value="<%=now()%>" size="30"></span><font size="2">��<strong><font color="#FF0000">*ע�Ᵽ��ԭ��ʱ���ʽ*��ʽ�����磺2018-5-8 9:09:09</font>��ͨ������ʱ�䣬���Ե���ǰ̨��ʾ˳��ʱ��Խ��Խ��ǰ��</strong>
	  </font>
            </td>
        </tr>


        <tr>
            <td height="50" colspan="2" class='forumRow'>
                <div align="center">
                    <input type="submit" value='�ύ' onclick='javascript: return true' name="Submit"><font size="2">
		</font>
                </div>
            </td>
        </tr>
    </table>

</form>
<br />
<br />
<br />

<%
Call DbconnEnd()
%>