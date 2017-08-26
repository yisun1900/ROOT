<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String sqbh=request.getParameter("sqbh");


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="insert into ybj_fpybj ( sqbh,khbh,fpr,fpsj,clzt ) ";
		ls_sql+=" select ?,khbh,?,SYSDATE,'N' ";
		ls_sql+=" from crm_khxx where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sqbh);
		ps.setString(2,yhdlm);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update ybj_cgsq set clzt='2' ";
	ls_sql+=" where  sqbh="+sqbh;
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
	out.print("存盘失败,发生意外: " + e);
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