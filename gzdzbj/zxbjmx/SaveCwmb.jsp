<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=request.getParameter("khbh");
String mbmc=cf.GB2Uni(request.getParameter("newmbmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_gzmbxm ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	if (count>0)
	{
		out.println("<BR>错误，该模板名称已存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	ls_sql="insert into bj_gzmbxm(yhdlm,mbmc,dqbm,xmbh,xh,mblx)";
	ls_sql+=" select '"+yhdlm+"','"+mbmc+"',dqbm,xmbh,xmpx,'2'";//1：公用模板；2：私人模板
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into bj_gzmbfjxx (yhdlm,mbmc,jgwzbm,xuhao,mblx) ";
	ls_sql+=" select '"+yhdlm+"','"+mbmc+"',jgwzbm,xuhao,'2'";//1：公用模板；2：私人模板
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_gzmbgclmx (yhdlm,mbmc,dqbm,xmbh,jgwzbm,sl,mblx) ";
	ls_sql+=" select '"+yhdlm+"','"+mbmc+"',dqbm,xmbh,jgwzbm,zjhsl,'2'";//1：公用模板；2：私人模板
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
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
	out.print("<BR>Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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