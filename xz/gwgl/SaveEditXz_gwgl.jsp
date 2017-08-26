<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gwbh=null;
String gwmc=null;
String gwnr=null;
java.sql.Date fbsj=null;
String fbr=null;
String fbbm=null;
java.sql.Date lrsj=null;
String bz=null;
String lrr=null;
gwbh=cf.GB2Uni(request.getParameter("gwbh"));
gwmc=cf.GB2Uni(request.getParameter("gwmc"));
gwnr=cf.GB2Uni(request.getParameter("gwnr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fbsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发布时间]类型转换发生意外:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
fbbm=cf.GB2Uni(request.getParameter("fbbm"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));

String fbfgs=cf.GB2Uni(request.getParameter("fbfgs"));
String fbfw=cf.GB2Uni(request.getParameter("fbfw"));

String wheregwbh=null;
wheregwbh=cf.GB2Uni(request.getParameter("wheregwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (!wheregwbh.equals(gwbh))
	{
		int xh=0;
		ls_sql="select count(*)";
		ls_sql+=" from  xz_gwgl";
		ls_sql+=" where gwbh='"+gwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (xh>0)
		{
			out.println("错误！[公文编号]已存在");
			return;
		}
	}


	ls_sql="update xz_gwgl set gwbh=?,gwmc=?,gwnr=?,fbsj=?,fbr=?,fbbm=?,lrsj=?,bz=?,lrr=?,fbfgs=?,fbfw=? ";
	ls_sql+=" where  (gwbh='"+wheregwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gwbh);
	ps.setString(2,gwmc);
	ps.setString(3,gwnr);
	ps.setDate(4,fbsj);
	ps.setString(5,fbr);
	ps.setString(6,fbbm);
	ps.setDate(7,lrsj);
	ps.setString(8,bz);
	ps.setString(9,lrr);
	ps.setString(10,fbfgs);
	ps.setString(11,fbfw);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>