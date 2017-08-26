<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh = request.getParameterValues("jsjlh");
if (jsjlh.length>1)
{
	out.println("错误！每次只能删除一条");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="delete from jc_fcgysjs ";
	ls_sql+=" where jsjlh="+jsjlh[0];
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	String ckph=null;
	ls_sql =" select ckph";
	ls_sql+=" from jc_fcgysjsmx";
	ls_sql+=" where jsjlh="+jsjlh[0];
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ckph=cf.fillNull(rs1.getString("ckph"));

		String sfjz="";
		ls_sql =" select sfjz";
		ls_sql+=" from jxc_ckd";
		ls_sql+=" where ckph='"+ckph+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfjz=cf.fillNull(rs.getString("sfjz"));
		}
		rs.close();
		ps.close();

		if (!sfjz.equals("Y"))
		{
			conn.rollback();
			out.println("<BR>错误，出库单【"+ckph+"】未结算");
			return;
		}

		ls_sql="update jxc_ckd set sfjz='N',jzr=null,jzsj=null,jsjlh=null";
		ls_sql+=" where ckph='"+ckph+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


	ls_sql="delete from jc_fcgysjsmx ";
	ls_sql+=" where jsjlh="+jsjlh[0];
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
