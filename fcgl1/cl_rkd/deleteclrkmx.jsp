<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=request.getParameter("rkph");
String[] oldclbm=request.getParameterValues("xhbox");
double sumrksl=0;
double sumrkje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

/************************************************************
|		删除选中的材料										|
*************************************************************/
	for (int i=0;i<oldclbm.length ; i++)
	{
		ls_sql="delete from cl_rkmx where rkph='"+rkph+"' and clbm='"+cf.GB2Uni(oldclbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("<BR>存盘失败！不存在的材料编码["+cf.GB2Uni(oldclbm[i])+"]");
			return;
		}
		ps.close();
	}
/************************************************************
|		查询删除后入库的数量									|
*************************************************************/
	ls_sql=" SELECT sum(rksl),sum(rkje) ";
	ls_sql+=" FROM cl_rkmx ";
    ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumrksl=rs.getDouble(1);
		sumrkje=rs.getDouble(2);
	}
	rs.close();
	ps.close();
/************************************************************
|		更新材料入库单中的数量									|
*************************************************************/
	ls_sql="update cl_rkd set rkzsl='"+sumrksl+"',rkzje='"+sumrkje+"' ";
	ls_sql+=" where rkph='"+rkph+"' ";
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