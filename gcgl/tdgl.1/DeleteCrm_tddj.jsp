<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] tdxh = request.getParameterValues("tdxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfthlp=null;
	String khbh=null;
	String lrr=null;
	java.sql.Date lrsj=null;

	conn.setAutoCommit(false);

	for (int i=0;i<tdxh.length ;i++ )
	{
		ls_sql="select lrr,lrsj,khbh,sfthlp";
		ls_sql+=" from  crm_tddj";
		ls_sql+=" where tdxh='"+tdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfthlp=cf.fillNull(rs.getString("sfthlp"));
			khbh=cf.fillNull(rs.getString("khbh"));
			lrr=cf.fillNull(rs.getString("lrr"));
			lrsj=rs.getDate("lrsj");
		}
		else{
			conn.rollback();
			out.println("错误！不存在的退单序号："+tdxh[i]);
			return;
		}
		rs.close();
		ps.close();

		String tdyjjzsj=null;

		ls_sql="select tdyjjzsj";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		}
		rs.close();
		ps.close();


		if (!tdyjjzsj.equals(""))
		{
			conn.rollback();
			out.println("错误！业绩已结转，不能再删除");
			return;
		}

		ls_sql="delete from crm_tddj ";
		ls_sql+=" where tdxh='"+tdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set zt='2',tdxh=null,tdsj=null where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (sfthlp.equals("Y"))//Y：退回；N：未退回
		{
			ls_sql="update yx_lqlpdj set shth='1',thdjr=null,thdjsj=null ";
			ls_sql+=" where shth='2' and khbh='"+khbh+"' and thdjr=? and thdjsj=?";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,lrr);
			ps.setDate(2,lrsj);
			ps.executeUpdate();
			ps.close();
		}
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

