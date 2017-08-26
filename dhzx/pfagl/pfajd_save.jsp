<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfalxbm=null;
pfalxbm=request.getParameter("pfalxbm");
String pfajlh=request.getParameter("pfajlh");
String sjsj=request.getParameter("sjsj");
String sjry=cf.GB2Uni(request.getParameter("sjry"));
String gc=cf.GB2Uni(request.getParameter("gc"));
String jd=cf.GB2Uni(request.getParameter("jd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_pfagcgl set sjsj=TO_DATE('"+sjsj+"','YYYY-MM-DD'),sjry='"+sjry+"',gc='"+gc+"',jd='"+jd+"' ";
	ls_sql+=" where pfajlh='"+pfajlh+"' ";
	ps2= conn.prepareStatement(ls_sql);

	/*ps2.setString(1,"00000001");
	ps2.setString(2,pfalxbm);
	ps2.setString(3,khbh);
	ps2.setString(4,ysmry);
	ps2.setString(5,smmb);*/
	//ps.executeUpdate();
	if(ps2.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
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