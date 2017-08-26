<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String pgcr=cf.GB2Uni(request.getParameter("pgcr"));
String pgcsm=cf.GB2Uni(request.getParameter("pgcsm"));
java.sql.Date pgcsj=null;

ls=request.getParameter("pgcsj");
try{
	if (!(ls.equals("")))  pgcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pgcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}


String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String khbh=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,khbh";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("17"))
	{
		out.println("！错误，处理状态不正确");
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
		out.println("！存盘失败，[工厂名称]为空。");
		return;
	}
	if (ppmc==null)
	{
		out.println("！存盘失败，[品牌]为空。");
		return;
	}
	if (gys==null)
	{
		out.println("！存盘失败，[供应商]为空。");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set pdgc=?,pdgcmc=?,gys=?,ppmc=?,pgcr=?,pgcsj=?,pgcsm=?";
	ls_sql+=" where  ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,gys);
	ps.setString(4,ppmc);
	ps.setString(5,pgcr);
	ps.setDate(6,pgcsj);
	ps.setString(7,pgcsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjx set pdgc=?,pdgcmc=?,gys=?,ppmc=?";
	ls_sql+=" where  ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,gys);
	ps.setString(4,ppmc);
	ps.executeUpdate();
	ps.close();

	//更新财务信息
	ls_sql="update cw_khfkjl set gysbh=?";
	ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and scbz='N' and fklxbm='22'";//22:橱柜款
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgcmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_khfkjl set zcgysbh=?";
	ls_sql+=" where khbh='"+khbh+"' and zcddbh='"+ddbh+"' and scbz='N' and zckx='22'";//22:橱柜款
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgcmc);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set pdgc=?,pdgcmc=?,gys=?,ppmc=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and lx='2'";//1：木门；2：橱柜；3：家具；4：主材
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,gys);
	ps.setString(4,ppmc);
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