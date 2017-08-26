<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk ";
	ls_sql+=" from  jc_cxhdbffyzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>������������ۿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">��������ַ����ۿ�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="button"  value="����" onClick="f_do(insertform)">
            <input type="reset"  value="����">
            <input type="hidden" name="cxhdbm" size="20" maxlength="7"  value="<%=cxhdbm%>" readonly>
                <br>
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">���������</font></td>
      <td width="32%"><%=cxhdbm%></td>
      <td align="right" width="18%"><font color="#0000FF">���������</font></td>
      <td width="32%"><%=cxhdmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
      <td><input type="text" name="clfzk" size="8" maxlength="9"  value="<%=clfzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
      <td align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
      <td><input type="text" name="zcfzk" size="8" maxlength="9"  value="<%=zcfzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���̣��˹����ۿ�</td>
      <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="<%=rgfzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>���̣�������ۿ�</td>
      <td><input type="text" name="ysfzk" size="8" maxlength="8" value="<%=ysfzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���̣���е���ۿ�</td>
      <td><input type="text" name="jxfzk" size="8" maxlength="8" value="<%=jxfzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>���̣���ķ��ۿ�</td>
      <td><input type="text" name="shfzk" size="8" maxlength="8" value="<%=shfzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���̣��������ۿ�</td>
      <td><input type="text" name="qtfzk" size="8" maxlength="8" value="<%=qtfzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clfzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.clfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcfzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcfzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcfzk.select();
		return false;
	}
	if(	javaTrim(FormName.rgfzk)=="") {
		alert("������[�˹����ۿ�]��");
		FormName.rgfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfzk, "�˹����ۿ�"))) {
		return false;
	}
	if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
	{
		alert("����[�˹����ۿ�]Ӧ����0��10֮�䣡");
		FormName.rgfzk.select();
		return false;
	}
	if(	javaTrim(FormName.ysfzk)=="") {
		alert("������[������ۿ�]��");
		FormName.ysfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysfzk, "������ۿ�"))) {
		return false;
	}
	if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ysfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxfzk)=="") {
		alert("������[��е���ۿ�]��");
		FormName.jxfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxfzk, "��е���ۿ�"))) {
		return false;
	}
	if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
	{
		alert("����[��е���ۿ�]Ӧ����0��10֮�䣡");
		FormName.jxfzk.select();
		return false;
	}
	if(	javaTrim(FormName.shfzk)=="") {
		alert("������[��ķ��ۿ�]��");
		FormName.shfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.shfzk, "��ķ��ۿ�"))) {
		return false;
	}
	if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
	{
		alert("����[��ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.shfzk.select();
		return false;
	}
	if(	javaTrim(FormName.qtfzk)=="") {
		alert("������[�������ۿ�]��");
		FormName.qtfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfzk, "�������ۿ�"))) {
		return false;
	}
	if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
	{
		alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.qtfzk.select();
		return false;
	}
	
	FormName.action="SaveInsertJc_cxhdbffyzk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
