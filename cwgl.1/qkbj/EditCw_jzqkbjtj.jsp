<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqysxmbm=null;
String sfkl=null;
String wherezqysxmbm=cf.GB2Uni(request.getParameter("zqysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqysxmbm,sfkl ";
	ls_sql+=" from  cw_jzqkbjtj";
	ls_sql+=" where  (zqysxmbm='"+wherezqysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		sfkl=cf.fillNull(rs.getString("sfkl"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jzqkbjtj.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ���̽���
  </td>
  <td width="35%"> 
    <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm",zqysxmbm);
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    ����ʵ�տ���С��
  </td>
  <td width="35%"> 
    <input type="text" name="sfkl" size="20" maxlength="9"  value="<%=sfkl%>" >
  </td>
</tr>
<input type="hidden" name="wherezqysxmbm"  value="<%=wherezqysxmbm%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.zqysxmbm)=="") {
		alert("��ѡ��[���̽���]��");
		FormName.zqysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkl)=="") {
		alert("������[����ʵ�տ���С��]��");
		FormName.sfkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkl, "����ʵ�տ���С��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
