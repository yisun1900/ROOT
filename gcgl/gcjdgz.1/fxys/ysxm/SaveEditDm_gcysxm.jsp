<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcysxmbm=null;
String gcysxmmc=null;
String ysxmflbm=null;
String bz=null;
gcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
gcysxmmc=cf.GB2Uni(request.getParameter("gcysxmmc"));
ysxmflbm=cf.GB2Uni(request.getParameter("ysxmflbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String dygcjdbm=request.getParameter("dygcjdbm");
String sfhf=request.getParameter("sfhf");
String hflxbm=request.getParameter("hflxbm");
double ljskbfb=0;
ls=request.getParameter("ljskbfb");
try{
	if (!(ls.equals("")))  ljskbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ljskbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计家装收款百分比]类型转换发生意外:"+e);
	return;
}

String wheregcysxmbm=null;
wheregcysxmbm=cf.GB2Uni(request.getParameter("wheregcysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_gcysxm set gcysxmbm=?,gcysxmmc=?,ysxmflbm=?,bz=?,dygcjdbm=?,sfhf=?,hflxbm=?,ljskbfb=? ";
	ls_sql+=" where  (gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysxmbm);
	ps.setString(2,gcysxmmc);
	ps.setString(3,ysxmflbm);
	ps.setString(4,bz);
	ps.setString(5,dygcjdbm);
	ps.setString(6,sfhf);
	ps.setString(7,hflxbm);
	ps.setDouble(8,ljskbfb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>