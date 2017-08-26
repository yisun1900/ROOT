<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bxxm=request.getParameterValues("bxxm");
String[] xmsm=request.getParameterValues("xmsm");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="delete from crm_bxxmbm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<bxxm.length ;i++ )
	{
		//未录信息
		if (bxxm[i].equals(""))
		{
			continue;
		}

		if (xmsm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[项目说明]为空");
			return;
		}

		//保修项目编码
		ls_sql="insert into crm_bxxmbm(bxxm,xmsm,xh)";
		ls_sql+=" values('"+cf.GB2Uni(bxxm[i])+"','"+cf.GB2Uni(xmsm[i])+"',"+(i+1)+")";
		ps= conn.prepareStatement(ls_sql);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>