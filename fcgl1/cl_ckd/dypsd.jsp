<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE12 {font-family: "宋体"; font-size: 14px; }
.STYLE13 {font-size: 14px}
.STYLE14 {font-family: "宋体"}
.STYLE15 {font-size: 14}
-->
</style>
</head>

<%
String whereckph=request.getParameter("ckph");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料配送单(出库批号:<%=whereckph%>)</font></B> 
</CENTER>
<span class="STYLE15">
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
String clgg=null;
String gdj=null;
String cksl=null;
String ckje=null;
String cldlmc=null;
String jldwmc=null;
if (whereckph.equals(""))
{
	return;
}

String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String dh=null;
String cksj=null;
String psfs=null;
String jhshsj=null;
double ckzje=0;
double yf=0;
double yqtsf=0;
double gjgf=0;
double zje=0;
String ckzt=null;
String ckbz=null;
String psbz=null;
String sjcksj=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT hth,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh,cksj,DECODE(cl_psd.psfs,'1','配送','2','自提','9','其他') psfs,jhshsj,ckzje,cl_ckd.yf,cl_ckd.qtsf,ckzt,cl_ckd.bz ckbz,cl_psd.bz psbz,cl_ckd.lrsj sjcksj";
	ls_sql+=" FROM cl_ckd,crm_khxx,sq_sgd,cl_psd ";
	ls_sql+=" where cl_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and cl_ckd.psdh=cl_psd.psdh(+) and cl_ckd.ckph='"+whereckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		dh=cf.fillHtml(rs.getString("dh"));
		cksj=cf.fillHtml(rs.getDate("cksj"));
		psfs=cf.fillHtml(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		ckzje=rs.getDouble("ckzje");
		yf=rs.getDouble("yf");
		yqtsf=rs.getDouble("qtsf");
		ckzt=cf.fillHtml(rs.getString("ckzt"));
		ckbz=cf.fillHtml(rs.getString("ckbz"));
		psbz=cf.fillHtml(rs.getString("psbz"));
		sjcksj=cf.fillHtml(rs.getDate("sjcksj"));
	}
	rs.close();
	ps.close();
	
	ls_sql="SELECT sum(fgsdj*cksl) gjgf  ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+whereckph+"' and cldlmc='杂项'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
	gjgf=rs.getDouble("gjgf");
	}
zje=ckzje+yf+yqtsf+gjgf;
%>
</span>
<table width="100%" border="0">
  <tr> 
    <td width="39%" class="STYLE15"><span class="STYLE14">客户姓名：<%=khxm%></span></td>
    <td width="33%" class="STYLE15"><span class="STYLE14">客户电话：<%=lxfs%></span></td>
    <td width="28%" class="STYLE15"><span class="STYLE14">合同号：<%=hth%></span></td>
  </tr>
  <tr> 
    <td width="39%" class="STYLE15"><span class="STYLE14">房屋地址：<%=fwdz%></span></td>
	<td width="33%" class="STYLE15"><span class="STYLE14">配送方式：<%=psfs%></span></td>
    <td width="28%" class="STYLE15"><span class="STYLE14">计划送货时间：<%=jhshsj%></span></td>
  </tr>
  <tr> 
    <td width="39%" class="STYLE15"><span class="STYLE14">项目经理：<%=sgdmc%></span></td>
    <td width="33%" class="STYLE15"><span class="STYLE14">项目经理电话：<%=dh%></span></td>
    <td width="28%" class="STYLE15"><span class="STYLE14">出库时间：<%=sjcksj%></span></td>
  </tr>
  
  <tr>
    <td class="STYLE15"><span class="STYLE14">材料费：<%=ckzje%></span></td>
    <td class="STYLE15">服装工具费：<span class="STYLE14"><%=gjgf%></span></td>
    <td class="STYLE15">运费：<span class="STYLE14"><%=yf%></span></td>
  </tr>
  <% if (ckzt.equals("2"))
  { %>
  <tr>
    <td class="STYLE15">油漆调色费：<span class="STYLE14"><%=yqtsf%></span></td>
    <td class="STYLE15">总金额：<span class="STYLE14"><%=zje%></span></td>
    <td class="STYLE15"><span class="STYLE14">实际送货时间：<%=cksj%></span></td>
  </tr>
  <% } %>
  <tr>
    <td colspan="3" class="STYLE15"><span class="STYLE14">配送说明：<%=psbz%></span></td>
  </tr>
  <tr> 
    <td colspan="3" class="STYLE15"><span class="STYLE14">出库说明：<%=ckbz%></span></td>
  </tr>
</table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%"><span class="STYLE12">序号</span></td>
	<td  width="12%"><span class="STYLE12">材料名称</span></td>
	<td  width="12%"><span class="STYLE12">材料规格</span></td>
	<td  width="12%"><span class="STYLE12">材料大类</span></td>
	<td  width="8%"><span class="STYLE12">计量单位</span></td>
	<td  width="8%"><span class="STYLE12">出库数量</span></td>
	<td  width="12%"><span class="STYLE12">备注</span></td>
</tr>
<%
	ls_sql="SELECT cl_ckmx.clbm clbm,ckph,cl_ckmx.clmc,cl_ckmx.clgg,cl_ckmx.gdj,cksl,ckje,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+whereckph+"' ";
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
		cksl=cf.fillNull(rs.getString("cksl"));
		ckje=cf.fillNull(rs.getString("ckje"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center" class="STYLE12"><%=i%>&nbsp;
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</div>		</td>
		<td> 
			<div align="center" class="STYLE12"><%=clmc%>&nbsp;<input type="hidden" name="clmc" value="<%=clmc%>"></div>		</td>
		<td> 
			<div align="center" class="STYLE12"><%=clgg%>&nbsp;</div>		</td>
		<td> 
			<div align="center" class="STYLE12"><%=cldlmc%>&nbsp;</div>		</td>
		<td> 
			<div align="center" class="STYLE12"><%=jldwmc%>&nbsp;</div>		</td>
		<td> <div align="center" class="STYLE12"><%=cksl%>&nbsp;</div></td>
		<td><span class="STYLE13"> &nbsp;</span></td>
		</tr>
<%
	row++;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
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
    <td width="33%">库管签字：________</td>
    <td width="33%">司机签字：________</td>
    <td width="34%">工长签字：________</td>
  </tr>
  <tr>
    <td width="33%">时&nbsp;&nbsp;&nbsp;&nbsp;间：________</td>
    <td width="33%">时&nbsp;&nbsp;&nbsp;&nbsp;间：________</td>
    <td width="33%">时&nbsp;&nbsp;&nbsp;&nbsp;间：________</td>
  </tr>
</table>
</body>

</html>

