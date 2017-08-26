<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khsgjhb ";
	ls_sql+=" where khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已生成计划");
	//	return;
	}

	String mbbm=null;
	String sjkgrq=null;
	ls_sql="select mbbm,sjkgrq";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mbbm=cf.fillNull(rs.getString("mbbm"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
	}
	rs.close();
	ps.close();

	if (mbbm.equals(""))
	{
		out.println("错误！无施工进度模版模版编码");
		return;
	}

	if (sjkgrq.equals(""))
	{
		out.println("错误！未开工");
		return;
	}

	rwjh.Rwjh rwjh=new rwjh.Rwjh();
	//初始化【客户施工计划表】
	rwjh.initRw(conn,khbh,yhmc);


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>