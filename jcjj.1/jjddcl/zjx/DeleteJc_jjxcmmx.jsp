<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String ddbh=request.getParameter("ddbh");
String[] xcmxh=request.getParameterValues("xcmxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再删除");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<xcmxh.length ;i++ )
	{
		String lx=null;
		ls_sql="select lx";
		ls_sql+=" from  jc_xcmzjxmx";
		ls_sql+=" where  zjxxh='"+zjxxh+"' and xcmxh='"+xcmxh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lx=cf.fillNull(rs.getString("lx"));
		}
		else{
			conn.rollback();
			out.println("错误！型材门序号不存在："+xcmxh[i]);
			return;
		}
		rs.close();
		ps.close();


		if (lx.equals("2"))//1：减项；2：增项
		{
			ls_sql="delete from jc_jjxcmmx ";
			ls_sql+=" where  xcmxh='"+xcmxh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql="delete from jc_xcmzjxmx ";
		ls_sql+=" where  zjxxh='"+zjxxh+"' and xcmxh='"+xcmxh[i]+"' ";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>