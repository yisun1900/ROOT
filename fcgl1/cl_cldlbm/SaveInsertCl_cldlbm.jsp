<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cldlbm=null;
String cldlmc=null;
cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
double qybfb=0;
ls=request.getParameter("qybfb");
try{
	if (!(ls.equals("")))  qybfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qybfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约百分比]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String sql=null;
int count=0;
try {
	conn=cf.getConnection();
	ls_sql="select count(*)";
	ls_sql+=" from  cl_cldlbm";
	ls_sql+=" where cldlbm='"+cldlbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！[材料大类编码]已经被使用!");
		return;
	}
	ls_sql="insert into cl_cldlbm ( cldlbm,cldlmc,qybfb ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cldlbm);
	ps.setString(2,cldlmc);
	ps.setDouble(3,qybfb);
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
	out.print("存盘失败,发生意外: " + e);
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