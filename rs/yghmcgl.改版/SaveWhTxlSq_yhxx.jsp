<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ygbh=request.getParameterValues("ygbh");
String[] bianhao=request.getParameterValues("bianhao");
String[] dh=request.getParameterValues("dh");
String[] bgdh=request.getParameterValues("bgdh");
String[] dhsfgb=request.getParameterValues("dhsfgb");
String[] xuhao=request.getParameterValues("xuhao");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	for (int i=0;i<ygbh.length ;i++ )
	{
		//家装工料分析表
		ls_sql="update sq_yhxx set xuhao='"+xuhao[i]+"',dh='"+cf.GB2Uni(dh[i])+"',bgdh='"+cf.GB2Uni(bgdh[i])+"',bianhao='"+cf.GB2Uni(bianhao[i])+"',dhsfgb='"+dhsfgb[i]+"'";
		ls_sql+=" where ygbh="+ygbh[i];
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