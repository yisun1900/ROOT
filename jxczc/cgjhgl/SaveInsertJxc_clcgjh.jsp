<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String cglb=null;
String cllb=null;

String cgjhmc=null;
String cgsqr=null;

String ssfgs=null;

String bz=null;
cllb=cf.GB2Uni(request.getParameter("cllb"));
cglb=cf.GB2Uni(request.getParameter("cglb"));
cgjhmc=cf.GB2Uni(request.getParameter("cgjhmc"));
cgsqr=cf.GB2Uni(request.getParameter("cgsqr"));

ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

bz=cf.GB2Uni(request.getParameter("bz"));

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//采购计划批号：F（Z）J+fgsbh+2位年+4位流水
	String nian=cf.today("YY");
	String cgjhph=null;
	int count=0;
	ls_sql="select NVL(max(substr(cgjhph,10,4)),0)";
	ls_sql+=" from  jxc_clcgjh";
	ls_sql+=" where ssfgs='"+ssfgs+"' and cglb='"+cglb+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	cgjhph="ZJ"+ssfgs+nian+cf.addZero(count+1,4);

	ls_sql="insert into jxc_clcgjh ( cgjhph,cgjhmc,cgsqr,ssfgs,cglb,cllb,nian,lrr,lrbm,lrsj,bz  ,jhsl,jhje,jhdzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,SYSDATE,? ,0,0,'0' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgjhph);
	ps.setString(2,cgjhmc);
	ps.setString(3,cgsqr);
	ps.setString(4,ssfgs);
	ps.setString(5,cglb);
	ps.setString(6,cllb);
	ps.setString(7,nian);
	ps.setString(8,lrr);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.executeUpdate();
	ps.close();

	response.sendRedirect("EditJxc_clcgjh.jsp?lx=1&cgjhph="+cgjhph);
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