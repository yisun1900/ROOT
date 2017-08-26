<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bgfjlh = request.getParameterValues("bgfjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<bgfjlh.length ;i++ )
	{
		String khbh=null;
		String bfcs=null;
		ls_sql="select khbh,bfcs";
		ls_sql+=" from cw_lfbgfjl";
		ls_sql+=" where bgfjlh='"+bgfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			bfcs=cf.fillNull(rs.getString("bfcs"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，记录号不存在");
			return;
		}
		rs.close();
		ps.close();

		String gdjsjd=null;
		ls_sql="select gdjsjd";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (gdjsjd.equals("B"))
		{
			conn.rollback();
			out.println("<BR>！！！错误，已完工结算");
			return;
		}

		if (!bfcs.equals(gdjsjd))
		{
			conn.rollback();
			out.println("<BR>！！！错误，只能删除最新拨工费记录");
			return;
		}


		String oldbgfjlh="";
		String oldbfcs="";
		ls_sql="select bgfjlh,bfcs";
		ls_sql+=" from cw_lfbgfjl";
		ls_sql+=" where  khbh='"+khbh+"' and bgfjlh!='"+bgfjlh[i]+"'";
		ls_sql+=" order by bgfjlh desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			oldbgfjlh=cf.fillNull(rs.getString("bgfjlh"));
			oldbfcs=cf.fillNull(rs.getString("bfcs"));
		}
		rs.close();
		ps.close();

		if (oldbfcs.equals(""))
		{
			oldbfcs="0";
		}

		ls_sql="update crm_khxx set gdjsjd='"+oldbfcs+"',gdjsjlh='"+oldbgfjlh+"'";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		
		ls_sql="delete from cw_lfbgfjl  ";
		ls_sql+=" where bgfjlh='"+bgfjlh[i]+"'";
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