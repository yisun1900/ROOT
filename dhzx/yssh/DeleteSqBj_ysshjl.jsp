<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ysshjl = request.getParameterValues("ysshjl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<ysshjl.length ;i++ )
	{
		String khbh=null;
		String zxbz=null;
		String yysshjl=null;
		String yysshbz=null;
		ls_sql="select khbh,zxbz,yysshjl,yysshbz";
		ls_sql+=" from  bj_ysshjl";
		ls_sql+=" where ysshjl='"+ysshjl[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			zxbz=cf.fillNull(rs.getString("zxbz"));
			yysshjl=cf.fillNull(rs.getString("yysshjl"));
			yysshbz=cf.fillNull(rs.getString("yysshbz"));
		}
		else{
			conn.rollback();
			out.println("错误！审核记录号不存在："+ysshjl[i]);
			return;
		}
		rs.close();
		ps.close();

		double ysshdf=0;
		ls_sql="select sum(shdf)";
		ls_sql+=" from  bj_ysshjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysshdf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ysshdf=100-ysshdf;

		ls_sql="update crm_zxkhxx set ysshbz='Y',ysshdf=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,ysshdf);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_ysshjl set ysshbz='Y',xgfasqr=null,xgfasqsj=null,xgfasqsm=null ";
		ls_sql+=" where ysshjl='"+ysshjl[i]+"'";
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