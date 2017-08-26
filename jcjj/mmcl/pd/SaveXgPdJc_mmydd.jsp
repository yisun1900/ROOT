<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String paidr=cf.GB2Uni(request.getParameter("paidr"));

String ls=null;
java.sql.Date paidsj=null;
ls=request.getParameter("paidsj");
try{
	if (!(ls.equals("")))  paidsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量paidsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("02"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}

	String pdgcmc=null;
	String ppmc=null;
	String gys=null;
	ls_sql="select gysmc,ppmc,gys";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where  gysbh='"+pdgc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdgcmc=rs.getString("gysmc");
		ppmc=rs.getString("ppmc");
		gys=rs.getString("gys");
	}
	rs.close();
	ps.close();

	if (pdgcmc==null)
	{
		out.println("！存盘失败，品牌供应商名称为空。");
		return;
	}
	if (ppmc==null)
	{
		out.println("！存盘失败，品牌名称为空。");
		return;
	}
	if (gys==null)
	{
		out.println("！存盘失败，供应商名称为空。");
		return;
	}
	
	conn.setAutoCommit(false);

	ls_sql="update jc_mmydd set pdgc=?,pdgcmc=?,ppmc=?,gys=?,paidr=?,paidsj=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='02' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,ppmc);
	ps.setString(4,gys);
	ps.setString(5,paidr);
	ps.setDate(6,paidsj);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_mmzjx set pdgc=?,pdgcmc=?,ppmc=?,gys=?";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,ppmc);
	ps.setString(4,gys);
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