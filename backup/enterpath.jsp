<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>���ݿⱸ��</title>
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
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���ݿⱸ��]��"+xtrzyhmc+"') ";
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
        <p>���ݿⱸ��</p>
        <p><font color="#FF3333"><b>Ϊ��ϵͳ�İ�ȫ�����ж��ڵ����ݿⱸ�ݷǳ���Ҫ</b></font></p>
        <p><b><font color="#FF3333">ÿ��Ӧ���°�ǰ���б��ݣ�����ʱֻ������Ŀ¼�������ť����</font></b></p>
      </td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="70">����Ŀ¼</td>
      <td width="64%" height="70"> 
        <input type="text" name="path" value="E:\ERP���ݱ���">
        <input type="button" value="��ʼ���ݱ���" onClick="f_do(insertform)" name="button">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.path)=="") {
		alert("������[����Ŀ¼]��");
		FormName.path.focus();
		return false;
	}

	FormName.action="backdb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.imppath)=="") {
		alert("������[�����ļ�]��");
		FormName.imppath.focus();
		return false;
	}

	FormName.action="impdb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
