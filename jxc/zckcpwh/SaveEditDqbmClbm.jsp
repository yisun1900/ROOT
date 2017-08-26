<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] dqbm = request.getParameterValues("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//检查系统初始化内容

	conn.setAutoCommit(false);

	for (int i=0;i<dqbm.length ;i++ )
	{
		ls_sql=" delete from jxc_cljgb ";
		ls_sql+=" where dqbm='"+dqbm[i]+"'";
		ls_sql+=" and xsfs in('2','3')";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
		ls_sql+=" and clbm in(select clbm from jxc_clbm where cllb='2')";//0：代销品主材；1：辅材；2：库存品主材)";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}



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
	out.print("<BR>存盘失败,发生意外: " + e);
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