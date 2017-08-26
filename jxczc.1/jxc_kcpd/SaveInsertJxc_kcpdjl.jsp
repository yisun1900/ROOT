<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String ls=null;
long pdph=0;
String dqbm=null;
String ckbh=null;
String pdzt="1";//1：正在盘点；2：盘点结束；
String bz=null;
String pdlb=null;
pdlb=cf.GB2Uni(request.getParameter("pdlb"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql=" select max(pdph)+1 xh ";
	ls_sql+=" from jxc_kcpdjl ";
	ls_sql+=" where 1=1 ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pdph=rs.getInt("xh");
		if (pdph==0)
		{pdph=pdph+1;}
	}
	else
	{pdph=1;}
	rs.close();
	ps.close();

	ls_sql="insert into jxc_kcpdjl ( pdph,dqbm,ckbh,pdzt,pdr,pdrssbm,pdrssfgs,pdsj,bz,pdlb ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,SYSDATE,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pdph);
	ps.setString(2,dqbm);
	ps.setString(3,ckbh);
	ps.setString(4,pdzt);
	ps.setString(5,yhmc);
	ps.setString(6,dwbh);
	ps.setString(7,ssfgs);
	ps.setString(8,bz);
	ps.setString(9,pdlb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
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