<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String lqsl=null;
String sysl=null;
String zfsl=null;
String dwbh=null;
String fgsbh=null;
String lqr=null;
String lqsj=null;
String qshth=null;
String zzhth=null;
String xzr=null;
String xzsj=null;
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
	ls_sql="select lqsl,sysl,zfsl,dwbh,fgsbh,lqr,lqsj,qshth,zzhth,xzr,xzsj,bz,lrr,lrsj ";
	ls_sql+=" from  crm_htlqjl";
	ls_sql+=" where  (lqjlh='"+wherelqjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lqsl=cf.fillNull(rs.getString("lqsl"));
		sysl=cf.fillNull(rs.getString("sysl"));
		zfsl=cf.fillNull(rs.getString("zfsl"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		lqr=cf.fillNull(rs.getString("lqr"));
		lqsj=cf.fillNull(rs.getDate("lqsj"));
		qshth=cf.fillNull(rs.getString("qshth"));
		zzhth=cf.fillNull(rs.getString("zzhth"));
		xzr=cf.fillNull(rs.getString("xzr"));
		xzsj=cf.fillNull(rs.getDate("xzsj"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXzCrm_htlqjl.jsp" name="editform">
<div align="center">��ͬ��ȡ������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ȡ�ֹ�˾</td> 
  <td width="35%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
  </select></td>
  <td align="right" width="15%">��ȡ����</td> 
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",dwbh);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ȡ��</td> 
  <td width="35%"><input type="text" name="lqr" size="20" maxlength="20"  value="<%=lqr%>" ></td>
  <td align="right" width="15%">��ȡʱ��</td> 
  <td width="35%"><input type="text" name="lqsj" size="20" maxlength="10"  value="<%=lqsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ʼ��ͬ��</td> 
  <td width="35%"><input type="text" name="qshth" size="20" maxlength="20"  value="<%=qshth%>" ></td>
  <td align="right" width="15%">��ֹ��ͬ��</td> 
  <td width="35%"><input type="text" name="zzhth" size="20" maxlength="20"  value="<%=zzhth%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >  </td>
  <td align="right">¼��ʱ��</td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ȡ����</td>
  <td><input type="text" name="lqsl" size="20" maxlength="8"  value="<%=lqsl%>" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ʹ������</td>
  <td><input type="text" name="sysl" size="20" maxlength="8"  value="" ></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="zfsl" size="20" maxlength="8"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="35%"><input type="text" name="xzr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">����ʱ��</span></td> 
  <td width="35%"><input type="text" name="xzsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
<input type="hidden" name="wherelqjlh"  value="<%=wherelqjlh%>" >
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
	if(	javaTrim(FormName.lqsl)=="") {
		alert("������[��ȡ����]��");
		FormName.lqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.lqsl, "��ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sysl)=="") {
		alert("������[ʹ������]��");
		FormName.sysl.focus();
		return false;
	}
	if(!(isNumber(FormName.sysl, "ʹ������"))) {
		return false;
	}
	if(	javaTrim(FormName.zfsl)=="") {
		alert("������[��������]��");
		FormName.zfsl.focus();
		return false;
	}
	if(!(isNumber(FormName.zfsl, "��������"))) {
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
	if(!(isDatetime(FormName.xzsj, "����ʱ��"))) {
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
