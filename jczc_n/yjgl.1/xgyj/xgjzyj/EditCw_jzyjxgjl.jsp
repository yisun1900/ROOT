<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xgsj=null;
String xgr=null;
String zt=null;
String hth=null;
String khxm=null;
String xglx=null;
String yjzrq=null;
String ywdzgce=null;
String yqye=null;
String xjzrq=null;
String xwdzgce=null;
String xqye=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherexgsj=cf.GB2Uni(request.getParameter("xgsj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,xgsj,xgr,zt,hth,khxm,xglx,yjzrq,ywdzgce,yqye,xjzrq,xwdzgce,xqye ";
	ls_sql+=" from  cw_jzyjxgjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (xgsj=TO_DATE('"+wherexgsj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		xgsj=cf.fillNull(rs.getDate("xgsj"));
		xgr=cf.fillNull(rs.getString("xgr"));
		zt=cf.fillNull(rs.getString("zt"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xglx=cf.fillNull(rs.getString("xglx"));
		yjzrq=cf.fillNull(rs.getDate("yjzrq"));
		ywdzgce=cf.fillNull(rs.getString("ywdzgce"));
		yqye=cf.fillNull(rs.getString("yqye"));
		xjzrq=cf.fillNull(rs.getDate("xjzrq"));
		xwdzgce=cf.fillNull(rs.getString("xwdzgce"));
		xqye=cf.fillNull(rs.getString("xqye"));
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
<form method="post" action="SaveEditCw_jzyjxgjl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
  </td>
  <td align="right" width="15%">�޸�ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="xgsj" size="20" maxlength="10"  value="<%=xgsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�޸���</td> 
  <td width="35%"> 
    <input type="text" name="xgr" size="20" maxlength="20"  value="<%=xgr%>" >
  </td>
  <td align="right" width="15%">�ͻ�����</td> 
  <td width="35%"> 
    <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"2+��װ�ͻ�&3+�˵��ͻ�&4+���ɿͻ�&5+��ƿͻ�",zt);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="hth" size="20" maxlength="20"  value="<%=hth%>" >
  </td>
  <td align="right" width="15%">�ͻ�����</td> 
  <td width="35%"> 
    <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�޸�����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "xglx","1+�޸�&2+ɾ��&3+����",xglx);
%>
  </td>
  <td align="right" width="15%">ԭҵ����תʱ��</td> 
  <td width="35%"> 
    <input type="text" name="yjzrq" size="20" maxlength="10"  value="<%=yjzrq%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ԭ��ͬԭ����</td> 
  <td width="35%"> 
    <input type="text" name="ywdzgce" size="20" maxlength="17"  value="<%=ywdzgce%>" >
  </td>
  <td align="right" width="15%">ԭ����ǩԼ��</td> 
  <td width="35%"> 
    <input type="text" name="yqye" size="20" maxlength="17"  value="<%=yqye%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�޸ĺ�ҵ����תʱ��</td> 
  <td width="35%"> 
    <input type="text" name="xjzrq" size="20" maxlength="10"  value="<%=xjzrq%>" >
  </td>
  <td align="right" width="15%">�޸ĺ��ͬԭ����</td> 
  <td width="35%"> 
    <input type="text" name="xwdzgce" size="20" maxlength="17"  value="<%=xwdzgce%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�޸ĺ󹤳�ǩԼ��</td> 
  <td width="35%"> 
    <input type="text" name="xqye" size="20" maxlength="17"  value="<%=xqye%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
<input type="hidden" name="wherexgsj"  value="<%=wherexgsj%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsj)=="") {
		alert("������[�޸�ʱ��]��");
		FormName.xgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xgr)=="") {
		alert("������[�޸���]��");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.zt)=="") {
		alert("��ѡ��[�ͻ�����]��");
		FormName.zt.focus();
		return false;
	}
	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xglx)) {
		alert("��ѡ��[�޸�����]��");
		FormName.xglx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzrq, "ԭҵ����תʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ywdzgce)=="") {
		alert("������[ԭ��ͬԭ����]��");
		FormName.ywdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.ywdzgce, "ԭ��ͬԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yqye)=="") {
		alert("������[ԭ����ǩԼ��]��");
		FormName.yqye.focus();
		return false;
	}
	if(!(isFloat(FormName.yqye, "ԭ����ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xjzrq, "�޸ĺ�ҵ����תʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xwdzgce)=="") {
		alert("������[�޸ĺ��ͬԭ����]��");
		FormName.xwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.xwdzgce, "�޸ĺ��ͬԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqye)=="") {
		alert("������[�޸ĺ󹤳�ǩԼ��]��");
		FormName.xqye.focus();
		return false;
	}
	if(!(isFloat(FormName.xqye, "�޸ĺ󹤳�ǩԼ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
