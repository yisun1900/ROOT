<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

double zqsfje=0;
double dxzkl=0;
double sfje=0;
String bz=null;

ls=request.getParameter("zqsfje");
try{
	if (!(ls.equals("")))  zqsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqsfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前收费金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dxzkl");
try{
	if (!(ls.equals("")))  dxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单项折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sfje");
try{
	if (!(ls.equals("")))  sfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后收费金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));


String wherekhbh=null;
String wheresfxmbm=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wheresfxmbm=cf.GB2Uni(request.getParameter("wheresfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update bj_sfxmmx set zqsfje=?,dxzkl=?,sfje=?,bz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sfxmbm='"+wheresfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqsfje);
	ps.setDouble(2,dxzkl);
	ps.setDouble(3,sfje);
	ps.setString(4,bz);
	ps.executeUpdate();
	ps.close();


	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,wherekhbh,"hmy");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,wherekhbh,"hmy");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>