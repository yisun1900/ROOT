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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String khjl=null;
String dmjl="";
String dmjldh="";

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;


double gcfqdzk=10;
double gczxzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

double hdzsjz=0;

try {
	conn=cf.getConnection();

	ls_sql="select cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		khjl=cf.fillNull(rs.getString("khjl"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select gcfqdzk,gczxzk,glfzk,sjzk,sjfzk";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		gczxzk=rs.getDouble("gczxzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();


	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(zsjz)";
	ls_sql+=" FROM crm_khzsxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hdzsjz=rs.getDouble(1);//����;�ֵ
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where lrr='"+yhmc+"' and clzt='2'  and (SYSDATE-lrsj)<31";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>3)
	{
		out.println("�������������ۿ۴���");
//		return;
	}

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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">������Ŀ�����ϸ�</div>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">����״̬</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="6%">���̷�ǩ���ۿ�</td>
	<td  width="6%">���������ۿ�</td>
	<td  width="6%">������ۿ�</td>
	<td  width="6%">˰���ۿ�</td>
	<td  width="6%">��Ʒ��ۿ�</td>
	<td  width="6%">¼����</td>
	<td  width="50%">����ԭ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT DECODE(crm_tzzkjl.clzt,'1','δ���','2','ֱ���޸��ۿ۳ɹ�','3','������','4','����ͨ���Ѹ��ۿ�','5','����δͨ��'),crm_tzzkjl.lrsj,crm_tzzkjl.gcfqdzk,crm_tzzkjl.gczxzk,crm_tzzkjl.glfzk,crm_tzzkjl.sjzk,crm_tzzkjl.sjfzk, crm_tzzkjl.lrr,crm_tzzkjl.tzyy ";
	ls_sql+=" FROM crm_zxkhxx,crm_tzzkjl  ";
    ls_sql+=" where crm_tzzkjl.khbh=crm_zxkhxx.khbh ";
    ls_sql+=" and crm_tzzkjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_tzzkjl.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�μӹ�˾�</span></td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С�������</span></td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">չ������</span></td>
    <td colspan="3"><%=cxhdbm%></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���̷�ǩ���ۿ�</td>
  <td><%=gcfqdzk%></td>
  <td align="right">���������ۿ�</td>
  <td><%=gczxzk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="21" align="right">������ۿ�</td>
  <td><%=glfzk%></td>
  <td align="right">˰���ۿ�</td>
  <td><%=sjzk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ��ۿ�</td>
  <td><%=sjfzk%></td>
  <td align="right"><span class="STYLE2">����;�ֵ</span></td>
  <td><%=hdzsjz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong><font color="#FF0000">*</font>�����ϸ�ԭ��</strong></td>
  <td colspan="3"><textarea name="tzyy" cols="71" rows="3"></textarea>
  </td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><strong><font color="#FF0000">*</font>���������ϸ��ٷֱ�</strong></td>
  <td><input type="text" name="ztsfbl" value="" size="8" maxlength="8" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
    <input type="hidden" name="khbh" value="<%=khbh%>" > 
	<input type="button"  value="�޸ı���" onClick="f_do(insertform)"></td>
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
	if(	javaTrim(FormName.tzyy)=="") {
		alert("������[����ԭ��]��");
		FormName.tzyy.focus();
		return false;
	}
	if(	javaTrim(FormName.ztsfbl)=="") {
		alert("������[���������ϸ��ٷֱ�]��");
		FormName.ztsfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ztsfbl, "���������ϸ��ٷֱ�"))) {
		return false;
	}
	if (FormName.ztsfbl.value<=0 || FormName.ztsfbl.value>100)
	{
		alert("����[���������ϸ��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.ztsfbl.select();
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

	FormName.action="SaveZtsfbj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
