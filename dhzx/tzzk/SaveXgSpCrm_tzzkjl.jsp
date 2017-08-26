<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clzt=null;
String spr=null;
java.sql.Date spsj=null;
String spsm=null;
clzt=cf.GB2Uni(request.getParameter("clzt"));
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[spsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}
spsm=cf.GB2Uni(request.getParameter("spsm"));

String tzjlh=request.getParameter("tzjlh");
String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_tzzkjl set clzt=?,spr=?,spsj=?,spsm=? ";
	ls_sql+=" where  tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,spr);
	ps.setDate(3,spsj);
	ps.setString(4,spsm);
	ps.executeUpdate();
	ps.close();

	if (clzt.equals("4"))//1：未完成；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
	{
		dzbj.Tzk tzk=new dzbj.Tzk();
		//根据修改，更新客户折扣
		tzk.updateTzZkl(conn,tzjlh,khbh,"yz");
		//更新报价折扣
		tzk.updateBjZkl(conn,khbh,"yz");

		//更新其它收费项目，调整收费百分比
		dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
		newdzbj.updateSfxm(conn,khbh,"yz");

		//获取电子报价金额
		dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
		double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


		//修改：电子报价总额
		ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
		ps.executeUpdate();
		ps.close();
	}
	else{
		dzbj.Tzk tzk=new dzbj.Tzk();
		//根据人工调整，更新客户折扣
		tzk.updateHdZkl(conn,khbh,"yz");
		//更新报价折扣
		tzk.updateBjZkl(conn,khbh,"yz");

		//更新其它收费项目，调整收费百分比
		dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
		newdzbj.updateSfxm(conn,khbh,"yz");

		//获取电子报价金额
		dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
		double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");




		//修改：电子报价总额
		ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>