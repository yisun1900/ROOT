<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String ppbm=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String ddlx="";
		ls_sql =" select khbh,clzt,ppbm,ddlx";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			ppbm=rs.getString("ppbm");
			ddlx=cf.fillNull(rs.getString("ddlx"));
		}
		rs.close();
		ps.close();


		if (ddlx.equals("E") || ddlx.equals("9") || ddlx.equals("C"))//E：散客
		{
			if (!clzt.equals("30") && !clzt.equals("99"))
			{
				conn.rollback();
				out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
				return;
			}
		}
		else{
			if (!clzt.equals("11") && !clzt.equals("99"))
			{
				conn.rollback();
				out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
				return;
			}
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_zczjx";
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

		int dzbz=0;
		ls_sql =" select count(*)";
		ls_sql+=" from cw_khfkjl";//1：未导出；2：导出凭证；3：凭证导入
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='23' and ddbh='"+ddbh[i]+"' and czlx='2' and gljlbz='N' and bz='主材合同确认自动转入'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dzbz=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (dzbz>0)
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】转款已对账");
			return;
		}

		if (clzt.equals("11"))
		{
			ls_sql="update jc_zcdd set ddqrr=null,ddqrsj=null,clzt='09'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (clzt.equals("30"))
		{
			ls_sql="update jc_zcdd set ddqrr=null,ddqrsj=null,clzt='09'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (clzt.equals("99"))
		{
			ls_sql="update jc_zcdd set ddqrr=null,ddqrsj=null,tdqrbz='N'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//删除客户付款记录
		ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='23' and ddbh='"+ddbh[i]+"' and gljlbz='N' and bz='主材合同确认自动转入'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除客户付款记录－关联
		ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
		ls_sql+=" where khbh='"+khbh+"' and zckx='23' and zcddbh='"+ddbh[i]+"' and gljlbz='Y' and bz='主材合同确认自动转入'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>