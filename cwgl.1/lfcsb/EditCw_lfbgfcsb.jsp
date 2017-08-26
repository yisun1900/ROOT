<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String bfcs=null;
String bfjs=null;
String bfbl=null;
String dzld=null;
String sfkclk=null;
String clkzdbl=null;
String sfkybgf=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherebfcs=cf.GB2Uni(request.getParameter("bfcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,bfcs,bfjs,bfbl,dzld,sfkclk,clkzdbl,sfkybgf ";
	ls_sql+=" from  cw_lfbgfcsb";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (bfcs="+wherebfcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bfcs=cf.fillNull(rs.getString("bfcs"));
		bfjs=cf.fillNull(rs.getString("bfjs"));
		bfbl=cf.fillNull(rs.getString("bfbl"));
		dzld=cf.fillNull(rs.getString("dzld"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		clkzdbl=cf.fillNull(rs.getString("clkzdbl"));
		sfkybgf=cf.fillNull(rs.getString("sfkybgf"));
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_lfbgfcsb.jsp" name="editform">
<div align="center">�����Ѳ������޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd not in('0','B') order by gdjsjd",bfcs);
	%>
    </select></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="bfbl" size="10" maxlength="9"  value="<%=bfbl%>" >
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bfjs","3+ʵ�տ�<BR>&1+��ǰ���̷�<BR>&2+�ۺ󹤳̷�<BR>&9+�ɴ������Ⱦ�����ǰ�ۺ�",bfjs);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td colspan="3"> 
    <p>
      <input type="text" name="dzld" size="20" maxlength="9"  value="<%=dzld%>" >      
      ��&gt;=0��&lt;=10��</p>
    <p>�ͻ��ۿ������ڡ��������ȡ���������ȡ��ǰ���ͻ��ۿ���С�ڡ��������ȡ���������ȡ�ۺ�</p></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk);
%></td>
  <td align="right">���Ͽ���ͱ���</td>
  <td><input name="clkzdbl" type="text" id="clkzdbl" value="<%=clkzdbl%>" size="10" maxlength="9" >
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѳ�����</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkybgf","Y+��&N+��",sfkybgf);
%></td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wherebfcs"  value="<%=wherebfcs%>" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("������[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.bfjs)) {
		alert("��ѡ��[��������]��");
		FormName.bfjs[0].focus();
		return false;
	}

	if (FormName.bfjs[2].checked)
	{
		if(	javaTrim(FormName.dzld)=="") {
			alert("������[��������]��");
			FormName.dzld.focus();
			return false;
		}
		if(!(isFloat(FormName.dzld, "��������"))) {
			return false;
		}

		if (parseFloat(FormName.dzld.value)<0 || parseFloat(FormName.dzld.value)>10)
		{
			alert("����[��������]Ӧ��0��10֮��");
			FormName.dzld.select();
			return false;
		}
	}
	else{
		FormName.dzld.value="";
	}

	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.bfbl.value)<0 || parseFloat(FormName.bfbl.value)>100)
	{
		alert("����[��������]Ӧ��0��100֮��");
		FormName.bfbl.select();
		return false;
	}
	if(	!radioChecked(FormName.sfkclk)) {
		alert("��ѡ��[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk[0].focus();
		return false;
	}
	if (FormName.sfkclk[0].checked)
	{
		if(	javaTrim(FormName.clkzdbl)=="") {
			alert("������[���Ͽ���ͱ���]��");
			FormName.clkzdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.clkzdbl, "���Ͽ���ͱ���"))) {
			return false;
		}

		if (parseFloat(FormName.clkzdbl.value)<0 || parseFloat(FormName.clkzdbl.value)>100)
		{
			alert("����[���Ͽ���ͱ���]Ӧ��0��100֮��");
			FormName.clkzdbl.select();
			return false;
		}
	}
	else{
		FormName.clkzdbl.value="";
	}

	if(	!radioChecked(FormName.sfkybgf)) {
		alert("��ѡ��[�Ƿ���Ѳ�����]��");
		FormName.sfkybgf[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
