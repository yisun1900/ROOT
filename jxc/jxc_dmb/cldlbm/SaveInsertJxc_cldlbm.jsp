<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int cldlbm=0;
String cldlmc=null;
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String cldllb=null;
cldllb=cf.GB2Uni(request.getParameter("cldllb"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(cldlbm),0)+1 cldlbm ";
	ls_sql+=" from  jxc_cldlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cldlbm=rs.getInt("cldlbm");
	}
	rs.close();
	ps.close();
	if (cldlbm==0)
	{cldlbm=1;}


	ls_sql="insert into jxc_cldlbm ( cldlbm,cldlmc,cldllb ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,cldlbm);
	ps.setString(2,cldlmc);
	ps.setString(3,cldllb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！材料大类编码为：<%=cldlbm%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
		if (ps != null) ps.close();
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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