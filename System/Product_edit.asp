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
	  <th class='tableHeaderText' colspan=2 height=25><font size="2">编辑产品</font></th>
	<tr>
	<td width="15%" height=23 class='forumRow'><font size="2">标题 (必填) </font> </td>
	<td class='forumRow'><input name='a_title' type='text' id='a_title' value="<%=rs("title") %>" size='70'><font size="2">
	  &nbsp;</font></td>
	</tr>
	<tr>
	<td class='forumRowHighLight' height=23><font size="2">分类</font><span class="forumRow"><font size="2"> (必选) 
	</font> </span></td>
    <td class='forumRowHighLight'>
            <font size="2">
            </select>
            &nbsp;&nbsp;
            </font>
            <select name="pid" id="pid"  onchange="changeselect2(this.value)">
              <option value="">选择二级分类</option>
            </select><font size="2">
            &nbsp;&nbsp;
            </font>
            <select name="ppid" id="ppid">
              <option value="">选择三级分类</option>
            </select><font size="2">&nbsp;</font></td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23><font size="2">品牌 </font> </td>
	    <td class='forumRow'><input name='SalePrice' type='text' id='SalePrice' size='30'><font size="2" color="#FF0000">（若为空，则前台详情页不显示该项）</font><font size="2">
		</font>
        </td>
      </tr>
	  <tr>
	    <td class='forumRowHighLight' height=23><font size="2">型号</font></td>
	    <td class='forumRowHighLight'><input name='SaleCount' type='text' id='SaleCount' size='30'><font color="#FF0000" size="2">（若为空，则前台详情页不显示该项）</font></td>
      </tr>
	  <tr>
	    <td class='forumRow' height=23><font size="2">市场价</font></td>
	    <td class='forumRow'><input name='a_wine' type='text' id='a_wine' size='30'><font color="#FF0000" size="2">（若为空，则前台详情页不显示该项）</font></td>
      </tr>
	  <tr>
	    <td class='forumRowHighLight' height=23><font size="2">优惠价</font></td>
	    <td class='forumRowHighLight'><input name='a_net' type='text' id='a_net' size='30'><font color="#FF0000" size="2">（若为空，则前台详情页不显示该项）</font></td>
      </tr>      
	  <tr>
	    <td class='forumRowHighLight' height=23><font size="2">产品图片</font></td>
	    <td width="85%" class='forumRowHighLight'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%" ><input name="web_image" type="text" id="web_image"  size="30"></td>
           <td width="78%"  ><font size="2"><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=2"></iframe>
			</font></td>
         </tr>
       </table></td>
      </tr>

        <td  class='forumRowHighLight' height=23><font size="2">关键字</font></td>
	      <td class='forumRowHighLight'><input type='text' id='a_keywords' name='a_keywords' size='100'><font size="2">&nbsp;请以中文逗号“，”隔开</font></td>
	</tr><tr>
	  <td class='forumRowHighLight' height=11><font size="2">描述 </font> </td>
	  <td class='forumRowHighLight'><textarea name='a_description'  cols="100" rows="4" id="a_description" ></textarea></td>
	</tr>
	<tr>
	  <td class='forumRow' height=23><font size="2">介绍 (必填) </font> </td>
	  <td class='forumRow'> <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea></td>
	</tr>
	
	<input name='a_author' type='hidden' id='a_author' value="<%=Session("log_name")%>" size='40'>
	
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">是否显示“提交订单”按钮</font></td>
	  <td class='forumRowHighLight'>
	  <input type="radio" name="product_order_show" value="1" checked><font size="2">是&nbsp;
	  </font>
	  <input type="radio" name="product_order_show" value="0"><font size="2">否
	   
		</font>
	  </td>
	</tr>
	
	<tr>
	  <td class='forumRow' height=23><font size="2">淘宝宝贝网址</font></td>
	  <td class='forumRow'><span class="forumRow">
	    <input name='product_tbbuy_url' type='text' id='product_tbbuy_url' size='120'><font size="2">
		</font>
	  </span><font size="2">（为空则不显示“去淘宝拍”按钮）</font></td>
	</tr>
	
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">浏览次数</font></td>
	  <td class='forumRowHighLight'><input name='a_hit' type='text' id='a_hit' value="0" size='40'><font size="2">
      &nbsp;只能是数字</font></td>
	  </tr>
	<tr>
	  <td class='forumRow' height=23><font size="2">推荐到首页</font></td>
	  <td class='forumRow'><input type="radio" name="a_index_push" value="1"><font size="2">是&nbsp;</font><input name="a_index_push" type="radio" value="0" checked><font size="2">否</font></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">更新时间</font></td>
	  <td class='forumRowHighLight'><span class="forumRow">
	    <input name="juhaoyongEditTime" type="text" value="<%=now()%>" size="30"></span><font size="2">　<strong><font color="#FF0000">*注意保持原有时间格式*格式必须如：2018-5-8 9:09:09</font>（通过调整时间，可以调整前台显示顺序，时间越大越靠前）</strong>
	  </font>
	  </td>
	</tr>

	  
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit><font size="2">
		</font>
	  </div></td></tr>
	</table>
</form>
<%
else
response.write"未找到数据"
end if%>
<%
Call DbconnEnd()
 %>