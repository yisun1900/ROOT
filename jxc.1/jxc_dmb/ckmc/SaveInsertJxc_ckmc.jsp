<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ckbh=null;
String ckmc=null;
String dqbm=null;
String cksslx=null;
int xh=0;
ckmc=cf.GB2Uni(request.getParameter("ckmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
cksslx=cf.GB2Uni(request.getParameter("cksslx"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select lpad(NVL(max(substr(ckbh,3,2)),0)+1,2,0) xh";
	ls_sql+=" from  jxc_ckmc";
	ls_sql+=" where  (dqbm='"+dqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckbh=dqbm+cf.fillNull(rs.getString("xh"));
	}
	rs.close();
	ps.close();

	ls_sql="insert into jxc_ckmc ( ckbh,ckmc,dqbm,cksslx ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckbh);
	ps.setString(2,ckmc);
	ps.setString(3,dqbm);
	ps.setString(4,cksslx);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！仓库编号为：<%=ckbh%>");
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