<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String[] ddbh=request.getParameterValues("ddbh");
String bzdh="";
String sgd="";

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String qhtsj=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double hkze=0;
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh[0]+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
	 }
	 rs.close();
	 ps.close();

	ls_sql ="SELECT sum(je+ycf+qtfyje)";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where lx='1' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
	}

%>

<html>
<head>
<title>主材附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {color: #0000CC}
.STYLE3 {
	color: #990000;
	font-weight: bold;
}
.STYLE4 {color: #990000}
-->
</style>
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="3"> 
      <div align="center"><strong>主材合同附件---主材订货明细</strong></div>
    </td>
  </tr>
  <tr> 
    <td width="34%" align="right"> 
      <div align="left">客户姓名：<b><%=khxm%></b></div>
    </td>
    <td width="34%" align="right"> 
      <div align="left">联系方式：<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right"> 
      <div align="left">合同号：<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2">地址：<b><%=fwdz%></b></td>
    <td>签约店面/家装设计师：<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="2">施工班长：<b><%=sgbz%> <%=bzdh%></b></td>
    <td>参加促销活动：<b><%=cxhdbm%></b></td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="9%">品牌</td>
	<td  width="13%">名称</td>
	<td  width="8%">系列</td>
	<td  width="12%">型号</td>
	<td  width="12%">规格</td>

	<td  width="6%">放置位置</td>
	<td  width="7%">颜色</td>
	<td  width="6%">单位</td>
	<td  width="6%">数量</td>

	<td  width="8%">远程费+其它</td>
	<td  width="13%">备注</td>
</tr>
<%
	String dwbh=null;
	String zcmc=null;
	String zclbbm=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	String zcpzwzbm=null;
	String zcysbm=null;
	String xzjg=null;
	String dj=null;
	double sl=0;
	double xjsl=0;
	double allsl=0;

	double je=0;
	double xjje=0;
	double allje=0;
	String qtsf=null;
	String cxhdbl=null;
	double cxhdje=0;
	double xjcxhdje=0;
	double allcxhdje=0;
	String bz=null;

	ls_sql ="SELECT distinct zcdlbm,dwbh";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where lx='1' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dwbh=cf.fillHtml(rs1.getString("dwbh"));

		xjje=0;
		xjcxhdje=0;
		xjsl=0;

		ls_sql ="SELECT zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,jc_zcddmx.dj||'/'||jldwbm dj,jldwbm,jc_zcddmx.sl,jc_zcddmx.je,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','','2','','3','')||qtfyje) qtsf,cxhdbl||'%' cxhdbl ,cxhdje,jc_zcddmx.bz  ";
		ls_sql+=" FROM jc_zcddmx";
		ls_sql+=" where lx='1' and dwbh='"+dwbh+"' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
		ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.ddbh,jc_zcddmx.zcbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			zclbbm=cf.fillHtml(rs.getString("zclbbm"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			gg=cf.fillHtml(rs.getString("gg"));
			zcpzwzbm=cf.fillHtml(rs.getString("zcpzwzbm"));
			zcysbm=cf.fillHtml(rs.getString("zcysbm"));
			xzjg=cf.fillHtml(rs.getString("xzjg"));
			dj=cf.fillHtml(rs.getString("dj"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			je=rs.getDouble("je");
			qtsf=cf.fillHtml(rs.getString("qtsf"));
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));

			xjje+=je;
			allje+=je;
			xjcxhdje+=cxhdje;
			allcxhdje+=cxhdje;
			xjsl+=sl;
			allsl+=sl;

			xjje=cf.round(xjje,2);
			allje=cf.round(allje,2);
			xjcxhdje=cf.round(xjcxhdje,2);
			allcxhdje=cf.round(allcxhdje,2);
			xjsl=cf.round(xjsl,2);
			allsl=cf.round(allsl,2);



			%>
			<tr bgcolor="#FFFFFF"  align="center">
			<td ><%=dwbh%></td>
			<td ><%=zcmc%></td>
			<td ><%=zclbbm%></td>
			<td ><%=xinghao%></td>
			<td ><%=gg%></td>
			<td ><%=zcpzwzbm%></td>
			<td ><%=zcysbm%></td>
			<td ><%=jldwbm%></td>
			<td ><%=sl%></td>
			<td ><%=qtsf%></td>
			<td ><%=bz%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="3"><span class="STYLE1"><%=dwbh%>小计</span></td>
		<td colspan="5" >&nbsp;</td>
		<td ><span class="STYLE2"><strong><%=xjsl%></strong></span></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

%> 
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr valign="top"> 
    <td height="60"><b>备注：</b></td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">客户签字：</td>
          <td width="544">经办人：</td>
        </tr>
        <tr> 
          <td colspan="2">签订日期：<%=qhtsj%></td>
          <td width="544">签订日期：<%=qhtsj%></td>
        </tr>
      </table>
    </td>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception:2 " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


