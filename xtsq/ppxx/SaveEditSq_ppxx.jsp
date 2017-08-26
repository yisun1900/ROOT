<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ppbm=null;
String ppmc=null;

ppbm=cf.GB2Uni(request.getParameter("ppbm"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));

String whereppbm=request.getParameter("whereppbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_ppxx";
	ls_sql+=" where ppmc='"+ppmc+"' and ppbm!="+whereppbm;
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
		out.println("错误！品牌名称已存在");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update sq_ppxx set ppbm=?,ppmc=?";
	ls_sql+=" where ppbm='"+whereppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_gysxx set ppbm=?,ppmc=?";
	ls_sql+=" where ppbm='"+whereppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
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