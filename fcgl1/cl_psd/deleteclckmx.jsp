<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String psdh=request.getParameter("psdh");
String clbm=request.getParameter("clbm");

double sumpssl=0;
double sumpsje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pszt=null;
	ls_sql=" SELECT pszt ";
	ls_sql+=" FROM cl_psd ";
    ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pszt=cf.fillNull(rs.getString("pszt"));
	}
	rs.close();
	ps.close();

	if (!pszt.equals("1"))//1：未提交；2：已提交；3：已配送
	{
		out.print("错误！已提交，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

/************************************************************
|		删除选中的材料										|
*************************************************************/
	ls_sql="delete from cl_psdmx where psdh='"+psdh+"' and clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("<BR>删除失败！不存在的材料编码["+clbm+"]");
		return;
	}
	ps.close();

/************************************************************
|		查询删除后出库的数量									|
*************************************************************/
	ls_sql=" SELECT sum(pssl),sum(psje) ";
	ls_sql+=" FROM cl_psdmx ";
    ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumpssl=rs.getDouble(1);
		sumpsje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		更新材料出库单中的数量									|
*************************************************************/
	ls_sql="update cl_psd set pszsl="+sumpssl+",pszje="+sumpsje;
	ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>