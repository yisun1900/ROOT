<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE3 {font-family: "����"; font-size: 12px; }
.STYLE9 {font-family: "����"; font-size: 14; }
.STYLE10 {font-family: "����"; font-size: 14px; }
.STYLE11 {font-size: 14px}
-->
</style>
</head>

<%
String wherepsdh=request.getParameter("psdh");
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
String wzclolr1="red";
String wzclolr2="blue";
String wzclolr3="black";
int i=0;
int row=0;
String clbm=null;
String clmc=null;
String clgg=null;
String gdj=null;
String pssl=null;
String psje=null;
String cldlmc=null;
String jldwmc=null;
if (wherepsdh.equals(""))
{
	return;
}

String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String dh=null;
String psfs=null;
String jhshsj=null;
String zjxm=null;
String sgbz=null;
String dh2=null;
String bjjbmc=null;
double pszje=0;
double yf=0;
double qtsf=0;
String bz=null;
String lrsj=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT hth,zjxm,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh dh,DECODE(psfs,'1','����','2','����','9','����') psfs,jhshsj,pszje,yf,qtsf,sgbz,sq_bzxx.dh dh2,bjjbmc,cl_psd.bz ,cl_psd.lrsj ";
	ls_sql+=" FROM cl_psd,crm_khxx,sq_sgd,sq_bzxx,bdm_bjjbbm ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=cl_psd.khbh(+) and  crm_khxx.sgd=sq_bzxx.sgd(+) and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and cl_psd.psdh='"+wherepsdh+"' ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		dh=cf.fillHtml(rs.getString("dh"));
		dh2=cf.fillHtml(rs.getString("dh2"));
		psfs=cf.fillHtml(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"><%=bjjbmc%>����Ҫ���嵥</font></B> 
</CENTER>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#FFFFFF"> 
    <td width="10%" align="right" ><span class="STYLE9">�������</span></td>
	<td width="20%"><span class="STYLE9"><%=hth%></span></td>
    <td width="10%" align="right"><span class="STYLE9">��Ŀ����</span></td>
	<td width="20%"><span class="STYLE9"><%=sgdmc%></span></td>
    <td width="10%" align="right"><span class="STYLE9">��ϵ��ʽ</span></td>
	<td width="20%"><span class="STYLE9"><%=dh%></span></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="10%" align="right"><span class="STYLE9">�ͻ�����</span></td>
	<td width="20%"><span class="STYLE9"><%=khxm%></span></td>
    <td width="10%" align="right"><span class="STYLE9">�ֳ�������</span></td>
	<td  colspan="3"><span class="STYLE9"><%=sgbz%><%=dh2%></span></td>
   
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="10%" align="right"><span class="STYLE9">Ҫ�󵽻�ʱ��</span></td>
	<td width="20%"><span class="STYLE9"><%=jhshsj%></span></td>
    <td width="10%" align="right"><span class="STYLE9">�ֳ��ӻ���</span></td>
	<td width="20%"><span class="STYLE9"><%=sgdmc%></span></td>
    <td width="10%" align="right"><span class="STYLE9">��ϵ��ʽ</span></td>
	<td width="20%"><span class="STYLE9"><%=dh%>/<%=dh2%></span></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="10%" align="right"><span class="STYLE9">Ҫ������</span></td>
	<td width="20%"><span class="STYLE9"><%=lrsj%></span></td>
    <td width="10%" align="right"><span class="STYLE9">���Ͻ��</span></td>
	<td width="20%"><span class="STYLE9"><%=pszje%></span></td>
    <td width="10%" align="right"><span class="STYLE9">Ҫ����ַ</span></td>
	<td width="20%"><span class="STYLE9"><%=fwdz%></span></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="10%" align="right"><span class="STYLE9">��ע</span></td>
	<td width="20%" colspan="5"><span class="STYLE9"><%=bz%></span></td>
    
  </tr>
 
</table>
<br>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%"><span class="STYLE3">���</span></td>
	<td  width="7%"><span class="STYLE3">���ϱ���</span></td>
	<td  width="30%"><span class="STYLE3">��������</span></td>
	<td  width="15%"><span class="STYLE3">���Ϲ��</span></td>
	<td  width="6%"><span class="STYLE3">������λ</span></td>
	<td  width="7%"><span class="STYLE3">����</span></td>
	<td  width="7%"><span class="STYLE3">����</span></td>
	<td  width="9%"><span class="STYLE3">���</span></td>
	<td  width="32%"><span class="STYLE3">��ϸע��</span></td>
</tr>
<%
	ls_sql="SELECT clbm,psdh,clmc,clgg,gdj,pssl,psje,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_psdmx ";
	ls_sql+=" where psdh='"+wherepsdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=cf.fillNull(rs.getString("gdj"));
		pssl=cf.fillNull(rs.getString("pssl"));
		psje=cf.fillNull(rs.getString("psje"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center" ><%=i%></div>		</td>
		<td> 
			<div align="center" ><%=clbm%></div>		</td>
		<td> 
			<div align="left" ><%=clmc%></div>		</td>
		<td> 
			<div align="center" ><%=clgg%>&nbsp;</div>		</td>
		
		<td> 
			<div align="center" ><%=jldwmc%>&nbsp;</div>		</td>
			<td> <div align="center" ><%=gdj%>&nbsp;</div></td>
			<td> <div align="center" ><%=pssl%>&nbsp;</div></td>
			<td> <div align="center" ><%=psje%>&nbsp;</div></td>
		<td>&nbsp;</td>
		</tr>
<%
	row++;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>
<br>
<table width="100%" border="0">
  <tr>
    <td width="50%">��Ŀ����ǩ�֣�________</td>
    <td width="50%">���ϲ����ǩ�֣�________</td>
  </tr>
</table>
</body>

</html>
