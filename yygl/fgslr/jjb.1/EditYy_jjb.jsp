<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_jjb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_jjbqntq=null;
String yy_jjbbyjh=null;
String yy_jjbylj=null;
String yy_jjbdmbylj=null;
String yy_jjbszjh=null;
String yy_jjbszwc=null;
String yy_jjbbzyj=null;
String yy_jjb_lrsj=null;
String yy_jjb_lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_jjb_ygmc=cf.getParameter(request,"yy_jjb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_jjb_ygmc,ssbm,ssfgs,yy_jjbqntq,yy_jjbbyjh,yy_jjbylj,yy_jjbdmbylj,yy_jjbszjh,yy_jjbszwc,yy_jjbbzyj,yy_jjb_lrsj,yy_jjb_lrr ";
	ls_sql+=" from  yy_jjb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_jjb_ygmc='"+whereyy_jjb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_jjb_ygmc=cf.fillNull(rs.getString("yy_jjb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_jjbqntq=cf.fillNull(rs.getString("yy_jjbqntq"));
		yy_jjbbyjh=cf.fillNull(rs.getString("yy_jjbbyjh"));
		yy_jjbylj=cf.fillNull(rs.getString("yy_jjbylj"));
		yy_jjbdmbylj=cf.fillNull(rs.getString("yy_jjbdmbylj"));
		yy_jjbszjh=cf.fillNull(rs.getString("yy_jjbszjh"));
		yy_jjbszwc=cf.fillNull(rs.getString("yy_jjbszwc"));
		yy_jjbbzyj=cf.fillNull(rs.getString("yy_jjbbzyj"));
		yy_jjb_lrsj=cf.fillNull(rs.getDate("yy_jjb_lrsj"));
		yy_jjb_lrr=cf.fillNull(rs.getString("yy_jjb_lrr"));
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
<form method="post" action="SaveEditYy_jjb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" >
  </td>
  <td align="right" width="15%">�ҾӲ�Ա������</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjb_ygmc" size="20" maxlength="20"  value="<%=yy_jjb_ygmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'",ssbm);
%>
    </select>
  </td>
  <td align="right" width="15%">�����ֹ�˾</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ȥ��ͬ���¶����Ĳ�ֵ</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbqntq" size="20" maxlength="17"  value="<%=yy_jjbqntq%>" >
  </td>
  <td align="right" width="15%">���¼ƻ�</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbbyjh" size="20" maxlength="17"  value="<%=yy_jjbbyjh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ۼ�</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbylj" size="20" maxlength="17"  value="<%=yy_jjbylj%>" >
  </td>
  <td align="right" width="15%">�������汾���ۼƹ��̲�ֵ</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbdmbylj" size="20" maxlength="17"  value="<%=yy_jjbdmbylj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ܼƻ�</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbszjh" size="20" maxlength="17"  value="<%=yy_jjbszjh%>" >
  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbszwc" size="20" maxlength="17"  value="<%=yy_jjbszwc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ԥ��</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbbzyj" size="20" maxlength="17"  value="<%=yy_jjbbzyj%>" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjb_lrsj" size="20" maxlength="10"  value="<%=yy_jjb_lrsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjb_lrr" size="20" maxlength="20"  value="<%=yy_jjb_lrr%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_jjb_ygmc"  value="<%=whereyy_jjb_ygmc%>" >
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
	if(	javaTrim(FormName.zqs)=="") {
		alert("������[������]��");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjb_ygmc)=="") {
		alert("������[�ҾӲ�Ա������]��");
		FormName.yy_jjb_ygmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.ssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_jjbqntq)=="") {
		alert("������[ȥ��ͬ���¶����Ĳ�ֵ]��");
		FormName.yy_jjbqntq.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbqntq, "ȥ��ͬ���¶����Ĳ�ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbbyjh)=="") {
		alert("������[���¼ƻ�]��");
		FormName.yy_jjbbyjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbbyjh, "���¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbylj)=="") {
		alert("������[�����ۼ�]��");
		FormName.yy_jjbylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbylj, "�����ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbdmbylj)=="") {
		alert("������[�������汾���ۼƹ��̲�ֵ]��");
		FormName.yy_jjbdmbylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbdmbylj, "�������汾���ۼƹ��̲�ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbszjh)=="") {
		alert("������[���ܼƻ�]��");
		FormName.yy_jjbszjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbszjh, "���ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbszwc)=="") {
		alert("������[�������]��");
		FormName.yy_jjbszwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbszwc, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbbzyj)=="") {
		alert("������[����Ԥ��]��");
		FormName.yy_jjbbzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbbzyj, "����Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjb_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_jjb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_jjb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjb_lrr)=="") {
		alert("������[¼����]��");
		FormName.yy_jjb_lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
