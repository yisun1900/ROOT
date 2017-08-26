<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String jzrq=request.getParameter("jzrq");
String dwbh=request.getParameter("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String maxjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+="  from cw_qmjz";  
	ls_sql+="  where dwbh='"+dwbh+"'";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		maxjzrq=cf.fillNull(rs.getDate(1)); 
	} 
	rs.close();
	ps.close();

	if (!maxjzrq.equals(jzrq))
	{
		out.println("错误！只能删除最新结转记录："+maxjzrq);
		return;
	}

	int czsj=0;
	ls_sql="select SYSDATE-czsj ";
	ls_sql+=" from cw_qmjz";  
	ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')";  
	ls_sql+="  and dwbh='"+dwbh+"'";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		czsj=rs.getInt(1); 
	} 
	rs.close();
	ps.close();
	if ( czsj>5 )
	{
		out.println("错误！结转已超过5天，不能再删除");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=null";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt!='3' and jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') and fgsbh='"+dwbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set tdyjjzsj=null";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='3' and jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') and fgsbh='"+dwbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from  cw_qmjz";
	ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+="  and dwbh='"+dwbh+"'";  
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from  cw_qmjzmx";
	ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+="  and fgsbh='"+dwbh+"'";  
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//客户付款记录:cw_khfkjl
	ls_sql=" update cw_khfkjl";
	ls_sql+=" set yjjzsj=null";
	ls_sql+=" where yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+=" and fgsbh='"+dwbh+"'";
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
