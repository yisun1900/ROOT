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
		String ddlx="";
		String yclzt="";
		String sxhtsfysh=null;
		ls_sql =" select clzt,sxhtsfysh,ddlx";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yclzt=rs.getString("clzt");
			sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
			ddlx=cf.fillNull(rs.getString("ddlx"));
		}
		rs.close();
		ps.close();

		if (!yclzt.equals("09") && !yclzt.equals("99"))
		{
			conn.rollback();
			out.println("<BR>错误，存盘失败！订单状态不正确："+ddbh[i]);
			return;
		}

		if (sxhtsfysh.equals("N"))
		{
			conn.rollback();
			out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能确认！</font></strong>："+ddbh[i]);
			return;
		}

		String clzt="";
		if (ddlx.equals("E") || ddlx.equals("9") || ddlx.equals("C"))//E：散客
		{
			clzt="30";
		}
		else{
			clzt="11";
		}

		if (yclzt.equals("09"))
		{
			ls_sql="update jc_zcdd set ddqrr=?,ddqrsj=SYSDATE,clzt=?";
			ls_sql+=" where ddbh='"+ddbh[i]+"' and  clzt='09' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.setString(2,clzt);
			ps.executeUpdate();
			ps.close();
		}
		else if (yclzt.equals("99"))
		{
			ls_sql="update jc_zcdd set ddqrr=?,ddqrsj=SYSDATE,tdqrbz='Y'";
			ls_sql+=" where ddbh='"+ddbh[i]+"' and  clzt='99' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.executeUpdate();
			ps.close();
		}
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