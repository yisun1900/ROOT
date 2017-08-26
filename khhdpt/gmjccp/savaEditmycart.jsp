<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
String zcbm=request.getParameter("zcbm");
String sl=request.getParameter("sl");
String zje=request.getParameter("zje");

double zsl = 0;
double zje2 = 0;
try{
	zsl = Double.parseDouble(sl);
	zje2 = Double.parseDouble(zje);
}
catch(Exception e){
	out.print("数字格式不正确，请您确认");
	return;
}
Connection conn = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sqlString = null;

try{
	conn = cf.getConnection();

		sqlString = "update HY_KHHDPT set gmsl='"+zsl+"',gmje='"+zje2+"' where zcbm='"+zcbm+"' and khbh='"+yhbh+"' ";
		ps=conn.prepareStatement(sqlString);  
		ps.executeUpdate();
		ps.close();
//	out.print("<BR>存盘成功");
{%>
		<script language="javascript">
		alert("修改成功！感谢您选择松下亿达！");
//	    return;
        window.open('mycart.jsp');
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