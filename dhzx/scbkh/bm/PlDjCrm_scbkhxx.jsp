<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String[] scbkhbh = request.getParameterValues("scbkhbh");

String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ssfgs";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where scbkhbh='"+scbkhbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<title>ʧ�ܵǼ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlDjCrm_scbkhxx.jsp" name="editform">
<div align="center">�г����ͻ���ʧ�ܵǼ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>״̬</td> 
  <td width="32%"> 
   <INPUT name="zt" type="radio" value="2" checked>
   ʧ��   </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>ʧ��ԭ��</td> 
  <td width="32%"> 
    <select name="sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ʧ��ԭ��˵��</td>
  <td colspan="3"><textarea name="sbyysm" cols="72" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">ʧ�ܵǼ���</span></td> 
  <td width="32%"><input type="text" name="sbdjr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">ʧ�ܵǼ�ʱ��</span></td> 
  <td width="32%"><input type="text" name="sbdjsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<%
for (int i=0;i<scbkhbh.length ;i++ )
{
	%>
	<input type="hidden" name="scbkhbh"  value="<%=scbkhbh[i]%>" >
	<%
}
%>
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

	if(	javaTrim(FormName.sbyybm)=="") {
		alert("������[ʧ��ԭ��]��");
		FormName.sbyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbyysm)=="") {
		alert("������[ʧ��ԭ��˵��]��");
		FormName.sbyysm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbdjr)=="") {
		alert("������[ʧ�ܵǼ���]��");
		FormName.sbdjr.focus();
		return false;
	}
	if(	javaTrim(FormName.sbdjsj)=="") {
		alert("������[ʧ�ܵǼ�ʱ��]��");
		FormName.sbdjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbdjsj, "ʧ�ܵǼ�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
