<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String gdjsjd=request.getParameter("gdjsjd");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String ygdjsjd=null;
	String gcjdbm=null;
	double cwsfke=0;
	ls_sql="select gdjsjd,gcjdbm,cwsfke";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		cwsfke=rs.getDouble("cwsfke");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set gdjsjd='"+gdjsjd+"'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cw_sgdjssqjl ";
	ls_sql+=" where  khbh='"+khbh+"' and gdjsjd='"+gdjsjd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	String sqr=(String)session.getAttribute("yhmc");
	String sqbm=(String)session.getAttribute("dwbh");

	ls_sql =" insert into cw_sgdjssqjl (khbh      ,gdjsjd      ,ygdjsjd      ,sqr      ,sqsj   ,sqbm      ,zt ,bz) ";
	ls_sql+="                    values('"+khbh+"','"+gdjsjd+"','"+ygdjsjd+"','"+sqr+"',SYSDATE,'"+sqbm+"','1','')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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