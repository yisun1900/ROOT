<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String tccplbbm="";
	ls_sql="select tccplbbm";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
	}
	rs.close();
	ps.close();

	String sfxzsl="";
	double bzsl=0;
	ls_sql="select sfxzsl,bzsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

	ls_sql=" delete from  bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double sjsl=0;
	double sjjshsl=0;
	double xjjsl=0;
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (sfxzsl.equals("1"))//1：可增项；2：不可增项；3：不控制
	{
		if (sjsl>bzsl)
		{
			xjjsl=sjsl-bzsl;
		}
	}
	else if (sfxzsl.equals("2"))//1：可增项；2：不可增项；3：不控制
	{
		if (sjsl>bzsl)
		{
			conn.rollback();
			out.println("错误！不可增项，实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]");
			return;
		}
	}

	ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl+",xjjsl="+xjjsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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