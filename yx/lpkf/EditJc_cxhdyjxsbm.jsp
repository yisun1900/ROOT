<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yjxsbm=null;
String yjxsmc=null;
String whereyjxsbm=cf.GB2Uni(request.getParameter("yjxsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yjxsbm,yjxsmc ";
	ls_sql+=" from  jc_cxhdyjxsbm";
	ls_sql+=" where  (yjxsbm='"+whereyjxsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yjxsbm=cf.fillNull(rs.getString("yjxsbm"));
		yjxsmc=cf.fillNull(rs.getString("yjxsmc"));
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
<form method="post" action="SaveEditJc_cxhdyjxsbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ҵ��ϵ������</td> 
  <td width="35%"> 
    <input type="text" name="yjxsbm" size="20" maxlength="2"  value="<%=yjxsbm%>" >
  </td>
  <td align="right" width="15%">ҵ��ϵ������</td> 
  <td width="35%"> 
    <input type="text" name="yjxsmc" size="20" maxlength="40"  value="<%=yjxsmc%>" >
  </td>
</tr>
<input type="hidden" name="whereyjxsbm"  value="<%=whereyjxsbm%>" >
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
	if(	javaTrim(FormName.yjxsbm)=="") {
		alert("������[ҵ��ϵ������]��");
		FormName.yjxsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjxsmc)=="") {
		alert("������[ҵ��ϵ������]��");
		FormName.yjxsmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
