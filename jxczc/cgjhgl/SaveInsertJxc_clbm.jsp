<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double jhcgsl = 0;
double jhcgdj = 0;
double jhcgje = 0;
ls=request.getParameter("jhcgsl");
try{
	if (!(ls.equals("")))  jhcgsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhcgsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhcgdj");
try{
	if (!(ls.equals("")))  jhcgdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhcgdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhcgje");
try{
	if (!(ls.equals("")))  jhcgje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhcgje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jhdzt=null;
	String ssfgs=null;
	ls_sql=" SELECT jhdzt,ssfgs ";
	ls_sql+=" FROM jxc_clcgjh ";
    ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (!jhdzt.equals("0"))//0：未提交；1：等待审核；2：审核完成；3：已分解成订单；5：正在办理入库；9：计划完结
	{
		out.print("错误！材料采购计划["+cgjhph+"]已提交，不能再修改！");
		return;
	}

	int count=0;
	ls_sql=" select count(*) ";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where clbm='"+clbm+"'  and cgjhph='"+cgjhph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//查询最大数量
	int jhxh=0;
	ls_sql="select NVL(max(jhxh),0)";
	ls_sql+=" from  jxc_cgjhmx";
	ls_sql+=" where cgjhph='"+cgjhph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jhxh++;

	conn.setAutoCommit(false);

	if (count==0)
	{
		ls_sql="insert into jxc_cgjhmx (cgjhph,jhxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,jhcgsl,jhcgdj,jhcgje,sjcgsl,sjcgdj,sjcgje)";
		ls_sql+=" select         ?,?   ,jxc_cljgb.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm   ,?      ,?     ,?     ,0     ,0     ,0 ";
		ls_sql+=" from  jxc_cljgb,jxc_clbm";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
		ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cgjhph);
		ps.setInt(2,jhxh);
		ps.setDouble(3,jhcgsl);
		ps.setDouble(4,jhcgdj);
		ps.setDouble(5,jhcgsl*jhcgdj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_cgjhmx set jhcgsl=?,jhcgdj=?,jhcgje=?";
		ls_sql+=" where clbm='"+clbm+"'  and cgjhph='"+cgjhph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,jhcgsl);
		ps.setDouble(2,jhcgdj);
		ps.setDouble(3,jhcgsl*jhcgdj);
		ps.executeUpdate();
		ps.close();
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