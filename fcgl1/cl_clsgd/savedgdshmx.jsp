<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] sgph =request.getParameterValues("sgph");
String[] clbm =request.getParameterValues("clbm");
String[] shsl =request.getParameterValues("shsl");
double shzs = 0;
for (int k=0;k<clbm.length ;k++ )
{
	String sl=shsl[k];
	try{
	if (!(sl.equals("")))  shzs=Double.parseDouble(sl.trim())+shzs;
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量shsl不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[审核数量]类型转换发生意外:"+e);
		return;
	}
}
String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		sql=" update cl_clsgmx set shsl='"+shsl[i]+"' where clbm='"+clbm[i]+"' and sgph='"+sgph[i]+"' ";
		ps= conn.prepareStatement(sql);		
		ps.executeUpdate();
		ps.close();
	}	
	sql=" update cl_clsgd set shzsl='"+shzs+"',sgzt='3',zbshr='"+yhmc+"',zbshsj=sysdate where sgph='"+sgph[0]+"' ";
	ps= conn.prepareStatement(sql);		
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("审核完成！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

