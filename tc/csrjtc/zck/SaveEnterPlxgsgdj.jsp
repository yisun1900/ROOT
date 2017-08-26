<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String ls=null;
String jgqz=cf.GB2Uni(request.getParameter("jgqz"));
String wheresql=cf.GB2Uni(request.getParameter("wheresql"));
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

	if (jgqz.equals("Y"))//结果取整
	{
		ls_sql="update tc_csrjzck set sgddj=ROUND(ysgddj*"+xs+",0),lrr='"+yhmc+"',lrsj=SYSDATE";
		ls_sql+=" where  (1=1) ";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (jgqz.equals("N"))
	{
		ls_sql="update tc_csrjzck set sgddj=ROUND(ysgddj*"+xs+",2),lrr='"+yhmc+"',lrsj=SYSDATE";
		ls_sql+=" where  (1=1) ";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


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
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>