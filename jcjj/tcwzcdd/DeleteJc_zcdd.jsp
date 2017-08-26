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
try {
	conn=cf.getConnection();

	String clzt=null;
	String xclbz=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql =" select clzt,xclbz";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			xclbz=rs.getString("xclbz");
		}
		else{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!clzt.equals("07"))
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】已完成不能删除，先删除完成状态");
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
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
			out.println("！删除失败，订单["+ddbh[i]+"]已有增减项，如果要删除，请先删除增减项。");
			return;
		}

		if (xclbz.equals("2") )//1：非定制式产品；2：定制式产品
		{
			ls_sql="update jc_zcdd set clzt='26',hkze=0,wdzje=0,htcxhdje=0,sfyyh='N',yhkssj=null,yhjzsj=null,yhnr=null,qhtsj=null,kjxsj=null";
			ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt in('07','09')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="delete from jc_zczjxmx ";
			ls_sql+=" where  ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from jc_zczjx ";
			ls_sql+=" where  ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from jc_zcddmx ";
			ls_sql+=" where  ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from jc_zcdd ";
			ls_sql+=" where  ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//集成订单
		ls_sql="delete from jc_jcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
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