<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String tcmc=null;
String mjpmdj=null;
String tnzxjjmj=null;
String cfdj=null;
String cfbzmj=null;
String cfccmjdj=null;
String wsjdj=null;
String wsjbzmj=null;
String wsjccmjdj=null;
String tlgbzjmj=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj ";
	ls_sql+=" from  tc_csrjtcjgb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		mjpmdj=cf.fillNull(rs.getString("mjpmdj"));
		tnzxjjmj=cf.fillNull(rs.getString("tnzxjjmj"));
		cfdj=cf.fillNull(rs.getString("cfdj"));
		cfbzmj=cf.fillNull(rs.getString("cfbzmj"));
		cfccmjdj=cf.fillNull(rs.getString("cfccmjdj"));
		wsjdj=cf.fillNull(rs.getString("wsjdj"));
		wsjbzmj=cf.fillNull(rs.getString("wsjbzmj"));
		wsjccmjdj=cf.fillNull(rs.getString("wsjccmjdj"));
		tlgbzjmj=cf.fillNull(rs.getString("tlgbzjmj"));
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
<form method="post" action="SaveEditTc_csrjtcjgb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select>
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���ۼ���</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ײ�����</td> 
  <td width="32%"> 
    <input type="text" name="tcmc" size="20" maxlength="50"  value="<%=tcmc%>" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���ƽ�׵���</td> 
  <td width="32%"> 
    <input type="text" name="mjpmdj" size="20" maxlength="17"  value="<%=mjpmdj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������С�Ƽ����</td> 
  <td width="32%"> 
    <input type="text" name="tnzxjjmj" size="20" maxlength="8"  value="<%=tnzxjjmj%>" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="cfdj" size="20" maxlength="17"  value="<%=cfdj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������׼���</td> 
  <td width="32%"> 
    <input type="text" name="cfbzmj" size="20" maxlength="8"  value="<%=cfbzmj%>" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���������������</td> 
  <td width="32%"> 
    <input type="text" name="cfccmjdj" size="20" maxlength="17"  value="<%=cfccmjdj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����䵥��</td> 
  <td width="32%"> 
    <input type="text" name="wsjdj" size="20" maxlength="17"  value="<%=wsjdj%>" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�������׼���</td> 
  <td width="32%"> 
    <input type="text" name="wsjbzmj" size="20" maxlength="8"  value="<%=wsjbzmj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����䳬���������</td> 
  <td width="32%"> 
    <input type="text" name="wsjccmjdj" size="20" maxlength="17"  value="<%=wsjccmjdj%>" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>Ϳ�ϸ�Ϊ��ֽ�����</td> 
  <td width="32%"> 
    <input type="text" name="tlgbzjmj" size="20" maxlength="17"  value="<%=tlgbzjmj%>" >
  </td>
</tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
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
	if(	javaTrim(FormName.tcmc)=="") {
		alert("������[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.mjpmdj)=="") {
		alert("������[���ƽ�׵���]��");
		FormName.mjpmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mjpmdj, "���ƽ�׵���"))) {
		return false;
	}
	if(	javaTrim(FormName.tnzxjjmj)=="") {
		alert("������[������С�Ƽ����]��");
		FormName.tnzxjjmj.focus();
		return false;
	}
	if(!(isNumber(FormName.tnzxjjmj, "������С�Ƽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.cfdj)=="") {
		alert("������[��������]��");
		FormName.cfdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cfdj, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.cfbzmj)=="") {
		alert("������[������׼���]��");
		FormName.cfbzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.cfbzmj, "������׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.cfccmjdj)=="") {
		alert("������[���������������]��");
		FormName.cfccmjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cfccmjdj, "���������������"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjdj)=="") {
		alert("������[�����䵥��]��");
		FormName.wsjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.wsjdj, "�����䵥��"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjbzmj)=="") {
		alert("������[�������׼���]��");
		FormName.wsjbzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.wsjbzmj, "�������׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjccmjdj)=="") {
		alert("������[�����䳬���������]��");
		FormName.wsjccmjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.wsjccmjdj, "�����䳬���������"))) {
		return false;
	}
	if(	javaTrim(FormName.tlgbzjmj)=="") {
		alert("������[Ϳ�ϸ�Ϊ��ֽ�����]��");
		FormName.tlgbzjmj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlgbzjmj, "Ϳ�ϸ�Ϊ��ֽ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
