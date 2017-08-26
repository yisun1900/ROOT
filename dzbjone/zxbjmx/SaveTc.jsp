<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_tcbjxmmx ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and tcmc='"+tcmc+"'";
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
		out.println("<BR>´íÎó£¬Ì×²ÍÃû³Æ["+tcmc+"]ÒÑ´æÔÚ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into bj_tcbjxmmx(fgsbh,tcmc,xmbh,dqbm,xmpx)";
	ls_sql+=" select '"+fgsbh+"','"+tcmc+"',xmbh,dqbm,xmpx";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_tcfjxx(fgsbh,tcmc,jgwzbm,xuhao)";
	ls_sql+=" select '"+fgsbh+"','"+tcmc+"',jgwzbm,xuhao";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_tcgclmx(fgsbh,tcmc,xmbh,jgwzbm,dqbm,sl,fjnxh)";
	ls_sql+=" select '"+fgsbh+"','"+tcmc+"',xmbh,jgwzbm,dqbm,sl,fjnxh";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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