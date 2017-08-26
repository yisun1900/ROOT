<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] jgwzbm=request.getParameterValues("jgwzbm");

if (jgwzbm==null)
{
	out.println("你没有选择任何数据!");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int xuhao=0;
	ls_sql="SELECT max(xuhao)";
	ls_sql+=" FROM bj_fjxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xuhao++;

	conn.setAutoCommit(false);

	for (int i=0;i<jgwzbm.length ; i++)
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("<BR>错误！房间["+cf.GB2Uni(jgwzbm[i])+"]已存在");
			return;
		}
		else{
			ls_sql="insert into bj_fjxx ( khbh,jgwzbm,xuhao ) values('"+khbh+"','"+cf.GB2Uni(jgwzbm[i])+"',"+(i+xuhao)+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}



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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>