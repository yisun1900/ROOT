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

	for (int i=0;i<jsjlh.length;i++)
	{
		ls_sql="delete from jc_gysjs ";
		ls_sql+=" where jsjlh="+jsjlh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		String ddbh=null;
		ls_sql =" select ddbh";
		ls_sql+=" from jc_gysjsmx";
		ls_sql+=" where jsjlh="+jsjlh[i];
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ddbh=cf.fillNull(rs1.getString("ddbh"));

			String sfjs="";
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (!sfjs.equals("Y"))
			{
				conn.rollback();
				out.println("<BR>错误，订单【"+ddbh+"】未结算");
				return;
			}

			ls_sql="update jc_zcdd set sfjs='C',jssj=null,jsr=null,jsje=0,kcfy=0,jssm=null";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();


		ls_sql="delete from jc_gysjsmx ";
		ls_sql+=" where jsjlh="+jsjlh[i];
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
