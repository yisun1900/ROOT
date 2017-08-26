<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String oldzjxm=cf.GB2Uni(request.getParameter("oldzjxm"));
String newzjxm=cf.GB2Uni(request.getParameter("zjxm"));
String hzjxmsm=cf.GB2Uni(request.getParameter("hzjxmsm"));

String yhmc=(String)session.getAttribute("yhmc");

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String ybysxmbm=null;
String zqysxmbm=null;
try {
	conn=cf.getConnection();

	ls_sql="select ybysxmbm,zqysxmbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (!newzjxm.equals(oldzjxm))
	{
		ls_sql="insert into pd_hzjjl (khbh,oldzjxm,newzjxm,czsj,czr,zqysxmbm,ybysxmbm,hzjxmsm) ";
		ls_sql+=" values (?,?,?,TRUNC(SYSDATE),?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,oldzjxm);
		ps.setString(3,newzjxm);
		ps.setString(4,yhmc);
		ps.setString(5,zqysxmbm);
		ps.setString(6,ybysxmbm);
		ps.setString(7,hzjxmsm);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_khxx set zjxm=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newzjxm);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("换工程担当成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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