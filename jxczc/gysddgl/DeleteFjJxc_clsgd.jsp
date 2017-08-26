<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sgph=request.getParameterValues("sgph");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	String gysddph=null;
	ls_sql="select gysddph";
	ls_sql+=" from  jxc_gysddglb";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		gysddph=cf.fillNull(rs1.getString("gysddph"));

		String ddzt=null;
		ls_sql="select ddzt";
		ls_sql+=" from  jxc_gysdd";
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ddzt=cf.fillNull(rs.getString("ddzt"));
		}
		rs.close();
		ps.close();

		if (!ddzt.equals("0"))//7：未提交；0：已提交；1：已下单；2：已接受；3：部分发货；5：已完成发货；4：已入库；6：正在办理入库； 9：已结算
		{
			conn.rollback();
			out.println("错误！供应商订单已下单:"+gysddph);
			return;
		}


		ls_sql="delete from jxc_gysdd ";
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jxc_gysddmx ";
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();

	for (int i=0;i<sgph.length ;i++ )
	{
		String sfzcgd=null;
		ls_sql="select sfzcgd";
		ls_sql+=" from  jxc_clsgd";
		ls_sql+=" where sgph='"+sgph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfzcgd=cf.fillNull(rs.getString("sfzcgd"));
		}
		rs.close();
		ps.close();

		if (!sfzcgd.equals("M"))//N：未转；Y：转为采购计划；M：转为供应商订单
		{
			conn.rollback();
			out.println("错误！未转为供应商订单:"+sgph[i]);
			return;
		}

		ls_sql="delete from jxc_gysddglb ";
		ls_sql+=" where sgph='"+sgph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" update  jxc_clsgd set sfzcgd='N',sfrksgdw='N'";
		ls_sql+=" where sgph='"+sgph[i]+"'";
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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