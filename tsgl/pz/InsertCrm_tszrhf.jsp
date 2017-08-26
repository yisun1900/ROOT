<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String khbh=null;
String pzyy="";
String pzr="";
String pzsj="";
String cjzrbl="";
String sgdzrbl="";
String khzrbl="";
String gszrbl="";
String lrr=null;
String lrsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select tsjlh,khbh,pzyy,pzr,pzsj,cjzrbl,sgdzrbl,khzrbl,gszrbl,lrr,lrsj,lrbm ";
	ls_sql+=" from  crm_tszrhf";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		pzyy=cf.fillNull(rs.getString("pzyy"));
		pzr=cf.fillNull(rs.getString("pzr"));
		pzsj=cf.fillNull(rs.getDate("pzsj"));
		cjzrbl=cf.fillNull(rs.getString("cjzrbl"));
		sgdzrbl=cf.fillNull(rs.getString("sgdzrbl"));
		khzrbl=cf.fillNull(rs.getString("khzrbl"));
		gszrbl=cf.fillNull(rs.getString("gszrbl"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_tszrhf.jsp" name="insertform" >
<div align="center">���λ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">Ͷ�߼�¼��</span></td> 
  <td width="33%"> 
    <input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly>  </td>
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">�ͻ����</span></td> 
  <td width="33%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ԭ��</td>
  <td colspan="3"><textarea name="pzyy" cols="71" rows="5"><%=pzyy%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������</td>
  <td><input type="text" name="pzr" size="20" maxlength="20"  value="<%=pzr%>" ></td>
  <td align="right"><span class="STYLE1">*</span>����ʱ��</td>
  <td><input type="text" name="pzsj" size="20" maxlength="10"  value="<%=pzsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�������α���</td>
  <td><input type="text" name="cjzrbl" size="10" maxlength="9"  value="<%=cjzrbl%>" >
    %</td>
  <td align="right"><span class="STYLE1">*</span>ʩ�������α���</td>
  <td><input type="text" name="sgdzrbl" size="10" maxlength="9"  value="<%=sgdzrbl%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ͻ����α���</td>
  <td><input type="text" name="khzrbl" size="10" maxlength="9"  value="<%=khzrbl%>" >
    %</td>
  <td align="right"><span class="STYLE1">*</span>��˾���α���</td>
  <td><input type="text" name="gszrbl" size="10" maxlength="9"  value="<%=gszrbl%>" >
    %</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("������[Ͷ�߼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pzyy)=="") {
		alert("������[����ԭ��]��");
		FormName.pzyy.focus();
		return false;
	}
	if(	javaTrim(FormName.pzr)=="") {
		alert("������[������]��");
		FormName.pzr.focus();
		return false;
	}
	if(	javaTrim(FormName.pzsj)=="") {
		alert("������[����ʱ��]��");
		FormName.pzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pzsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzrbl)=="") {
		alert("������[�������α���]��");
		FormName.cjzrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzrbl, "�������α���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdzrbl)=="") {
		alert("������[ʩ�������α���]��");
		FormName.sgdzrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdzrbl, "ʩ�������α���"))) {
		return false;
	}
	if(	javaTrim(FormName.khzrbl)=="") {
		alert("������[�ͻ����α���]��");
		FormName.khzrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khzrbl, "�ͻ����α���"))) {
		return false;
	}
	if(	javaTrim(FormName.gszrbl)=="") {
		alert("������[��˾���α���]��");
		FormName.gszrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.gszrbl, "��˾���α���"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
