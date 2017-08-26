<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yddbh=request.getParameterValues("yddbh");
String yhmc=(String)session.getAttribute("yhmc");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yddbh.length ;i++ )
	{
		ls_sql="select clzt";
		ls_sql+=" from  jc_mmydd";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldclzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!oldclzt.equals("07"))
		{
			conn.rollback();
			out.println("！存盘失败，处理状态不正确："+yddbh[i]);
			return;
		}
		
		ls_sql="update jc_mmydd set aztz='Y',aztzsj=TRUNC(SYSDATE),aztzr=?,clzt='09'";
		ls_sql+=" where  yddbh='"+yddbh[i]+"' and clzt='07'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
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