<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/x_to_html/index_to_html.asp" -->

<% '添加数据到数据表
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
response.Write "<script language='javascript'>alert('添加成功！');location.href='product_list.asp';</script>"
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
            <th class='tableHeaderText' colspan="2" height="25"><font size="2">添加车辆</font></th>
            <tr>
                <td width="15%" height="23" class='forumRowHighLight'><font size="2">标题 (必填) </font></td>
                <td class='forumRowHighLight'>
                    <input name='a_title' type='text' id='a_title' size='70'><font size="2">
	  &nbsp;</font></td>
            </tr>

        <tr>
            <td class='forumRow' height="23"><font size="2">品牌 </font></td>
            <td class='forumRow'>
                <input name='SalePrice' type='text' id='SalePrice' size='30'><font size="2" color="#FF0000">（若为空，则前台详情页不显示该项）</font><font size="2">
		</font>
            </td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">型号</font></td>
            <td class='forumRowHighLight'>
                <input name='SaleCount' type='text' id='SaleCount' size='30'><font color="#FF0000" size="2">（若为空，则前台详情页不显示该项）</font></td>
        </tr>
        <tr>
            <td class='forumRow' height="23"><font size="2">市场价</font></td>
            <td class='forumRow'>
                <input name='a_wine' type='text' id='a_wine' size='30'><font color="#FF0000" size="2">（若为空，则前台详情页不显示该项）</font></td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">优惠价</font></td>
            <td class='forumRowHighLight'>
                <input name='a_net' type='text' id='a_net' size='30'><font color="#FF0000" size="2">（若为空，则前台详情页不显示该项）</font></td>
        </tr>
        <tr>
            <td class='forumRow' height="23"><font size="2">车辆图片</font></td>
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
            <td class='forumRowHighLight' height="23"><font size="2">介绍 (必填) </font></td>
            <td class='forumRowHighLight'>
                <textarea name="a_content" id="a_content" style="width: 100%; height: 400px; visibility: hidden;"></textarea></td>
        </tr>

        <input name='a_author' type='hidden' id='a_author' value="<%=Session("log_name")%>" size='40'>




        <tr>
            <td class='forumRow' height="23"><font size="2">推荐到首页</font></td>
            <td class='forumRow'>
                <input type="radio" name="index_push" value="1" checked><font size="2">是&nbsp;</font><input name="index_push" type="radio" value="0"><font size="2">否</font></td>
        </tr>
        <tr>
            <td class='forumRowHighLight' height="23"><font size="2">更新时间</font></td>
            <td class='forumRowHighLight'><span class="forumRow">
                <input name="juhaoyongEditTime" type="text" value="<%=now()%>" size="30"></span><font size="2">　<strong><font color="#FF0000">*注意保持原有时间格式*格式必须如：2018-5-8 9:09:09</font>（通过调整时间，可以调整前台显示顺序，时间越大越靠前）</strong>
	  </font>
            </td>
        </tr>


        <tr>
            <td height="50" colspan="2" class='forumRow'>
                <div align="center">
                    <input type="submit" value='提交' onclick='javascript: return true' name="Submit"><font size="2">
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