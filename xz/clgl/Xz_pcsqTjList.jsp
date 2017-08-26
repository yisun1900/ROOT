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
<center><B><%=dwmc%>司机出车情况统计表</B></center><BR>

<CENTER><%=request.getParameter("xz_pcsq_sqrq")%>至<%=request.getParameter("xz_pcsq_sqrq2")%></CENTER>
<%
	String wheresql="";
	String xz_pcsq_sqrq=null;
	String xz_pcsq_dwbh=null;
	String xz_pcsq_mdd=null;
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq>=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq2");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq<=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
//**********************************
//根据用户属性，附加查询条件
//********************************
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+="and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and  sq_dwxx.ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	}	

%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">车号</td>
	<td  width="11%">申请序号</td>
	<td  width="11%">申请日期</td>
	<td  width="11%">申请部门</td>
	<td  width="11%">用车事由</td>
	<td  width="11%">目的地</td>
	<td  width="11%">用车时间</td>
	<td  width="11%">返回时间</td>
	<td  width="11%">公里数</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={3,1,1,1,1,1,1,1,2};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

	ls_sql="SELECT xz_qcdm.qcph,xz_pcsq.sqxh,xz_pcsq.sqrq,sq_dwxx.dwmc,xz_pcsq.ycsy,xz_pcsq.mdd,xz_pcsq.ycsj,xz_pcsq.fhsj,sum(xz_pcsq.gls)  ";
	ls_sql+=" FROM xz_pcsq,sq_dwxx,xz_qcdm  ";
    ls_sql+=" where xz_pcsq.qcdm=xz_qcdm.qcdm(+) and xz_pcsq.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=wheresql;
	ls_sql+=" and xz_qcdm.qcph is not null";
    ls_sql+=" group by xz_qcdm.qcph,xz_pcsq.sqxh,xz_pcsq.sqrq,sq_dwxx.dwmc,xz_pcsq.ycsy,xz_pcsq.mdd,xz_pcsq.ycsj,xz_pcsq.fhsj order by xz_qcdm.qcph";
	//out.print(ls_sql);
	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);
%>
</table>
</body>
</html>
