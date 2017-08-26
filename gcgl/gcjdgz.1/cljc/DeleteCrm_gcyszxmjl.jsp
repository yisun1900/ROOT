<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ysjlh = request.getParameterValues("ysjlh");
if (ysjlh.length>1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}
String khbh=null;
String gcjdbm=null;
String gcyszxmbm=null;
String ygcyszxmbm=null;
java.sql.Date yyssj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select khbh,gcjdbm,gcyszxmbm,yyssj,ygcyszxmbm";
	ls_sql+=" from  crm_gcyszxmjl";
	ls_sql+=" where ysjlh='"+ysjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		gcjdbm=rs.getString("gcjdbm");
		gcyszxmbm=rs.getString("gcyszxmbm");
		yyssj=rs.getDate("yyssj");
		ygcyszxmbm=rs.getString("ygcyszxmbm");
	}
	else{
		out.println("错误！不存在的验收记录号："+ysjlh[0]);
		return;
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	ls_sql="delete from crm_gcyszp";
	ls_sql+=" where ysjlh='"+ysjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_gcyszxmjl";
	ls_sql+=" where ysjlh='"+ysjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//材料进场明细
	ls_sql="delete from  crm_cljcmx ";
	ls_sql+=" where ysjlh='"+ysjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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