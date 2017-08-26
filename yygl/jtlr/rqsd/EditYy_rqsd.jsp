<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_rqsd_szs=null;
String yy_rqsd_sze=null;
String yy_rqsd_bzs=null;
String yy_rqsd_bze=null;
String lrr=null;
String lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze,lrr,lrsj ";
	ls_sql+=" from  yy_rqsd";
	ls_sql+=" where  (zqs="+wherezqs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_rqsd_szs=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		yy_rqsd_sze=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYy_rqsd.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�������ڿ�ʼ</td>
  <td><input type="text" name="yy_rqsd_szs" size="20" maxlength="10"  value="<%=yy_rqsd_szs%>" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>�������ڽ���</td>
  <td><input type="text" name="yy_rqsd_sze" size="20" maxlength="10"  value="<%=yy_rqsd_sze%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������ڿ�ʼ</td> 
  <td width="32%"><input type="text" name="yy_rqsd_bzs" size="20" maxlength="10"  value="<%=yy_rqsd_bzs%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�������ڽ���</td> 
  <td width="32%"><input type="text" name="yy_rqsd_bze" size="20" maxlength="10"  value="<%=yy_rqsd_bze%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly></td>
</tr>

<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.yy_rqsd_szs)=="") {
		alert("������[�������ڿ�ʼ]��");
		FormName.yy_rqsd_szs.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_szs, "�������ڿ�ʼ"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_sze)=="") {
		alert("������[�������ڽ���]��");
		FormName.yy_rqsd_sze.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_sze, "�������ڽ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_bzs)=="") {
		alert("������[�������ڿ�ʼ]��");
		FormName.yy_rqsd_bzs.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bzs, "�������ڿ�ʼ"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_bze)=="") {
		alert("������[�������ڽ���]��");
		FormName.yy_rqsd_bze.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bze, "�������ڽ���"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
