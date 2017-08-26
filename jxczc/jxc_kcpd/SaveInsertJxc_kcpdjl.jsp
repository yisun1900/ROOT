<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String dqbm=request.getParameter("dqbm");
String ckbh=request.getParameter("ckbh");
String bz=cf.GB2Uni(request.getParameter("bz"));
String pdlb=request.getParameter("pdlb");
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdrssbm=request.getParameter("pdrssbm");

String pdzt="1";//1：正在盘点；2：盘点结束；

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int pdph=0;
	ls_sql=" select max(NVL(pdph,0))";
	ls_sql+=" from jxc_kcpdjl ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pdph=rs.getInt(1);
	}
	rs.close();
	ps.close();

	pdph++;

	ls_sql="insert into jxc_kcpdjl ( pdph,dqbm,ckbh,pdr,pdrssbm,pdrssfgs,pdsj,bz,pdlb,pdzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,SYSDATE,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pdph);
	ps.setString(2,dqbm);
	ps.setString(3,ckbh);
	ps.setString(4,pdr);
	ps.setString(5,pdrssbm);
	ps.setString(6,ssfgs);
	ps.setString(7,bz);
	ps.setString(8,pdlb);
	ps.setString(9,pdzt);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	&nbsp;<br>&nbsp;<br>
	<center>
	<a href="dckcexcel.jsp?pdph=<%=pdph%>">点击下载库存盘点表</a>
	</center>
	<%

}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>