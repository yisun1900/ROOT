<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bdbh=null;
String bdmc=null;
java.sql.Date fbsj=null;
String fbr=null;
String fbbm=null;
String lrr=null;
String bz=null;
java.sql.Date lrsj=null;
bdbh=cf.GB2Uni(request.getParameter("bdbh"));
bdmc=cf.GB2Uni(request.getParameter("bdmc"));
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
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));
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

String fbfgs=cf.GB2Uni(request.getParameter("fbfgs"));
String fbfw=cf.GB2Uni(request.getParameter("fbfw"));

String wherebdbh=null;
wherebdbh=cf.GB2Uni(request.getParameter("wherebdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (!wherebdbh.equals(bdbh))
	{
		int xh=0;
		ls_sql="select count(*)";
		ls_sql+=" from  xz_bdgl";
		ls_sql+=" where bdbh='"+bdbh+"'";
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
			out.println("错误！[表单编号]已存在");
			return;
		}
	}

	
	ls_sql="update xz_bdgl set bdbh=?,bdmc=?,fbsj=?,fbr=?,fbbm=?,lrr=?,bz=?,lrsj=?,fbfgs=?,fbfw=? ";
	ls_sql+=" where  (bdbh='"+wherebdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bdbh);
	ps.setString(2,bdmc);
	ps.setDate(3,fbsj);
	ps.setString(4,fbr);
	ps.setString(5,fbbm);
	ps.setString(6,lrr);
	ps.setString(7,bz);
	ps.setDate(8,lrsj);
	ps.setString(9,fbfgs);
	ps.setString(10,fbfw);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！"+ls_sql);
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