<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="content-language" content="zh-cn" />
<!-- #include file="../inc/AntiAttack.asp" -->
<!-- #include file="../inc/conn.asp" -->
<!-- #include file="../inc/web_config.asp" -->
<!-- #include file="../inc/html_clear.asp" -->
<%
a_id=request.querystring("id")
%>
<%
set rs=server.createobject("adodb.recordset")
sql="select [title] from [article] where [id]="&a_id&" and view_yes=1"
rs.open(sql),cn,1,1
if not rs.eof then
ProductName=rs("title")
end if
rs.close 
set rs=nothing
%>
<title>���߶���_<%=ProductName%></title>
<link href="/css/juhaoyongfgstyle/inner.css" rel="stylesheet" type="text/css" />
<link href="/css/juhaoyongfgstyle/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/css/juhaoyongfgstyle/functions.js"></script>

</head>

<body>
<!--FeedBack start-->
<div class="FeedBack">


<div class="commentbox">
<form id="form1" name="form1" method="post" action="/inc/order.asp?act=add&id=<%=a_id%>">
  <table id="commentform" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>������Ʒ</td>
      <td><span class='OrderName'><%=ProductName%></span><input type='hidden' name='ProductName' id='ProductName' value="<%=ProductName%>"></td>
    </tr>
    <tr>
      <td>��������</td>
      <td><input name='ordercount' type='text' id='ordercount' size='10' maxlength="10" value='1'><span class="FontRed">*</span></td>
    </tr>    
    <tr>
      <td>��ϵ��</td>
      <td><input name='name' type='text' id='name' size='30' maxlength="30"><span class="FontRed">*</span></td>
    </tr>
    <tr>
      <td>��ϵ��ַ</td>
      <td><input name='address' type='text' id='address' size='30' maxlength="30"><span class="FontRed">*</span></td>
    </tr>
    <tr>
      <td>��ϵ�绰</td>
      <td><input name='tel' type='text' id='tel' size='30' maxlength="30"><span class="FontRed">*</span></td>
    </tr>    
    <tr>
      <td>�����ʼ�</td>
      <td><input name='email' type='text' id='email' size='30' maxlength="80"></td>
    </tr>
    <tr>
      <td>QQ</td>
      <td><input name='qq' type='text' id='qq' size='30' maxlength="30"></td>
    </tr>	
    <tr>
      <td>��ע</td>
      <td>
        <textarea name="content" cols="60" rows="5"  value="" ></textarea>
           </td>    </tr>
    <tr>
      <td>��֤��</td>
      <td><input name="verycode"  maxLength=5 size=10 > <span class="FontRed">*</span><img src="/inc/getcode.asp" width="55"  onclick="this.src=this.src+'?'" alt="ͼƬ�����壿������µõ���֤��" style="cursor:hand;"></td>
    </tr>	
    <tr>
      <td>&nbsp;</td>
      <td><input class="Cbutton" type="submit" value=" �������� " onClick='javascript:return order_check()'></td>
    </tr>
  </table>
</form>
</div>

</div>
<!--FeedBack end-->


<script type="text/javascript">
window.onerror=function(){return true;}
</script>

<script type="text/javascript" src="/juhaoyong-kfimgs/jquery.js"></script>
<script type="text/javascript" src="/juhaoyong-kfimgs/kf.js"></script>
</body>
</html>


