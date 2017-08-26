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


try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String oldclzt=null;
		String oldycclzt=null;
		ls_sql="select clzt,ycclzt";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldclzt=rs.getString("clzt");
			oldycclzt=cf.fillNull(rs.getString("ycclzt"));
		}
		rs.close();
		ps.close();
		if (!oldclzt.equals("33"))
		{
			conn.rollback();
			out.println("！错误，订单【"+ddbh[i]+"】处理状态不正确");
			return;
		}

		if (oldycclzt.equals("1"))//0：未延迟；1：延迟未核实；2：延迟原因属实；3：延迟原因不属实
		{
			conn.rollback();
			out.println("！错误，订单【"+ddbh[i]+"】延迟未处理，不能完结");
			return;
		}


		ls_sql="update jc_cgdd set wjsj=TRUNC(SYSDATE),wjlrr=?,clzt='35'";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='33'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_cgzjx set clzt='04',azwcsj=TRUNC(SYSDATE)";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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