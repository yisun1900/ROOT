<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String fgsbh1=cf.GB2Uni(request.getParameter("fgsbh1"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into oa_bgypbm ( bgypbm,bgypmc,flbm,jldw,dj,pp,xh,ghs,fgsbh ) ";
	ls_sql+=" select bgypbm,bgypmc,flbm,jldw,dj,pp,xh,ghs,'"+fgsbh1+"' ";
	ls_sql+=" from oa_bgypbm";
	ls_sql+=" where fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���Ƴɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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