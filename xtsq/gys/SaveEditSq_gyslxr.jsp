<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
lxrxm=cf.GB2Uni(request.getParameter("lxrxm"));
zw=cf.GB2Uni(request.getParameter("zw"));
sj=cf.GB2Uni(request.getParameter("sj"));
bgdh=cf.GB2Uni(request.getParameter("bgdh"));
cz=cf.GB2Uni(request.getParameter("cz"));
sflz=cf.GB2Uni(request.getParameter("sflz"));
bz=cf.GB2Uni(request.getParameter("bz"));

String gysbm=request.getParameter("gysbm");
String wherelxrxm=cf.GB2Uni(request.getParameter("wherelxrxm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update sq_gyslxr set lxrxm=?,zw=?,sj=?,bgdh=?,cz=?,sflz=?,bz=? ";
	ls_sql+=" where  (gysbm='"+gysbm+"' and lxrxm='"+wherelxrxm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lxrxm);
	ps.setString(2,zw);
	ps.setString(3,sj);
	ps.setString(4,bgdh);
	ps.setString(5,cz);
	ps.setString(6,sflz);
	ps.setString(7,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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