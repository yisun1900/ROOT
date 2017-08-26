<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjqk=null;
double sqdj=0;
String clgw=null;
String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date jhccsj=null;
String dwbh=null;
String bz=null;
wjqk=cf.GB2Uni(request.getParameter("wjqk"));
ls=request.getParameter("sqdj");
try{
	if (!(ls.equals("")))  sqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金]类型转换发生意外:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
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
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String cxhdbm=request.getParameter("cxhdbm");
String wjsgsbz=null;
if (wjqk.equals("1"))//1：客户自购；2：公司购买
{
	wjsgsbz="N";
}
String xmzy=cf.GB2Uni(request.getParameter("xmzy"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String ppmc=cf.GB2Uni(request.getParameter("ppmc"));
String gys=cf.GB2Uni(request.getParameter("gys"));

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
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
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
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

	ls_sql="update jc_mmydd set wjqk=?,sqdj=?,clgw=?,lrr=?,lrsj=?,dwbh=?,bz=?,jhccsj=?,wjsgsbz=?,xmzy=?,ztjjgw=?,pdgc=?,pdgcmc=?,ppmc=?,gys=? ";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjqk);
	ps.setDouble(2,sqdj);
	ps.setString(3,clgw);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,dwbh);
	ps.setString(7,bz);
	ps.setDate(8,jhccsj);
	ps.setString(9,wjsgsbz);
	ps.setString(10,xmzy);
	ps.setString(11,ztjjgw);
	ps.setString(12,pdgc);
	ps.setString(13,newpdgcmc);
	ps.setString(14,ppmc);
	ps.setString(15,gys);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set clgw=?,ztjjgw=?,xmzy=?,pdgc=?,pdgcmc=?,ppmc=?,gys=?";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,xmzy);
	ps.setString(4,pdgc);
	ps.setString(5,newpdgcmc);
	ps.setString(6,ppmc);
	ps.setString(7,gys);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set clgw=?,ztjjgw=?,xmzy=?,pdgc=?,pdgcmc=?,ppmc=?,gys=?";
	ls_sql+=" where ddbh='"+yddbh+"' and lx='1'";//1：木门；2：橱柜；3：家具；4：主材
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,xmzy);
	ps.setString(4,pdgc);
	ps.setString(5,newpdgcmc);
	ps.setString(6,ppmc);
	ps.setString(7,gys);
	ps.executeUpdate();
	ps.close();

	//更新财务信息
	ls_sql="update cw_khfkjl set gysbh=?";
	ls_sql+=" where  khbh='"+khbh+"' and gysbh='"+oldpdgcmc+"' and fklxbm='21'";
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>