<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ls_sql2=null;
String dwmc=null;
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{
		ls_sql2="select dwmc from sq_dwxx where dwlx='A0' ";

	}
	else if  (yhjs.equals("F0")||yhjs.equals("F1"))
	{
		ls_sql2="select dwmc from sq_dwxx where dwlx='F0' and ssdw='"+ssfgs+"'";
    }
	dwmc=cf.executeQuery(ls_sql2);
%>


<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center><B><%=dwmc%>行政助理考核情况统计表</B></center><BR>
<CENTER><%=request.getParameter("xz_xzzlkhb_khsj")%>至<%=request.getParameter("xz_xzzlkhb_khsj2")%></CENTER>


<%
	String wheresql="";
	String xz_xzzlkhb_dwbh=null;
	String xz_xzzlkhb_khsj=null;
	xz_xzzlkhb_dwbh=request.getParameter("xz_xzzlkhb_dwbh");
	if (xz_xzzlkhb_dwbh!=null)
	{
		xz_xzzlkhb_dwbh=cf.GB2Uni(xz_xzzlkhb_dwbh);
		if (!(xz_xzzlkhb_dwbh.equals("")))	wheresql+="  and (xz_xzzlkhb.dwbh='"+xz_xzzlkhb_dwbh+"')";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj>=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj2");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj<=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
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
	<td  width="6%">序号</td>
	<td  width="9%">被考核部门</td>
	<td  width="8%">考核时间</td>
	<td  width="4%">考核人</td>
	<td  width="6%">财务15分</td>
	<td  width="6%">合同10分</td>
	<td  width="6%">店面管理10分</td>
	<td  width="6%">文件5分</td>
	<td  width="6%">物品设备10</td>
	<td  width="6%">办公用品5分</td>
	<td  width="6%">宣传用品5分</td>
	<td  width="6%">各项报表15分</td>
	<td  width="6%">监控5分</td>
	<td  width="6%">考勤7分</td>
	<td  width="6%">工作安排8分</td>
	<td  width="6%">其它部门及人员投诉5分</td>
<td  width="6%">合计</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

	ls_sql="SELECT xz_xzzlkhb.xh,sq_dwxx.dwmc,xz_xzzlkhb.khsj,xz_xzzlkhb.khr,(xz_xzzlkhb.cw),(xz_xzzlkhb.ht),(xz_xzzlkhb.dmgl),(xz_xzzlkhb.wj),(xz_xzzlkhb.wpsb),(xz_xzzlkhb.bgyp),(xz_xzzlkhb.xcyp),(xz_xzzlkhb.gxbb),(xz_xzzlkhb.jk),(xz_xzzlkhb.kq),(xz_xzzlkhb.gzap),(xz_xzzlkhb.ts),((xz_xzzlkhb.cw)+(xz_xzzlkhb.ht)+(xz_xzzlkhb.dmgl)+(xz_xzzlkhb.wj)+(xz_xzzlkhb.wpsb)+(xz_xzzlkhb.bgyp)+(xz_xzzlkhb.xcyp)+(xz_xzzlkhb.gxbb)+(xz_xzzlkhb.jk)+(xz_xzzlkhb.kq)+(xz_xzzlkhb.gzap)+(xz_xzzlkhb.ts)) as hj";
	ls_sql+=" FROM xz_xzzlkhb,sq_dwxx  ";
    ls_sql+=" where xz_xzzlkhb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by hj desc";
	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);
%>
</table>
</body>
</html>
