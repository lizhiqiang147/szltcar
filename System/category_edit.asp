	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25><font size="2">�༭��Ŀ</font></th>
	<tr>
	  <td height=23 colspan="2" class='forumRow'><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" class='TipTitle'><font size="2">&nbsp;�� ������ʾ</font></td>
        </tr>
        <tr>
          <td height="30" valign="top" class="TipWords"><p><font size="2">1��һ������£�������Ҫ��д��Ŀ���Ƽ���,��Ŀ�ļ������Ʋ�����Զ���ƴ��������</font></p>
            <p><font size="2">2����Ŀ�ļ��н����ڸ�Ŀ¼�½��д������뾡��ʹ����ϵͳ�ļ��в�ͬ������������</font></p>
            <p><font size="2">3��ϵͳ�ļ����С�</font></p>
            </td>
        </tr>
        <tr>
          <td height="10"><font size="2">&nbsp;</font></td>
        </tr>
      </table></td>
	  </tr>
	<tr>
	<td width="15%" height=23 class='forumRowHighLight'><font size="2">��Ŀ���ƣ����</font></td>
	<td class='forumRowHighLight'><input name='c_name' type='text' id='c_name' size='40'><font size="2">
	</font>
	<input name='pid' type='hidden' id='pid' size='40' value="<%=pid%>">
	<input name='ppid' type='hidden' id='ppid' size='40' value="<%=ppid%>">
<span style="color: #FF0000"><font size="2"><%
	  if ppid=2 then
response.write "��ǰΪ������Ŀ:&nbsp;"&pid_name
elseif ppid=3 then
response.write "��ǰΪ������Ŀ:&nbsp;"&pid_name&"&nbsp;>&nbsp;"&pid_name2
else
response.write "��ǰΪһ����Ŀ"
end if%></font></span></td>
	</tr>
	
	<tr>
	<td class='forumRowHighLight' height=23><font size="2">��Ŀ�ļ������ƣ����</font></td>
    <td class='forumRowHighLight'><input type='text' id='c_folder' name='c_folder' size='40'><font size="2">
      &nbsp;</font><span style="color: #FF0000"><font size="2">&nbsp;��ʽ�磺Baidu������Ӣ����ĸ�������Ҳ�Ҫ�������ַ��Ϳո񣩣���Ϊ�ս��Զ�����Ŀ����ƴ����������ϵͳ�ļ������ظ�����</font></span></td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23><font size="2">��ĿͼƬ</font><span style="color: #FF0000"><font size="2">��ֻ�С����ڹ�˾���͡���ϵ���ǡ���Ŀ������Ҫ�ϴ���ĿͼƬ������ҳ��Ŀ��ʾ��</font></span></td>
	    <td width="85%" class='forumRow'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%"  class='forumRow'><input name="web_image" type="text" id="web_image"  size="30"></td>
           <td width="78%"  class='forumRow'><font size="2"><iframe width=750 name="ad" frameborder=0 height=30 scrolling=no src="upload.asp?uploadType=1"></iframe>
			</font></td>
         </tr>
       </table></td>
      </tr>
	  
	 <tr>
	  <td class='forumRowHighLight' height=23><font size="2">��Ŀҳ����</font></td>
	  <td class='forumRowHighLight'>
	    <input name='c_title' type='text' id='c_title' size='50' maxlength="200" /><font size="2">
		</font>
	 </td>
	</tr>


      <td class='forumRowHighLight' height=11><font size="2">��Ŀҳ�ؼ���</font></td>
	      <td class='forumRowHighLight'><input type='text' id='v3' name='c_keywords' size='80'><font size="2">
	  &nbsp;���ԣ�����</font></td>
	</tr>
	
	<tr>
	  <td class='forumRowHighLight' height=11><font size="2">��Ŀҳ����</font></td>
	  <td class='forumRowHighLight'><textarea name='c_description'  cols="100" rows="4" id="c_description" ></textarea></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">��Ŀ���</font><font size="2" color="#FF0000">��ֻ�С���ҳ�����͵���Ŀ������Ҫ��д������</font></td>
	  <td class='forumRowHighLight'>  <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea><font size="2">
		</font>
</td>
	</tr>
<%if juhaoyongClassType="0" then%>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">��Ŀ����</font></td>
	  <td class='forumRowHighLight'>
		<input name="ClassType" type="radio" value="1" checked="checked"><font size="2">����&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="2"><font size="2">��Ʒ&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="4"><font size="2">��Ƹ&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="5"><font size="2">��ҳ
		</font>
		</td>
	 </tr>	
<%elseif juhaoyongClassType="4" then%>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">��Ŀ����</font></td>
	  <td class='forumRowHighLight'>
		<input name="ClassType" type="radio" value="4" checked="checked"><font size="2">��Ƹ&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="5"><font size="2">��ҳ
		</font>
		</td>
	 </tr>
<%elseif juhaoyongClassType="1" then%>
	<tr>
	  <td class='forumRowHighLight' height=23><font size="2">��Ŀ����</font></td>
	  <td class='forumRowHighLight'>
		<input name="ClassType" type="radio" value="1" checked="checked"><font size="2">����&nbsp;&nbsp;
		</font>
		<input name="ClassType" type="radio" value="5"><font size="2">��ҳ
		</font>
		</td>
	 </tr>
<%else%>
<input name="ClassType" type="hidden" value="<%=juhaoyongClassType%>">
<%end if%>
<tr>
	    <td class='forumRowHighLight' height=23><font size="2">��Ŀ����</font></td>
	    <td class='forumRowHighLight'><span class="forumRow">
	      <input name='order' type='text' id='order' value="100" size='20' maxlength="5"><font size="2">
	    &nbsp;ֻ�������֣�����ԽС����Խ��ǰ��Ĭ��Ϊ100�������������</font></span></td>
      </tr>	
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='�ύ' onClick='javascript:return checksignup1()' name=Submit><font size="2">
		</font>
	  </div></td></tr>
	</table>
	<font size="2">
</form><br /><br /><br /></font>