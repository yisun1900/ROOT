<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{

		String gdjsjd=null;
		String fgsbh=null;
		ls_sql="select gdjsjd,fgsbh";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("X"))//0:未结算
		{
			conn.rollback();
			out.println("<BR>！！！错误，状态不正确");
			return;
		}

		String bfjs=null;
		ls_sql="select bfjs ";
		ls_sql+=" from  dm_sgdjscsb";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs=4 and sfwgjs='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bfjs=rs.getString("bfjs");
		}

		rs.close();
		ps.close();

		if (bfjs==null)
		{
			ls_sql="update crm_khxx set gdjsjd='I'";//A:可以第一次拨工费
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update crm_khxx set gdjsjd='L'";//A:可以第一次拨工费
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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