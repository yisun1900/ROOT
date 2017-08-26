<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>店面销售统计表白</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String) session.getAttribute("yhjs");
String wheresql=request.getParameter("wheresql");
String dwbh=request.getParameter("dwbh");
String xsrq=request.getParameter("xsrq");
String xsrq2=request.getParameter("xsrq2");
String tjxz=request.getParameter("tjxz");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql1=null;
String ls_sql=null;

String cpdlbm=null;
String cpdlmc=null;
String plbm=null;
String plmc=null;
int count=0;
long lsj=0;
long bqj=0;
long ysj=0;
long sxj=0;

int xjcount=0;
long xjlsj=0;
long xjbqj=0;
long xjysj=0;
long xjsxj=0;

int allcount=0;
long alllsj=0;
long allbqj=0;
long allysj=0;
long allsxj=0;

String dwmc=null;
try {
	conn=cf.getConnection();    //得到连接
	
	ls_sql="select dwmc from sq_dwxx ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dwmc=rs.getString(1);
	}

	rs.close();
	ps.close();

	//输出表头
	out.print("\n<B><center><font size=\"2\">"+dwmc+"销售统计表</font></B></center>");
	out.print("\n<table style='FONT-SIZE:14px' width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"1\">");
	out.print("\n  <tr> ");
	out.print("\n    <td width=\"30%\" align=\"center\">产品名称</td>");
	out.print("\n    <td width=\"10%\" align=\"center\">数量</td>");
	if (lsjmark.equals("1"))
	{
		out.print("\n    <td width=\"15%\" align=\"center\">零售金额</td>");
	}
	out.print("\n    <td width=\"15%\" align=\"center\">标签金额</td>");
	out.print("\n    <td width=\"15%\" align=\"center\">实销金额</td>");
	out.print("\n    <td width=\"15%\" align=\"center\">备注</td>");
	out.print("\n  </tr>");
//查询共有大类		
	if (tjxz.equals("1"))
	{
		ls_sql="select xt_plbm.plmc,count(*),sum(lsj),sum(bqj),sum(sxj)";
		ls_sql+=" from cp_cpxx,xt_plbm,v_bk";
		ls_sql+=wheresql;
		ls_sql+=" and cp_cpxx.plbm=xt_plbm.plbm(+) and cp_cpxx.bkbh=v_bk.bkbh(+)";
		ls_sql+="  and v_bk.bkflbm in('202','203') ";
		ls_sql+="  and cp_cpxx.szdw='"+dwbh+"'";
		ls_sql+=" and cp_cpxx.wlzt='05'";
	}
	else{
		ls_sql="select xt_plbm.plmc,count(*),sum(lsj),sum(bqj),sum(sxj)";
		ls_sql+=" from dm_xsjl,xt_plbm,v_bk";
		ls_sql+=wheresql;
		ls_sql+=" and dm_xsjl.plbm=xt_plbm.plbm(+) and dm_xsjl.bkbh=v_bk.bkbh(+)";
		ls_sql+="  and v_bk.bkflbm in('202','203') ";
		ls_sql+="  and dm_xsjl.dwbh='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql1);
	rs=ps.executeQuery();
	while (rs.next())
	{
		cpdlbm=rs.getString("cpdlbm");
		cpdlmc=rs.getString("cpdlmc");
	}

}
catch (Exception e) {
	try{
		out.println("Exception: " + e);
		out.println("sql=" + ls_sql);
	}
	catch (Exception e1){}
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}

%>
