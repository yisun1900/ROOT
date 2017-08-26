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
PreparedStatement ps1=null;
String ls_sql=null;

String khbh=null;
String clzt=null;
String fkfs=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select khbh,clzt,fkfs ";
		ls_sql+=" from jc_jjdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			fkfs=cf.fillNull(rs.getString("fkfs"));
		}
		rs.close();
		ps.close();
		if (!clzt.equals("15"))
		{
			conn.rollback();
			out.println("错误，删除失败！订单【"+ddbh[i]+"】处理状态不正确");
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_jjzjx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("错误，删除失败！订单【"+ddbh[i]+"】已有增减项");
			return;
		}
		
		ls_sql="update jc_jjdd set htqrsj=null,htqrr=null,htqrbz=null,clzt='13'";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='15'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除客户付款记录
		ls_sql="delete from cw_khfkjl ";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='24' and ddbh='"+ddbh[i]+"' and gljlbz='N' and bz='家具收款确认自动转入'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//删除客户付款记录－关联
		ls_sql="delete from cw_khfkjl ";
		ls_sql+=" where khbh='"+khbh+"' and zckx='24' and zcddbh='"+ddbh[i]+"' and gljlbz='Y' and bz='家具收款确认自动转入'";
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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>