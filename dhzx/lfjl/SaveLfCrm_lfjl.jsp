<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lflxbm=null;
lflxbm=request.getParameter("lflxbm");
String khbh=request.getParameter("khbh");
String sjsmsj=request.getParameter("sjsmsj");
String sjsmry=cf.GB2Uni(request.getParameter("sjsmry"));
String lfjgsm=cf.GB2Uni(request.getParameter("lfjgsm"));
String cfwsjcs=cf.GB2Uni(request.getParameter("cfwsjcs"));
String bzsm=cf.GB2Uni(request.getParameter("bzsm"));
String lfjlh_2=request.getParameter("lfjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_lfjl set zt='4',sjsmsj=to_date('"+sjsmsj+"','yyyy-MM-dd'),sjsmry='"+sjsmry+"',lfjgsm='"+lfjgsm+"',cfwsjcs='"+cfwsjcs+"',bzsm='"+bzsm+"' ";
	ls_sql+=" where lfjlh='"+lfjlh_2+"' ";
	ps2= conn.prepareStatement(ls_sql);

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