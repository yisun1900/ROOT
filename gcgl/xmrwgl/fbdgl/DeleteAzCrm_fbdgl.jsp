<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] fbdbh = request.getParameterValues("fbdbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (inr i=0;i<fbdbh.length ;i++ )
	{
		String zt=null;
		String khbh=null;
		String cpflbm=null;
		ls_sql="select zt,khbh,cpflbm";
		ls_sql+=" from  crm_fbdgl";
		ls_sql+=" where fbdbh='"+fbdbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=cf.fillNull(rs.getString("zt"));
			khbh=cf.fillNull(rs.getString("khbh"));
			cpflbm=cf.fillNull(rs.getString("cpflbm"));
		}
		rs.close();
		ps.close();
		if (!zt.equals("9"))//1：录入、2：出方案、3：下单、4：备货完成、9：安装完成
		{
			conn.rollback();
			out.println("错误！处理状态不正确");
			return;
		}

		ls_sql="update crm_fbdgl set azlrr=null,sjazsj=null,azsfcg='N',zt='4' where zt='9'";
		ls_sql+=" where fbdbh='"+fbdbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_cpgzjl set sfxfb='Y'";
		ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

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