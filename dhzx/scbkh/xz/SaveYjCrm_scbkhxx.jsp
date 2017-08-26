<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String zt=null;
String yjbm=null;
String yjsm=null;
String yjr=null;
java.sql.Date yjsj=null;

zt=cf.GB2Uni(request.getParameter("zt"));
yjbm=cf.GB2Uni(request.getParameter("yjbm"));
yjsm=cf.GB2Uni(request.getParameter("yjsm"));
yjr=cf.GB2Uni(request.getParameter("yjr"));
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[移交时间]类型转换发生意外:"+e);
	return;
}

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khxm=null;
	ls_sql="select khxm";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where  scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_scbkhxx set zt=?,yjbm=?,yjsm=?,yjr=?,yjsj=? ";
	ls_sql+=" where  scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zt);
	ps.setString(2,yjbm);
	ps.setString(3,yjsm);
	ps.setString(4,yjr);
	ps.setDate(5,yjsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_scbkhyjjl (scbkhbh,khxm,yjr,yjsj,yjbm,yjsm)";
	ls_sql+=" values ( ?,?,?,SYSDATE,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,scbkhbh);
	ps.setString(2,khxm);
	ps.setString(3,yjr);
	ps.setString(4,yjbm);
	ps.setString(5,yjsm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>