<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<%

String wherexh=cf.GB2Uni(cf.getParameter(request,"xh"));
String wherecglb=cf.GB2Uni(cf.getParameter(request,"cglb"));
String wherecllb=cf.GB2Uni(cf.getParameter(request,"cllb"));
String dqbm=cf.GB2Uni(cf.getParameter(request,"dqbm"));
String xh=null;
String clbm=null;
String retStr="";

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null; 
String ls_sql=null;
int row=0;
 
try {
	conn=cf.getConnection();

		ls_sql=" SELECT jxc_cljgb.clbm clbm,gg ";
		ls_sql+=" FROM jxc_cljgb,jxc_clbm ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and dqbm='"+dqbm+"' and jxc_clbm.cllb='"+wherecllb+"' and gg like '"+wherexh+"%' and jxc_clbm.cglb='"+wherecglb+"' ";
		ls_sql+=" order by gg ";
//		out.println(ls_sql); 
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{   
			row++;
			
			xh=cf.fillNull(rs.getString("gg"));
			clbm=cf.fillNull(rs.getString("clbm"));
			if (row<=20)
			{
			retStr+="^"+clbm+"~"+xh;
			}
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