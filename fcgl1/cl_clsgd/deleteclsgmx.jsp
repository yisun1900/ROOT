<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=request.getParameter("sgph");
String[] oldclbm=request.getParameterValues("xhbox");
double sumsgsl=0;
//out.print(sgph+"<br>");
//for (int m=0;m<oldclbm.length;m++)
//{
//	out.print(oldclbm[m]+"<br>");
//}
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
		ls_sql="delete from cl_clsgmx where sgph='"+sgph+"' and clbm='"+cf.GB2Uni(oldclbm[i])+"'";
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
|		查询删除后申购的数量									|
*************************************************************/
	ls_sql=" SELECT sum(sgsl) ";
	ls_sql+=" FROM cl_clsgmx ";
    ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumsgsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();
/************************************************************
|		更新材料申购单中的数量									|
*************************************************************/
	ls_sql="update cl_clsgd set sgzsl='"+sumsgsl+"' ";
	ls_sql+=" where sgph='"+sgph+"' ";
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