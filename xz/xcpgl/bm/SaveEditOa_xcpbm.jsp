<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xcpbm=null;
String xcpmc=null;
String xcpflbm=null;
String jldw=null;
double dj=0;
String sfxsp=null;
long xh=0;
String bz=null;
xcpbm=cf.GB2Uni(request.getParameter("xcpbm"));
xcpmc=cf.GB2Uni(request.getParameter("xcpmc"));
xcpflbm=cf.GB2Uni(request.getParameter("xcpflbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
sfxsp=cf.GB2Uni(request.getParameter("sfxsp"));
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

String[] fgsbh=request.getParameterValues("fgsbh");

String wherexcpbm=null;
wherexcpbm=cf.GB2Uni(request.getParameter("wherexcpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from oa_xcplqfw ";
	ls_sql+=" where  (xcpbm='"+wherexcpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update oa_xcpbm set xcpbm=?,xcpmc=?,xcpflbm=?,jldw=?,dj=?,sfxsp=?,xh=?,bz=? ";
	ls_sql+=" where  (xcpbm='"+wherexcpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xcpbm);
	ps.setString(2,xcpmc);
	ps.setString(3,xcpflbm);
	ps.setString(4,jldw);
	ps.setDouble(5,dj);
	ps.setString(6,sfxsp);
	ps.setLong(7,xh);
	ps.setString(8,bz);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<fgsbh.length ;i++ )
	{
		ls_sql="insert into oa_xcplqfw ( xcpbm,fgsbh)";
		ls_sql+=" values ( ?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xcpbm);
		ps.setString(2,fgsbh[i]);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>