<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kp_pdkpjl_kpjlh=null;
String sq_dwxx_dwmc=null;
String kp_pdkpjl_qssj=null;
String kp_pdkpjl_jzsj=null;
String kp_pdkpjl_sgdpdze=null;
String kp_pdkpjl_ajqz=null;
String kp_pdkpjl_bjqz=null;
String kp_pdkpjl_cjqz=null;
String kp_pdkpjl_djqz=null;
String kp_pdkpjl_ajddbl=null;
String kp_pdkpjl_ajzdbl=null;
String kp_pdkpjl_ajxdbl=null;
String kp_pdkpjl_bjddbl=null;
String kp_pdkpjl_bjzdbl=null;
String kp_pdkpjl_bjxdbl=null;
String kp_pdkpjl_cjddbl=null;
String kp_pdkpjl_cjzdbl=null;
String kp_pdkpjl_cjxdbl=null;
String kp_pdkpjl_djddbl=null;
String kp_pdkpjl_djzdbl=null;
String kp_pdkpjl_djxdbl=null;
String kp_pdkpjl_ajzdjde=null;
String kp_pdkpjl_bjzdjde=null;
String kp_pdkpjl_cjzdjde=null;
String kp_pdkpjl_djzdjde=null;
String kp_pdkpjl_sgdpkzf=null;
String mfkjde=null;
String kp_pdkpjl_zsdpdze=null;
String kp_pdkpjl_zsajddbl=null;
String kp_pdkpjl_zsajzdbl=null;
String kp_pdkpjl_zsajxdbl=null;
String kp_pdkpjl_zsbjddbl=null;
String kp_pdkpjl_zsbjzdbl=null;
String kp_pdkpjl_zsbjxdbl=null;
String kp_pdkpjl_zsajzdjde=null;
String kp_pdkpjl_zsbjzdjde=null;
String kp_pdkpjl_zsdkpzf=null;
String zsmfkjde=null;
String kp_pdkpjl_lrr=null;
String kp_pdkpjl_lrsj=null;
String kp_pdkpjl_zxbz=null;
String kp_pdkpjl_bz=null;
String kp_pdkpjl_kxsgds=null;
String kp_pdkpjl_sgdkpdde=null;
String kp_pdkpjl_sgdkpzde=null;
String kp_pdkpjl_sgdkpxde=null;
double sgdspdze=0;
String kp_pdkpjl_sgdspdde=null;
String kp_pdkpjl_sgdspzde=null;
String kp_pdkpjl_sgdspxde=null;
String kp_pdkpjl_zsdkpdde=null;
String kp_pdkpjl_zsdkpzde=null;
String kp_pdkpjl_zsdkpxde=null;
String kp_pdkpjl_zsdspdze=null;
String kp_pdkpjl_zsdspdde=null;
String kp_pdkpjl_zsdspzde=null;
String kp_pdkpjl_zsdspxde=null;
String kp_pdkpjl_sqkpjlh=null;
String kp_pdkpjl_sqsjqye=null;
String kp_pdkpjl_sqddqye=null;
String kp_pdkpjl_sqzdqye=null;
String kp_pdkpjl_sqxdqye=null;
String kp_pdkpjl_sqddsjbl=null;
String kp_pdkpjl_sqzdsjbl=null;
String kp_pdkpjl_sqxdsjbl=null;
String kp_pdkpjl_zsajqz=null;
String kp_pdkpjl_zsbjqz=null;
String kp_pdkpjl_zscjqz=null;
String kp_pdkpjl_zsdjqz=null;
String kp_pdkpjl_zscjddbl=null;
String kp_pdkpjl_zscjzdbl=null;
String kp_pdkpjl_zscjxdbl=null;
String kp_pdkpjl_zsdjddbl=null;
String kp_pdkpjl_zsdjzdbl=null;
String kp_pdkpjl_zsdjxdbl=null;
String kp_pdkpjl_zscjzdjde=null;
String kp_pdkpjl_zsdjzdjde=null;
String kpjlh=null;

double sgdpdde=0;
double sgdpzde=0;
double sgdpxde=0;
double sgdsqze=0;
double sgdsqdde=0;
double sgdsqzde=0;
double sgdsqxde=0;
double sgdbcze=0;
double sgdbcdde=0;
double sgdbczde=0;
double sgdbcxde=0;
double sgdkpdze=0;

double zsdpdde=0;
double zsdpzde=0;
double zsdpxde=0;
double zsdsqze=0;
double zsdsqdde=0;
double zsdsqzde=0;
double zsdsqxde=0;
double zsdbcze=0;
double zsdbcdde=0;
double zsdbczde=0;
double zsdbcxde=0;
double zsdkpdze=0;

kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select kp_pdkpjl.kpjlh as kp_pdkpjl_kpjlh,sq_dwxx.dwmc as sq_dwxx_dwmc,kp_pdkpjl.qssj as kp_pdkpjl_qssj,kp_pdkpjl.jzsj as kp_pdkpjl_jzsj,kp_pdkpjl.sgdpdze as kp_pdkpjl_sgdpdze,kp_pdkpjl.ajqz as kp_pdkpjl_ajqz,kp_pdkpjl.bjqz as kp_pdkpjl_bjqz,kp_pdkpjl.cjqz as kp_pdkpjl_cjqz,kp_pdkpjl.djqz as kp_pdkpjl_djqz,kp_pdkpjl.ajddbl as kp_pdkpjl_ajddbl,kp_pdkpjl.ajzdbl as kp_pdkpjl_ajzdbl,kp_pdkpjl.ajxdbl as kp_pdkpjl_ajxdbl,kp_pdkpjl.bjddbl as kp_pdkpjl_bjddbl,kp_pdkpjl.bjzdbl as kp_pdkpjl_bjzdbl,kp_pdkpjl.bjxdbl as kp_pdkpjl_bjxdbl,kp_pdkpjl.cjddbl as kp_pdkpjl_cjddbl,kp_pdkpjl.cjzdbl as kp_pdkpjl_cjzdbl,kp_pdkpjl.cjxdbl as kp_pdkpjl_cjxdbl,kp_pdkpjl.djddbl as kp_pdkpjl_djddbl,kp_pdkpjl.djzdbl as kp_pdkpjl_djzdbl,kp_pdkpjl.djxdbl as kp_pdkpjl_djxdbl,kp_pdkpjl.ajzdjde as kp_pdkpjl_ajzdjde,kp_pdkpjl.bjzdjde as kp_pdkpjl_bjzdjde,kp_pdkpjl.cjzdjde as kp_pdkpjl_cjzdjde,kp_pdkpjl.djzdjde as kp_pdkpjl_djzdjde,kp_pdkpjl.sgdpkzf as kp_pdkpjl_sgdpkzf,kp_pdkpjl.mfkjde,kp_pdkpjl.zsdpdze as kp_pdkpjl_zsdpdze,kp_pdkpjl.zsajddbl as kp_pdkpjl_zsajddbl,kp_pdkpjl.zsajzdbl as kp_pdkpjl_zsajzdbl,kp_pdkpjl.zsajxdbl as kp_pdkpjl_zsajxdbl,kp_pdkpjl.zsbjddbl as kp_pdkpjl_zsbjddbl,kp_pdkpjl.zsbjzdbl as kp_pdkpjl_zsbjzdbl,kp_pdkpjl.zsbjxdbl as kp_pdkpjl_zsbjxdbl,kp_pdkpjl.zsajzdjde as kp_pdkpjl_zsajzdjde,kp_pdkpjl.zsbjzdjde as kp_pdkpjl_zsbjzdjde,kp_pdkpjl.zsdkpzf as kp_pdkpjl_zsdkpzf,kp_pdkpjl.zsmfkjde,kp_pdkpjl.lrr as kp_pdkpjl_lrr,kp_pdkpjl.lrsj as kp_pdkpjl_lrsj,kp_pdkpjl.zxbz as kp_pdkpjl_zxbz,kp_pdkpjl.bz as kp_pdkpjl_bz,kp_pdkpjl.kxsgds as kp_pdkpjl_kxsgds,kp_pdkpjl.sgdkpdde as kp_pdkpjl_sgdkpdde,kp_pdkpjl.sgdkpzde as kp_pdkpjl_sgdkpzde,kp_pdkpjl.sgdkpxde as kp_pdkpjl_sgdkpxde,kp_pdkpjl.sgdspdze,kp_pdkpjl.sgdspdde as kp_pdkpjl_sgdspdde,kp_pdkpjl.sgdspzde as kp_pdkpjl_sgdspzde,kp_pdkpjl.sgdspxde as kp_pdkpjl_sgdspxde,kp_pdkpjl.zsdkpdde as kp_pdkpjl_zsdkpdde,kp_pdkpjl.zsdkpzde as kp_pdkpjl_zsdkpzde,kp_pdkpjl.zsdkpxde as kp_pdkpjl_zsdkpxde,kp_pdkpjl.zsdspdze as kp_pdkpjl_zsdspdze,kp_pdkpjl.zsdspdde as kp_pdkpjl_zsdspdde,kp_pdkpjl.zsdspzde as kp_pdkpjl_zsdspzde,kp_pdkpjl.zsdspxde as kp_pdkpjl_zsdspxde,kp_pdkpjl.sqkpjlh as kp_pdkpjl_sqkpjlh,kp_pdkpjl.sqsjqye as kp_pdkpjl_sqsjqye,kp_pdkpjl.sqddqye as kp_pdkpjl_sqddqye,kp_pdkpjl.sqzdqye as kp_pdkpjl_sqzdqye,kp_pdkpjl.sqxdqye as kp_pdkpjl_sqxdqye,kp_pdkpjl.sqddsjbl as kp_pdkpjl_sqddsjbl,kp_pdkpjl.sqzdsjbl as kp_pdkpjl_sqzdsjbl,kp_pdkpjl.sqxdsjbl as kp_pdkpjl_sqxdsjbl,kp_pdkpjl.zsajqz as kp_pdkpjl_zsajqz,kp_pdkpjl.zsbjqz as kp_pdkpjl_zsbjqz,kp_pdkpjl.zscjqz as kp_pdkpjl_zscjqz,kp_pdkpjl.zsdjqz as kp_pdkpjl_zsdjqz,kp_pdkpjl.zscjddbl as kp_pdkpjl_zscjddbl,kp_pdkpjl.zscjzdbl as kp_pdkpjl_zscjzdbl,kp_pdkpjl.zscjxdbl as kp_pdkpjl_zscjxdbl,kp_pdkpjl.zsdjddbl as kp_pdkpjl_zsdjddbl,kp_pdkpjl.zsdjzdbl as kp_pdkpjl_zsdjzdbl,kp_pdkpjl.zsdjxdbl as kp_pdkpjl_zsdjxdbl,kp_pdkpjl.zscjzdjde as kp_pdkpjl_zscjzdjde,kp_pdkpjl.zsdjzdjde as kp_pdkpjl_zsdjzdjde ";
	ls_sql+=" ,sgdpdde,sgdpzde,sgdpxde,sgdsqze,sgdsqdde ,sgdsqzde,sgdsqxde,sgdbcze,sgdbcdde,sgdbczde,sgdbcxde,sgdkpdze";
	ls_sql+=" ,zsdpdde,zsdpzde,zsdpxde,zsdsqze,zsdsqdde ,zsdsqzde,zsdsqxde,zsdbcze,zsdbcdde,zsdbczde,zsdbcxde,zsdkpdze";
	ls_sql+=" from  kp_pdkpjl,sq_dwxx";
	ls_sql+=" where kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+) and  (kp_pdkpjl.kpjlh='"+kpjlh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgdpdde=rs.getDouble("sgdpdde");
		sgdpzde=rs.getDouble("sgdpzde");
		sgdpxde=rs.getDouble("sgdpxde");
		sgdsqze=rs.getDouble("sgdsqze");
		sgdsqdde=rs.getDouble("sgdsqdde");
		sgdsqzde=rs.getDouble("sgdsqzde");
		sgdsqxde=rs.getDouble("sgdsqxde");
		sgdbcze=rs.getDouble("sgdbcze");
		sgdbcdde=rs.getDouble("sgdbcdde");
		sgdbczde=rs.getDouble("sgdbczde");
		sgdbcxde=rs.getDouble("sgdbcxde");
		sgdkpdze=rs.getDouble("sgdkpdze");

		zsdpdde=rs.getDouble("zsdpdde");
		zsdpzde=rs.getDouble("zsdpzde");
		zsdpxde=rs.getDouble("zsdpxde");
		zsdsqze=rs.getDouble("zsdsqze");
		zsdsqdde=rs.getDouble("zsdsqdde");
		zsdsqzde=rs.getDouble("zsdsqzde");
		zsdsqxde=rs.getDouble("zsdsqxde");
		zsdbcze=rs.getDouble("zsdbcze");
		zsdbcdde=rs.getDouble("zsdbcdde");
		zsdbczde=rs.getDouble("zsdbczde");
		zsdbcxde=rs.getDouble("zsdbcxde");
		zsdkpdze=rs.getDouble("zsdkpdze");

		kp_pdkpjl_kpjlh=cf.fillNull(rs.getString("kp_pdkpjl_kpjlh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		kp_pdkpjl_qssj=cf.fillNull(rs.getDate("kp_pdkpjl_qssj"));
		kp_pdkpjl_jzsj=cf.fillNull(rs.getDate("kp_pdkpjl_jzsj"));
		kp_pdkpjl_sgdpdze=cf.fillNull(rs.getString("kp_pdkpjl_sgdpdze"));
		kp_pdkpjl_ajqz=cf.fillNull(rs.getString("kp_pdkpjl_ajqz"));
		kp_pdkpjl_bjqz=cf.fillNull(rs.getString("kp_pdkpjl_bjqz"));
		kp_pdkpjl_cjqz=cf.fillNull(rs.getString("kp_pdkpjl_cjqz"));
		kp_pdkpjl_djqz=cf.fillNull(rs.getString("kp_pdkpjl_djqz"));
		kp_pdkpjl_ajddbl=cf.fillNull(rs.getString("kp_pdkpjl_ajddbl"));
		kp_pdkpjl_ajzdbl=cf.fillNull(rs.getString("kp_pdkpjl_ajzdbl"));
		kp_pdkpjl_ajxdbl=cf.fillNull(rs.getString("kp_pdkpjl_ajxdbl"));
		kp_pdkpjl_bjddbl=cf.fillNull(rs.getString("kp_pdkpjl_bjddbl"));
		kp_pdkpjl_bjzdbl=cf.fillNull(rs.getString("kp_pdkpjl_bjzdbl"));
		kp_pdkpjl_bjxdbl=cf.fillNull(rs.getString("kp_pdkpjl_bjxdbl"));
		kp_pdkpjl_cjddbl=cf.fillNull(rs.getString("kp_pdkpjl_cjddbl"));
		kp_pdkpjl_cjzdbl=cf.fillNull(rs.getString("kp_pdkpjl_cjzdbl"));
		kp_pdkpjl_cjxdbl=cf.fillNull(rs.getString("kp_pdkpjl_cjxdbl"));
		kp_pdkpjl_djddbl=cf.fillNull(rs.getString("kp_pdkpjl_djddbl"));
		kp_pdkpjl_djzdbl=cf.fillNull(rs.getString("kp_pdkpjl_djzdbl"));
		kp_pdkpjl_djxdbl=cf.fillNull(rs.getString("kp_pdkpjl_djxdbl"));
		kp_pdkpjl_ajzdjde=cf.fillNull(rs.getString("kp_pdkpjl_ajzdjde"));
		kp_pdkpjl_bjzdjde=cf.fillNull(rs.getString("kp_pdkpjl_bjzdjde"));
		kp_pdkpjl_cjzdjde=cf.fillNull(rs.getString("kp_pdkpjl_cjzdjde"));
		kp_pdkpjl_djzdjde=cf.fillNull(rs.getString("kp_pdkpjl_djzdjde"));
		kp_pdkpjl_sgdpkzf=cf.fillNull(rs.getString("kp_pdkpjl_sgdpkzf"));
		mfkjde=cf.fillNull(rs.getString("mfkjde"));
		kp_pdkpjl_zsdpdze=cf.fillNull(rs.getString("kp_pdkpjl_zsdpdze"));
		kp_pdkpjl_zsajddbl=cf.fillNull(rs.getString("kp_pdkpjl_zsajddbl"));
		kp_pdkpjl_zsajzdbl=cf.fillNull(rs.getString("kp_pdkpjl_zsajzdbl"));
		kp_pdkpjl_zsajxdbl=cf.fillNull(rs.getString("kp_pdkpjl_zsajxdbl"));
		kp_pdkpjl_zsbjddbl=cf.fillNull(rs.getString("kp_pdkpjl_zsbjddbl"));
		kp_pdkpjl_zsbjzdbl=cf.fillNull(rs.getString("kp_pdkpjl_zsbjzdbl"));
		kp_pdkpjl_zsbjxdbl=cf.fillNull(rs.getString("kp_pdkpjl_zsbjxdbl"));
		kp_pdkpjl_zsajzdjde=cf.fillNull(rs.getString("kp_pdkpjl_zsajzdjde"));
		kp_pdkpjl_zsbjzdjde=cf.fillNull(rs.getString("kp_pdkpjl_zsbjzdjde"));
		kp_pdkpjl_zsdkpzf=cf.fillNull(rs.getString("kp_pdkpjl_zsdkpzf"));
		zsmfkjde=cf.fillNull(rs.getString("zsmfkjde"));
		kp_pdkpjl_lrr=cf.fillNull(rs.getString("kp_pdkpjl_lrr"));
		kp_pdkpjl_lrsj=cf.fillNull(rs.getDate("kp_pdkpjl_lrsj"));
		kp_pdkpjl_zxbz=cf.fillNull(rs.getString("kp_pdkpjl_zxbz"));
		kp_pdkpjl_bz=cf.fillNull(rs.getString("kp_pdkpjl_bz"));
		kp_pdkpjl_kxsgds=cf.fillNull(rs.getString("kp_pdkpjl_kxsgds"));
		kp_pdkpjl_sgdkpdde=cf.fillNull(rs.getString("kp_pdkpjl_sgdkpdde"));
		kp_pdkpjl_sgdkpzde=cf.fillNull(rs.getString("kp_pdkpjl_sgdkpzde"));
		kp_pdkpjl_sgdkpxde=cf.fillNull(rs.getString("kp_pdkpjl_sgdkpxde"));
		sgdspdze=rs.getDouble("sgdspdze");
		kp_pdkpjl_sgdspdde=cf.fillNull(rs.getString("kp_pdkpjl_sgdspdde"));
		kp_pdkpjl_sgdspzde=cf.fillNull(rs.getString("kp_pdkpjl_sgdspzde"));
		kp_pdkpjl_sgdspxde=cf.fillNull(rs.getString("kp_pdkpjl_sgdspxde"));
		kp_pdkpjl_zsdkpdde=cf.fillNull(rs.getString("kp_pdkpjl_zsdkpdde"));
		kp_pdkpjl_zsdkpzde=cf.fillNull(rs.getString("kp_pdkpjl_zsdkpzde"));
		kp_pdkpjl_zsdkpxde=cf.fillNull(rs.getString("kp_pdkpjl_zsdkpxde"));
		kp_pdkpjl_zsdspdze=cf.fillNull(rs.getString("kp_pdkpjl_zsdspdze"));
		kp_pdkpjl_zsdspdde=cf.fillNull(rs.getString("kp_pdkpjl_zsdspdde"));
		kp_pdkpjl_zsdspzde=cf.fillNull(rs.getString("kp_pdkpjl_zsdspzde"));
		kp_pdkpjl_zsdspxde=cf.fillNull(rs.getString("kp_pdkpjl_zsdspxde"));
		kp_pdkpjl_sqkpjlh=cf.fillNull(rs.getString("kp_pdkpjl_sqkpjlh"));
		kp_pdkpjl_sqsjqye=cf.fillNull(rs.getString("kp_pdkpjl_sqsjqye"));
		kp_pdkpjl_sqddqye=cf.fillNull(rs.getString("kp_pdkpjl_sqddqye"));
		kp_pdkpjl_sqzdqye=cf.fillNull(rs.getString("kp_pdkpjl_sqzdqye"));
		kp_pdkpjl_sqxdqye=cf.fillNull(rs.getString("kp_pdkpjl_sqxdqye"));
		kp_pdkpjl_sqddsjbl=cf.fillNull(rs.getString("kp_pdkpjl_sqddsjbl"));
		kp_pdkpjl_sqzdsjbl=cf.fillNull(rs.getString("kp_pdkpjl_sqzdsjbl"));
		kp_pdkpjl_sqxdsjbl=cf.fillNull(rs.getString("kp_pdkpjl_sqxdsjbl"));
		kp_pdkpjl_zsajqz=cf.fillNull(rs.getString("kp_pdkpjl_zsajqz"));
		kp_pdkpjl_zsbjqz=cf.fillNull(rs.getString("kp_pdkpjl_zsbjqz"));
		kp_pdkpjl_zscjqz=cf.fillNull(rs.getString("kp_pdkpjl_zscjqz"));
		kp_pdkpjl_zsdjqz=cf.fillNull(rs.getString("kp_pdkpjl_zsdjqz"));
		kp_pdkpjl_zscjddbl=cf.fillNull(rs.getString("kp_pdkpjl_zscjddbl"));
		kp_pdkpjl_zscjzdbl=cf.fillNull(rs.getString("kp_pdkpjl_zscjzdbl"));
		kp_pdkpjl_zscjxdbl=cf.fillNull(rs.getString("kp_pdkpjl_zscjxdbl"));
		kp_pdkpjl_zsdjddbl=cf.fillNull(rs.getString("kp_pdkpjl_zsdjddbl"));
		kp_pdkpjl_zsdjzdbl=cf.fillNull(rs.getString("kp_pdkpjl_zsdjzdbl"));
		kp_pdkpjl_zsdjxdbl=cf.fillNull(rs.getString("kp_pdkpjl_zsdjxdbl"));
		kp_pdkpjl_zscjzdjde=cf.fillNull(rs.getString("kp_pdkpjl_zscjzdjde"));
		kp_pdkpjl_zsdjzdjde=cf.fillNull(rs.getString("kp_pdkpjl_zsdjzdjde"));
	}
	rs.close();
	ps.close();

	if (mfkjde.startsWith("."))
	{
		mfkjde="0"+mfkjde;
	}
	else if (mfkjde.startsWith("-."))
	{
		mfkjde="-0."+mfkjde.substring(2);
	}

	if (zsmfkjde.startsWith("."))
	{
		zsmfkjde="0"+zsmfkjde;
	}
	else if (zsmfkjde.startsWith("-."))
	{
		zsmfkjde="-0."+zsmfkjde.substring(2);
	}
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">ʩ�����ɵ�����</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%"> ������¼�� </td>
    <td width="28%"> <%=kp_pdkpjl_kpjlh%> </td>
    <td align="right" width="23%">���±�־ </td>
    <td width="27%"><%
	cf.selectToken(out,"Y+����&N+������",kp_pdkpjl_zxbz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%">�ֹ�˾</td>
    <td width="28%"><%=sq_dwxx_dwmc%></td>
    <td align="right" width="23%">�ɵ�ʱ��ѡʩ������</td>
    <td width="27%"><%=kp_pdkpjl_kxsgds%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%"> ������ʼʱ�� </td>
    <td width="28%"> <%=kp_pdkpjl_qssj%> </td>
    <td align="right" width="23%"> ������ֹʱ�� </td>
    <td width="27%"> <%=kp_pdkpjl_jzsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%">���ڿ�����¼�� </td>
    <td width="28%"><%=kp_pdkpjl_sqkpjlh%> </td>
    <td align="right" width="23%">����ʵ��ǩԼ�� </td>
    <td width="27%"><%=kp_pdkpjl_sqsjqye%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%">����ʵ�ʴ󵥱��� </td>
    <td width="28%"><%=kp_pdkpjl_sqddsjbl%> </td>
    <td align="right" width="23%"> ���ڴ�ǩԼ�� </td>
    <td width="27%"> <%=kp_pdkpjl_sqddqye%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%">����ʵ���е�����</td>
    <td width="28%"><%=kp_pdkpjl_sqzdsjbl%></td>
    <td align="right" width="23%">�����е�ǩԼ��</td>
    <td width="27%"><%=kp_pdkpjl_sqzdqye%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%">����ʵ��С������ </td>
    <td width="28%"><%=kp_pdkpjl_sqxdsjbl%> </td>
    <td align="right" width="23%"> ����С��ǩԼ�� </td>
    <td width="27%"> <%=kp_pdkpjl_sqxdqye%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%"> ¼���� </td>
    <td width="28%"> <%=kp_pdkpjl_lrr%> </td>
    <td align="right" width="23%"> ¼��ʱ�� </td>
    <td width="27%"> <%=kp_pdkpjl_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="22%">��ע</td>
    <td colspan="3"><%=kp_pdkpjl_bz%></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="5"><b>��ֱ����</b></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td height="19" width="20%"><b>�����ɵ���</b></td>
    <td height="19" width="20%"><b>����ʣ�൥��</b></td>
    <td height="19" width="20%"><b>���ڲ�������</b></td>
    <td height="19" width="20%"><b>���ɵ���</b></td>
    <td height="19" width="20%"><b>ʵ�ɵ���</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="19" width="20%">�ܶ<%=kp_pdkpjl_sgdpdze%></td>
    <td height="19" width="20%">�ܶ<%=sgdsqze%></td>
    <td height="19" width="20%">�ܶ<%=sgdbcze%></td>
    <td height="19" width="20%">�ܶ<%=sgdkpdze%></td>
    <td height="19" width="20%">�ܶ<%=sgdspdze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">�󵥶<%=sgdpdde%></td>
    <td width="20%">�󵥶<%=sgdsqdde%></td>
    <td width="20%">�󵥶<%=sgdbcdde%></td>
    <td width="20%">�󵥶<%=kp_pdkpjl_sgdkpdde%></td>
    <td width="20%">�󵥶<%=kp_pdkpjl_sgdspdde%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">�е��<%=sgdpzde%></td>
    <td width="20%">�е��<%=sgdsqzde%></td>
    <td width="20%">�е��<%=sgdbczde%></td>
    <td width="20%">�е��<%=kp_pdkpjl_sgdkpzde%></td>
    <td width="20%">�е��<%=kp_pdkpjl_sgdspzde%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">С���<%=sgdpxde%></td>
    <td width="20%">С���<%=sgdsqxde%></td>
    <td width="20%">С���<%=sgdbcxde%></td>
    <td width="20%">С���<%=kp_pdkpjl_sgdkpxde%></td>
    <td width="20%">С���<%=kp_pdkpjl_sgdspxde%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">&nbsp;</td>
    <td colspan="2">�����ܷ֣�<%=kp_pdkpjl_sgdpkzf%></td>
    <td colspan="2">ÿ�ֵĿɽӵ��<%=mfkjde%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="5"><b>ֱ����</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="19" width="20%">�ܶ<%=kp_pdkpjl_zsdpdze%></td>
    <td height="19" width="20%">�ܶ<%=zsdsqze%></td>
    <td height="19" width="20%">�ܶ<%=zsdbcze%></td>
    <td height="19" width="20%">�ܶ<%=zsdkpdze%></td>
    <td height="19" width="20%">�ܶ<%=kp_pdkpjl_zsdspdze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">�󵥶<%=zsdpdde%></td>
    <td width="20%">�󵥶<%=zsdsqdde%></td>
    <td width="20%">�󵥶<%=zsdbcdde%></td>
    <td width="20%">�󵥶<%=kp_pdkpjl_zsdkpdde%></td>
    <td width="20%">�󵥶<%=kp_pdkpjl_zsdspdde%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">�е��<%=zsdpzde%></td>
    <td width="20%">�е��<%=zsdsqzde%></td>
    <td width="20%">�е��<%=zsdbczde%></td>
    <td width="20%">�е��<%=kp_pdkpjl_zsdkpzde%></td>
    <td width="20%">�е��<%=kp_pdkpjl_zsdspzde%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">С���<%=zsdpxde%></td>
    <td width="20%">С���<%=zsdsqxde%></td>
    <td width="20%">С���<%=zsdbcxde%></td>
    <td width="20%">С���<%=kp_pdkpjl_zsdkpxde%></td>
    <td width="20%">С���<%=kp_pdkpjl_zsdspxde%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%">&nbsp;</td>
    <td colspan="2">�����ܷ֣�<%=kp_pdkpjl_zsdkpzf%></td>
    <td colspan="2">ÿ�ֵĿɽӵ��<%=zsmfkjde%></td>
  </tr>
</table>
      
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="8" height="22"><b>��ֱ����</b></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="2">A����</td>
    <td colspan="2">B����</td>
    <td colspan="2">C����</td>
    <td colspan="2">D����</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_ajqz%></td>
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_bjqz%></td>
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_cjqz%></td>
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_djqz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_ajddbl%></td>
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_bjddbl%></td>
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_cjddbl%></td>
    <td width="13%" align="right">D�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_djddbl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_ajzdbl%></td>
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_bjzdbl%></td>
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_cjzdbl%></td>
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_djzdbl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_ajxdbl%></td>
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_bjxdbl%></td>
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_cjxdbl%></td>
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_djxdbl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_ajzdjde%></td>
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_bjzdjde%></td>
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_cjzdjde%></td>
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_djzdjde%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="8" height="22"><b>ֱ����</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_zsajqz%></td>
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_zsbjqz%></td>
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_zscjqz%></td>
    <td width="13%" align="right">Ȩ��</td>
    <td width="12%"><%=kp_pdkpjl_zsdjqz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_zsajddbl%></td>
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_zsbjddbl%></td>
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_zscjddbl%></td>
    <td width="13%" align="right">�Ӵ󵥱���</td>
    <td width="12%"><%=kp_pdkpjl_zsdjddbl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_zsajzdbl%></td>
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_zsbjzdbl%></td>
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_zscjzdbl%></td>
    <td width="13%" align="right">���е�����</td>
    <td width="12%"><%=kp_pdkpjl_zsdjzdbl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_zsajxdbl%></td>
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_zsbjxdbl%></td>
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_zscjxdbl%></td>
    <td width="13%" align="right">��С������</td>
    <td width="12%"><%=kp_pdkpjl_zsdjxdbl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_zsajzdjde%></td>
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_zsbjzdjde%></td>
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_zscjzdjde%></td>
    <td width="13%" align="right">�������ӵ���</td>
    <td width="12%"><%=kp_pdkpjl_zsdjzdjde%></td>
  </tr>
</table>

<table border="1" width="317%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="30">��������</td>
	<td  width="40">���ڵ÷�</td>
	<td  width="62">�����ܷ�</td>
	<td  width="50">ʩ��������</td>
	<td  width="40">ʩ��������</td>
	<td  width="55">�ʱ���</td>
	<td  width="45">������</td>
	<td  width="40">ʩ���Ӽ���</td>
	<td  width="35">�ӵ�Ȩ��</td>
	<td  width="35">�󵥱���</td>
	<td  width="35">�е�����</td>
	<td  width="35">С������</td>
	<td  width="40">�۳��ӵ��ܶ�ٷֱ�</td>
	<td  width="62">���ӵ��ܶ�</td>
	<td  width="62">�ۼ��������䵥��</td>
	<td  width="62">���۽ӵ��ܶ�</td>
	<td  width="62">�ӵ��ܶ�</td>
	<td  width="62">���۽Ӵ󵥶�</td>
	<td  width="62">�󵥽��</td>
	<td  width="62">���۽��е���</td>
	<td  width="62">�е����</td>
	<td  width="62">���۽�С����</td>
	<td  width="62">С�����</td>
	<td  width="62">����ʣ�൥�ܶ�</td>
	<td  width="62">����ʣ��󵥶�</td>
	<td  width="62">����ʣ���е���</td>
	<td  width="62">����ʣ��С����</td>
	<td  width="62">�����ɵ������ܶ�</td>
	<td  width="62">�����ɵ������󵥶�</td>
	<td  width="62">�����ɵ������е���</td>
	<td  width="62">�����ɵ�����С����</td>
	<td  width="62">���ڽӵ��ܶ�</td>
	<td  width="62">���ڴ󵥶�</td>
	<td  width="62">�����е���</td>
	<td  width="62">����С����</td>
	<td  width="62">�ѽӵ��ܶ�</td>
	<td  width="62">�ѽӴ󵥽��</td>
	<td  width="62">�ѽ��е����</td>
	<td  width="62">�ѽ�С�����</td>
	<td  width="62">�������ܶ�</td>
	<td  width="62">�����󵥽��</td>
	<td  width="62">�����е����</td>
	<td  width="62">����С�����</td>
	<td  width="62">ʣ�൥�ܶ�</td>
	<td  width="62">ʣ��󵥽��</td>
	<td  width="62">ʣ���е����</td>
	<td  width="62">ʣ��С�����</td>
	<td  width="40">��������</td>
	<td  width="40">���3λ��־</td>
	<td  width="40">ǰ5λ��־</td>
	<td  width="40">������־</td>
	<td  width="40">������־</td>
	<td  width="50">������</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),kp_pdkpmx.kpzf,sq_sgd.sgdmc, DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��'),kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.zdjdze,kp_pdkpmx.kjhzdfpe,kp_pdkpmx.lljdze,kp_pdkpmx.jdze,kp_pdkpmx.lljdde,kp_pdkpmx.ddje,kp_pdkpmx.lljzde,kp_pdkpmx.zdje,kp_pdkpmx.lljxde,kp_pdkpmx.xdje,kp_pdkpmx.sqsydze,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcze,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde,kp_pdkpmx.yjdze,kp_pdkpmx.yjddje,kp_pdkpmx.yjzdje,kp_pdkpmx.yjxdje,kp_pdkpmx.jfdze,kp_pdkpmx.jfddje,kp_pdkpmx.jfzdje,kp_pdkpmx.jfxdje,kp_pdkpmx.sydze,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje,TO_CHAR(kp_pdkpmx.sqpm),kp_pdkpmx.hjwbz,kp_pdkpmx.qjwbz,kp_pdkpmx.sjbz,kp_pdkpmx.jjbz,kp_pdkpmx.jcf  ";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx desc,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

<CENTER>�ɵ������˹����</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">ʩ����</td>
	<td  width="10%">���̼�����</td>
	<td  width="7%">���̼���÷�</td>
	<td  width="7%">���̼���¼����</td>
	<td  width="7%">���̼���¼��ʱ��</td>
	<td  width="7%">��ϼ��ɵ÷�</td>
	<td  width="7%">��ϼ���¼����</td>
	<td  width="7%">��ϼ���¼��ʱ��</td>
	<td  width="7%">���⹱�׵÷�</td>
	<td  width="7%">���⹱��¼����</td>
	<td  width="7%">���⹱��¼��ʱ��</td>
	<td  width="7%">����־</td>
</tr>
<%
	ls_sql="SELECT sq_sgd.sgdmc,kp_pdkprgdf.gcjxje,kp_pdkprgdf.gcjxdf,kp_pdkprgdf.gcjxlrr,kp_pdkprgdf.gcjxlrsj,kp_pdkprgdf.phjcdf,kp_pdkprgdf.phjclrr,kp_pdkprgdf.phjclrsj,kp_pdkprgdf.tsgxdf,kp_pdkprgdf.tsgxlrr,kp_pdkprgdf.tsgxlrsj, DECODE(kp_pdkprgdf.kpbz,'N','δ����','Y','����')  ";
	ls_sql+=" FROM kp_pdkprgdf,sq_sgd  ";
    ls_sql+=" where kp_pdkprgdf.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_pdkprgdf.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_pdkprgdf.kpjlh,sq_sgd.sgdlx,sgdmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

<CENTER>�ɵ���������÷�</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ʩ����</td>
	<td  width="3%">�깤�طù�����</td>
	<td  width="3%">�깤�ط�ƽ����</td>
	<td  width="3%">�ͻ����۵÷�</td>
	<td  width="3%">���������۷ֹ�����</td>
	<td  width="3%">���������۷�</td>
	<td  width="3%">�۳��ӵ��ܶ�ٷֱ�</td>
	<td  width="3%">���������÷�</td>
	<td  width="3%">��΢Ͷ�ߴ���</td>
	<td  width="3%">һ��Ͷ�ߴ���</td>
	<td  width="3%">�ش�Ͷ�ߴ���</td>
	<td  width="3%">Ͷ����÷�</td>
	<td  width="3%">�ϸ����������</td>
	<td  width="3%">���ϸ����������</td>
	<td  width="3%">�������÷�</td>
	<td  width="3%">������</td>
	<td  width="3%">����������÷�</td>
	<td  width="3%">��ϼ��ɵ÷�</td>
	<td  width="3%">5��������Ͷ�ߴ���</td>
	<td  width="3%">10��������Ͷ�ߴ���</td>
	<td  width="3%">����10����깤����</td>
	<td  width="3%">�������ڵ÷�</td>
	<td  width="3%">ά�޹�����</td>
	<td  width="3%">ά�޿۷�</td>
	<td  width="3%">ά����÷�</td>
	<td  width="3%">���⹱�׵÷�</td>
</tr>
<%
	ls_sql="SELECT sq_sgd.sgdmc,kp_pdkpdxdf.wghfgds,kp_pdkpdxdf.wghfpjf,kp_pdkpdxdf.khpjdf,kp_pdkpdxdf.gczlkfgds,kp_pdkpdxdf.gczlkf,kp_pdkpdxdf.kcjdebfb,kp_pdkpdxdf.gczldf,kp_pdkpdxdf.qwtscs,kp_pdkpdxdf.ybtscs,kp_pdkpdxdf.zdtscs,kp_pdkpdxdf.tsdf,kp_pdkpdxdf.hgybjsl,kp_pdkpdxdf.bhgybjsl,kp_pdkpdxdf.ybjdf,kp_pdkpdxdf.gcjxje,kp_pdkpdxdf.gcjxdf,kp_pdkpdxdf.phjcdf,kp_pdkpdxdf.yqtscs1,kp_pdkpdxdf.yqtscs2,kp_pdkpdxdf.yqtscs3,kp_pdkpdxdf.gcyqdf,kp_pdkpdxdf.wxgds,kp_pdkpdxdf.wxkf,kp_pdkpdxdf.wxdf,kp_pdkpdxdf.tsgxdf  ";
	ls_sql+=" FROM sq_sgd,kp_pdkpdxdf  ";
    ls_sql+=" where kp_pdkpdxdf.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_pdkpdxdf.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_pdkpdxdf.kpjlh,sq_sgd.sgdlx,sgdmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>
