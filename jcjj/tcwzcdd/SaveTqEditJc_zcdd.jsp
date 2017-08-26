<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String clgw=null;
String ddshbz=null;

java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
String xclbz=null;
java.sql.Date htshsj=null;
String xmzy=null;
java.sql.Date qhtsj=null;
java.sql.Date jhclsj=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));



ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhtzshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划通知送货时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}
xclbz=cf.GB2Uni(request.getParameter("xclbz"));
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同送货时间]类型转换发生意外:"+e);
	return;
}
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qhtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhclsj");
try{
	if (!(ls.equals("")))  jhclsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhclsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划测量时间]类型转换发生意外:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String ppmc=cf.GB2Uni(request.getParameter("ppmc"));
String gys=cf.GB2Uni(request.getParameter("gys"));

/*
String jkxz=cf.GB2Uni(request.getParameter("jkxz"));
String jkdd=cf.GB2Uni(request.getParameter("jkdd"));
*/

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newppmc=null;
	ls_sql=" select scsmc" ;
	ls_sql+=" from jxc_ppxx,jxc_ppsqfgs " ;
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm";
	ls_sql+=" and jxc_ppsqfgs.ssfgs='"+ssfgs+"' and jxc_ppxx.ppmc='"+ppbm+"'" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		newppmc = rs.getString("scsmc");			    
	}
	rs.close();
	ps.close();
	if (!ppmc.equals(newppmc))
	{
		conn.rollback();
		out.println("<BR>！！！错误，[子品牌:"+ppbm+"]对应的品牌为:"+newppmc);
		return;
	}
	
	int count=0;
	ls_sql=" select count(*)" ;
	ls_sql+=" from jxc_ppgysdzb " ;
	ls_sql+=" where ssfgs='"+ssfgs+"' and gysmc='"+gys+"'" ;
	ls_sql+=" and ppmc='"+ppbm+"'" ;

	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		count = rs.getInt(1);			    
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		conn.rollback();
		out.println("<BR>！！！错误，子品牌["+ppbm+"]与供应商["+gys+"]无对照关系");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_zcdd set clgw=?,ztjjgw=?,ddshbz=?,kjxsj=?,xclbz=?,htshsj=?,xmzy=?,qhtsj=?,jhclsj=?,bz=?,jhtzshsj=?,jjsjs=?,ppbm=?,ppmc=?,gys=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,ddshbz);
	ps.setDate(4,kjxsj);
	ps.setString(5,xclbz);
	ps.setDate(6,htshsj);
	ps.setString(7,xmzy);
	ps.setDate(8,qhtsj);
	ps.setDate(9,jhclsj);
	ps.setString(10,bz);
	ps.setDate(11,jhtzshsj);
	ps.setString(12,jjsjs);
	ps.setString(13,ppbm);
	ps.setString(14,ppmc);
	ps.setString(15,gys);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx set dwbh=?,ppmc=?,gys=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,gys);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set ppbm=?,ppmc=?,gys=?,clgw=?,ztjjgw=?,xmzy=?,jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,gys);
	ps.setString(4,clgw);
	ps.setString(5,ztjjgw);
	ps.setString(6,xmzy);
	ps.setString(7,jjsjs);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set fssj=?";
	ls_sql+=" where gjz='"+ddbh+"' and lx='4' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set pdgcmc=?,ppmc=?,gys=?,clgw=?,ztjjgw=?,xmzy=?,jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='4'";//1：木门；2：橱柜；3：家具；4：主材
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,gys);
	ps.setString(4,clgw);
	ps.setString(5,ztjjgw);
	ps.setString(6,xmzy);
	ps.setString(7,jjsjs);
	ps.executeUpdate();
	ps.close();

 	conn.commit();

	out.println("<P><P>存盘成功！");

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