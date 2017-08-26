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

	conn.setAutoCommit(false);


	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql =" select khbh,clzt,ppbm";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			ppbm=rs.getString("ppbm");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("15"))
		{
			conn.rollback();
			out.println("<BR>´íÎó£¬´æÅÌÊ§°Ü£¡¶©µ¥×´Ì¬²»ÕýÈ·£º"+ddbh[i]);
			return;
		}


		ls_sql="update jc_zcdd set tzshr=?,tzshsj=SYSDATE,ddshbz='3',clzt='17'";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and  clzt='15' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();
	
	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
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
