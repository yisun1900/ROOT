<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dxpjzbbm=null;
String dxpjzb=null;
String hfdxbm=null;
String xh=null;
String wheredxpjzbbm=cf.GB2Uni(request.getParameter("dxpjzbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dxpjzbbm,dxpjzb,hfdxbm,xh ";
	ls_sql+=" from  hdm_dxpjzb";
	ls_sql+=" where  (dxpjzbbm='"+wheredxpjzbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dxpjzbbm=cf.fillNull(rs.getString("dxpjzbbm"));
		dxpjzb=cf.fillNull(rs.getString("dxpjzb"));
		hfdxbm=cf.fillNull(rs.getString("hfdxbm"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditHdm_dxpjzb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�طö���</td>
  <td><select name="hfdxbm" style="FONT-SIZE:12PX;WIDTH:462PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc||'---��'||hfdxflmc||'��' from hdm_hfdxbm,hdm_hfdxflbm where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm",hfdxbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="28%">�طö�������ָ�����</td> 
  <td width="72%"> 
    <input type="text" name="dxpjzbbm" size="20" maxlength="6"  value="<%=dxpjzbbm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�طö�������ָ��</td>
  <td><input type="text" name="dxpjzb" size="50" maxlength="50"  value="<%=dxpjzb%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="28%">���</td> 
  <td width="72%"><input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" ></td>
  </tr>
<input type="hidden" name="wheredxpjzbbm"  value="<%=wheredxpjzbbm%>" >
    <tr> 
      <td colspan="2" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.dxpjzbbm)=="") {
		alert("������[�طö�������ָ�����]��");
		FormName.dxpjzbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dxpjzb)=="") {
		alert("������[�طö�������ָ��]��");
		FormName.dxpjzb.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxbm)=="") {
		alert("��ѡ��[�طö���]��");
		FormName.hfdxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
