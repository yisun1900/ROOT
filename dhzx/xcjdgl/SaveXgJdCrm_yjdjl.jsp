<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

java.sql.Date sjjdsj=null;
String jdsfcg=null;

ls=request.getParameter("sjjdsj");
try{
	if (!(ls.equals("")))  sjjdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjdsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ��Ԥ����ʱ��]����ת����������:"+e);
	return;
}
jdsfcg=cf.GB2Uni(request.getParameter("jdsfcg"));
String sjjdqk=cf.GB2Uni(request.getParameter("sjjdqk"));


String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	ls_sql=" SELECT clzt,khbh";
	ls_sql+=" FROM crm_yjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("3"))//1�����룻2��������3����Ԥ����
	{
		out.print("���󣡴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_yjdjl set sjjdsj=?,jdsfcg=?,sjjdqk=?,clzt='3' ";
	ls_sql+=" where  jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjjdsj);
	ps.setString(2,jdsfcg);
	ps.setString(3,sjjdqk);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_zxkhxx set xcjdbz='4'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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