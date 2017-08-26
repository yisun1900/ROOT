<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;

double gczjxfzk=10;
double glfzjxzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;
double qtsfxmzjxzk=10;


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


	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
	ls_sql+=" from  jc_cxhdzjxzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
		qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
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
  <div align="center">������������ۿ�</div>
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
      <td align="right" width="20%"><font color="#0000FF">���������</font></td>
      <td width="30%"><%=cxhdbm%></td>
      <td align="right" width="20%"><font color="#0000FF">���������</font></td>
      <td width="30%"><%=cxhdmc%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�����������ۿ�</td>
      <td><input type="text" name="gczjxfzk" value="<%=gczjxfzk%>" size="8" maxlength="8" >
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>������������ۿ�</td>
      <td><input type="text" name="glfzjxzk" value="<%=glfzjxzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>˰���������ۿ�</td>
      <td><input type="text" name="sjzjxzk" value="<%=sjzjxzk%>" size="8" maxlength="8" >
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>��Ʒ��������ۿ�</td>
      <td><input type="text" name="sjfzjxzk" value="<%=sjfzjxzk%>" size="8" maxlength="8" >
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�����շ���Ŀ�������ۿ�</td>
      <td><input type="text" name="qtsfxmzjxzk" value="<%=qtsfxmzjxzk%>" size="8" maxlength="8" >
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

	if(	javaTrim(FormName.gczjxfzk)=="") {
		alert("������[�����������ۿ�]��");
		FormName.gczjxfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gczjxfzk, "�����������ۿ�"))) {
		return false;
	}
	if (FormName.gczjxfzk.value<0 || FormName.gczjxfzk.value>10)
	{
		alert("����[�����������ۿ�]Ӧ����0��10֮�䣡");
		FormName.gczjxfzk.select();
		return false;
	}

	if(	javaTrim(FormName.glfzjxzk)=="") {
		alert("������[������������ۿ�]��");
		FormName.glfzjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.glfzjxzk, "������������ۿ�"))) {
		return false;
	}
	if (FormName.glfzjxzk.value<0 || FormName.glfzjxzk.value>10)
	{
		alert("����[������������ۿ�]Ӧ����0��10֮�䣡");
		FormName.glfzjxzk.select();
		return false;
	}

	if(	javaTrim(FormName.sjzjxzk)=="") {
		alert("������[˰���������ۿ�]��");
		FormName.sjzjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzjxzk, "˰���������ۿ�"))) {
		return false;
	}
	if (FormName.sjzjxzk.value<0 || FormName.sjzjxzk.value>10)
	{
		alert("����[˰���������ۿ�]Ӧ����0��10֮�䣡");
		FormName.sjzjxzk.select();
		return false;
	}

	if(	javaTrim(FormName.sjfzjxzk)=="") {
		alert("������[��Ʒ��������ۿ�]��");
		FormName.sjfzjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfzjxzk, "��Ʒ��������ۿ�"))) {
		return false;
	}
	if (FormName.sjfzjxzk.value<0 || FormName.sjfzjxzk.value>10)
	{
		alert("����[��Ʒ��������ۿ�]Ӧ����0��10֮�䣡");
		FormName.sjfzjxzk.select();
		return false;
	}

	if(	javaTrim(FormName.qtsfxmzjxzk)=="") {
		alert("������[�����շ���Ŀ�������ۿ�]��");
		FormName.qtsfxmzjxzk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsfxmzjxzk, "�����շ���Ŀ�������ۿ�"))) {
		return false;
	}
	if (FormName.qtsfxmzjxzk.value<0 || FormName.qtsfxmzjxzk.value>10)
	{
		alert("����[�����շ���Ŀ�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.qtsfxmzjxzk.select();
		return false;
	}

	
	FormName.action="SaveInsertJc_cxhdzjxzk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
