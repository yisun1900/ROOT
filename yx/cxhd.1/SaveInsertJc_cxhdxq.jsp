<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String[] xqmc=request.getParameterValues("xqmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String cxhdmc=null;
	String fgsbh=null;
	ls_sql=" SELECT cxhdmc,fgsbh ";
	ls_sql+=" FROM jc_cxhd ";
    ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	else{
		out.print("错误！促销活动不存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from jc_cxhdxq ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xqmc.length ;i++ )
	{
		
		ls_sql="insert into jc_cxhdxq (cxhdbm,cxhdmc,fgsbh,xqmc) ";
		ls_sql+=" values(?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cxhdbm);
		ps.setString(2,cxhdmc);
		ps.setString(3,fgsbh);
		ps.setString(4,cf.GB2Uni(xqmc[i]));
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
	out.print("Exception: " + e);
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