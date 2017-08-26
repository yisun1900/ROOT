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
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!clzt.equals("99"))
		{
			conn.rollback();
			out.println("´íÎó£¬É¾³ýÊ§°Ü£¡¶©µ¥¡¾"+ddbh[i]+"¡¿Î´ÍËµ¥");
			return;
		}

		ls_sql="update jc_cgdd set clzt=lsclzt,lsclzt='',tdsj=null,tdblr=null,kclf=0,jctdyybm=null,tdsm=null";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='99'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_cgzjx set clzt=lsclzt";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='99'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//¼¯³É¶©µ¥
		ls_sql =" delete from jc_jcdd ";
		ls_sql+=" where gjz='"+ddbh[i]+"' and lx='2' and czlx='3'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("É¾³ýÍËµ¥³É¹¦£¡");
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