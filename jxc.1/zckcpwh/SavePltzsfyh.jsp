<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] clbm =request.getParameterValues("clbm");
String dqbm =request.getParameter("dqbm");

String sfyh = request.getParameter("sfyh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
double cpbqj=0;

try {
	conn=cf.getConnection();    //�õ�����

	conn.setAutoCommit(false);

//=======================================������ѡ�������±�ǩ��=======================================
	for (int i=0;i<clbm.length ;i++ )
	{
		ls_sql = " update jxc_cljgb set sfyh='"+sfyh+"'";
		ls_sql+= " where dqbm='"+dqbm+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>