<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

long shbh=0;
String zpsqbh=null;
String shjl=null;
String shyj=null;
String sqzt=null;
String ls=null;
long shhrs=0;
ls=request.getParameter("shhrs");
try{
	if (!(ls.equals("")))  shhrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shhrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核后人数]类型转换发生意外:"+e);
	return;
}

zpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
shjl=cf.GB2Uni(request.getParameter("shjl"));
shyj=cf.GB2Uni(request.getParameter("shyj"));
String ztbm=null;
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
String whereshbh=null;
whereshbh=cf.GB2Uni(request.getParameter("whereshbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

//	ls_sql=" SELECT yztbm ";
//	ls_sql+=" FROM rs_zpsh ";
//    ls_sql+=" where shbh='"+whereshbh+"'";
//	ps= conn.prepareStatement(ls_sql);
//	rs =ps.executeQuery(ls_sql);
//	if (rs.next())
//	{
//		ztbm=rs.getString(1);
//	}
//	rs.close();
//	ps.close();

	ls_sql=" SELECT sqzt ";
	ls_sql+=" FROM rs_ztbm ";
    ls_sql+=" where ztbm='"+ztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqzt=rs.getString(1);
	}
	rs.close();
	ps.close();

//	if(ztbm.equals("0100"))
//	{
//		sqzt="6";
//	}
//	if(shjl.equals("0"))
//	{
//		sqzt="4";
//	}
//	if(shjl.equals("9"))
//	{
//		sqzt="5";
//	}
	conn.setAutoCommit(false);


	ls_sql="update rs_zpsh set shjl=?,shyj=?,ztbm=?,sqzt=? ";
	ls_sql+=" where  (shbh="+whereshbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shyj);
	ps.setString(3,ztbm);
	ps.setString(4,sqzt);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_zpsq set shjl=?,shyj=?,sqzt=?,ztbm=?,shhrs=? ";
	ls_sql+=" where  (shbh="+whereshbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shyj);
	ps.setString(3,sqzt);
	ps.setString(4,ztbm);
	ps.setLong(5,shhrs);
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
	out.print("存盘失败,发生意外: " + e+ls_sql);
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