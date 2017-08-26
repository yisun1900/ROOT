<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select clzt";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!clzt.equals("13"))
		{
			conn.rollback();
			out.println("错误，删除失败！订单【"+ddbh[i]+"】处理状态不正确");
			return;
		}

		ls_sql="update jc_jjdd set qhtsj=null,jhazrq=null,kjxsj=null,qhtr=null,htbz=null,wdzje=0,zqjjje=0,zqxcmje=0,zqcpjjje=0 ,htze=0,jjje=0,xcmje=0,cpjjje=0  ,jjzjje=0,xcmzjje=0,cpjjzjje=0,zjhze=0,zqjjzjje=0,zqxcmzjje=0,zqcpjjzjje=0,zqzjhze=0  ,clzt=lsclzt1";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='13'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_jjgtmx ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_gtbjmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_gtpjmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_jjxcmmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_cpjjddmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and lx='3'";
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
	out.print("<BR>SQL: " + ls_sql);
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