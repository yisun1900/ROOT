<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.URLEncoder' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");
String fileName = "";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	for(int i = 0; i<khbh.length; i++)
	{
		ls_sql="select ewmmc";
		ls_sql+=" from  app_ewmscmx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fileName=cf.fillNull(rs.getString("ewmmc"));
		}
		else{
			out.println("错误！咨询客户信息不存在");
			
		}
		rs.close();
		ps.close();

		fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
		
		%>
    
	<SCRIPT language=javascript >
		window.open("/app/ewm/download.jsp?fileName=<%=fileName%>");
	</SCRIPT>
	<%
	}
	

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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

