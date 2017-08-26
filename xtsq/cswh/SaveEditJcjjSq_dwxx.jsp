<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010120")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String ls=null;
String jcppbz=cf.GB2Uni(request.getParameter("jcppbz"));
String zcmmbz=cf.GB2Uni(request.getParameter("zcmmbz"));
String mmbz=cf.GB2Uni(request.getParameter("mmbz"));
String cgjjbz=cf.GB2Uni(request.getParameter("cgjjbz"));
String jjbz=cf.GB2Uni(request.getParameter("jjbz"));
String xmzyglbz=cf.GB2Uni(request.getParameter("xmzyglbz"));
String jjgwglbz=cf.GB2Uni(request.getParameter("jjgwglbz"));
String jcddblxs=cf.GB2Uni(request.getParameter("jcddblxs"));
String jcddmxblxs=cf.GB2Uni(request.getParameter("jcddmxblxs"));

String kfdh=cf.GB2Uni(request.getParameter("kfdh"));
String jjsjsglbz=cf.GB2Uni(request.getParameter("jjsjsglbz"));

String djlrfs=cf.GB2Uni(request.getParameter("djlrfs"));
String kgcxhdbl=cf.GB2Uni(request.getParameter("kgcxhdbl"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="update sq_dwxx set jcppbz=?,xmzyglbz=?,jjgwglbz=?,jcddblxs=?  ,jjsjsglbz=?,jcddmxblxs=?,zcmmbz=?,mmbz=?,cgjjbz=?,jjbz=?,djlrfs=?,kgcxhdbl=? ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcppbz);
	ps.setString(2,xmzyglbz);
	ps.setString(3,jjgwglbz);
	ps.setString(4,jcddblxs);

	ps.setString(5,jjsjsglbz);
	ps.setString(6,jcddmxblxs);
	ps.setString(7,zcmmbz);
	ps.setString(8,mmbz);
	ps.setString(9,cgjjbz);
	ps.setString(10,jjbz);
	ps.setString(11,djlrfs);
	ps.setString(12,kgcxhdbl);

	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






