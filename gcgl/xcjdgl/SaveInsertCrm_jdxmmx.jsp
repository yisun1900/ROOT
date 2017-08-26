<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] jdxmbm=request.getParameterValues("jdxmbm");
String[] jdry=request.getParameterValues("jdry");
String[] jdrydh=request.getParameterValues("jdrydh");
String[] jdnr=request.getParameterValues("jdnr");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jdxmbm.length ;i++ )
	{
		if (cf.GB2Uni(jdry[i]).equals(""))
		{
			conn.rollback();
			out.println("错误！[交底人员]为空");
			return;
		}
		if (cf.GB2Uni(jdrydh[i]).equals(""))
		{
			conn.rollback();
			out.println("错误！[交底人员电话]为空");
			return;
		}
		if (cf.GB2Uni(jdnr[i]).equals(""))
		{
			conn.rollback();
			out.println("错误！[交底内容]为空");
			return;
		}
		ls_sql="update crm_jdxmmx set jdry=?,jdrydh=?,jdnr=?";
		ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(jdry[i]));
		ps.setString(2,cf.GB2Uni(jdrydh[i]));
		ps.setString(3,cf.GB2Uni(jdnr[i]));
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