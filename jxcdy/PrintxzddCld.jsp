<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] clbms = request.getParameterValues("clbm");
String psph=cf.GB2Uni(request.getParameter("psph"));

String clbmlist="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

%>
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
<head>
<title>���϶���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<div align="center"><font size="3"><b>��������Ԥ�㵥(����:<%=psph%>&nbsp;)</font></div>
<%
String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String dh=null;
String psfs=null;
String jhshsj=null;
String zjxm=null;

String kgrq=null;
String jgrq=null;


double pszje=0;
double yf=0;
double qtsf=0;
try {
	conn=cf.getConnection();
	ls_sql="SELECT hth,zjxm,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh,DECODE(psfs,'1','����','2','����','9','����') psfs,jhshsj,pszje,yf,qtsf,kgrq,jgrq  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=jxc_clpsd.khbh(+) and jxc_clpsd.psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
     	khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		dh=cf.fillHtml(rs.getString("dh"));
		psfs=cf.fillHtml(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
	}
	
	rs.close();
	ps.close();
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
<table width="100%" border="0">
  <tr> 
    <td width="39%"><span class="STYLE9">�ͻ�������<%=khxm%></span></td>
    <td width="33%"><span class="STYLE9">�ͻ��绰��<%=lxfs%></span></td>
    <td width="28%"><span class="STYLE9">��ͬ�ţ�<%=hth%></span></td>
  </tr>
  <tr> 
    <td width="39%"><span class="STYLE9">���ݵ�ַ��<%=fwdz%></span></td>
	<td width="33%"><span class="STYLE9">���ͷ�ʽ��<%=psfs%>&nbsp;&nbsp;&nbsp;&nbsp;�ʼ죺<%=zjxm%></span></td>
    <td width="28%"><span class="STYLE9">�ƻ��ͻ�ʱ�䣺<%=jhshsj%></span></td>
  </tr>
  <tr> 
    <td width="39%"><span class="STYLE9">��Ŀ����<%=sgdmc%>��<%=dh%>��</span></td>
    <td width="33%"><span class="STYLE9">�ܽ�<%=pszje%></td>
    <td width="28%"><span class="STYLE9">�˷ѣ�<%=yf%>�������շѣ�<%=qtsf%></span></td>
  </tr>
 </table>


<table width="101%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
	<td align="center" width="5%"><b>���</b></td>
	<td align="center" width="20%"><b>��������</b></td>
	<td align="center" width="15%"><b>���Ϲ��</b></td>
	<td align="center" width="15%"><b>���ϴ���</b></td>
	<td align="center" width="7%"><b>������λ</b></td>
	<td align="center" width="6%"><b>��������</b></td>
	<td align="center" width="10%"><b>��ע</b></td>
</tr>
<%
int dhxh=0;
int i=0;
String xspsph=null;
String xsclbm=null;
String xsclmc=null;
String xsgg=null;
String xsjldwmc=null;
String xscldlbm=null;
double dhsl=0;
double sumdhsl=0;
double cltj=0;
double djzl=0;
double sumcltj=0;
double sumdjzl=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT clbm,psph,clmc,gg,cldlbm,jldwbm,pssl  ";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"' and "+cf.arrayToInSQL(clbms,"clbm");
	ls_sql+=" order by clbm";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		xsclbm=cf.fillNull(rs.getString("clbm"));
		xspsph=cf.fillNull(rs.getString("psph"));
		xsclmc=cf.fillNull(rs.getString("clmc"));
		xscldlbm=cf.fillNull(rs.getString("cldlbm"));
		xsgg=cf.fillNull(rs.getString("gg"));
		xsjldwmc=cf.fillNull(rs.getString("jldwbm"));
		dhsl=rs.getDouble("pssl");

		sumdhsl+=dhsl;
		sumcltj+=cltj*dhsl;
		sumdjzl+=djzl*dhsl;
		%>
		<tr bgcolor="#FFFFFF">
		<td align="center"><%=i%></td>
	
		<td align="center"><%=xsclmc%></td>
		<td align="center"><%=xsgg%></td>
		<td align="center"><%=xscldlbm%></td>
		<td align="center"><%=xsjldwmc%></td>
		<td align="center"><%=dhsl%></td>
		
		<td align="center">&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	sumcltj=sumcltj*1000;
	%>
		<tr bgcolor="#FFFFFF">
		<td align="center" colspan="5">�ϼ�</td>
		<td align="center"><%=cf.formatDouble(sumdhsl)%></td>
		<td align="center">&nbsp;</td>
		<!-- <td align="center"><%=Math.floor(sumcltj)/1000%></td>
		<td align="center"><%=sumdjzl%></td> -->
		</tr>
		<tr bgcolor="#FFFFFF" >
		<td colspan="7" align="left"></td>
		</tr>
		
		<%
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

</table>
</body>
</html>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<table width="100%" border="0">
  <tr>
    <td width="33%">�Ƶ���ǩ�֣�________</td>
    <td width="33%">����ǩ�֣�________</td>
    <td width="34%"> �������ǩ�֣�________</td>
  </tr>
  <tr>
    <td width="33%">ʱ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�䣺________</td>
    <td width="33%">ʱ&nbsp;&nbsp;&nbsp;&nbsp;�䣺________</td>
    <td width="33%">ʱ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�䣺________</td>
  </tr>
 <tr>
    <td width="33%"><b>��ͬ����ʱ�䣺<%=kgrq%></b></td>
    <td width="33%"><b>��ͬ����ʱ�䣺<%=jgrq%></b></td>
    <td width="33%"><font ><b>��ӡ���ڣ�<%=cf.today("YYYY-MM-DD")%></b></font></td>
  </tr>

</table>