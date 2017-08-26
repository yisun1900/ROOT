<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rq=null;
String nian=null;
String yue=null;
String ri=null;
String jjrbz=null;
String jjrlx=null;
String whererq=cf.GB2Uni(request.getParameter("rq"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rq,nian,yue,ri,jjrbz,jjrlx ";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where  (rq=TO_DATE('"+whererq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rq=cf.fillNull(rs.getDate("rq"));
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		jjrbz=cf.fillNull(rs.getString("jjrbz"));
		jjrlx=cf.fillNull(rs.getString("jjrlx"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_gzrl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">����</span></td> 
  <td width="32%"> 
    <input type="text" name="rq" size="20" maxlength="10"  value="<%=rq%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��</span></td> 
  <td width="32%"> 
    <input type="text" name="nian" size="20" maxlength="4"  value="<%=nian%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��</span></td> 
  <td width="32%"> 
    <input type="text" name="yue" size="20" maxlength="2"  value="<%=yue%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��</span></td> 
  <td width="32%"> 
    <input type="text" name="ri" size="20" maxlength="2"  value="<%=ri%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ڼ��ձ�־</td>
  <td><%
	cf.radioToken(out, "jjrbz","Y+��&N+��",jjrbz);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ڼ�������</td> 
  <td colspan="3"><%
	cf.radioToken(out, "jjrlx","1+����&2+����&3+����&8+����&9+�ǽڼ���",jjrlx);
%></td>
  </tr>
<input type="hidden" name="whererq"  value="<%=whererq%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.rq)=="") {
		alert("������[����]��");
		FormName.rq.focus();
		return false;
	}
	if(!(isDatetime(FormName.rq, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("������[��]��");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ri)=="") {
		alert("������[��]��");
		FormName.ri.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjrbz)) {
		alert("��ѡ��[�ڼ��ձ�־]��");
		FormName.jjrbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjrlx)) {
		alert("��ѡ��[�ڼ�������]��");
		FormName.jjrlx[0].focus();
		return false;
	}
	if (FormName.jjrbz[0].checked)
	{
		if (FormName.jjrlx[4].checked)
		{
			alert("�ڼ������ʹ���Ӧѡ��[�ڼ���]��");
			FormName.jjrlx[0].focus();
			return false;
		}
	}
	else{
		if (!FormName.jjrlx[4].checked)
		{
			alert("�ڼ������ʹ���Ӧѡ��[�ǽڼ���]��");
			FormName.jjrlx[4].focus();
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
