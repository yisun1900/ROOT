<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String khbh=cf.getParameter(request,"khbh");
String xmbh=cf.GB2Uni(cf.getParameter(request,"xmbh"));


String getxmbh=null;
String getxmmc=null;
String retStr="";

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT xmbh,xmmc";
	ls_sql+=" FROM bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"' and xmbh like '"+xmbh+"%'";
	ls_sql+=" and rownum<20";
	ls_sql+=" order by xmbh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{   
		getxmbh=rs.getString("xmbh").trim();
		getxmmc=rs.getString("xmmc").trim();

		retStr+="^"+getxmbh+"~"+getxmbh+":"+getxmmc;
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