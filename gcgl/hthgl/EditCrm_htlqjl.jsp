<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String lqsl=null;
String dwbh=null;
String fgsbh=null;
String lqr=null;
String lqsj=null;
String qshth=null;
String zzhth=null;
String bz=null;
String lrr=null;
String lrsj=null;
String wherelqjlh=cf.GB2Uni(request.getParameter("lqjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select lqsl,dwbh,fgsbh,lqr,lqsj,qshth,zzhth,bz,lrr,lrsj ";
	ls_sql+=" from  crm_htlqjl";
	ls_sql+=" where  (lqjlh='"+wherelqjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lqsl=cf.fillNull(rs.getString("lqsl"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		lqr=cf.fillNull(rs.getString("lqr"));
		lqsj=cf.fillNull(rs.getDate("lqsj"));
		qshth=cf.fillNull(rs.getString("qshth"));
		zzhth=cf.fillNull(rs.getString("zzhth"));
		bz=cf.fillNull(rs.getString("bz"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_htlqjl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ȡ����</td> 
  <td width="35%"> 
    <input type="text" name="lqsl" size="20" maxlength="8"  value="<%=lqsl%>" >
  </td>
  <td align="right" width="15%">��ȡ����</td> 
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",dwbh);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ȡ�ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgsbh);
%>
    </select>
  </td>
  <td align="right" width="15%">��ȡ��</td> 
  <td width="35%"> 
    <input type="text" name="lqr" size="20" maxlength="20"  value="<%=lqr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ȡʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lqsj" size="20" maxlength="10"  value="<%=lqsj%>" >
  </td>
  <td align="right" width="15%">��ʼ��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="qshth" size="20" maxlength="20"  value="<%=qshth%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ֹ��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="zzhth" size="20" maxlength="20"  value="<%=zzhth%>" >
  </td>
  <td align="right" width="15%">��ע</td> 
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"><%=bz%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
</tr>
<input type="hidden" name="wherelqjlh"  value="<%=wherelqjlh%>" >
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
	if(	javaTrim(FormName.lqsl)=="") {
		alert("������[��ȡ����]��");
		FormName.lqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.lqsl, "��ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��ȡ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[��ȡ�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lqr)=="") {
		alert("������[��ȡ��]��");
		FormName.lqr.focus();
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("������[��ȡʱ��]��");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "��ȡʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qshth)=="") {
		alert("������[��ʼ��ͬ��]��");
		FormName.qshth.focus();
		return false;
	}
	if(	javaTrim(FormName.zzhth)=="") {
		alert("������[��ֹ��ͬ��]��");
		FormName.zzhth.focus();
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
