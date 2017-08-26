<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010128")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

double bzlybl=0;
double lyblxx=0;
double lyblsx=0;


String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,bzlybl,lyblxx,lyblsx";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bz=cf.fillNull(rs.getString("bz"));

		bzlybl=rs.getDouble("bzlybl");
		lyblxx=rs.getDouble("lyblxx");
		lyblsx=rs.getDouble("lyblsx");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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


<form method="post" action="" name="editform">
      <div align="center">�������ñ�����ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ���</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ����</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="20%" align="right"><font color="#0000FF">����</font></td>
	  <td width="30%"><%=bianma%></td>
	  <td width="20%" align="right"><font color="#0000FF">�绰����</font></td>
	  <td width="30%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ�绰</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ����</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="20%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">��ע</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>���ģ���׼���ñ���</td>
	  <td><input type="text" name="bzlybl" size="14" maxlength="9"  value="<%=bzlybl%>" >
		�ٷֱ� </td>
	  <td align="right">&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>�������ñ���������</td>
	  <td><input type="text" name="lyblxx" size="14" maxlength="9"  value="<%=lyblxx%>" >
		�ٷֱ�</td>
	  <td align="right"><font color="#FF0000">*</font>�������ñ��������� </td>
	  <td><input type="text" name="lyblsx" size="14" maxlength="9"  value="<%=lyblsx%>" >
		�ٷֱ�</td>
	</tr>
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
		  <input type="reset"  value="����"></td>
	</tr>
</table>
</form>


</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--



function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.bzlybl)=="") {
		alert("������[��׼���ñ���]��");
		FormName.bzlybl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzlybl, "��׼���ñ���"))) {
		return false;
	}
	if (parseFloat(FormName.bzlybl.value) <0 || parseFloat(FormName.bzlybl.value) >100)
	{
		alert("����[��׼���ñ���]Ӧ����0��100֮�䣡");
		FormName.bzlybl.select();
		return false;
	}

	
	if(	javaTrim(FormName.lyblxx)=="") {
		alert("������[���ñ�������]��");
		FormName.lyblxx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblxx, "���ñ�������"))) {
		return false;
	}
	if (parseFloat(FormName.lyblxx.value) <0 || parseFloat(FormName.lyblxx.value) >100)
	{
		alert("����[���ñ�������]Ӧ����0��100֮�䣡");
		FormName.lyblxx.select();
		return false;
	}

	if(	javaTrim(FormName.lyblsx)=="") {
		alert("������[���ñ�������]��");
		FormName.lyblsx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblsx, "���ñ�������"))) {
		return false;
	}
	if (parseFloat(FormName.lyblsx.value) <0 || parseFloat(FormName.lyblsx.value) >100)
	{
		alert("����[���ñ�������]Ӧ����0��100֮�䣡");
		FormName.lyblsx.select();
		return false;
	}

	if (parseFloat(FormName.lyblxx.value)>parseFloat(FormName.bzlybl.value))
	{
		alert("����[���ñ�������]���ܴ���[��׼���ñ���]");
		FormName.lyblxx.select();
		return false;
	}

	if (parseFloat(FormName.lyblsx.value)<parseFloat(FormName.bzlybl.value))
	{
		alert("����[���ñ�������]����С��[��׼���ñ���]");
		FormName.lyblsx.select();
		return false;
	}

	FormName.action="SaveEditFcblSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











