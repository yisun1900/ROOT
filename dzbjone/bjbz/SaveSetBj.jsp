<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;



try {
	conn=cf.getConnection();    //得到连接


	ls_sql = "update bj_jzbjb ";
	ls_sql+= " set sgdbj=cbenj*gcjcbjxs,sgcbj=cbenj*sgcbbjxs,bj=cbenj*khbjxs";
	ls_sql+= " where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("调价成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
