<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String sjqd=null;
String sjzd=null;
String xm=null;
String xzzwbm=null;
String ssfgs=null;
String dwbh=null;
String gzsm=null;
String lrr=null;
String lrsj=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wheresjqd=cf.GB2Uni(request.getParameter("sjqd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,sjqd,sjzd,xm,xzzwbm,ssfgs,dwbh,gzsm,lrr,lrsj ";
	ls_sql+=" from  rs_yggzbg";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (sjqd=TO_DATE('"+wheresjqd+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		sjqd=cf.fillNull(rs.getDate("sjqd"));
		sjzd=cf.fillNull(rs.getDate("sjzd"));
		xm=cf.fillNull(rs.getString("xm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		gzsm=cf.fillNull(rs.getString("gzsm"));
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
.STYLE1 {color: #0000CC}
.STYLE2 {color: #CC0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_yggzbg.jsp" name="editform">
<div align="center"><strong>�޸�Ա���������棨Ա����ţ�<%=ygbh%>��</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE2">*</span>����ʱ�����</td> 
  <td width="35%"><input type="text" name="sjqd" size="20" maxlength="10"  value="<%=sjqd%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%"><span class="STYLE2">*</span>����ʱ���յ�</td> 
  <td width="35%"><input type="text" name="sjzd" size="20" maxlength="10"  value="<%=sjzd%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>����</span></td> 
  <td width="35%"><input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" readonly></td>
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>ְ��</span></td> 
  <td width="35%"><input type="text" name="xzzwbm2" value="<%=xzzwbm%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>�����ֹ�˾</span></td> 
  <td width="35%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' ","");
%>
  </select></td>
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>��������</span></td> 
  <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE2">*</span>����˵��</td> 
  <td colspan="3"><textarea name="gzsm" cols="72" rows="20"><%=gzsm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>¼����</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>¼��ʱ��</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
<input type="hidden" name="wheresjqd"  value="<%=wheresjqd%>" >
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
	if(	javaTrim(FormName.sjqd)=="") {
		alert("������[����ʱ�����]��");
		FormName.sjqd.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjqd, "����ʱ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzd)=="") {
		alert("������[����ʱ���յ�]��");
		FormName.sjzd.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjzd, "����ʱ���յ�"))) {
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��������]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gzsm)=="") {
		alert("������[����˵��]��");
		FormName.gzsm.focus();
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
