<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hjbh=null;
String hjmc=null;
String ckbh=null;
hjmc=cf.GB2Uni(request.getParameter("hjmc"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select lpad(NVL(max(substr(hjbh,5,2)),0)+1,2,0) xh";
	ls_sql+=" from  jxc_hjmc";
	ls_sql+=" where  (ckbh='"+ckbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hjbh=ckbh+cf.fillNull(rs.getString("xh"));
	}
	rs.close();
	ps.close();


	ls_sql="insert into jxc_hjmc ( hjbh,hjmc,ckbh ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hjbh);
	ps.setString(2,hjmc);
	ps.setString(3,ckbh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！生成新货架编码为：<%=hjbh%>");
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