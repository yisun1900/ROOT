<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yjjzsj=request.getParameter("yjjzsj");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String maxyjjzsj=null;
	String scsj=null;
	ls_sql="select max(yjjzsj),SYSDATE-5 ";
	ls_sql+="  from cw_qmjz";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		maxyjjzsj=cf.fillNull(rs.getDate(1)); 
		scsj=cf.fillNull(rs.getDate(2)); 
	} 
	rs.close();
	ps.close();

	if (!maxyjjzsj.equals(yjjzsj))
	{
		out.println("错误！只能删除最新结转记录："+maxyjjzsj);
		return;
	}

	if ( scsj.compareTo(maxyjjzsj)>=0 )
	{
		out.println("错误！结转已超过5天，不能再删除");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=null";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='2' and yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set tdyjjzsj=null";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='3' and yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from  cw_qmjz";
	ls_sql+=" where yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from  cw_qmjzmx";
	ls_sql+=" where yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
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

