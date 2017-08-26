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
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String jjgys=cf.GB2Uni(request.getParameter("jjgys"));
String jjppmc=cf.GB2Uni(request.getParameter("jjppmc"));
String xcmgc=cf.GB2Uni(request.getParameter("xcmgc"));
String xcmgys=cf.GB2Uni(request.getParameter("xcmgys"));
String xcmppmc=cf.GB2Uni(request.getParameter("xcmppmc"));

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newpdgcmc=null;
	String newjjppmc=null;
	String newjjgys=null;
	ls_sql=" select gysmc,ppmc,gys" ;
	ls_sql+=" from sq_gysxx " ;
	ls_sql+=" where  gysbh='"+pdgc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		newpdgcmc = rs.getString("gysmc");			    
		newjjppmc = rs.getString("ppmc");			    
		newjjgys = rs.getString("gys");			    
	}
	rs.close();
	ps.close();

	if (!jjppmc.equals(newjjppmc))
	{
		out.println("<BR>！！！严重警告，[家具工厂:"+newpdgcmc+"]对应的品牌为:"+newjjppmc);
	}

	if (!jjgys.equals(newjjgys))
	{
		out.println("<BR>！！！严重警告，[家具工厂:"+newpdgcmc+"]对应的供应商为:"+newjjgys);
	}

	String newxcmgcmc=null;
	String newxcmppmc=null;
	String newxcmgys=null;
	ls_sql=" select gysmc,ppmc,gys" ;
	ls_sql+=" from sq_gysxx " ;
	ls_sql+=" where  gysbh='"+xcmgc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		newxcmgcmc = rs.getString("gysmc");			    
		newxcmppmc = rs.getString("ppmc");			    
		newxcmgys = rs.getString("gys");			    
	}
	rs.close();
	ps.close();

	if (!xcmppmc.equals(newxcmppmc))
	{
		out.println("<BR>！！！严重警告，[型材门工厂:"+newxcmgcmc+"]对应的品牌为:"+newxcmppmc);
	}

	if (!xcmgys.equals(newxcmgys))
	{
		out.println("<BR>！！！严重警告，[型材门工厂:"+newxcmgcmc+"]对应的供应商为:"+newxcmgys);
	}
	
	String khbh=null;
	String oldpdgcmc=null;
	String oldxcmgcmc=null;
	ls_sql="select khbh,pdgcmc,xcmgcmc";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		oldpdgcmc=rs.getString("pdgcmc");
		oldxcmgcmc=rs.getString("xcmgcmc");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set dj=?,clgw=?,ztjjgw=?,xmzy=?,bz=?,jhccsj=?,jjsjs=?,pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?";
	ls_sql+=" ,xcmgc=?,xcmgcmc=?,xcmgys=?,xcmppmc=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dj);
	ps.setString(2,clgw);
	ps.setString(3,ztjjgw);
	ps.setString(4,xmzy);
	ps.setString(5,bz);
	ps.setDate(6,jhccsj);
	ps.setString(7,jjsjs);
	ps.setString(8,pdgc);
	ps.setString(9,newpdgcmc);
	ps.setString(10,jjgys);
	ps.setString(11,jjppmc);
	ps.setString(12,xcmgc);
	ps.setString(13,newxcmgcmc);
	ps.setString(14,xcmgys);
	ps.setString(15,xcmppmc);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjzjx set pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?,xcmgc=?,xcmgcmc=?,xcmgys=?,xcmppmc=?,clgw=?,ztjjgw=?,xmzy=?,jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,newpdgcmc);
	ps.setString(3,jjgys);
	ps.setString(4,jjppmc);
	ps.setString(5,xcmgc);
	ps.setString(6,newxcmgcmc);
	ps.setString(7,xcmgys);
	ps.setString(8,xcmppmc);
	ps.setString(9,clgw);
	ps.setString(10,ztjjgw);
	ps.setString(11,xmzy);
	ps.setString(12,jjsjs);
	ps.executeUpdate();
	ps.close();

	//更新财务信息
	ls_sql="update cw_khfkjl set gysbh=?";
	ls_sql+=" where  khbh='"+khbh+"' and gysbh='"+oldpdgcmc+"' and fklxbm='24'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newpdgcmc);
	ps.executeUpdate();
	ps.close();

	//更新财务信息
	ls_sql="update cw_khfkjl set gysbh=?";
	ls_sql+=" where  khbh='"+khbh+"' and gysbh='"+oldxcmgcmc+"' and fklxbm='24'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newxcmgcmc);
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