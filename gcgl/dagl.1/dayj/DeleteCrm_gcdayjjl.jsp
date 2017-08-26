<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
int jlh=Integer.parseInt(request.getParameter("jlh").trim());
int jlh1=0;

String khbh=null;
String damxbm=null;
String yjr=null;
String yjsj=null;
String yjrdw=null;
String yjrfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,damxbm,yjr,yjrdw,yjrfgs,oldyjsj from crm_gcdayjjl where jlh="+jlh;
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		damxbm=rs.getString("damxbm");
		yjr=rs.getString("yjr");
		yjrdw=rs.getString("yjrdw");
		yjrfgs=rs.getString("yjrfgs");
		yjsj=rs.getDate("oldyjsj").toString();
	}
	rs.close();
	ps.close();

	ls_sql="select MAX(jlh) from crm_gcdayjjl where khbh='"+khbh+"' and damxbm='"+damxbm+"'";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlh1=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	if(jlh!=jlh1)
	{
		
		out.println("<B>只能删除此明细的最后一次移交记录！");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from crm_gcdayjjl ";
	ls_sql+=" where jlh="+jlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_gcdagl set bgr='"+yjr+"', bgrdw='"+yjrdw+"',bgrfgs='"+yjrfgs+"',bgsj=TO_DATE('"+yjsj+"','yyyy-mm-dd') ";
	ls_sql+=" where khbh='"+khbh+"' and damxbm='"+damxbm+"'";
	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e );
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