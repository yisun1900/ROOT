<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);
	
	for (int i=0;i<ddbh.length ;i++ )
	{
		String clzt="";
		String tdqrbz="";
		ls_sql =" select clzt,tdqrbz";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=cf.fillNull(rs.getString("clzt"));
			tdqrbz=cf.fillNull(rs.getString("tdqrbz"));
		}
		rs.close();
		ps.close();

		if (clzt.equals("11") || (clzt.equals("99") && tdqrbz.equals("Y")))
		{
		}
		else{
			conn.rollback();
			out.println("<BR>���󣬴���ʧ�ܣ�����״̬����ȷ��"+ddbh[i]);
			return;
		}

		if (clzt.equals("11"))
		{
			ls_sql="update jc_zcdd set gysjslrr=?,gysjslrsj=SYSDATE,clzt='13'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else if (clzt.equals("99"))
		{
			ls_sql="update jc_zcdd set gysjslrr=?,gysjslrsj=SYSDATE,tdqrbz='J'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
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
	alert("���̳ɹ���");
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