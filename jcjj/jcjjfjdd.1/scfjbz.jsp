<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");
if (khbh.length>1)
{
	out.println("错误！每次只能删除一条");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (!fjtcbz.equals("Y"))
	{
		out.println("错误！未分解订单");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set fjtcbz='N'";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String ddbh=null;
	String clzt=null;
	String sfjs=null;
	ls_sql="select ddbh,clzt,sfjs";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh[0]+"' and ddlx in('5','6','7','8') ";
	//5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		clzt=cf.fillNull(rs.getString("clzt"));
		sfjs=cf.fillNull(rs.getString("sfjs"));

		if (!clzt.equals("09") && !clzt.equals("07"))//00：录入预订单：02：预订单已接收；03：测量已通知；05：已测量； 25：通知复尺；26：复尺；07：合同未完成；09：合同已完成；11：合同已确认；13：工厂已接收；27：入库；15：确定送货时间；17：已通知送货；18：已出库；19：已送货；21：已通知退补货；23：已退补货；30：单项完结；98:取消预订单；99：退单
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh+"】状态不正确");
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			conn.rollback();
			out.println("！删除失败，订单["+ddbh+"]已有增减项，如果要删除，请先删除增减项。");
			return;
		}

		ls_sql="delete from jc_zcdd ";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from jc_zcddmx ";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where  gjz='"+ddbh+"' and lx='4' and czlx='1'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>