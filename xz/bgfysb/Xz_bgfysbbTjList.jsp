<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String ls_sql2=null;
String dwmc=null;
ls_sql2="select dwmc from sq_dwxx where dwlx='F0' and dqbm='"+dqbm+"'";
dwmc=cf.executeQuery(ls_sql2);
if (yhjs.equals("A0"))
{
dwmc="松下亿达";
}

%>
<center><B><%=dwmc%>各单位月度申请办公费统计分析</B></center><BR>
<CENTER><%=request.getParameter("xz_bgfysbb_sqrq")%>至<%=request.getParameter("xz_bgfysbb_sqrq2")%></CENTER>

<%
	String wheresql="";
	String xz_bgfysbb_sqxh=null;
	String xz_bgfysbb_dwbh=null;
	String xz_bgfysbb_sqrq=null;
	String xz_bgfysbb_sqr=null;
	xz_bgfysbb_sqxh=request.getParameter("xz_bgfysbb_sqxh");
	if (xz_bgfysbb_sqxh!=null)
	{
		xz_bgfysbb_sqxh=cf.GB2Uni(xz_bgfysbb_sqxh);
		if (!(xz_bgfysbb_sqxh.equals("")))	wheresql+="  and (xz_bgfysbb.sqxh='"+xz_bgfysbb_sqxh+"')";
	}
	xz_bgfysbb_dwbh=request.getParameter("xz_bgfysbb_dwbh");
	if (xz_bgfysbb_dwbh!=null)
	{
		xz_bgfysbb_dwbh=cf.GB2Uni(xz_bgfysbb_dwbh);
		if (!(xz_bgfysbb_dwbh.equals("")))	wheresql+="  and (xz_bgfysbb.dwbh='"+xz_bgfysbb_dwbh+"')";
	}
	xz_bgfysbb_sqrq=request.getParameter("xz_bgfysbb_sqrq");
	if (xz_bgfysbb_sqrq!=null)
	{
		xz_bgfysbb_sqrq=xz_bgfysbb_sqrq.trim();
		if (!(xz_bgfysbb_sqrq.equals("")))	wheresql+="  and (xz_bgfysbb.sqrq>=TO_DATE('"+xz_bgfysbb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgfysbb_sqrq=request.getParameter("xz_bgfysbb_sqrq2");
	if (xz_bgfysbb_sqrq!=null)
	{
		xz_bgfysbb_sqrq=xz_bgfysbb_sqrq.trim();
		if (!(xz_bgfysbb_sqrq.equals("")))	wheresql+="  and (xz_bgfysbb.sqrq<=TO_DATE('"+xz_bgfysbb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgfysbb_sqr=request.getParameter("xz_bgfysbb_sqr");
	if (xz_bgfysbb_sqr!=null)
	{
		xz_bgfysbb_sqr=cf.GB2Uni(xz_bgfysbb_sqr);
		if (!(xz_bgfysbb_sqr.equals("")))	wheresql+="  and (xz_bgfysbb.sqr='"+xz_bgfysbb_sqr+"')";
	}
	
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}
%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">单位名称</td>
	<td  width="12%">申请序号</td>
	<td  width="12%">申请日期</td>
	<td  width="12%">申请人</td>
	<td  width="12%">费用名称</td>
	<td  width="12%">备注</td>
	<td  width="12%">所需金额</td>
	<td  width="12%">批准金额</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={3,3,3,3,3,3,2,2};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

	ls_sql="SELECT sq_dwxx.dwmc,xz_bgfysbb.sqxh,xz_bgfysbb.sqrq,xz_bgfysbb.sqr,xz_bgfysbb.fymc,xz_bgfysbb.bz,sum(xz_bgfysbb.sxje),sum(xz_bgfysbb.pzje)  ";
	ls_sql+=" FROM sq_dwxx,xz_bgfysbb  ";
    ls_sql+=" where xz_bgfysbb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" group by xz_bgfysbb.sqxh,xz_bgfysbb.sqrq,sq_dwxx.dwmc,xz_bgfysbb.sqr,xz_bgfysbb.fymc,xz_bgfysbb.bz";
	
	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);
%>
</table>
</body>
</html>
