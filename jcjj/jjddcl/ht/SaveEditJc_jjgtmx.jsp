<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtxh=null;
String ddbh=null;
String gtmc=null;
String jjazwz=null;
String guige=null;
String jjlx=null;
String bcys=null;
String bz=null;
gtxh=cf.GB2Uni(request.getParameter("gtxh"));
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
gtmc=cf.GB2Uni(request.getParameter("gtmc"));
jjazwz=cf.GB2Uni(request.getParameter("jjazwz"));
guige=cf.GB2Uni(request.getParameter("guige"));
jjlx=cf.GB2Uni(request.getParameter("jjlx"));
bcys=cf.GB2Uni(request.getParameter("bcys"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheregtxh=null;
wheregtxh=cf.GB2Uni(request.getParameter("wheregtxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
		jjzkl=rs.getDouble("jjzkl");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	ls_sql="update jc_jjgtmx set gtmc=?,jjazwz=?,guige=?,jjlx=?,bcys=?,bz=?";
	ls_sql+=" where gtxh='"+wheregtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtmc);
	ps.setString(2,jjazwz);
	ps.setString(3,guige);
	ps.setString(4,jjlx);
	ps.setString(5,bcys);
	ps.setString(6,bz);
	ps.executeUpdate();
	ps.close();


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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>