<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String zje=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String shr=null;
String shsj=null;
String shyj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String xmzy="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zje,clzt,lrr,lrsj,lrbm,bz,shr,shsj,shyj ";
	ls_sql+=" from  jc_khzcgmxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zje=cf.fillNull(rs.getString("zje"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shyj=cf.fillNull(rs.getString("shyj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,crm_khxx.xmzy,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmzy=cf.fillNull(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
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
<title>����޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center"><strong>���Ĺ�����Ϣ������޸�</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF"> �ͻ���� </td>
    <td width="35%" bgcolor="#CCCCFF"><%=khbh%> </td>
    <td width="15%" align="right" bgcolor="#CCCCFF"> ��ͬ�� </td>
    <td width="35%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">�ͻ�����</td>
    <td><%=khxm%></td>
    <td align="right">�ʼ�</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"> ʩ���� </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> �೤ </td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"> ��װǩԼ���� </td>
    <td><%=qyrq%> </td>
    <td align="right"> ��װǩԼ�� </td>
    <td><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">��ͬ��������</td>
    <td><%=kgrq%></td>
    <td align="right">��ͬ��������</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">�μӴ����</td>
    <td colspan="3"><%=cxhdbm%> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="23" colspan="4" align="right">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><%=lrr%></td>
  <td align="right">¼��ʱ��</td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼�벿��</td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">�ܽ��</td>
  <td><%=zje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE1">�����</span></td>
  <td><input type="text" name="shr" value="<%=shr%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2">*</span><span class="STYLE1">���ʱ��</span></td>
  <td><input type="text" name="shsj" value="<%=shsj%>" size="20" maxlength="10" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td colspan="3"><textarea name="shyj" cols="71" rows="3"><%=shyj%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input name="lr" type="button" onClick="f_lr(editform)"  value="¼����ϸ" >
	  <input name="ck" type="button" onClick="f_ck(editform)"  value="�鿴��ϸ" >
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
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}

	FormName.target="";
	FormName.action="SaveXgShJc_khzcgmxx.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJc_khzcgmmx.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jc_khzcgmmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
