<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdmc=cf.GB2Uni(request.getParameter("cxhdmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String djjzsfs=null;
String zsjs=null;

int row=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT djjzsfs,zsjs";
	ls_sql+=" FROM jc_hddjj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#FFFFFF">
<CENTER >
  <B><font size="3">���������ȯ(<%=cxhdmc%>)</font></B>
</CENTER>
<form method="post" action="SaveInsertJc_hddjj.jsp" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">���������</span></td> 
  <td width="32%"> 
    <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="20" maxlength="8" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">���������</span></td> 
  <td width="32%"> 
    <input type="text" name="cxhdmc" value="<%=cxhdmc%>" size="20" maxlength="100" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ȯ���ͷ�ʽ</td> 
  <td colspan="3">
<%
	cf.radioToken(out, "djjzsfs","1+�̶����&2+�ٷֱ�",djjzsfs);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���ͻ���</td>
  <td colspan="3"><%
	cf.radioToken(out, "zsjs","1+��ǰ��ͬ��&2+�ۺ��ͬ��&3+��ǰ���̷�&4+�ۺ󹤳̷�&5+������",zsjs);
%></td>
  </tr>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#E8E8FF">
  <td width="10%" height="23"><strong>�ֶ�</strong></td>
  <td width="23%"><strong>������</strong></td>
  <td width="23%"><strong>����ֹ��</strong></td>
  <td width="23%"><strong>��ȯ���</strong></td>
  <td width="21%"><strong>��ȯ�ٷֱ�<font color="#0000FF">��>0��<=100��</font></strong></td>
</tr>
<%

	String qd=null;
	String zd=null;
	double fqje=0;
	double fqbfb=0;

	ls_sql="SELECT qd,zd,fqje,fqbfb";
	ls_sql+=" FROM jc_cxhdfqbz  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qd=rs.getString("qd");
		zd=rs.getString("zd");
		fqje=rs.getDouble("fqje");
		fqbfb=rs.getDouble("fqbfb");

		row++;


		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td>�ֶ�<%=row%></td>
		  <td><input type="text" name="qd" value="<%=qd%>" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td ><input type="text" name="zd" value="<%=zd%>" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td  > 
			<input type="text" name="fqje" value="<%=fqje%>" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">  </td>
		  <td  > 
			<input type="text" name="fqbfb" value="<%=fqbfb%>" size="12" maxlength="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			%&nbsp;&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	for (int i=0;i<5 ;i++ )
	{
		row++;
		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td>�ֶ�<%=row%></td>
		  <td><input type="text" name="qd" value="" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td ><input type="text" name="zd" value="" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td  > 
			<input type="text" name="fqje" value="" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">  </td>
		  <td  > 
			<input type="text" name="fqbfb" value="" size="12" maxlength="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			%&nbsp;&nbsp;</td>
		</tr>
		<%
	}
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	if(!(isNumber(FormName.cxhdbm, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.cxhdmc)=="") {
		alert("������[���������]��");
		FormName.cxhdmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.zsjs)) {
		alert("��ѡ��[���ͻ���]��");
		FormName.zsjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.djjzsfs)) {
		alert("��ѡ��[����ȯ���ͷ�ʽ]��");
		FormName.djjzsfs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.qd[0])=="") {
		alert("������[������]��");
		FormName.qd[0].focus();
		return false;
	}
	if(!(isFloat(FormName.qd[0], "������"))) {
		return false;
	}

	if(	javaTrim(FormName.zd[0])=="") {
		alert("������[����ֹ��]��");
		FormName.zd[0].focus();
		return false;
	}
	if(!(isFloat(FormName.zd[0], "����ֹ��"))) {
		return false;
	}

	if (parseFloat(FormName.zd[0].value)<=parseFloat(FormName.qd[0].value))
	{
		alert("[����ֹ��]Ҫ����[������]��");
		FormName.zd[0].select();
		return false;
	}

	for (var i=0;i<<%=row%> ;i++ )
	{
		if(	javaTrim(FormName.qd[i])!="") 
		{
			if(	javaTrim(FormName.zd[i])=="") {
				alert("������[����ֹ��]��");
				FormName.zd[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zd[i], "����ֹ��"))) {
				return false;
			}

			if (parseFloat(FormName.zd[i].value)<=parseFloat(FormName.qd[i].value))
			{
				alert("[����ֹ��]Ҫ����[������]��");
				FormName.zd[i].select();
				return false;
			}

			if (FormName.djjzsfs[1].checked)//�ٷֱ�
			{
				if(	javaTrim(FormName.fqbfb[i])=="") {
					alert("������[��ȯ�ٷֱ�]��");
					FormName.fqbfb[i].focus();
					return false;
				}
				if(!(isFloat(FormName.fqbfb[i], "��ȯ�ٷֱ�"))) {
					return false;
				}
				if (FormName.fqbfb[i].value<0 || FormName.fqbfb[i].value>100)
				{
					alert("����[��ȯ�ٷֱ�]Ӧ����0��100֮�䣡");
					FormName.fqbfb[i].select();
					return false;
				}

				FormName.fqje[i].value="";
			}
			else{
				if(	javaTrim(FormName.fqje[i])=="") {
					alert("������[��ȯ���]��");
					FormName.fqje[i].focus();
					return false;
				}
				if(!(isFloat(FormName.fqje[i], "��ȯ���"))) {
					return false;
				}
				if (FormName.fqje[i].value<0)
				{
					alert("����[��ȯ���]Ӧ����0��");
					FormName.fqje[i].select();
					return false;
				}

				FormName.fqbfb[i].value="";
			}
		}

	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
