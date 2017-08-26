<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double dj=0;
String clgw=null;
String xmzy=null;
String bz=null;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金]类型转换发生意外:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
bz=cf.GB2Uni(request.getParameter("bz"));
java.sql.Date jhccsj=null;
java.sql.Date jhfcsj=null;
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhfcsj");
try{
	if (!(ls.equals("")))  jhfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhfcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划复测时间]类型转换发生意外:"+e);
	return;
}
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String cgsjs=cf.GB2Uni(request.getParameter("cgsjs"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String ppmc=cf.GB2Uni(request.getParameter("ppmc"));
String gys=cf.GB2Uni(request.getParameter("gys"));

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newpdgcmc=null;
	String newppmc=null;
	String newgys=null;
	if (!pdgc.equals(""))
	{
		ls_sql=" select gysmc,ppmc,gys" ;
		ls_sql+=" from sq_gysxx " ;
		ls_sql+=" where  gysbh='"+pdgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			newpdgcmc = rs.getString("gysmc");			    
			newppmc = rs.getString("ppmc");			    
			newgys = rs.getString("gys");			    
		}
		rs.close();
		ps.close();

		if (!ppmc.equals(newppmc))
		{
			out.println("<BR>！！！严重警告，[工厂:"+newpdgcmc+"]对应的品牌为:"+newppmc);
		}

		if (!gys.equals(newgys))
		{
			out.println("<BR>！！！严重警告，[工厂:"+newpdgcmc+"]对应的供应商为:"+newgys);
		}
	}
	
	
	String khbh=null;
	String oldpdgcmc=null;
	ls_sql="select khbh,pdgcmc";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		oldpdgcmc=rs.getString("pdgcmc");
	}
	rs.close();
	ps.close();
	
	conn.setAutoCommit(false);
	
	ls_sql="update jc_cgdd set dj=?,clgw=?,ztjjgw=?,xmzy=?,bz=?,jhccsj=?,jhfcsj=?,cgsjs=?,pdgc=?,pdgcmc=?,gys=?,ppmc=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dj);
	ps.setString(2,clgw);
	ps.setString(3,ztjjgw);
	ps.setString(4,xmzy);
	ps.setString(5,bz);
	ps.setDate(6,jhccsj);
	ps.setDate(7,jhfcsj);
	ps.setString(8,cgsjs);
	ps.setString(9,pdgc);
	ps.setString(10,newpdgcmc);
	ps.setString(11,gys);
	ps.setString(12,ppmc);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgzjx set clgw=?,ztjjgw=?,xmzy=?,cgsjs=?,pdgc=?,pdgcmc=?,gys=?,ppmc=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,xmzy);
	ps.setString(4,cgsjs);
	ps.setString(5,pdgc);
	ps.setString(6,newpdgcmc);
	ps.setString(7,gys);
	ps.setString(8,ppmc);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set clgw=?,ztjjgw=?,xmzy=?,jjsjs=?,pdgc=?,pdgcmc=?,ppmc=?,gys=?";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='2'";//1：木门；2：橱柜；3：家具；4：主材
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,xmzy);
	ps.setString(4,cgsjs);
	ps.setString(5,pdgc);
	ps.setString(6,newpdgcmc);
	ps.setString(7,ppmc);
	ps.setString(8,gys);
	ps.executeUpdate();
	ps.close();

	//更新财务信息
	ls_sql="update cw_khfkjl set gysbh=?";
	ls_sql+=" where  khbh='"+khbh+"' and gysbh='"+oldpdgcmc+"' and fklxbm='22'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newpdgcmc);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>