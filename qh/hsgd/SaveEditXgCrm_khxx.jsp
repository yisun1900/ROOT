<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String oldsgd=cf.GB2Uni(request.getParameter("oldsgd"));
String newsgd=cf.GB2Uni(request.getParameter("newsgd"));
String hsgdsm=cf.GB2Uni(request.getParameter("hsgdsm"));
String yhdlm=(String)session.getAttribute("yhdlm");

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

	ls_sql="insert into pd_hsgdjl (khbh,oldsgd,newsgd,czsj,czr,hsgdsm,zqysxmbm,ybysxmbm) ";
	ls_sql+=" values (?,?,?,TRUNC(SYSDATE),?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,oldsgd);
	ps.setString(3,newsgd);
	ps.setString(4,yhdlm);
	ps.setString(5,hsgdsm);
	ps.setString(6,zqysxmbm);
	ps.setString(7,ybysxmbm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set sgd=?,sgbz=''";
	ls_sql+=" where  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newsgd);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("换施工队成功！");
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