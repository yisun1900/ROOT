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

String[] wtbh=request.getParameterValues("wtbh");
String[] wt=request.getParameterValues("wt");

String[] bz=request.getParameterValues("bz");



Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="delete from rs_xxaqcs  ";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<wtbh.length ;i++ )
	{
		String da=cf.GB2Uni(request.getParameter("da"+(i+1)));
		String dabh=da.substring(0,1);
		da=da.substring(1);

		ls_sql="insert into rs_xxaqcs ( wtbh,wt,dabh,da,ygbh,yhmc,lrsj,lrbm,ssfgs,bz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,SYSDATE,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(wtbh[i]));
		ps.setString(2,cf.GB2Uni(wt[i]));
		ps.setString(3,dabh);
		ps.setString(4,da);
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