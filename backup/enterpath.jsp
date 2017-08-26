<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>数据库备份</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='010405'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[数据库备份]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr align="center"> 
      <td colspan="2" height="139"> 
        <p>数据库备份</p>
        <p><font color="#FF3333"><b>为了系统的安全，进行定期的数据库备份非常重要</b></font></p>
        <p><b><font color="#FF3333">每天应在下班前进行备份，备份时只需输入目录，点击按钮即可</font></b></p>
      </td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="70">备份目录</td>
      <td width="64%" height="70"> 
        <input type="text" name="path" value="E:\ERP数据备份">
        <input type="button" value="开始数据备份" onClick="f_do(insertform)" name="button">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="71">&nbsp; </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.path)=="") {
		alert("请输入[备份目录]！");
		FormName.path.focus();
		return false;
	}

	FormName.action="backdb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.imppath)=="") {
		alert("请输入[导入文件]！");
		FormName.imppath.focus();
		return false;
	}

	FormName.action="impdb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
