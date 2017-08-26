<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String oldycclzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select clzt,ycclzt";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			oldycclzt=cf.fillNull(rs.getString("ycclzt"));
		}
		rs.close();
		ps.close();
		if (!clzt.equals("33") && !clzt.equals("31"))
		{
			conn.rollback();
			out.println("错误，删除失败！订单【"+ddbh[i]+"】处理状态不正确");
			return;
		}
		if (oldycclzt.equals("2") || oldycclzt.equals("3"))//1：延迟未核实；2：延迟原因属实；3：延迟原因不属实
		{
			conn.rollback();
			out.println("！错误，订单【"+ddbh[i]+"】延迟已处理，不能再修改");
			return;
		}

		ls_sql="update jc_jjdd set ksazsj=null,sazrq=null,azr=null,azsm=null,ycyybm=null,clzt=lsclzt3";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt in('33','31')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_jjazjl ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
	}

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