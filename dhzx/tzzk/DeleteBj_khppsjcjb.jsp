<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String wherejgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String whereppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="delete from bj_khppsjcjb  ";
	ls_sql+=" where  (khbh='"+khbh+"') and  (jgwzbm='"+wherejgwzbm+"') and  (ppmc='"+whereppmc+"') and  (tccplbbm="+wheretccplbbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double sjsfsl=0;//升级收费数量

	//不含品牌升级
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+wherejgwzbm+"' and tccplbbm='"+wheretccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and ppmc='"+whereppmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsfsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="update bj_khzcxmxj set sjsfsl=sjsfsl+"+sjsfsl+",sjsfje=sjsfje+sjcj*"+sjsfsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+wherejgwzbm+"' and tccplbbm='"+wheretccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>