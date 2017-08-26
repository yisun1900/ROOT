<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String zjxxh=request.getParameter("zjxxh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String lx=request.getParameter("lx");

String[] slStr=request.getParameterValues("sl");
String[] cpbm=request.getParameterValues("cpbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");

if (cpbm==null)
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<cpbm.length;i++ )
	{
		double sl=0;
		try {
			sl=Double.parseDouble(slStr[i].trim());
		}
		catch (Exception e) {
			conn.rollback();
			out.print("错误！输入非数字:" + slStr[i]);
			return;
		}

		ls_sql="update bj_khcltcmxh set sl="+sl;
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and cpbm='"+cf.GB2Uni(cpbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_khcltcfjslh set sl=NVL((select sum(sl) from bj_khcltcmxh where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'),0)";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double bzsl=0;
		ls_sql="SELECT bzsl";
		ls_sql+=" FROM bj_khcltcfjslh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bzsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double sjsl=0;
		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and sfbpx='Y'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();



		if (sjsl>bzsl)
		{
			conn.rollback();
			out.println("错误！["+cf.GB2Uni(jgwzbm[i])+"]标配数量:"+sjsl+"大于限定数量:"+bzsl);
			return;
		}
	}



	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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