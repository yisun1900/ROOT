<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String sglb=null;
sglb=cf.GB2Uni(request.getParameter("sglb"));
String ssfgs=null;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String sgr=null;
sgr=cf.GB2Uni(request.getParameter("sgr"));
java.sql.Date sgrq=null;
ls=request.getParameter("sgrq");
try{
	if (!(ls.equals("")))  sgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申购日期]类型转换发生意外:"+e);
	return;
}

String psfs=null;
psfs=cf.GB2Uni(request.getParameter("psfs"));
java.sql.Date jhshsj=null;
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}


String lrr=null;
java.sql.Date lrsj=null;
String ssbm=null;
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
ssbm=cf.GB2Uni(request.getParameter("ssbm"));

String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	//生成申购批号：F（Z）+fgsbh+2位年+5位流水
	String nian=cf.today("YY");
	String sgph=null;
	int count=0;
	ls_sql="select NVL(max(substr(sgph,10,4)),0)";
	ls_sql+=" from  jxc_clsgd";
	ls_sql+=" where ssfgs='"+ssfgs+"' and sglb='"+sglb+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sgph="FS"+ssfgs+nian+cf.addZero(count+1,4);

	ls_sql="insert into jxc_clsgd ( sgph,psfs,jhshsj,sgr,sgrq,ssfgs,ssbm,bz,sglb,nian  ,lrr,lrsj,sgzsl,sgzje,sfsk,sfzcgd,sgdzt,sfrksgdw ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,SYSDATE,0,0,'N','N','0','N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgph);
	ps.setString(2,psfs);
	ps.setDate(3,jhshsj);
	ps.setString(4,sgr);
	ps.setDate(5,sgrq);
	ps.setString(6,ssfgs);
	ps.setString(7,ssbm);
	ps.setString(8,bz);
	ps.setString(9,sglb);
	ps.setString(10,nian);

	ps.setString(11,lrr);
	ps.executeUpdate();
	ps.close();

	response.sendRedirect("EditJxc_clsgd.jsp?lx=1&sgph="+sgph);
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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