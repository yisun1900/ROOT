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
String yhmc=(String)session.getAttribute("yhmc");
String psph=request.getParameter("psph");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������Ԥ�㵥(����:<%=psph%>)</font></B> 
</CENTER>
<%
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
String gg=null;
String gdj=null;
double pssl=0;
double psslxj=0;
String psje=null;
String cldlbm=null;
String jldwbm=null;
if (psph.equals(""))
{
	return;
}

String shjl="";
String psdzt="";
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

	ls_sql="SELECT jxc_clpsd.shjl,jxc_clpsd.psdzt,hth,zjxm,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh,DECODE(psfs,'1','����','2','����','9','����') psfs,jhshsj,pszje,yf,qtsf,kgrq,jgrq  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=jxc_clpsd.khbh(+) and jxc_clpsd.psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		shjl=cf.fillNull(rs.getString("shjl"));
		psdzt=cf.fillNull(rs.getString("psdzt"));
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

	if (  (psdzt.equals("0") || psdzt.equals("1")) || (psdzt.equals("6") && shjl.equals("N")))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����δͨ��
	{
		out.println("<P>����״̬����ȷ�����ܴ�ӡ��ֻ���ύ�������ͨ������ܴ�ӡ");
		return;
	}

	ls_sql="update jxc_clpsd set dybz='Y',dyr='"+yhmc+"',dysj=SYSDATE";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
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
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%"><span class="STYLE3">���</span></td>
	<td  width="22%"><span class="STYLE3">��������</span></td>
	<td  width="16%"><span class="STYLE3">���Ϲ��</span></td>
	<td  width="16%"><span class="STYLE3">���ϴ���</span></td>
	<td  width="8%"><span class="STYLE3">������λ</span></td>
	<td  width="10%"><span class="STYLE3">��������</span></td>
	<td  width="24%"><span class="STYLE3">��ע</span></td>
</tr>
<%
	ls_sql="SELECT jxc_clpsmx.clbm,jxc_clpsmx.psph,jxc_clpsmx.clmc,jxc_clpsmx.gg,jxc_clbm.cldlbm,jxc_clpsmx.jldwbm,jxc_clpsmx.pssl  ";
	ls_sql+=" FROM jxc_clpsmx,jxc_clbm ";
	ls_sql+=" where jxc_clpsmx.clbm=jxc_clbm.clbm and psph='"+psph+"' ";
	ls_sql+=" and jxc_clpsmx.xsfs='1'";
	ls_sql+=" order by jxc_clpsmx.psxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillHtml(rs.getString("clmc"));
		gg=cf.fillHtml(rs.getString("gg"));
		pssl=rs.getDouble("pssl");
		cldlbm=cf.fillHtml(rs.getString("cldlbm"));
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		
		psslxj+=pssl;
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center">
			<td><div class="STYLE10"><%=i%></div></td>
			<td><div class="STYLE10"><%=clmc%></div></td>
			<td><div class="STYLE10"><%=gg%></div></td>
			<td><div class="STYLE10"><%=cldlbm%></div></td>
			<td><div class="STYLE10"><%=jldwbm%></div></td>
			<td><div class="STYLE10"><%=pssl%></div></td>
			<td>&nbsp;</td>
		</tr>
<%
	row++;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e+ls_sql);
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
     <tr>
			<td colspan="5"><div align="center"><strong>�ϼ�</strong></div></td>
			<td><div align="center"><%=cf.doubleTrim(psslxj)%></div></td>
			<td>&nbsp;</td>
  </tr>
</table>
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
</body>

</html>

