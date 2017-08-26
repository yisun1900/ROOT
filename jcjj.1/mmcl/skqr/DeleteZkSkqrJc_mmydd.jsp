<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yddbh=request.getParameterValues("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yddbh.length ;i++ )
	{
		String khbh=null;
		String clzt=null;
		String pdgcmc=null;
		ls_sql="select khbh,clzt,pdgcmc";
		ls_sql+=" from  jc_mmydd";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh").trim();
			clzt=rs.getString("clzt");
			pdgcmc=rs.getString("pdgcmc");
		}
		rs.close();
		ps.close();
		if (!clzt.equals("23"))
		{
			conn.rollback();
			out.println("！删除失败，预订单["+yddbh[i]+"]处理状态不正确。");
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_mmzjx";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'  ";
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
			out.println("错误，删除失败！预订单["+yddbh[i]+"]已有增减项");
			return;
		}

		ls_sql="update jc_mmydd set clzt='04',skqrsj=null,skqrr=null";
		ls_sql+=" where  yddbh='"+yddbh[i]+"' and clzt='23' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//删除客户付款记录
		ls_sql="delete from cw_khfkjl ";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='21' and ddbh='"+yddbh[i]+"' and gljlbz='N' and bz='木门收款确认自动转入'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除客户付款记录－关联
		ls_sql="delete from cw_khfkjl ";
		ls_sql+=" where khbh='"+khbh+"' and zckx='21' and zcddbh='"+yddbh[i]+"' and gljlbz='Y' and bz='木门收款确认自动转入'";
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