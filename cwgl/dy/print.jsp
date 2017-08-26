<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fkxh=null;
fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String khbh="";
	String fklxbm="";
	ls_sql="select khbh,fklxbm";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where cw_khfkjl.fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
	}
	rs.close();
	ps.close();



	if (fklxbm.equals("11") )
	{
		response.sendRedirect("/cwgl/qyecx/PrintJzSj.jsp?fkxh="+fkxh+"&khbh="+khbh);
	}
	else if (fklxbm.equals("21") || fklxbm.equals("22") || fklxbm.equals("23") || fklxbm.equals("24") )
	{
		response.sendRedirect("/cwgl/qyecx/PrintJcSj.jsp?fkxh="+fkxh+"&khbh="+khbh);
	}
	else{
		response.sendRedirect("/cwgl/qyecx/PrintQtSj.jsp?fkxh="+fkxh+"&khbh="+khbh);
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

