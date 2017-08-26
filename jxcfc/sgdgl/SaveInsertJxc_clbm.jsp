<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String sgph=cf.GB2Uni(request.getParameter("sgph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double sgsl = 0;
double sgjg = 0;
double sgje = 0;
ls=request.getParameter("sgsl");
try{
	if (!(ls.equals("")))  sgsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgjg");
try{
	if (!(ls.equals("")))  sgjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申购价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgje");
try{
	if (!(ls.equals("")))  sgje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgje不存在");
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

	String sgdzt=null;
	ls_sql=" SELECT sgdzt ";
	ls_sql+=" FROM jxc_clsgd ";
    ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzt=cf.fillNull(rs.getString("sgdzt"));
	}
	rs.close();
	ps.close();

	if (!sgdzt.equals("0"))//0：未提交；1：已提交；2：审核通过；5：部分出库；3：已出库；4：已入库
	{
		out.print("错误！材料单["+sgph+"]已提交，不能再修改！");
		return;
	}

	int count=0;
	ls_sql=" select count(*) ";
	ls_sql+=" from jxc_clsgmx ";
	ls_sql+=" where clbm='"+clbm+"'  and sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//查询最大数量
	int sgxh=0;
	ls_sql="select NVL(max(sgxh),0)";
	ls_sql+=" from  jxc_clsgmx";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sgxh++;

	conn.setAutoCommit(false);

	if (count==0)
	{
		ls_sql="insert into jxc_clsgmx (sgph,sgxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,sgsl,sgjg,sgje,shsl,shjg,shje,ycksl)";
		ls_sql+=" select         ?,?   ,jxc_cljgb.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,?   ,?   ,?   ,?   ,?   ,?   ,0 ";
		ls_sql+=" from  jxc_cljgb,jxc_clbm";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
		ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sgph);
		ps.setInt(2,sgxh);
		ps.setDouble(3,sgsl);
		ps.setDouble(4,sgjg);
		ps.setDouble(5,sgsl*sgjg);
		ps.setDouble(6,sgsl);
		ps.setDouble(7,sgjg);
		ps.setDouble(8,sgsl*sgjg);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_clsgmx set sgsl=?,sgjg=?,sgje=?,shsl=?,shjg=?,shje=?";
		ls_sql+=" where clbm='"+clbm+"'  and sgph='"+sgph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sgsl);
		ps.setDouble(2,sgjg);
		ps.setDouble(3,sgsl*sgjg);
		ps.setDouble(4,sgsl);
		ps.setDouble(5,sgjg);
		ps.setDouble(6,sgsl*sgjg);
		ps.executeUpdate();
		ps.close();
	}
	

	double sgzsl=0;
	double sgzje=0;
	ls_sql=" SELECT sum(shsl),sum(shje)";
	ls_sql+=" FROM jxc_clsgmx ";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgzsl=rs.getDouble(1);
		sgzje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_clsgd set sgzsl="+sgzsl+",sgzje="+sgzje;
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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