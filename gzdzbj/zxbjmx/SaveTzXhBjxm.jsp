<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");
String[] xmpx=request.getParameterValues("xmpx");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ; i++)
	{
		if (xmpx[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！项目排序为空值");
			return;
		}

		ls_sql="update bj_bjxmmx set xmpx="+xmpx[i]+" where khbh='"+khbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//调整序号，删除中间空号
	int pxxh=0;
	String lsxh=null;
	ls_sql="SELECT xh";
	ls_sql+=" FROM bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsxh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_bjxmmx set xmpx="+pxxh+" where khbh='"+khbh+"' and xh="+lsxh;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>