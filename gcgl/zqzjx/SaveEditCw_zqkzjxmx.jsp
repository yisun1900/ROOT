<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

String[] zjxbz=request.getParameterValues("zjxbz");
String[] mc=request.getParameterValues("mc");
String[] cls=request.getParameterValues("cls");
String[] je=request.getParameterValues("je");
String[] ptr=request.getParameterValues("ptr");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from cw_zqkzjxmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<mc.length ;i++ )
	{
		if (mc[i].equals(""))
		{
			break;
		}

		if (cls[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[材料商]为空");
			return;
		}
		if (ptr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[陪同人]为空");
			return;
		}
		if (je[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[金额]为空");
			return;
		}

		ls_sql="insert into cw_zqkzjxmx ( khbh,mc,zjxbz,je,cls,ptr,bz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,cf.GB2Uni(mc[i]));
		ps.setString(3,zjxbz[i]);
		ps.setString(4,je[i]);
		ps.setString(5,cf.GB2Uni(cls[i]));
		ps.setString(6,cf.GB2Uni(ptr[i]));
		ps.setString(7,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();
	}
	

	double allje=0;
	ls_sql="select sum(je) ";
	ls_sql+=" FROM cw_zqkzjxmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_zqkzjxdj set sjysje=eqkje+"+allje;
	ls_sql+=" where khbh='"+khbh+"'";
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