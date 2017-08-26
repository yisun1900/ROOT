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

	ls_sql="select DECODE(jxc_clpsd.fclb,'1','开工','2','补料','3','中期') fclb,jxc_clpsd.yckje,jxc_clpsd.ycksl,khbh,psfs,jhshsj,pszsl,pszje,fkje,yf,qtsf,DECODE(jxc_clpsd.psdzt,'0','等待提交','1','等待审核','2','等待出库','3','已出库','5','部分出库','6','驳回重新修改','7','作废') psdzt,dwmc,lrr,lrrq,jxc_clpsd.bz,DECODE(jxc_clpsd.dybz,'Y','打印','N','未打印') dybz,jxc_clpsd.dyr,jxc_clpsd.dysj,zfr,zfsj,zfsm";
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
<title>查看信息</title>
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
<div align="center">材料单（材料单号：<%=psph%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">客户编号 </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right">合同号 </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">客户姓名 </td>
    <td><%=khxm%> </td>
    <td align="right">质检员</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">签约店面</td>
    <td><%=dwbh%></td>
    <td align="right">设计师</td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">施工队 </td>
    <td><%=sgd%>    </td>
    <td align="right">施工班组 </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同开工日期</td>
    <td bgcolor="#FFFFFF"><%=kgrq%> </td>
    <td align="right">合同交工日期</td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">材料单状态</span></td>
    <td><%=psdzt%></td>
    <td align="right"><span class="STYLE2">打印标志</span></td>
    <td><%=dybz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">打印人</td>
    <td><%=dyr%></td>
    <td align="right">打印时间</td>
    <td><%=dysj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">配送方式</td>
    <td><%
	cf.radioToken(out,"1+配送&2+自提&9+其它",psfs,true);
%>    </td>
    <td align="right">计划送货时间</td>
    <td><%=jhshsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">材料类别</td>
    <td><%=fclb%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">已出库数量</td>
    <td><%=ycksl%></td>
    <td align="right">已出库金额</td>
    <td><%=yckje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">配送总数量</td>
    <td><%=pszsl%></td>
    <td align="right">配送总金额</td>
    <td><%=pszje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">配送运费</td>
    <td><%=yf%></td>
    <td align="right">其它收费</td>
    <td><%=qtsf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">返款金额</td>
    <td><%=fkje%></td>
    <td align="right">录入部门</td>
    <td><%=ssbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入人</td>
    <td><%=lrr%></td>
    <td align="right">录入时间</td>
    <td><%=lrrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">作废人</td>
    <td><%=zfr%></td>
    <td align="right">作废时间</td>
    <td><%=zfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">作废说明</td>
    <td colspan="3"><%=zfsm%></td>
  </tr>
</table>


<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">内部编码</td>
	<td  width="10%">材料名称</td>
	<td  width="6%">规格</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">材料单价</td>
	<td  width="4%">申请数量</td>
	<td  width="4%"><span class="STYLE3">审核数量</span></td>
	<td  width="5%">金额</td>
	<td  width="4%"><span class="STYLE3">已出库数</span></td>
	<td  width="4%"><span class="STYLE3">需出库数</span></td>
	<td  width="5%"><span class="STYLE3">目前库存数</span></td>
	<td  width="5%"><span class="STYLE3">累计订货数</span></td>
	<td  width="4%"><span class="STYLE2">销售方式</span></td>
	<td  width="4%">最小起订量</td>
	<td  width="7%">子品牌</td>
	<td  width="8%">供应商</td>
	<td  width="7%">材料小类</td>
	<td  width="6%">材料编码</td>
	<td  width="5%">型号</td>
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
	ls_sql+=" ,DECODE(jxc_clpsmx.xsfs,'1','代销品','2','现货','3','期货销售','4','可负库存') xsfsmc,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,zxqdl";
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
	<td colspan="2">小 计</td>
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
	out.print("<BR>出错:" + e);
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