<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
lxrxm=cf.GB2Uni(request.getParameter("lxrxm"));
zw=cf.GB2Uni(request.getParameter("zw"));
sj=cf.GB2Uni(request.getParameter("sj"));
bgdh=cf.GB2Uni(request.getParameter("bgdh"));
cz=cf.GB2Uni(request.getParameter("cz"));
sflz=cf.GB2Uni(request.getParameter("sflz"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into sq_dwlxr ( dwbh,lxrxm,zw,sj,bgdh,cz,sflz,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,lxrxm);
	ps.setString(3,zw);
	ps.setString(4,sj);
	ps.setString(5,bgdh);
	ps.setString(6,cz);
	ps.setString(7,sflz);
	ps.setString(8,bz);
	if (ps.executeUpdate()!=1)
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