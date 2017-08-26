<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] zpsqbh = request.getParameterValues("zpsqbh");
//if (cqkbh.length>1)
//{
//	out.println("错误！每次只能删除一条记录");
//	return;
//}

long sjzprs=0;
double sjzpfy=0;
java.sql.Date sjkssj=null;
java.sql.Date sjjssj=null;
String sjzpsj=null;
String zpjglrr=null;
java.sql.Date zpjglsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	for(int i=0;i<zpsqbh.length;i++){
		ls_sql="update rs_zpsq set sjzprs=?,sjzpfy=?,sjkssj=?,sjjssj=?,sjzpsj=?,zpjglrr=?,zpjglsj=?,sqzt='04' ";
		ls_sql+=" where  (zpsqbh='"+zpsqbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sjzprs);
		ps.setDouble(2,sjzpfy);
		ps.setDate(3,sjkssj);
		ps.setDate(4,sjjssj);
		ps.setString(5,sjzpsj);
		ps.setString(6,zpjglrr);
		ps.setDate(7,zpjglsj);
	//	out.println(zpsqbh[i]);
		ps.executeUpdate();
		ps.close();

		ps.close();
	}
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！请刷新列表显示删除后结果。");
	window.close();
	//-->
	</SCRIPT>
	<%
	
}
catch (Exception e) {
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>
