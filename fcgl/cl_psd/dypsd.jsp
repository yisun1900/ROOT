<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE3 {font-family: "宋体"; font-size: 12px; }
.STYLE9 {font-family: "宋体"; font-size: 14; }
.STYLE10 {font-family: "宋体"; font-size: 14px; }
.STYLE11 {font-size: 14px}
-->
</style>
</head>

<%
String wherepsdh=request.getParameter("psdh");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料配送单(配送单号:<%=wherepsdh%>)</font></B> 
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
double pszje=0;
double yf=0;
double qtsf=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT hth,zjxm,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh,DECODE(psfs,'1','配送','2','自提','9','其他') psfs,jhshsj,pszje,yf,qtsf  ";
	ls_sql+=" FROM cl_psd,crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=cl_psd.khbh(+) and cl_psd.psdh='"+wherepsdh+"' ";
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
		pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
	}
	rs.close();
	ps.close();

%>

  
<table width="100%" border="0">
  <tr> 
    <td width="39%"><span class="STYLE9">客户姓名：<%=khxm%></span></td>
    <td width="33%"><span class="STYLE9">客户电话：<%=lxfs%></span></td>
    <td width="28%"><span class="STYLE9">合同号：<%=hth%></span></td>
  </tr>
  <tr> 
    <td width="39%"><span class="STYLE9">房屋地址：<%=fwdz%></span></td>
	<td width="33%"><span class="STYLE9">配送方式：<%=psfs%>&nbsp;&nbsp;&nbsp;&nbsp;质检：<%=zjxm%></span></td>
    <td width="28%"><span class="STYLE9">计划送货时间：<%=jhshsj%></span></td>
  </tr>
  <tr> 
    <td width="39%"><span class="STYLE9">项目经理：<%=sgdmc%>（<%=dh%>）</span></td>
    <td width="33%"><span class="STYLE9">总金额：<%=pszje%></td>
    <td width="28%"><span class="STYLE9">运费：<%=yf%>，其它收费：<%=qtsf%></span></td>
  </tr>
</table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%"><span class="STYLE3">序号</span></td>
	<td  width="12%"><span class="STYLE3">材料名称</span></td>
	<td  width="12%"><span class="STYLE3">材料规格</span></td>
	<td  width="12%"><span class="STYLE3">材料大类</span></td>
	<td  width="8%"><span class="STYLE3">计量单位</span></td>
	<td  width="8%"><span class="STYLE3">配送数量</span></td>
	<td  width="12%"><span class="STYLE3">备注</span></td>
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
			<div align="center" class="STYLE10"><%=i%>&nbsp;
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</div>		</td>
		<td> 
			<div align="center" class="STYLE10"><%=clmc%>&nbsp;<input type="hidden" name="clmc" value="<%=clmc%>"></div>		</td>
		<td> 
			<div align="center" class="STYLE10"><%=clgg%>&nbsp;</div>		</td>
		<td> 
			<div align="center" class="STYLE10"><%=cldlmc%>&nbsp;</div>		</td>
		<td> 
			<div align="center" class="STYLE10"><%=jldwmc%>&nbsp;</div>		</td>
		<td> <div align="center" class="STYLE10"><%=pssl%>&nbsp;</div></td>
		<td>&nbsp;</td>
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
<table width="100%" border="0">
  <tr>
    <td width="33%">制单入签字：________</td>
    <td width="33%">工长签字：________</td>
    <td width="34%"> 财务审核签字：________</td>
  </tr>
  <tr>
    <td width="33%">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间：________</td>
    <td width="33%">时&nbsp;&nbsp;&nbsp;&nbsp;间：________</td>
    <td width="33%">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间：________</td>
  </tr>
</table>
</body>

</html>

