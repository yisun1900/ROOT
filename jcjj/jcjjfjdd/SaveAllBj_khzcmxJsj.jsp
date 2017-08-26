<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] cbjStr=request.getParameterValues("cbj");

String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");

if (xh==null)
{
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))
	{
		out.println("���������");
		return ;
	}

	conn.setAutoCommit(false);
	
	for (int i=0;i<xh.length ;i++ )
	{
		double cbj=0;
		cbj=Double.parseDouble(cbjStr[i]);

		ls_sql="update bj_khzcmx set jsfs='1',cbj=? ";
		ls_sql+=" where xh="+xh[i];
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.executeUpdate();
		ps.close();
	}

	jcjj.Fjdd fjdd=new jcjj.Fjdd();
	String retStr=fjdd.fj(conn,khbh,yhmc,dwbh);
	if (!retStr.equals(""))
	{
		conn.rollback();
		out.println(retStr);
		return;
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>