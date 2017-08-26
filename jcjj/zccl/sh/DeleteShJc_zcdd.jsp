<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String clzt=null;
		String sfjs=null;
		String ddlx="";
		ls_sql =" select clzt,sfjs,ddlx";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			sfjs=rs.getString("sfjs");
			ddlx=cf.fillNull(rs.getString("ddlx"));
		}
		rs.close();
		ps.close();

		if (!clzt.equals("19"))
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
			return;
		}

		if (!sfjs.equals("N") && !sfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】已结算");
			return;
		}

		ls_sql="update jc_zcdd set sshr=null,sshsj=null,shqk=null,clzt=lsclzt";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zcddmx set shsl=0";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String ckph="";
		ls_sql =" select ckph";
		ls_sql+=" from jc_zcshd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ckph=cf.fillNull(rs.getString("ckph"));

			ls_sql =" update  jxc_ckd set sfth='N'";
			ls_sql+=" where ckph='"+ckph+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();

		ls_sql="delete from jc_zcshd  ";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_zcshmx  ";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
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
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>