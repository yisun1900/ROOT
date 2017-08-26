<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ldhtbh = request.getParameterValues("ldhtbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<ldhtbh.length ;i++ )
	{
		String ygbh="";
		String yldhtbh="";
		ls_sql="select ygbh,yldhtbh";
		ls_sql+=" from  rs_ldhtjl";
		ls_sql+=" where  ldhtbh='"+ldhtbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ygbh=cf.fillNull(rs.getString("ygbh"));
			yldhtbh=cf.fillNull(rs.getString("yldhtbh"));
		}
		else{
			conn.rollback();
			out.println("错误！『劳动合同记录』不存在："+ldhtbh[i]);
			return;
		}
		rs.close();
		ps.close();

		String getldhtbh="";
		ls_sql="select ldhtbh";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh="+ygbh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getldhtbh=cf.fillNull(rs.getString("ldhtbh"));
		}
		rs.close();
		ps.close();

		if (!getldhtbh.equals(ldhtbh[i]))
		{
			conn.rollback();
			out.println("错误！『劳动合同编号』已改变为："+getldhtbh);
			return;
		}
	
		ls_sql="delete from rs_ldhtjl";
		ls_sql+=" where  ldhtbh='"+ldhtbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		if (!yldhtbh.equals(""))
		{
			String ldhtlx=null;
			String ldhtqx=null;
			java.sql.Date htksrq=null;
			java.sql.Date htdqrq=null;
			ls_sql="select ldhtlx,ldhtqx,htksrq,htdqrq";
			ls_sql+=" from  rs_ldhtjl";
			ls_sql+=" where  ldhtbh='"+yldhtbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ldhtlx=cf.fillNull(rs.getString("ldhtlx"));
				ldhtqx=cf.fillNull(rs.getString("ldhtqx"));
				htksrq=rs.getDate("htksrq");
				htdqrq=rs.getDate("htdqrq");
			}
			rs.close();
			ps.close();

			ls_sql="update sq_yhxx set ldhtbh=?,ldhtlx=?,ldhtqx=?,htksrq=?,htdqrq=?";
			ls_sql+=" where ygbh="+ygbh;
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yldhtbh);
			ps.setString(2,ldhtlx);
			ps.setString(3,ldhtqx);
			ps.setDate(4,htksrq);
			ps.setDate(5,htdqrq);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update sq_yhxx set ldhtbh=null,ldhtlx=null,ldhtqx=null,htksrq=null,htdqrq=null";
			ls_sql+=" where ygbh="+ygbh;
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
	out.print("<BR>出错:" + e);
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