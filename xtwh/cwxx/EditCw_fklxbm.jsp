<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fklxbm=null;
String fklxmc=null;
String fkdl=null;
String pzfl=null;
String wherefklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fklxbm,fklxmc,fkdl,pzfl ";
	ls_sql+=" from  cw_fklxbm";
	ls_sql+=" where  (fklxbm='"+wherefklxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fklxmc=cf.fillNull(rs.getString("fklxmc"));
		fkdl=cf.fillNull(rs.getString("fkdl"));
		pzfl=cf.fillNull(rs.getString("pzfl"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_fklxbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ͱ���</td> 
  <td width="35%"> 
    <input type="text" name="fklxbm" size="20" maxlength="2"  value="<%=fklxbm%>" >
  </td>
  <td align="right" width="15%">������������</td> 
  <td width="35%"> 
    <input type="text" name="fklxmc" size="20" maxlength="50"  value="<%=fklxmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <select name="fkdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+��װ��&2+���ɿ�&3+���ɶ���&4+��ѯ�տ�&5+Ԥ����&9+�����տ�",fkdl);
%>
    </select>
  </td>
  <td align="right" width="15%">ƾ֤����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "pzfl","1+���̿�&2+���ɿ�",pzfl);
%>
  </td>
</tr>
<input type="hidden" name="wherefklxbm"  value="<%=wherefklxbm%>" >
    <tr> 
      <td colspan="4" height="2">
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
	if(	javaTrim(FormName.fklxbm)=="") {
		alert("������[�������ͱ���]��");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fklxmc)=="") {
		alert("������[������������]��");
		FormName.fklxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fkdl)=="") {
		alert("��ѡ��[�������]��");
		FormName.fkdl.focus();
		return false;
	}
	if(	!radioChecked(FormName.pzfl)) {
		alert("��ѡ��[ƾ֤����]��");
		FormName.pzfl[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
