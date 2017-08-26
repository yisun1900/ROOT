<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");

String[] zjxbh=request.getParameterValues("zjxbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String sxhtsfysh=null;

	conn.setAutoCommit(false);


	for (int i=0;i<zjxbh.length ;i++ )
	{
		ls_sql =" select clzt,sxhtsfysh";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			sxhtsfysh=rs.getString("sxhtsfysh");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("01"))
		{
			conn.rollback();
			out.println("<BR>错误，存盘失败！增减项单状态不正确:"+zjxbh[i]);
			return;
		}

		if (sxhtsfysh.equals("N"))
		{
			conn.rollback();
			out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能确认！</font></strong>："+zjxbh[i]);
			return;
		}

		ls_sql="update jc_zczjx set qrr=?,qrsj=SYSDATE,clzt='02'";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"' and  clzt='01' ";
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