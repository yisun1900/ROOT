<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String zxjlh=null;
	ls_sql="select zxjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxjlh=cf.fillNull(rs.getString("zxjlh"));

	}
	rs.close();
	ps.close();

	if (!zxjlh.equals(""))
	{
		response.sendRedirect("/dhzx/sjszx/EditSjsZxCrm_zxkhxx.jsp?zxjlh="+zxjlh);
	}
	else{
		out.println("错误！未做电子报价");
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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