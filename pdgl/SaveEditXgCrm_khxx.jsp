<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String jlbz=cf.GB2Uni(request.getParameter("jlbz"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
java.sql.Date pdsj=null;
ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
String wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update pd_pdjl set sgd=?,sgbz=?,zjxm=?,pdsj=SYSDATE,pdr=?,pdsm=?,jlbz=?";
	ls_sql+=" where  khbh='"+wherekhbh+"' and sgd='"+wheresgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,sgbz);
	ps.setString(3,zjxm);
	ps.setString(4,pdr);
	ps.setString(5,pdsm);
	ps.setString(6,jlbz);
	ps.executeUpdate();
	ps.close();


//0+正常派单&5+大单抵小单&6+小单抵大单&1+回单奖励&2+公司奖励&3+设计师指定派单&4+客户指定派单
	

	ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,sgbz=?,pdsm=?,pdclzt='2',jlbz=?,zjxm=?,pzjr=?,pzjsj=?";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,pdsj);
	ps.setString(2,pdr);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setString(5,pdsm);
	ps.setString(6,jlbz);
	ps.setString(7,zjxm);
	ps.setString(8,pdr);
	ps.setDate(9,pdsj);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("错误！存盘失败");
		return;
	}
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("派单成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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