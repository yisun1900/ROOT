<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] zjxbh = request.getParameterValues("zjxbh");

String ddbh=null;
String khbh=null;
String clzt=null;
String ppbm=null;
String zjxbz=null;
double zjxze=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxbh.length ;i++ )
	{
		ls_sql =" select ddbh,khbh,clzt,ppbm,zjxze";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			ddbh=rs1.getString("ddbh").trim();
			khbh=rs1.getString("khbh").trim();
			clzt=rs1.getString("clzt");
			ppbm=rs1.getString("ppbm");
			zjxze=rs1.getDouble("zjxze");

			if (!clzt.equals("02"))
			{
				conn.rollback();
				out.println("<BR>错误！[增减项编号："+zjxbh[i]+"]状态不正确");
				return;
			}

			ls_sql="update jc_zczjx set qrr=null,qrsj=null,clzt='01'";
			ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();


			//删除客户付款记录
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='23' and ddbh='"+ddbh+"' and zjxbh='"+zjxbh[i]+"' and gljlbz='N' and bz='主材增减项确认自动转入'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//删除客户付款记录－关联
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where khbh='"+khbh+"' and zckx='23' and zcddbh='"+ddbh+"' and zczjxbh='"+zjxbh[i]+"' and gljlbz='Y' and bz='主材增减项确认自动转入'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//删除客户付款记录
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='62' and zcddbh='"+ddbh+"' and zczjxbh='"+zjxbh[i]+"' and gljlbz='N' and bz='主材增减项确认自动转入'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//删除客户付款记录－关联
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where khbh='"+khbh+"' and zckx='62' and ddbh='"+ddbh+"' and zjxbh='"+zjxbh[i]+"' and gljlbz='Y' and bz='主材增减项确认自动转入'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();


		}
		rs1.close();
		ps1.close();
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>