<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh=request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String shbz="";
		ls_sql =" select shbz";
		ls_sql+=" from jc_gysjs";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shbz=cf.fillNull(rs.getString("shbz"));
		}
		rs.close();
		ps.close();

		if (!shbz.equals("Y"))
		{
			conn.rollback();
			out.println("<BR>´íÎó£¬¡¾"+jsjlh[i]+"¡¿Î´ÉóºË");
			return;
		}

		ls_sql="update jc_gysjs set shbz='N',shsj=null,shr=null";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
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

			if (ddbh.length()==9)
			{
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

				if (!sfjs.equals("M"))
				{
					conn.rollback();
					out.println("<BR>´íÎó£¬¶©µ¥¡¾"+ddbh+"¡¿Î´ÉóºË");
					return;
				}

				ls_sql="update jc_zcdd set sfjs='Y' ";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

			}
			else{
				String sfjs="";
				String clzt=null;
				String khbh=null;
				ls_sql =" select sfjs,clzt,khbh";
				ls_sql+=" from jc_zczjx";
				ls_sql+=" where zjxbh='"+ddbh+"'";
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

				if (!sfjs.equals("M"))
				{
					conn.rollback();
					out.println("<BR>´íÎó£¬Ôö¼õÏî¡¾"+ddbh+"¡¿Î´ÉóºË");
					return;
				}

				ls_sql="update jc_zczjx set sfjs='Y' ";
				ls_sql+=" where zjxbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		rs1.close();
		ps1.close();
	}


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("É¾³ý³É¹¦£¡");
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
