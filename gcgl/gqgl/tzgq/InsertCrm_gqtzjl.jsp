<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #990000}
.STYLE2 {color: #0000CC}
.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrdw=(String)session.getAttribute("dwbh");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sgd=null;
String zjxm=null;
String gqts=null;

String djjlh=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,sgd,zjxm,gqts";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gqts=cf.fillNull(rs.getString("gqts"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(djjlh,8,2)),0)";
	ls_sql+=" from  crm_gqtzjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	djjlh=khbh+cf.addZero(count+1,2);
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_gqtzjl.jsp" name="insertform" >
<div align="center">���ڵ�����¼���ǼǼ�¼�ţ�<%=djjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ͻ���� </td>
    <td><%=khbh%> </td>
    <td align="right">��ͬ��</td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ�����</td>
    <td><%=khxm%></td>
    <td align="right">�绰</td>
    <td><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ݵ�ַ </td>
    <td><%=fwdz%> </td>
    <td align="right">���ʦ </td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ǩԼ���� </td>
    <td><%=qyrq%> </td>
    <td align="right">����</td>
    <td><%=gqts%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ�������� </td>
    <td><%=kgrq%></td>
    <td align="right">��ͬ�깤����</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʵ�ʿ������� </td>
    <td><%=sjkgrq%></td>
    <td align="right">ʵ���깤����</td>
    <td><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʩ����</td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd",sgd,true);
%></td>
    <td align="right">���̵���</td>
    <td><%=zjxm%></td>
  </tr>
  <tr >
    <td height="22" colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"><input type="radio" name="tzlx"  value="1">
����
  <input type="radio" name="tzlx"  value="2">
��������
<input type="radio" name="tzlx"  value="3">
���ں������� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"><input type="text" name="tzts" value="" size="10" maxlength="8" >
    <span class="STYLE3">������Ϊ��������Ϊ����</span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���ڵ���ԭ��</td>
  <td><select name="gqtzyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gqtzyybm,gqtzyymc from dm_gqtzyybm order by lx,gqtzyybm","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>����ʱ���</td>
  <td><input type="text" name="tzsjd" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ԭ��˵��</td>
  <td colspan="3"><textarea name="tzyysm" cols="71" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼�뵥λ</span></td> 
  <td width="32%"><select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"' order by dwbh","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="djjlh" value="<%=djjlh%>" size="20" maxlength="9" ></td>
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
	if(	javaTrim(FormName.djjlh)=="") {
		alert("������[�ǼǼ�¼��]��");
		FormName.djjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.tzlx)) {
		alert("��ѡ��[��������]��");
		FormName.tzlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.tzsjd)=="") {
		alert("������[����ʱ���]��");
		FormName.tzsjd.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzsjd, "����ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tzts)=="") {
		alert("������[��������]��");
		FormName.tzts.focus();
		return false;
	}
	if(!(isInt(FormName.tzts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gqtzyybm)=="") {
		alert("��ѡ��[���ڵ���ԭ�����]��");
		FormName.gqtzyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tzyysm)=="") {
		alert("������[����ԭ��˵��]��");
		FormName.tzyysm.focus();
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrdw.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
