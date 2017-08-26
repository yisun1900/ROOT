<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String sfpsjs=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select clzt,sfpsjs";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			sfpsjs=rs.getString("sfpsjs");
		}
		rs.close();
		ps.close();


		if (!clzt.equals("17"))
		{
			conn.rollback();
			out.println("！错误，订单【"+ddbh[i]+"】处理状态不正确");
			return;
		}


		ls_sql="update jc_cgdd set gcjssj=TRUNC(SYSDATE),gcjsr=?,gcjsbz=?,lsclzt2=?,clzt='19'";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ls_sql+=" and jc_cgdd.clzt='17' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
		ps.setString(2,"批量接收");
		ps.setString(3,clzt);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>