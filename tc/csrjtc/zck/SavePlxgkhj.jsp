<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String ls=null;
String jgqz=cf.GB2Uni(request.getParameter("jgqz"));
String[] cpbm = request.getParameterValues("cpbm");
double xs=0;
ls=request.getParameter("xs");
try{
	if (!(ls.equals("")))  xs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[系数]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<cpbm.length ;i++ )
	{
		if (jgqz.equals("Y"))//结果取整
		{
			ls_sql="update tc_csrjzck set khxsdj=ROUND(ykhxsdj*"+xs+",0),lrr='"+yhmc+"',lrsj=SYSDATE";
			ls_sql+=" where cpbm='"+cpbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (jgqz.equals("N"))
		{
			ls_sql="update tc_csrjzck set khxsdj=ROUND(ykhxsdj*"+xs+",2),lrr='"+yhmc+"',lrsj=SYSDATE";
			ls_sql+=" where cpbm='"+cpbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>