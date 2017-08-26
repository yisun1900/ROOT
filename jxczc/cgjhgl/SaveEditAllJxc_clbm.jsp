<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String cgjhph=request.getParameter("cgjhph");
String[] clbm=request.getParameterValues("clbm");
String[] jhcgslStr=request.getParameterValues("jhcgsl");
String[] jhcgdjstr=request.getParameterValues("jhcgdj");
double jhcgsl=0;
double jhcgdj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jhdzt=null;
	ls_sql=" SELECT jhdzt ";
	ls_sql+=" FROM jxc_clcgjh ";
    ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
	}
	rs.close();
	ps.close();

	if (!jhdzt.equals("0"))//0：未提交；1：等待审核；2：审核完成；3：已分解成订单；5：正在办理入库；9：计划完结
	{
		out.print("错误！采购计划["+cgjhph+"]已提交，不能再修改！");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		jhcgsl = Double.parseDouble(jhcgslStr[i]);
		jhcgdj = Double.parseDouble(jhcgdjstr[i].trim());

		ls_sql="update jxc_cgjhmx set jhcgsl=?,jhcgdj=?,jhcgje=? ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and cgjhph='"+cgjhph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,jhcgsl);
		ps.setDouble(2,jhcgdj);
		ps.setDouble(3,jhcgsl*jhcgdj);
		ps.executeUpdate();
		ps.close();

	}




	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>