<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String rkph=null;
String nian=null;
int maxbh=0;
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("ssfgs");
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	ls_sql=" select to_char(sysdate,'yy') nian,NVL(MAX(to_number(SUBSTR(rkph,8,4))),0) maxbh ";
	ls_sql+=" from cl_rkd where dwbh='"+dwbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		nian = rs.getString("nian");
		maxbh = rs.getInt("maxbh")+1;
	}
	rkph = dwbh+nian+cf.addZero(maxbh,4);
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������(�������:<%=rkph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="ServerInsertsgrk.jsp" name="insertform">
			<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
				<tr bgcolor="#FFFFFF"> 
					<td width="15%"> <div align="right">��Ӧ��</div></td>
					<td><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
					<option value=""></option>
					<%
					cf.selectItem(out,"select gysmc,gysmc from cl_gysbm order by gysbm","");
					%> 
					</select>
					</td>
					<td width="15%"> <div align="right">&nbsp;</div></td>
					<td> &nbsp;</td>
				</tr>
				<tr bgcolor="#FFFFFF"> 
					<td width="15%"> <div align="right">�����</div></td>
					<td> <input type="text" name="rkr" size="20" maxlength="13" value=""></td>
					<td width="15%"> <div align="right">���ʱ��</div></td>
					<td> <input type="text" name="rksj" size="20" maxlength="10" value=""></td>
				</tr>
				<tr bgcolor="#FFFFFF"> 
					<td width="15%"> <div align="right">��ע</div></td>
					<td colspan="3"> <textarea name="bz" cols="71" rows="2"></textarea></td>
				</tr>
				<tr align="center"> 
					<td colspan="4"> <input type="button"  value="����" onClick="f_do(insertform)"> 
					<input type="reset"  value="����" name="reset"> </td>
				</tr>
			</table>
		</form>
	</div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[��Ӧ��]��");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.rkr)=="") {
		alert("������[�����]��");
		FormName.rkr.focus();
		return false;
	}
	if(	javaTrim(FormName.rksj)=="") {
		alert("������[���ʱ��]��");
		FormName.rksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rksj, "���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
