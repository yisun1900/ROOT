<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");

String[] glbxh=request.getParameterValues("glbxh");
String[] wlbm=request.getParameterValues("wlbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<glbxh.length ;i++ )
	{
		//[���ϱ���]�Ƿ�Ϊ��
		if (wlbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����ϱ����["+glbxh[i]+"]��[���ϱ���]Ϊ��");
			return;
		}

		//��װ���Ϸ�����
		ls_sql="update bj_jzglfxb set wlbm='"+wlbm[i]+"'";
		ls_sql+=" where dqbm='"+dqbm+"' and glbxh="+glbxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>