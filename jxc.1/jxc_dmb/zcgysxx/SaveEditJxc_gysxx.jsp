<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gysbm=0;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String gyslx=null;

String bz=null;
String sfhz=null;
ls=request.getParameter("gysbm");
try{
	if (!(ls.equals("")))  gysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gysbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[供应商编码]类型转换发生意外:"+e);
	return;
}
sfhz=cf.GB2Uni(request.getParameter("sfhz"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gyslx=cf.GB2Uni(request.getParameter("gyslx"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
gysdz=cf.GB2Uni(request.getParameter("gysdz"));
gysfzr=cf.GB2Uni(request.getParameter("gysfzr"));
gysdh=cf.GB2Uni(request.getParameter("gysdh"));
gyscz=cf.GB2Uni(request.getParameter("gyscz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));
String cllx=cf.GB2Uni(request.getParameter("cllx"));

String cwdm=null;
cwdm=cf.GB2Uni(request.getParameter("cwdm"));

String wheregysbm=null;
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

 	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  gysmc='"+gysmc+"' and dqbm='"+dqbm+"'";
	ls_sql+=" and gysbm!='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！供应商名称已存在");
		return;
	}
	
	conn.setAutoCommit(false);
	
	ls_sql="update jxc_gysxx set dqbm=?,gysmc=?,gysdz=?,gysfzr=?,gysdh=?,gyscz=?,email=?,cwdm=?,bz=?,gyslx=?,sfhz=?,cllx=? ";
	ls_sql+=" where  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,gysmc);
	ps.setString(3,gysdz);
	ps.setString(4,gysfzr);
	ps.setString(5,gysdh);
	ps.setString(6,gyscz);
	ps.setString(7,email);
	ps.setString(8,cwdm);
	ps.setString(9,bz);
	ps.setString(10,gyslx);
	ps.setString(11,sfhz);
	ps.setString(12,cllx);
	ps.executeUpdate();
	ps.close();



	ls_sql="update jxc_ppgysdzb set gysmc=?";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where gysbm not in(select gysbm from jxc_gysxx) ";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>出错:" + e);
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