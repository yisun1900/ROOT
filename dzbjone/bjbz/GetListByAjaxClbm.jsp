<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String invalue=cf.GB2Uni(cf.getParameter(request,"invalue"));
String dqbm=request.getParameter("dqbm");


if (invalue.equals(""))
{
	return;
}

String c1=null;

String retStr="";

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT jxc_clbm.nbbm||':('||jxc_cljgb.cbj||'гд/'||jxc_clbm.jldwbm||')'||jxc_clbm.clmc";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb ";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cllb='1' and jxc_cljgb.sfyh='Y'";
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.clmc like '"+invalue+"%'";
	ls_sql+=" order by jxc_clbm.clmc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{   
		c1=rs.getString(1);

		retStr+="%"+c1;
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