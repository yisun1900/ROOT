<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int scsbm=0;
String scsmc=null;
String scslb=null;
scsmc=cf.GB2Uni(request.getParameter("scsmc"));
scslb=cf.GB2Uni(request.getParameter("scslb"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select NVL(max(scsbm),0)+1 scsbm ";
	ls_sql+=" from  jxc_scsxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		scsbm=rs.getInt("scsbm");
	}
	rs.close();
	ps.close();
	if (scsbm==0)
	{scsbm=1;}



	ls_sql="insert into jxc_scsxx ( scsbm,scsmc,scslb ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,scsbm);
	ps.setString(2,scsmc);
	ps.setString(3,scslb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！产生新的编号为：<%=scsbm%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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