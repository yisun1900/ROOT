<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] cgjhph=request.getParameterValues("cgjhph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<cgjhph.length ;i++ )
	{
		String jhdzt=null;
		String ssfgs=null;
		ls_sql=" SELECT jhdzt,ssfgs ";
		ls_sql+=" FROM jxc_clcgjh ";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jhdzt=cf.fillNull(rs.getString("jhdzt"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
		}
		rs.close();
		ps.close();

		if (!jhdzt.equals("1"))//0：未提交；1：等待审核；2：审核完成；3：已分解成订单；5：正在办理入库；9：计划完结
		{
			conn.rollback();
			out.print("错误！采购计划["+cgjhph[i]+"]未提交！");
			return;
		}


		ls_sql="update jxc_clcgjh set jhdzt='0',jhsl=0,jhje=0";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除提交成功！");
	window.close();
	//-->
	</SCRIPT>

	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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