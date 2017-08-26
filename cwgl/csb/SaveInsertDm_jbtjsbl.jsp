<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String bfcs=cf.GB2Uni(request.getParameter("bfcs"));


String[] sgdjbbm=request.getParameterValues("sgdjbbm");
String[] jsbl=request.getParameterValues("jsbl");
String[] zyfw=request.getParameterValues("zyfw");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="delete from dm_jbtjsbl  ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs='"+bfcs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<jsbl.length ;i++ )
	{
		if (jsbl[i].equals(""))
		{
			continue;
		}
		ls_sql="insert into dm_jbtjsbl (fgsbh,bfcs,sgdjbbm,jsbl,zyfw)";
		ls_sql+=" values(?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,fgsbh);
		ps.setString(2,bfcs);
		ps.setString(3,sgdjbbm[i]);
		ps.setString(4,jsbl[i]);
		ps.setString(5,zyfw[i]);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%


}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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