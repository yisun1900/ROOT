<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String sfbx=null;
String lbzqj=null;
String lbyhj=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherelbmc=cf.getParameter(request,"lbmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,lbmc,sfbx,lbzqj,lbyhj ";
	ls_sql+=" from  tc_yhlb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (lbmc='"+wherelbmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		lbmc=cf.fillNull(rs.getString("lbmc"));
		sfbx=cf.fillNull(rs.getString("sfbx"));
		lbzqj=cf.fillNull(rs.getString("lbzqj"));
		lbyhj=cf.fillNull(rs.getString("lbyhj"));
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
<form method="post" action="SaveEditTc_yhlb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
  <td align="right" width="15%">���ۼ���</td> 
  <td width="35%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td colspan="3"> 
    <input type="text" name="lbmc" size="73" maxlength="100"  value="<%=lbmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��ѡ</td>
  <td><%
	cf.radioToken(out, "sfbx","1+��ѡ&2+�Ǳ�ѡ",sfbx);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ǰ��</td> 
  <td width="35%"> 
    <input type="text" name="lbzqj" size="20" maxlength="17"  value="<%=lbzqj%>" >  </td>
  <td align="right" width="15%">����Żݼ�</td> 
  <td width="35%"> 
    <input type="text" name="lbyhj" size="20" maxlength="17"  value="<%=lbyhj%>" >  </td>
</tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wherelbmc"  value="<%=wherelbmc%>" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lbmc)=="") {
		alert("������[�������]��");
		FormName.lbmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbx)) {
		alert("��ѡ��[�Ƿ��ѡ]��");
		FormName.sfbx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lbzqj)=="") {
		alert("������[�����ǰ��]��");
		FormName.lbzqj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbzqj, "�����ǰ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lbyhj)=="") {
		alert("������[����Żݼ�]��");
		FormName.lbyhj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbyhj, "����Żݼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
