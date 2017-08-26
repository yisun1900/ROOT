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

	String khbh=null;
	String clzt=null;
	String ppbm=null;
	String tzshsj=null;

	conn.setAutoCommit(false);


	for (int i=0;i<ddbh.length ;i++ )
	{
		String ddshbz="";
		ls_sql =" select khbh,clzt,ppbm,tzshsj,ddshbz";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			ppbm=rs.getString("ppbm");
			tzshsj=cf.fillNull(rs.getDate("tzshsj"));
			ddshbz=cf.fillNull(rs.getString("ddshbz"));
		}
		rs.close();
		ps.close();


		if (ddshbz.equals("1"))////等待送货通知标志  1：不需待电；2：待电未通知；3：待电已通知
		{
			if (!clzt.equals("13") && !clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))
			{
				conn.rollback();
				out.println("<BR>错误，存盘失败！订单状态不正确："+ddbh[i]);
				return;
			}
		}
		else{
			if (!clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))
			{
				conn.rollback();
				out.println("<BR>错误，存盘失败！订单状态不正确："+ddbh[i]);
				return;
			}
		}

		if (tzshsj.equals(""))
		{
			out.println("<P>提醒！未发送货通知："+ddbh[i]);
		}

		ls_sql="update jc_zcdd set sshr=?,sshsj=TRUNC(SYSDATE),lsclzt='"+clzt+"',clzt='19'";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
