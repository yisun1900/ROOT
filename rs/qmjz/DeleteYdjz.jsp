<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML><HEAD>
<TITLE>期末结转</TITLE>
<BODY bgColor=#ffffff>

<% 
String[] jzph=request.getParameterValues("jzph");


Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jzph.length ;i++ )
	{
		String jzrq=null;
		ls_sql="select jzrq";
		ls_sql+=" from rs_ydjz ";
		ls_sql+=" where jzph='"+jzph[i]+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			jzrq=cf.fillNull(rs.getDate(1));
		} 
		rs.close();
		ps.close();

		String maxjzrq=null;
		ls_sql="select max(jzrq)";
		ls_sql+=" from rs_ydjz ";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			maxjzrq=cf.fillNull(rs.getDate(1));
		} 
		rs.close();
		ps.close();

		if (!jzrq.equals(maxjzrq))
		{
			conn.rollback();
			out.println("删除失败！只能删除最新结转记录："+maxjzrq);
			return;
		}

		ls_sql="delete from rs_yhxxqmjz ";
		ls_sql+=" where jzph='"+jzph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from rs_ydjz ";
		ls_sql+=" where jzph='"+jzph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除结转成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("数据库操作失败"+e);
	out.print("ls_sql="+ls_sql);
}
finally{
	try{
		conn.setAutoCommit(true);

		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("关闭连接发生以外,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




