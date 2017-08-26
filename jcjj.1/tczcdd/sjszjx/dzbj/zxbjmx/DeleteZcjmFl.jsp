<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String zjxxh=null;
String jmfl=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
jmfl=cf.GB2Uni(cf.getParameter(request,"jmfl"));

 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sfwc="";
	String khbh="";
	ls_sql="select sfwc,khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


	conn.setAutoCommit(false);

	String jgwzbm=null;
	String tccplbbm=null;
	ls_sql="SELECT jgwzbm,tccplbbm";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jmfl='"+jmfl+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");
		tccplbbm=rs1.getString("tccplbbm");


		ls_sql="update bj_khzcxmxjh set sjjmsl=0,sjjmje=0";
		ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjsfje=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("取消减免成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>