<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>

<%
String wheresql=" ";
String[] xmdlbm=null;
String[] xmxlbm=null;
String smbm=null;
String dqbm=null;
String jgqz=null;
String tjbfb=null;
String bjjbbm=null;
jgqz=request.getParameter("jgqz");
tjbfb=request.getParameter("tjbfb");
dqbm=request.getParameter("dqbm");
bjjbbm=request.getParameter("bjjbbm");


xmdlbm=request.getParameterValues("xmdlbm");
if (xmdlbm!=null)
{
	wheresql+=cf.arrayToSQL(xmdlbm,"bj_jzbjb.xmdlbm");
}
xmxlbm=request.getParameterValues("xmxlbm");
if (xmxlbm!=null)
{
	wheresql+=cf.arrayToSQL(xmxlbm,"bj_jzbjb.xmxlbm");
}
smbm=request.getParameter("smbm");
if (smbm!=null)
{
	smbm=cf.GB2Uni(smbm);
	if (!(smbm.equals("")))	wheresql+=" and  (bj_jzbjb.smbm='"+smbm+"')";
}

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (jgqz.equals("Y"))//结果取整
	{
		ls_sql="update bj_jzbjb set bj=ROUND(bj*"+tjbfb+"/100.0,0),lrr='"+yhmc+"',lrsj=trunc(SYSDATE)";
		ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (jgqz.equals("N"))
	{
		ls_sql="update bj_jzbjb set bj=bj*"+tjbfb+"/100.0,lrr='"+yhmc+"',lrsj=trunc(SYSDATE)";
		ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
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