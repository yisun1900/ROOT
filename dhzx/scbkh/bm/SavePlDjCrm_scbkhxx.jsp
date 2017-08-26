<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
java.sql.Date sbdjsj=null;

zt=cf.GB2Uni(request.getParameter("zt"));
sbyybm=cf.GB2Uni(request.getParameter("sbyybm"));
sbyysm=cf.GB2Uni(request.getParameter("sbyysm"));
sbdjr=cf.GB2Uni(request.getParameter("sbdjr"));
ls=request.getParameter("sbdjsj");
try{
	if (!(ls.equals("")))  sbdjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sbdjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[失败登记时间]类型转换发生意外:"+e);
	return;
}

String[] scbkhbh = request.getParameterValues("scbkhbh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<scbkhbh.length ;i++ )
	{
		ls_sql="update crm_scbkhxx set zt=?,sbyybm=?,sbyysm=?,sbdjr=?,sbdjsj=? ";
		ls_sql+=" where  scbkhbh='"+scbkhbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zt);
		ps.setString(2,sbyybm);
		ps.setString(3,sbyysm);
		ps.setString(4,sbdjr);
		ps.setDate(5,sbdjsj);
		ps.executeUpdate();
		ps.close();
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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