<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] kpjlh = request.getParameterValues("kpjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	conn.setAutoCommit(false);

	for (int i=0;i<kpjlh.length ;i++ )
	{
		String sqkpjlh=null;//上期考评记录号
		String zxbz=null;
		ls_sql=" select sqkpjlh,zxbz";
		ls_sql+=" from  kp_pdkpjl";
		ls_sql+=" where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sqkpjlh=rs.getString("sqkpjlh");
			zxbz=rs.getString("zxbz");
		}
		else{
			conn.rollback();
			out.println("删除["+kpjlh[i]+"]失败！不存在的考评记录");
			return;
		}
		rs.close();
		ps.close();

		if (!zxbz.equals("Y"))
		{
			conn.rollback();
			out.println("删除["+kpjlh[i]+"]失败！只能修改最新的考评记录");
			return;
		}

		ls_sql=" delete from kp_pdkpmx ";
		ls_sql+=" where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from kp_pdkprgdf ";
		ls_sql+=" where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from kp_pdkpjl ";
		ls_sql+=" where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" update kp_pdkpjl set zxbz='Y'";
		ls_sql+=" where kpjlh='"+sqkpjlh+"'";
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>