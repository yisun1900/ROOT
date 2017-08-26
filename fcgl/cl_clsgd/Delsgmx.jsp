<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=cf.GB2Uni(request.getParameter("sgph"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double sgzsl = 0;
try {
	conn=cf.getConnection();
	ls_sql="delete from cl_clsgmx ";
	ls_sql+=" where (sgph='"+sgph+"') and clbm='"+clbm+"'  ";
	ps= conn.prepareStatement(ls_sql);   
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>删除申购明细失败！");
		return;
	}
//==========================================查询申购总数量=====================================================
	ls_sql="select sum(sgsl) sgzsl from cl_clsgmx ";
	ls_sql+=" where (sgph='"+sgph+"') ";
	ps= conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sgzsl=rs.getDouble("sgzsl");
	}
	else {sgzsl = 0;}
	ps.close();
	rs.close();
//==========================================更新申购总数量=====================================================
	ls_sql=" update cl_clsgd set sgzsl='"+sgzsl+"' where (sgph='"+sgph+"') ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql); 
	ps.executeUpdate();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
		<SCRIPT language=javascript >
		<!--
		alert("申购材料删除成功！");
		window.opener.location.reload();
		window.close();
		//-->
		</SCRIPT>
