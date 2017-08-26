<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.getParameter(request,"khbh");
String xmbh=cf.GB2Uni(cf.getParameter(request,"xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String getStr2="";

String	xmmc=null;
String	jldwmc=null;
double dj=0;
double sl=0;

try {
	conn=cf.getConnection();

	ls_sql="select xmmc,jldwmc,dj";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) and khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=cf.fillNull(rs.getString("xmmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");


		getStr2=xmmc+"";
		getStr2+="+"+jldwmc;//1
		getStr2+="+"+dj;
	}
	rs.close();
	ps.close();

	ls_sql="select sum(zjhsl)";
	ls_sql+=" FROM bj_gclmx";
	ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	getStr2+="+"+sl;

	out.print(getStr2);
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



