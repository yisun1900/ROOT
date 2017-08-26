<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] khbh = request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String getclzt=null;
		ls_sql="select clzt";
		ls_sql+=" from  crm_htyczz";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getclzt=cf.fillNull(rs.getString("clzt"));
		}
		rs.close();
		ps.close();

		if (!getclzt.equals("1"))//1：未审批；2：审批同意；3：审批不同意
		{
			conn.rollback();
			out.println("错误！已审批："+khbh[i]);
			return;
		}

		String gcjdbm=null;
		gcjdbm="7";//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：客户完结；7：合同异常终止
		ls_sql="update crm_khxx set gcjdbm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gcjdbm);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update crm_htyczz set spsm=?,spr=?,spsj=TRUNC(SYSDATE),clzt='2' ";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"批量审批");
		ps.setString(2,yhmc);
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