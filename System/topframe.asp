<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- #include file="../inc/access.asp" -->
<!-- #include file="inc/functions.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>��ҵ��վ����ϵͳ</title>
<script language=JavaScript>
function logout(){
	if (confirm("��ȷ��Ҫ�˳���̨������"))
	top.location = "logout.asp";
	return false;
}
</script>

</head>

<body>
<div class="header_content">
     <div class="logo"></div>
	 <div class="right_nav">
	    <div class="text_left"><ul class="nav_list"><li></li></ul></div>
		<div class="text_right">
			<ul class="nav_return">
			<li><a href="/" target="_blank">ǰ̨��ҳ</a> |  <a href="#" target="_self" onClick="logout();">�˳�����</a></li>
			</ul>
		</div>
	 </div>
</div>
</body>
</html>