<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}
String zgsmc=(String)session.getAttribute("zgsmc");
String cxrq=request.getParameter("cxrq");
String cxrq2=request.getParameter("cxrq2");
%>
<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>
</head>

 <body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<center><B>家居顾问业绩统计<br>(统计时间：<%=cxrq%>--<%=cxrq2%>)</B></center><BR>
<%
	
	String ztjjgw=null;
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
	String wheresql="";
	String wheresql1="";
	String wheresql2="";
	if(ztjjgw!=null)
	{
		if(!(ztjjgw.equals("")))
		{
				wheresql1=" and sq_yhxx.yhmc='"+ztjjgw+"'";
		}
	}
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	if (!(fgs.equals("")))	wheresql2+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql2+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	String ddrq=null;

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	String yhmc=null;
	String mmsl=null;
	String fgsbh=null;
	String fgsmc=null;
	String jjgwmc=null;
	int zcqys=0;
	int pjde=0;
	double fkje1=0;
	double htje=0;
	double zjxje=0;
	double zcsse=0;//主材实收款
	double allzcsse=0;//主材实收款总额
	int allzcqys=0;
	double zhtje=0;
	int row=0;
%>

<DIV onselectstart="return false" class="STYLE_DIV"> 
<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
    <td  width="4%" class="STYLE2">序号</td>
    <td  width="8%" class="STYLE2">家居顾问</td>
    <td  width="8%" class="STYLE2">所属分公司</td>
	<td  width="6%" class="STYLE2">主材签约数</td>
	<td  width="6%" class="STYLE2">主材签约额</td>
	<td  width="6%" class="STYLE2">平均单额</td>
	<td  width="6%" class="STYLE2">主材实收额</td>
	<td  width="12%" class="STYLE2">总额</td>
</tr>
<%

try {
		conn=cf.getConnection();
		//主材实收款总额(注:以签合同时间为准)
		ls_sql="select sum(jc_zcdd.hkze+jc_zcdd.zjhze) from crm_khxx,jc_zcdd where  crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.zt='2'  ";
		ls_sql+="and jc_zcdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') ";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery(ls_sql);
		if(rs.next())
		{
			fkje1=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if(fkje1==0)
		{	out.print("没有数据");
			return;
		}


		ls_sql=" SELECT distinct sq_yhxx.yhmc jjgw,sq_yhxx.ssfgs fgsbh,sq_dwxx.dwmc fgsmc,count(distinct jc_zcdd.khbh) lstscs,sum(jc_zcdd.hkze) htje,sum(jc_zcdd.zjhze) zjxje  ";
		ls_sql+=" from jc_zcdd,crm_khxx,sq_yhxx,sq_dwxx ";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and sq_yhxx.zwbm='08' and sq_yhxx.yhmc(+)=ztjjgw and sfzszg in('Y','N') and sq_dwxx.dwbh=sq_yhxx.ssfgs and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=wheresql1;
		ls_sql+=" group by sq_yhxx.yhmc,sq_yhxx.ssfgs,sq_dwxx.dwmc ";
		ls_sql+=" order by htje desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;
			zcsse=0;
			yhmc=rs.getString("jjgw");
			fgsbh=rs.getString("fgsbh");
			fgsmc=rs.getString("fgsmc");
			zcqys=rs.getInt("lstscs");
			htje=rs.getDouble("htje");
			zjxje=rs.getDouble("zjxje");
			if (zcqys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(htje/zcqys);
			}
			zhtje+=htje;
			allzcqys+=zcqys;
			zcsse=htje+zjxje;
			allzcsse+=zcsse;
			jjgwmc=URLEncoder.encode(yhmc,"UTF-8");//把zcdlmc编码传给zcxltjb.jsp
	%>

	<tr align="center">
	<td  width="4%"><%=row%></td>
	<td  width="4%"><%=yhmc%></td>
	<td  width="4%"><%=fgsmc%></td>
	<td  width="6%"><%=zcqys%></td>
	<td  width="12%"><%=htje%></td>
	<td  width="12%"><%=pjde%></td>
	<td  width="12%"><%=zcsse%></td>
	<td  width="6%" align="left"><A HREF="jjgwkhxx.jsp?sjfw=<%=cxrq%>&sjfw2=<%=cxrq2%>&fgs=<%=fgsbh%>&jjgwmc=<%=jjgwmc%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=cf.formatDouble(zcsse*100/fkje1)%>" height="14"></A><%=cf.formatDouble(zcsse*100/fkje1)%>%</td>
	</tr>

<%
		}
		rs.close();
		ps.close();
	if((ztjjgw.equals(""))){
//列出没有业绩的家居顾问
		ls_sql="SELECT sq_yhxx.yhmc yhmc,sq_dwxx.dwmc fgsmc,sq_dwxx.dwbh fgsbh from sq_yhxx,sq_dwxx where yhmc not in (select  ztjjgw from jc_zcdd) and sq_yhxx.zwbm='08' and sfzszg in('Y','N') and sq_yhxx.ssfgs=sq_dwxx.dwbh ";
		ls_sql+=wheresql2;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;
			yhmc=rs.getString("yhmc");
			fgsbh=rs.getString("fgsbh");
			fgsmc=rs.getString("fgsmc");
			jjgwmc=URLEncoder.encode(yhmc,"UTF-8");//把jjgwmc编码传给jjgwkhxx.jsp

	%>

	<tr align="center">
	<td  width="4%"><%=row%></td>
	<td  width="4%"><%=yhmc%></td>
	<td  width="4%"><%=fgsmc%></td>
	<td  width="6%">0</td>
	<td  width="12%">0.0</td>
	<td  width="12%">0</td>
	<td  width="12%">0.0</td>
	<td  width="6%" align="left"><A HREF="jjgwkhxx.jsp?sjfw=<%=cxrq%>&sjfw2=<%=cxrq2%>&fgs=<%=fgsbh%>&jjgwmc=<%=jjgwmc%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=cf.formatDouble(0*100/fkje1)%>" height="14"></A><%=cf.formatDouble(0*100/fkje1)%>%</td>
	</tr>

<%
		}
		rs.close();
		ps.close();
	  }
			pjde=0;
			if (allzcqys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zhtje/allzcqys);
			}

%>
<tr  align="center">
    <td colspan="2"><font color="red"><b>合计(元)</b></td>
	<td>&nbsp;</td>
	<td  width="6%"><font color="red"><b><%=allzcqys%></B></td>
	<td  width="6%"><font color="red"><b><%=zhtje%></B></td>
	<td  width="12%"><font color="red"><b><%=pjde%></B></td>
	<td  width="12%"><font color="red"><b><%=allzcsse%></B></td>
	<td >&nbsp;</td>
</tr>
</table>

<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:14">
<tr><td style="FONT-SIZE:16"><B>注意！</B></td></tr>
<tr><td>[主材实收款]=[合同金额]+[增减项]。</td></tr>
<tr><td>[总额比例]=[实收款]/[实收款总额]。</td></tr>
<tr><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td align="right"><font color="red"><%=zgsmc%>家居管理中心<font></td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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