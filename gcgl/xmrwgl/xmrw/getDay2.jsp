<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jhjssj=cf.GB2Uni(request.getParameter("jhjssj"));
String jhgzr=cf.GB2Uni(request.getParameter("jhgzr"));
String jjrksg=cf.GB2Uni(request.getParameter("jjrksg"));//1：节、假日不可施工；2：节日不可施工； 9：不限制
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jhkssj=null;

	ls_sql="select rq";

	ls_sql+=" from (";

	ls_sql+=" select rq";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
	if (jjrksg.equals("1"))//1：节、假日不可施工
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2：节日不可施工
	{
		ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
	}
	ls_sql+=" order by rq desc";

	ls_sql+=" )";

	ls_sql+=" where rownum<="+jhgzr;
	ls_sql+=" order by rq ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhkssj=cf.fillNull(rs.getDate(1));
	}
	rs.close();
	ps.close();

	out.println(jhkssj);
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

