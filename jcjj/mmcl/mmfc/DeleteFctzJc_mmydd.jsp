<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yddbh=request.getParameterValues("yddbh");

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
	

		String bclzt=null;
		ls_sql="select bclzt";
		ls_sql+=" from  jdm_mmclzt";
		ls_sql+=" where cdmc='通知复测' and jgclzt='"+oldclzt+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bclzt=rs.getString("bclzt");
		}
		rs.close();
		ps.close();
		
		if (bclzt==null)
		{
			conn.rollback();
			out.println("！删除失败，预订单["+yddbh[i]+"]处理状态不正确。");
			return;
		}

		ls_sql="update jc_mmydd set clzt='"+bclzt+"',ffctzsj=null,ffctzr=null,tzfcsj=null";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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