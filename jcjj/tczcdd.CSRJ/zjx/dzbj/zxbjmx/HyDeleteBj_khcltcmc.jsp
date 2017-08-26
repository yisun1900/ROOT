<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String lx=cf.GB2Uni(request.getParameter("lx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}



	ls_sql="update bj_khcltcmch set zjlx='1'";//1：原套餐；3：删除套餐；4：新增套餐
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";//1：温暖套餐；2：静音套餐
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();




	%>
	<SCRIPT language=javascript >
	<!--
	alert("还原成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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