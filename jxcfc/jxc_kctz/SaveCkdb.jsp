<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="jzgl" scope="page" class="jxc.kcjz.Kcjz"/>
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String ckbh=request.getParameter("ckbh");
String hjbh=request.getParameter("hjbh");
String[] lsh=request.getParameterValues("lsh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<lsh.length ;i++ )
	{
		//�޸Ĳ��ϼ۸������Ʒ������
		ls_sql=" update jxc_kcb set ckbh='"+ckbh+"',hjbh='"+hjbh+"',hwbh=''";
		ls_sql+=" where dqbm='"+dqbm+"' and lsh='"+lsh[i]+"' ";
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
	out.print("<BR>����ʧ��,��������: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>