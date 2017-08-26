<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfgs=null;
String xsdlx=null;
String sklx=null;
String sfqk=null;
String shfmc=null;
String shrlxfs=null;
String shfdz=null;
String xsy=null;
java.sql.Date xsrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
xsdlx=cf.GB2Uni(request.getParameter("xsdlx"));

sklx=cf.GB2Uni(request.getParameter("sklx"));
sfqk=cf.GB2Uni(request.getParameter("sfqk"));
shfmc=cf.GB2Uni(request.getParameter("shfmc"));
shrlxfs=cf.GB2Uni(request.getParameter("shrlxfs"));
shfdz=cf.GB2Uni(request.getParameter("shfdz"));
xsy=cf.GB2Uni(request.getParameter("xsy"));
ls=request.getParameter("xsrq");
try{
	if (!(ls.equals("")))  xsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xsrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[销售日期]类型转换发生意外:"+e);
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
String cllx=cf.GB2Uni(request.getParameter("cllx"));
String shbm=cf.GB2Uni(request.getParameter("shbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//生成销售批号：FX+XX(地区)+XX(年) +XXXXX（流水）
	String xsph=null;
	String nian=cf.today("YY");
	int count=0;
	ls_sql="select NVL(max(substr(xsph,7,5)),0)";
	ls_sql+=" from  jxc_fcxsd";
	ls_sql+=" where dqbm='"+dqbm+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xsph="ZX"+dqbm+nian+cf.addZero(count+1,5);


	ls_sql="insert into jxc_fcxsd ( xsph,dqbm,ssfgs,xsdlx,sklx,sfqk,shfmc,shrlxfs,shfdz,xsy   ,xsrq,nian,lrr,lrsj,lrbm,bz,shbm,cllx,xsdzt,xszsl,xszje,cbzje,ycksl,yckje ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,'0',0,0,0,0,0) ";//0：未提交；2：提交；3：已出库 
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xsph);
	ps.setString(2,dqbm);
	ps.setString(3,ssfgs);
	ps.setString(4,xsdlx);
	ps.setString(5,sklx);
	ps.setString(6,sfqk);
	ps.setString(7,shfmc);
	ps.setString(8,shrlxfs);
	ps.setString(9,shfdz);

	ps.setString(10,xsy);
	ps.setDate(11,xsrq);
	ps.setString(12,nian);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,bz);
	ps.setString(17,shbm);
	ps.setString(18,cllx);
	ps.executeUpdate();
	ps.close();

	
	response.sendRedirect("EditJxc_fcxsd.jsp?lx=1&xsph="+xsph);
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