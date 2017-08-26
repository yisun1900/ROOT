<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] djxmbh=request.getParameterValues("djxmbh");
String[] djxm=request.getParameterValues("djxm");
String[] gj=request.getParameterValues("gj");

String[] bz=request.getParameterValues("bz");



Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="delete from rs_zwdjb  ";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<djxmbh.length ;i++ )
	{
		String djjg=request.getParameter("djjg"+(i+1));

		ls_sql="insert into rs_zwdjb ( djxmbh,djxm,gj,djjg,ygbh,yhmc,lrsj,lrbm,ssfgs,bz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,SYSDATE,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(djxmbh[i]));
		ps.setString(2,cf.GB2Uni(djxm[i]));
		ps.setString(3,cf.GB2Uni(gj[i]));
		ps.setString(4,djjg);
		ps.setString(5,ygbh);
		ps.setString(6,yhmc);
		ps.setString(7,lrbm);
		ps.setString(8,ssfgs);
		ps.setString(9,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();
	}


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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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