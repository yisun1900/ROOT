<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
java.sql.Date jsrq=null;
double ysglk=0;
double rgfbfb=0;
double yfrgf=0;
double bcrgf=0;

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ysglk");
try{
	if (!(ls.equals("")))  ysglk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ysglk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预算工料款]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("rgfbfb");
try{
	if (!(ls.equals("")))  rgfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rgfbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费百分比]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("yfrgf");
try{
	if (!(ls.equals("")))  yfrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfrgf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已付人工费]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("bcrgf");
try{
	if (!(ls.equals("")))  bcrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bcrgf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本次应付人工费]类型转换发生意外:"+e);
	return;
}

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
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String gdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("2"))//A:可以第一次拨工费
	{
		out.println("<BR>！！！错误，已付第二次工费");
		return;
	}

	conn.setAutoCommit(false);

	String lx="5";//5:二次拨工费

	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lx);
	ps.setString(2,jsjlh);
	ps.executeUpdate();
	ps.close();
	
	
	ls_sql="insert into cw_jrbgf ( jsjlh,khbh,sgd,sgbz,jsrq,ysglk,rgfbfb,yfrgf,bcrgf,cfje  ,lrr,lrsj,lrbm,bz,lx,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDate(5,jsrq);
	ps.setDouble(6,ysglk);
	ps.setDouble(7,rgfbfb);
	ps.setDouble(8,yfrgf);
	ps.setDouble(9,bcrgf);
	ps.setDouble(10,0);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,lrbm);
	ps.setString(14,bz);
	ps.setString(15,lx);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>