<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String[] ygbh=request.getParameterValues("ygbh");
String[] byqds=request.getParameterValues("byqds");
String[] byyj=request.getParameterValues("byyj");
String[] dzkhbl=request.getParameterValues("dzkhbl");

String khzq=cf.GB2Uni(request.getParameter("khzq"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	ls_sql="update cw_jrkhzq  set sfkh='3'";//1：未考核；2：录入任务；3：考核；4：提成
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql="update cw_jryjkh  set sfkh='Y',byqds="+byqds[i]+",byyj="+byyj[i]+",dzkhbl="+dzkhbl[i]+",khr='"+lrr+"',khsj=SYSDATE";//1：未考核；2：录入任务；3：考核；4：提成
		ls_sql+=" where khzq='"+khzq+"' and ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
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