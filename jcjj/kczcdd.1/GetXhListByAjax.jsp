<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String srxh=cf.GB2Uni(cf.getParameter(request,"srxh"));
String dqbm=request.getParameter("dqbm");
String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));

String clbm=null;
String xh=null;
String retStr="";

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.xh";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.ppmc='"+ppbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
	ls_sql+=" and jxc_cljgb.sfyh='Y'";//Y：有货；N：无货
	ls_sql+=" and jxc_cljgb.xsfs in('2','3')";//1：代销品；2：现货销售；3：库存无货可销售
    ls_sql+=" and jxc_clbm.xh like '"+srxh+"%'";
	ls_sql+=" and rownum<21";
	ls_sql+=" order by jxc_clbm.xh,jxc_clbm.clbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{   
		clbm=rs.getString("clbm");
		xh=rs.getString("xh");

		retStr+="^"+clbm+"~"+xh;
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