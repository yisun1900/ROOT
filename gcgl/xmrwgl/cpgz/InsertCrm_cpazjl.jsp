<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
.STYLE5 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;

String ghf=null;
String cplx=null;
String cpztbm=null;
String cpztmc=null;
int ztxh=0;

try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	ls_sql="select cpztbm,cplx,ghf ";
	ls_sql+=" from  crm_cpgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpztbm=cf.fillNull(rs.getString("cpztbm"));
		cplx=cf.fillNull(rs.getString("cplx"));
		ghf=cf.fillNull(rs.getString("ghf"));
	}
	else{
		out.println("���󣡲����ڵĲ�Ʒ��Ϣ");
		return;
	}
	rs.close();
	ps.close();

	ls_sql="select ztxh,cpztmc ";
	ls_sql+=" from  dm_cpztbm";
	ls_sql+=" where cpztbm='"+cpztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztxh=rs.getInt("ztxh");
		cpztmc=cf.fillNull(rs.getString("cpztmc"));
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
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_cpazjl.jsp" name="insertform" >
<div align="center">¼�밲װ��¼</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">��װ��¼��</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="8%">��װ���</td>
	<td  width="8%">����ʱ��</td>
	<td  width="8%">������</td>
	<td  width="12%">��װ˵��</td>
	<td  width="8%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_cpazjl.azjlh,dm_cpflbm.cpflmc, DECODE(crm_cpazjl.azjg,'1','δ���','2','��װ�ɹ�','3','��װʧ��'),crm_cpazjl.smsj,crm_cpazjl.smr,crm_cpazjl.azsm,crm_cpazjl.lrr,crm_cpazjl.lrsj,crm_cpazjl.lrbm  ";
	ls_sql+=" FROM dm_cpflbm,crm_cpazjl  ";
    ls_sql+=" where crm_cpazjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpazjl.khbh='"+khbh+"' and crm_cpazjl.cpflbm='"+cpflbm+"'";
    ls_sql+=" order by crm_cpazjl.cpflbm,crm_cpazjl.smsj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">�ͻ����</span></td>
    <td><%=khbh%></td>
    <td align="right"><span class="STYLE3">��ͬ��</span></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">�ͻ�����</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE3">���ݵ�ַ</span></td>
    <td><%=fwdz%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ����</td> 
  <td width="32%"> 
    <select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm='"+cpflbm+"'","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��װ���</td> 
  <td width="32%"> 
    <input type="radio" name="azjg"  value="1">δ���
    <input type="radio" name="azjg"  value="2">��װ�ɹ�
    <input type="radio" name="azjg"  value="3">��װʧ��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="smsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="smr" value="" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��װ˵��</td> 
  <td colspan="3"> 
    <textarea name="azsm" cols="71" rows="3"></textarea>  </td>
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
	    <input type="hidden" name="khbh" value="<%=khbh%>"  >
	    <input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.azjg)) {
		alert("��ѡ��[��װ���]��");
		FormName.azjg[0].focus();
		return false;
	}
	if (!FormName.azjg[1].checked)
	{
		if(	javaTrim(FormName.azsm)=="") {
			alert("������[��װ˵��]��");
			FormName.azsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.smsj)=="") {
		alert("������[����ʱ��]��");
		FormName.smsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.smsj, "����ʱ��"))) {
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
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
