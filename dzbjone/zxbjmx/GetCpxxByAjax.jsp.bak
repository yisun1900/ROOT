<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
double xsj=0;
String sfycx=null;
double cxj=0;
String cxkssj=null;
String cxjzsj=null;


String clbm=request.getParameter("clbm");
String ssfgs=request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String getStr2="";

try {
	conn=cf.getConnection();

	ls_sql="select xsj,sfycx,cxj,cxkssj,cxjzsj";
	ls_sql+=" FROM jxc_cljgb";
	ls_sql+=" where clbm='"+clbm+"'";
	ls_sql+=" and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsj=rs.getDouble("xsj");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=rs.getDouble("cxj");
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));//
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));//


		double dj=0;


		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
		{
			sfycx="Y";
			dj=cxj;
		}
		else
		{
			sfycx="N";
			dj=xsj;
		}

		getStr2=dj+"";
	}
	rs.close();
	ps.close();

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



