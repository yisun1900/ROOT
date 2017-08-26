<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String sgph=request.getParameter("sgph");
String shyj=cf.GB2Uni(request.getParameter("shyj"));
String[] oldclbm=request.getParameterValues("clbm");
String[] shsl=request.getParameterValues("shsl");

if (oldclbm.length<0)
{
	out.print("没有找到数据!!!");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
double sjshsl=0;
double sumshsl=0;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

/************************************************************
|		更改审核数量,审核状态									|
*************************************************************/
	for (int i=0;i<oldclbm.length ; i++)
	{
		sjshsl = Double.parseDouble(shsl[i]);

		ls_sql=" update cl_clsgmx set shsl='"+sjshsl+"' ";
		ls_sql+=" where sgph='"+sgph+"' and clbm='"+oldclbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

/************************************************************
|		查询审核后的数量										|
*************************************************************/
	ls_sql=" SELECT sum(shsl) ";
	ls_sql+=" FROM cl_clsgmx ";
    ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumshsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

/************************************************************
|		更新材料申购单中的数量									|
*************************************************************/
	ls_sql="update cl_clsgd set sgzt='5',sjshr='"+yhmc+"',sjshyj='"+shyj+"',sjshsj=sysdate,shzsl='"+sumshsl+"' ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审核成功!");
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