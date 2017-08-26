<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rwbm=request.getParameter("rwbm");
String[] qzrwbm=request.getParameterValues("qzrwbm");


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="delete from dm_bzrwljgx  ";
	ls_sql+=" where  rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (qzrwbm!=null)
	{
		for (int i=0;i<qzrwbm.length ;i++ )
		{
			if (!qzrwbm[i].equals(""))
			{
				ls_sql="insert into dm_bzrwljgx ( rwbm,qzrwbm)";
				ls_sql+=" values ( ?,?)";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,rwbm);
				ps.setString(2,qzrwbm[i]);
				ps.executeUpdate();
				ps.close();
			}
		}
	}

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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>