<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] scbkhbh = request.getParameterValues("scbkhbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<scbkhbh.length ;i++ )
	{

		String yyjsj=null;
		String zt="";
		ls_sql="select TRUNC(yjsj),zt";
		ls_sql+=" from  crm_scbkhxx";
		ls_sql+=" where  scbkhbh='"+scbkhbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yyjsj=cf.fillNull(rs.getDate(1));
			zt=cf.fillNull(rs.getString(2));
		}
		rs.close();
		ps.close();

		if (!zt.equals("3"))//1：跟踪；2：失败；3：移交；4：已接收；5：准备移交；6：准备失败
		{
			conn.rollback();
			out.println("错误！状态不正确:"+scbkhbh[i]);
			return;
		}

		ls_sql="update crm_scbkhxx set zt='1',yjbm=null,yjsm=null,yjr=null,yjsj=null ";
		ls_sql+=" where  scbkhbh='"+scbkhbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_scbkhyjjl  ";
		ls_sql+=" where  scbkhbh='"+scbkhbh[i]+"' and TRUNC(yjsj)=TO_DATE('"+yyjsj+"','YYYY-MM-DD')";
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>