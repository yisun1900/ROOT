<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] czxh = request.getParameterValues("czxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String khbh=null;
String cldlmc=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<czxh.length ;i++ )
	{
		ls_sql=" SELECT khbh ";
		ls_sql+=" FROM cl_djj ";
		ls_sql+=" where czxh='"+czxh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString(1);
		}
		else{
			conn.rollback();
			out.println("错误！不存在的操作序号："+czxh[i]);
			return;
		}
		rs.close();
		ps.close();

		ls_sql="update cl_djjmx set sjsl=sqlqsl,sjje=sqlqje";
		ls_sql+=" where czxh='"+czxh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cl_djj set shzt='1',sjsl=sqlqsl,sjje=sqlqje,shjl=null,shyj=null,shr=null,shsj=null";
		ls_sql+=" where czxh='"+czxh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" SELECT cldlmc ";
		ls_sql+=" FROM cl_djjflmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			cldlmc=rs1.getString(1);

			double xjsjje=0;
			
			ls_sql=" SELECT sum(cl_djjmx.sjje) ";
			ls_sql+=" FROM cl_djjmx,cl_djj ";
			ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"' and cl_djjmx.cldlmc='"+cldlmc+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				xjsjje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="update cl_djjflmx set sjje="+xjsjje;
			ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cldlmc+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>