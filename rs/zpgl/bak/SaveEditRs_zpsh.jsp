<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

long shbh=0;
String zpjhbh=null;
String shjl=null;
String shyj=null;
String ztbm=null;
String jhzt="2";

zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
shjl=cf.GB2Uni(request.getParameter("shjl"));
shyj=cf.GB2Uni(request.getParameter("shyj"));
String xyztbm=null;
String whereshbh=null;
whereshbh=cf.GB2Uni(request.getParameter("whereshbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql=" SELECT yztbm ";
	ls_sql+=" FROM rs_zpsh ";
    ls_sql+=" where shbh='"+whereshbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	ls_sql=" SELECT xyztbm ";
	ls_sql+=" FROM rs_zpztkz ";
    ls_sql+=" where shjl='"+shjl+"' and ztbm='"+ztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xyztbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	if(xyztbm.equals("0100"))
	{
		jhzt="6";
	}
	if(shjl.equals("0"))
	{
		jhzt="4";
	}
	if(shjl.equals("9"))
	{
		jhzt="5";
	}
	conn.setAutoCommit(false);


	ls_sql="update rs_zpsh set shjl=?,shyj=? ";
	ls_sql+=" where  (shbh="+whereshbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shyj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_zpjh set shjl=?,shyj=?,jhzt=? ";
	ls_sql+=" where  (zpjhbh="+zpjhbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shyj);
	ps.setString(3,jhzt);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>