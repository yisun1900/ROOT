<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sqlString = null;

try{
	conn = cf.getConnection();
		sqlString = "update HY_KHHDPT set khwjbz='Y',gmrq=sysdate where khbh='"+yhbh+"' and khwjbz='N'";
		ps=conn.prepareStatement(sqlString);  
		ps.executeUpdate();
		ps.close();
//	out.print("<BR>存盘成功");
{%>
		<script language="javascript">
		alert("购物结束！感谢您选择松下亿达！");
//	    return;
//      window.open('printmycart.jsp');
		window.close()
		</script>
		<%}
}
catch(Exception e){
	out.println("Exception : "+e);
}
finally{
	try{
		conn.setAutoCommit(true);
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) cf.close(conn);
	}
	catch(Exception e){
		out.println("EXCEPTION: "+e);
	}
}
%>