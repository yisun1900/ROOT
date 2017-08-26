<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sjsfsl=0;
double sjcj=0;
double sjsfje=0;


ls=request.getParameter("sjsfsl");
try{
	if (!(ls.equals("")))  sjsfsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsfsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级收费数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjcj");
try{
	if (!(ls.equals("")))  sjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjcj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级差价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsfje");
try{
	if (!(ls.equals("")))  sjsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsfje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级收费金额]类型转换发生意外:"+e);
	return;
}


String khbh=null;
String wherejgwzbm=null;
String wheretccplbbm=null;
String whereppmc=null;
khbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherejgwzbm=cf.GB2Uni(request.getParameter("wherejgwzbm"));
wheretccplbbm=cf.GB2Uni(request.getParameter("wheretccplbbm"));
whereppmc=cf.GB2Uni(request.getParameter("whereppmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="update bj_khppsjcjb set sjcj=?,sjsfje=? ";
	ls_sql+=" where  (khbh='"+khbh+"') and  (jgwzbm='"+wherejgwzbm+"') and  (ppmc='"+whereppmc+"') and  (tccplbbm="+wheretccplbbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sjcj);
	ps.setDouble(2,sjsfje);
	ps.executeUpdate();
	ps.close();


	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

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