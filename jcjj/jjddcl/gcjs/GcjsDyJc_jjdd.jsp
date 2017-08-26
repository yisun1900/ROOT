<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcjsbz=cf.GB2Uni(request.getParameter("gcjsbz"));
String gcjsr=cf.GB2Uni(request.getParameter("gcjsr"));
java.sql.Date gcjssj=null;
ls=request.getParameter("gcjssj");
try{
	if (!(ls.equals("")))  gcjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工厂接收时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String sfpsjs=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,sfpsjs";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		sfpsjs=rs.getString("sfpsjs");
	}
	rs.close();
	ps.close();

	if (sfpsjs.equals("1"))//1：是；2：否
	{
		if (!clzt.equals("17"))
		{
			out.println("！错误，处理状态不正确");
			return;
		}
	}
	else{
		if (!clzt.equals("15"))
		{
			out.println("！错误，处理状态不正确");
			return;
		}
	}


	ls_sql="update jc_jjdd set gcjssj=?,gcjsr=?,gcjsbz=?,lsclzt2=?,clzt='19'";
	ls_sql+=" where  ddbh='"+ddbh+"'";
    ls_sql+=" and ((jc_jjdd.clzt='15' and jc_jjdd.sfpsjs='2') or (jc_jjdd.clzt='17' and jc_jjdd.sfpsjs='1'))";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,gcjssj);
	ps.setString(2,gcjsr);
	ps.setString(3,gcjsbz);
	ps.setString(4,clzt);
	if (ps.executeUpdate()!=1)
	{
		ps.close();
		out.println("<BR>存盘失败！");
	}
	else
	{
		ps.close();
		response.sendRedirect("/jcjj/dygl/jjht.jsp?ddbh="+ddbh);
	}

	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
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