<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String psdzt=null;
String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;
String lx=null;
double yf=0;
double qtsf=0;
double pszsl=0;
double pszje=0;
String ssbm=null;
String lrr=null;
String lrrq=null;
String bz=null;
String dybz=null;
String dyr=null;
String dysj=null;
String zfr=null;
String zfsj=null;
String zfsm=null;
double yckje=0;
double ycksl=0;
String fclb=null;

String dqbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;

String psph=cf.GB2Uni(request.getParameter("psph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select DECODE(jxc_clpsd.fclb,'1','����','2','����','3','����') fclb,jxc_clpsd.yckje,jxc_clpsd.ycksl,khbh,psfs,jhshsj,pszsl,pszje,fkje,yf,qtsf,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','5','���ֳ���','6','���������޸�','7','����') psdzt,dwmc,lrr,lrrq,jxc_clpsd.bz,DECODE(jxc_clpsd.dybz,'Y','��ӡ','N','δ��ӡ') dybz,jxc_clpsd.dyr,jxc_clpsd.dysj,zfr,zfsj,zfsm";
	ls_sql+=" from  jxc_clpsd,sq_dwxx";
	ls_sql+=" where jxc_clpsd.ssbm=sq_dwxx.dwbh and psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		fclb=cf.fillNull(rs.getString("fclb"));
		yckje=rs.getDouble("yckje");
		ycksl=rs.getDouble("ycksl");
		khbh=cf.fillNull(rs.getString("khbh"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		pszsl=rs.getDouble("pszsl");
		pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		psdzt=cf.fillNull(rs.getString("psdzt"));
		ssbm=cf.fillNull(rs.getString("dwmc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		bz=cf.fillHtml(rs.getString("bz"));
		dybz=cf.fillHtml(rs.getString("dybz"));
		dyr=cf.fillHtml(rs.getString("dyr"));
		dysj=cf.fillHtml(rs.getString("dysj"));
		zfr=cf.fillHtml(rs.getString("zfr"));
		zfsj=cf.fillHtml(rs.getString("zfsj"));
		zfsm=cf.fillHtml(rs.getString("zfsm"));
	}
	rs.close();
	ps.close();


	ls_sql="select khbh,khxm,fwdz,lxfs,dwmc,sjs,sgdmc,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
	ls_sql+=" from  crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE2 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">���ϵ������ϵ��ţ�<%=psph%>��</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">�ͻ���� </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right">��ͬ�� </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ����� </td>
    <td><%=khxm%> </td>
    <td align="right">�ʼ�Ա</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ����</td>
    <td><%=dwbh%></td>
    <td align="right">���ʦ</td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʩ���� </td>
    <td><%=sgd%>    </td>
    <td align="right">ʩ������ </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ��������</td>
    <td bgcolor="#FFFFFF"><%=kgrq%> </td>
    <td align="right">��ͬ��������</td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">���ϵ�״̬</span></td>
    <td><%=psdzt%></td>
    <td align="right"><span class="STYLE2">��ӡ��־</span></td>
    <td><%=dybz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ӡ��</td>
    <td><%=dyr%></td>
    <td align="right">��ӡʱ��</td>
    <td><%=dysj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ͷ�ʽ</td>
    <td><%
	cf.radioToken(out,"1+����&2+����&9+����",psfs,true);
%>    </td>
    <td align="right">�ƻ��ͻ�ʱ��</td>
    <td><%=jhshsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�������</td>
    <td><%=fclb%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ѳ�������</td>
    <td><%=ycksl%></td>
    <td align="right">�ѳ�����</td>
    <td><%=yckje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����������</td>
    <td><%=pszsl%></td>
    <td align="right">�����ܽ��</td>
    <td><%=pszje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����˷�</td>
    <td><%=yf%></td>
    <td align="right">�����շ�</td>
    <td><%=qtsf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=fkje%></td>
    <td align="right">¼�벿��</td>
    <td><%=ssbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">¼����</td>
    <td><%=lrr%></td>
    <td align="right">¼��ʱ��</td>
    <td><%=lrrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=zfr%></td>
    <td align="right">����ʱ��</td>
    <td><%=zfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����˵��</td>
    <td colspan="3"><%=zfsm%></td>
  </tr>
</table>


<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="10%">��������</td>
	<td  width="6%">���</td>
	<td  width="4%">������λ</td>
	<td  width="4%">���ϵ���</td>
	<td  width="4%">��������</td>
	<td  width="4%"><span class="STYLE3">�������</span></td>
	<td  width="5%">���</td>
	<td  width="4%"><span class="STYLE3">�ѳ�����</span></td>
	<td  width="4%"><span class="STYLE3">�������</span></td>
	<td  width="5%"><span class="STYLE3">Ŀǰ�����</span></td>
	<td  width="5%"><span class="STYLE3">�ۼƶ�����</span></td>
	<td  width="4%"><span class="STYLE2">���۷�ʽ</span></td>
	<td  width="4%">��С����</td>
	<td  width="7%">��Ʒ��</td>
	<td  width="8%">��Ӧ��</td>
	<td  width="7%">����С��</td>
	<td  width="6%">���ϱ���</td>
	<td  width="5%">�ͺ�</td>
</tr>
<%
	String psxh=null;
	String nbbm=null;
	String clmc=null;
	String xh=null;
	String gg=null;
	String jldwbm=null;
	double dj=0;
	double sqpssl=0;
	double pssl=0;
	double psje=0;
	double cksl=0;
	String xsfsmc=null;
	double zcpzsl=0;
	double dhsl=0;
	double zxqdl=0;
	String ppmc=null;
	String gysmc=null;
	String clxlbm=null;
	String clbm=null;

	double allsqpssl=0;
	double allpssl=0;
	double allpsje=0;
	double allcksl=0;
	double allzcpzsl=0;
	double alldhsl=0;
	
	
	
	ls_sql="  SELECT jxc_clpsmx.psxh,jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.jldwbm ";
	ls_sql+=" ,jxc_clpsmx.dj,jxc_clpsmx.sqpssl,jxc_clpsmx.pssl,jxc_clpsmx.psje,jxc_clpsmx.cksl";
	ls_sql+=" ,DECODE(jxc_clpsmx.xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�����','4','�ɸ����') xsfsmc,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,zxqdl";
	ls_sql+=" ,jxc_clpsmx.ppmc,jxc_clpsmx.gysmc,jxc_clpsmx.clxlbm,jxc_clpsmx.clbm";
	ls_sql+=" FROM jxc_clpsmx,jxc_cljgb ";
	ls_sql+=" where jxc_clpsmx.psph='"+psph+"' ";
	ls_sql+=" and jxc_clpsmx.clbm=jxc_cljgb.clbm(+)";
	ls_sql+=" and  jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" order by jxc_clpsmx.psxh ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		psxh=cf.fillNull(rs.getString("psxh"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		clmc=cf.fillHtml(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		dj=rs.getDouble("dj");
		sqpssl=rs.getDouble("sqpssl");
		pssl=rs.getDouble("pssl");
		psje=rs.getDouble("psje");
		cksl=rs.getDouble("cksl");
		xsfsmc=cf.fillHtml(rs.getString("xsfsmc"));
		zcpzsl=rs.getDouble("zcpzsl");
		dhsl=rs.getDouble("dhsl");
		zxqdl=rs.getDouble("zxqdl");
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		gysmc=cf.fillHtml(rs.getString("gysmc"));
		clxlbm=cf.fillHtml(rs.getString("clxlbm"));
		clbm=cf.fillHtml(rs.getString("clbm"));

		allsqpssl+=sqpssl;
		allpssl+=pssl;
		allpsje+=psje;
		allcksl+=cksl;
		allzcpzsl+=zcpzsl;
		alldhsl+=dhsl;

		String xcks="&nbsp;";
		if (pssl!=cksl)
		{
			xcks=""+cf.round(pssl-cksl,2);
		}
		String ycks="&nbsp;";
		if (cksl!=0)
		{
			ycks=""+cksl;
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=psxh%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dj%></td>
			<td><%=sqpssl%></td>
			<td><%=pssl%></td>
			<td><%=psje%></td>
			<td><%=ycks%></td>
			<td><%=xcks%></td>
			<td><%=zcpzsl%></td>
			<td><%=dhsl%></td>
			<td><%=xsfsmc%></td>
			<td><%=zxqdl%></td>
			<td><%=ppmc%></td>
			<td><%=gysmc%></td>
			<td><%=clxlbm%></td>
			<td><%=clbm%></td>
			<td><%=xh%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="2">С ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsqpssl)%></td>
	<td><%=cf.formatDouble(allpssl)%></td>
	<td><%=cf.formatDouble(allpsje)%></td>
	<td><%=cf.formatDouble(allcksl)%></td>
	<td><%=cf.formatDouble(allpssl-allcksl)%></td>
	<td><%=cf.formatDouble(allzcpzsl)%></td>
	<td><%=cf.formatDouble(alldhsl)%></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>

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
</body>
</html>