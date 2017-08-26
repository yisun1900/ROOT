<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String tzyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
tzyy=cf.GB2Uni(request.getParameter("tzyy"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));


double ztsfbl=0;
ls=request.getParameter("ztsfbl");
try{
	if (!(ls.equals("")))  ztsfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ztsfbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[报价整体上浮百分比]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt="2";//1：未完成；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过

	conn.setAutoCommit(false);

/*
	ls_sql="insert into crm_tzzkjl ( khbh,tzyy,gcfqdzk,gczxzk,glfzk,sjzk,sjfzk,hdzsjz,lrr,lrsj,lrbm,clzt,tzhmll ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,tzyy);
	ps.setDouble(3,0);
	ps.setDouble(4,0);
	ps.setDouble(5,0);
	ps.setDouble(6,0);
	ps.setDouble(7,0);
	ps.setDouble(8,0);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,clzt);
	ps.executeUpdate();
	ps.close();
*/

	ls_sql="update bj_bjxmmx set zqdj=zqdj*(100+"+ztsfbl+")/100,cldj=cldj*(100+"+ztsfbl+")/100,rgdj=rgdj*(100+"+ztsfbl+")/100,jxdj=jxdj*(100+"+ztsfbl+")/100,zcf=zcf*(100+"+ztsfbl+")/100,shf=shf*(100+"+ztsfbl+")/100,ysf=ysf*(100+"+ztsfbl+")/100,qtf=qtf*(100+"+ztsfbl+")/100,dj=dj*(100+"+ztsfbl+")/100";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();




	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//根据人工调整，更新客户折扣
	dzbj.updateTzZkl(conn,khbh,"yz");

	//更新报价折扣
	dzbj.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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