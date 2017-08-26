<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zsxm=null;
String jldw=null;
String cbdj=null;
String scdj=null;
String zsslsx=null;
String zsslxx=null;
String sftz=null;
String bz=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherezsxm=request.getParameter("zsxm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,sftz,bz ";
	ls_sql+=" from  jc_tqzsxx";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (zsxm='"+wherezsxm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=cf.fillNull(rs.getString("cbdj"));
		scdj=cf.fillNull(rs.getString("scdj"));
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		sftz=cf.fillNull(rs.getString("sftz"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditJc_tqzsxx.jsp" name="editform">
<div align="center">��Ȩ������Ϣ��ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������Ŀ</td>
  <td colspan="3"><input type="text" name="zsxm" size="73" maxlength="100"  value="<%=zsxm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������λ</td> 
  <td width="32%"><input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�ֹͣ</td> 
  <td width="32%"><%
	cf.radioToken(out, "sftz","Y+��&N+��",sftz);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ɱ�����</td> 
  <td width="32%"> 
    <input type="text" name="cbdj" size="20" maxlength="17"  value="<%=cbdj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�г�����</td> 
  <td width="32%"> 
    <input type="text" name="scdj" size="20" maxlength="17"  value="<%=scdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������������ </td> 
  <td width="32%"><input type="text" name="zsslxx" size="20" maxlength="17"  value="<%=zsslxx%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>������������</td> 
  <td width="32%"><input type="text" name="zsslsx" size="20" maxlength="17"  value="<%=zsslsx%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
		<input type="hidden" name="wherezsxm"  value="<%=wherezsxm%>" >
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
	if(	javaTrim(FormName.zsxm)=="") {
		alert("������[������Ŀ]��");
		FormName.zsxm.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("������[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.cbdj)=="") {
		alert("������[�ɱ�����]��");
		FormName.cbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbdj, "�ɱ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.scdj)=="") {
		alert("������[�г�����]��");
		FormName.scdj.focus();
		return false;
	}
	if(!(isFloat(FormName.scdj, "�г�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zsslsx)=="") {
		alert("������[������������]��");
		FormName.zsslsx.focus();
		return false;
	}
	if(!(isFloat(FormName.zsslsx, "������������"))) {
		return false;
	}
	if(	javaTrim(FormName.zsslxx)=="") {
		alert("������[������������]��");
		FormName.zsslxx.focus();
		return false;
	}
	if(!(isFloat(FormName.zsslxx, "������������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sftz)) {
		alert("��ѡ��[�Ƿ�ֹͣ]��");
		FormName.sftz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
