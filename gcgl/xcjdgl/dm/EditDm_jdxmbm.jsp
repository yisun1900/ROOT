<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jdxmbm=null;
String jdxmmc=null;
String jdlxbm=null;
String jdqrlx=null;
String wherejdxmbm=cf.GB2Uni(request.getParameter("jdxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jdxmbm,jdxmmc,jdlxbm,jdqrlx ";
	ls_sql+=" from  dm_jdxmbm";
	ls_sql+=" where  (jdxmbm='"+wherejdxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jdxmbm=cf.fillNull(rs.getString("jdxmbm"));
		jdxmmc=cf.fillNull(rs.getString("jdxmmc"));
		jdlxbm=cf.fillNull(rs.getString("jdlxbm"));
		jdqrlx=cf.fillNull(rs.getString("jdqrlx"));
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
<form method="post" action="SaveEditDm_jdxmbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="jdxmbm" size="20" maxlength="2"  value="<%=jdxmbm%>" >
  </td>
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="jdxmmc" size="20" maxlength="50"  value="<%=jdxmmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ͱ���</td> 
  <td width="35%"> 
    <select name="jdlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdlxbm,jdlxmc from dm_jdlxbm order by jdlxbm",jdlxbm);
%>
    </select>
  </td>
  <td align="right" width="15%">����ȷ������</td> 
  <td width="35%"> 
    <select name="jdqrlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdqrlx,jdqrlxmc from dm_jdqrlx order by jdqrlx",jdqrlx);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="wherejdxmbm"  value="<%=wherejdxmbm%>" >
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
	if(	javaTrim(FormName.jdxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.jdxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.jdxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jdlxbm)=="") {
		alert("��ѡ��[�������ͱ���]��");
		FormName.jdlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdqrlx)=="") {
		alert("��ѡ��[����ȷ������]��");
		FormName.jdqrlx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
