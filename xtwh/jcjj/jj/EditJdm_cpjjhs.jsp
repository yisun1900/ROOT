<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpjjhsbm=null;
String cpjjhs=null;
String cpjjczbm=null;
String wherecpjjhsbm=cf.GB2Uni(request.getParameter("cpjjhsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpjjhsbm,cpjjhs,cpjjczbm ";
	ls_sql+=" from  jdm_cpjjhs";
	ls_sql+=" where  (cpjjhsbm='"+wherecpjjhsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjhsbm=cf.fillNull(rs.getString("cpjjhsbm"));
		cpjjhs=cf.fillNull(rs.getString("cpjjhs"));
		cpjjczbm=cf.fillNull(rs.getString("cpjjczbm"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJdm_cpjjhs.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">��Ʒ�Ҿ߲���</td>
      <td width="27%"> 
        <select name="cpjjczbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="getItemValue(cpjjczbm,cpjjhsbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjczbm,cpjjcz from jdm_cpjjcz order by cpjjczbm",cpjjczbm);
%> 
        </select>
      </td>
      <td align="right" width="20%">&nbsp; </td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">��Ʒ�Ҿ߻�ɫ���루<font color="#FF0000"><b>4λ</b></font>��</td>
      <td width="27%"> 
        <input type="text" name="cpjjhsbm" size="20" maxlength="4"  value="<%=cpjjhsbm%>" >
      </td>
      <td align="right" width="20%">��Ʒ�Ҿ߻�ɫ</td>
      <td width="30%"> 
        <input type="text" name="cpjjhs" size="20" maxlength="50"  value="<%=cpjjhs%>" >
      </td>
    </tr>
    <input type="hidden" name="wherecpjjhsbm"  value="<%=wherecpjjhsbm%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
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
	if(	javaTrim(FormName.cpjjczbm)=="") {
		alert("��ѡ��[��Ʒ�Ҿ߲���]��");
		FormName.cpjjczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhsbm)=="") {
		alert("������[��Ʒ�Ҿ߻�ɫ����]��");
		FormName.cpjjhsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhs)=="") {
		alert("������[��Ʒ�Ҿ߻�ɫ]��");
		FormName.cpjjhs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
