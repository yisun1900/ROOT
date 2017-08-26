<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String oldcpbm=cf.GB2Uni(request.getParameter("oldcpbm"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

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

	double tcslxz=0;//套餐数量限制
	String clxlmc="";
	ls_sql="select tcslxz,clxlmc";
	ls_sql+=" FROM jxc_clxlbm";
	ls_sql+=" where clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcslxz=rs.getDouble("tcslxz");
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql=" delete from  bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and cpbm='"+oldcpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khzcxm (khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sfxclxs,sl,ptcpsm,bjjbbm,sfyx,yxkssj,yxjzsj) ";
	ls_sql+=" select ?,?,cpbm,sku,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sfxclxs,?,?,?,sfyx,yxkssj,yxjzsj  ";
	ls_sql+=" from bj_tczcbj";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,jgwzbm);
	ps.setDouble(3,sl);
	ps.setString(4,ptcpsm);
	ps.setString(5,bjjbbm);
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

	if (tcslxz>0)
	{
		if (sjsl>tcslxz)
		{
			conn.rollback();
			out.println("错误！类别【"+clxlmc+"】限制总数量，总数量["+sjsl+"]不能超过限制数量["+tcslxz+"]");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>