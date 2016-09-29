	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25><font size="2">编辑栏目</font></th>
	<tr>
	  <td height=23 colspan="2" class='forumRow'><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" class='TipTitle'><font size="2">&nbsp;√ 操作提示</font></td>
        </tr>
        <tr>
          <td height="30" valign="top" class="TipWords"><p><font size="2">1、一般情况下，您可需要填写栏目名称即可,栏目文件夹名称不填将会自动用拼音命名。</font></p>
            <p><font size="2">2、栏目文件夹将会在根目录下进行创建，请尽量使用与系统文件夹不同的名称命名。</font></p>
            <p><font size="2">3、系统文件夹有。</font></p>
            </td>
        </tr>
        <tr>
          <td height="10"><font size="2">&nbsp;</font></td>
        </tr>
      </table></td>
	  </tr>
	<tr>
	<td width="15%" height=23 class='forumRowHighLight'><font size="2">栏目名称（必填）</font></td>
	<td class='forumRowHighLight'><input name='c_name' type='text' id='c_name' size='40'><font size="2">
	</font>
	<input name='pid' type='hidden' id='pid' size='40' value="<%=pid%>">
	<input name='ppid' type='hidden' id='ppid' size='40' value="<%=ppid%>">
<span style="color: #FF0000"><font size="2"><%
	  if ppid=2 then
response.write "当前为二级栏目:&nbsp;"&pid_name
elseif ppid=3 then
response.write "当前为三级栏目:&nbsp;"&pid_name&"&nbsp;>&nbsp;"&pid_name2
else
response.write "当前为一级栏目"
end if%></font></span></td>
	</tr>
	
	<tr>
	<td class='forumRowHighLight' height=23><font size="2">栏目文件夹名称（必填）</font></td>
    <td class='forumRowHighLight'><input type='text' id='c_folder' name='c_folder' size='40'><font size="2">
      &nbsp;</font><span style="color: #FF0000"><font size="2">&nbsp;格式如：Baidu（请用英文字母命名，且不要带特殊字符和空格），若为空将自动用栏目名称拼音。（勿与系统文件夹名重复！）</font></span></td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23><font size="2">栏目图片</font><span style="color: #FF0000"><font size="2">（只有“关于公司”和“联系我们”栏目，才需要上传栏目图片，在首页栏目显示）</font></span></td>
	    <td width="85%" class='forumRow'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%"  class='forumRow'><input name="web_image" type="text" id="web_image"  size="30"></td>
           <td width="78%"  class='forumRow'><font size="2"><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=1"></iframe>
			</font></td>
         </tr>
       </table></td>
      </tr>
	  
	 <tr>
	  <td class='forumRowHighLight' height=23><font size="2">栏目页标题</font></td>
	  <td class='forumRowHighLight'>
	    <input name='c_title' type='text' id='c_title' size='50' maxlength="200" /><font size="2">
		</font>
	 </td>
	</tr>


      <td class='forumRowHighLight' height=11><font size="2">栏目页关键字</font></td>
	      <td class='forumRowHighLight'><input type='text' id='v3' name='c_keywords' size='80'><font size="2">
	  &nbsp;请以，隔开</font></td>
	</tr>
	
	<tr>
	  <td class='forumRowHighLight' height=11><font size="2">栏目页描述</font></td>
	  <td class='forumRowHighLight'><textarea name='c_description'  cols="100" rows="4" id="c_description" ></textarea></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">栏目简介</font><font size="2" color="#FF0000">（只有“单页”类型的栏目，才需要填写该栏）</font></td>
	  <td class='forumRowHighLight'>  <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea><font size="2">
		</font>
</td>
	</tr>
<%if juhaoyongClassType="0" then%>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">栏目属性</font></td>
	  <td class='forumRowHighLight'>
		<input name="ClassType" type="radio" value="1" checked="checked"><font size="2">文章&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="2"><font size="2">产品&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="4"><font size="2">招聘&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="5"><font size="2">单页
		</font>
		</td>
	 </tr>	
<%elseif juhaoyongClassType="4" then%>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">栏目属性</font></td>
	  <td class='forumRowHighLight'>
		<input name="ClassType" type="radio" value="4" checked="checked"><font size="2">招聘&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="5"><font size="2">单页
		</font>
		</td>
	 </tr>
<%elseif juhaoyongClassType="1" then%>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">栏目属性</font></td>
	  <td class='forumRowHighLight'>
		<input name="ClassType" type="radio" value="1" checked="checked"><font size="2">文章&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="5"><font size="2">单页
		</font>
		</td>
	 </tr>
<%else%>
<input name="ClassType" type="hidden" value="<%=juhaoyongClassType%>">
<%end if%>
<tr>
	    <td class='forumRowHighLight' height=23><font size="2">栏目排序</font></td>
	    <td class='forumRowHighLight'><span class="forumRow">
	      <input name='order' type='text' id='order' value="100" size='20' maxlength="5"><font size="2">
	    &nbsp;只能是数字，数字越小排名越靠前，默认为100，将排在最后面</font></span></td>
      </tr>	
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit><font size="2">
		</font>
	  </div></td></tr>
	</table>
	<font size="2">
</form><br /><br /><br /></font>