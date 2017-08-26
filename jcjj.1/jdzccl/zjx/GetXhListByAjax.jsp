<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String jc_zcjgb_xh=request.getParameter("jc_zcjgb_xh");
String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));
String dqbm=request.getParameter("dqbm");

String zcbm=null;
String xh=null;
String retStr="";

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT zcbm,xh";
	ls_sql+=" FROM jc_zcjgb  ";
	ls_sql+=" where jc_zcjgb.dwbh='"+ppbm+"' and jc_zcjgb.dqbm='"+dqbm+"'";
    ls_sql+=" and jc_zcjgb.xh like '"+jc_zcjgb_xh+"%'";
	ls_sql+=" and rownum<21";
	ls_sql+=" order by xh,zcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{   
		zcbm=rs.getString("zcbm");
		xh=rs.getString("xh");

		retStr+="^"+zcbm+"~"+xh;
	}
	rs.close();
	ps.close();

	if (!retStr.equals(""))
	{
		retStr=retStr.substring(1);
	}

	out.print(retStr);
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