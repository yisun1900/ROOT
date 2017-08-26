<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String mbmc=cf.GB2Uni(request.getParameter("mbmc"));
int pos=mbmc.indexOf("+");
String yhdlm=mbmc.substring(pos+1);
mbmc=mbmc.substring(0,pos);

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_bjmbfjxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<1)
	{
		out.println("<BR>错误，该模板名称不存在");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql=" delete from bj_bjmb ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_bjmbglxmb ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_bjmbfjxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_bjmbgclmx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + ls_sql);
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