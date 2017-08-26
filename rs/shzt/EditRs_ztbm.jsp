<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ztbm=null;
String ztmc=null;
String ztlx=null;
String sqzt=null;
String whereztbm=cf.GB2Uni(request.getParameter("ztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ztbm,ztmc,ztlx,sqzt ";
	ls_sql+=" from  rs_ztbm";
	ls_sql+=" where  (ztbm='"+whereztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztbm=cf.fillNull(rs.getString("ztbm"));
		ztmc=cf.fillNull(rs.getString("ztmc"));
		ztlx=cf.fillNull(rs.getString("ztlx"));
		sqzt=cf.fillNull(rs.getString("sqzt"));
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
<form method="post" action="SaveEditRs_ztbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" size="20" maxlength="4"  value="<%=ztbm%>" >
  </td>
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <input type="text" name="ztmc" size="20" maxlength="40"  value="<%=ztmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+��Ƹ&02+��ѵ&03+�䶯&04+��������&06+������ְ&07+��������&08+�Ӱ�����&09+���ڿ�������&10+��ٵ�&11+��������&12+�����λ����&13+��ְ����&14+�˻���Ա����",ztlx);
%>
    </select>
  </td>
  <td align="right" width="15%">���޸�����״̬</td> 
  <td width="35%"> 
    <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"02+��������&03+����ͨ��&04+����ȡ��",sqzt);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="whereztbm"  value="<%=whereztbm%>" >
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
	if(	javaTrim(FormName.ztbm)=="") {
		alert("������[״̬����]��");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmc)=="") {
		alert("������[״̬����]��");
		FormName.ztmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztlx)=="") {
		alert("��ѡ��[״̬����]��");
		FormName.ztlx.focus();
		return false;
	}
	if(	javaTrim(FormName.sqzt)=="") {
		alert("��ѡ��[���޸�����״̬]��");
		FormName.sqzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
