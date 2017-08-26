<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=request.getParameter("khbh");
String jdr=request.getParameter("jdr");
java.sql.Date sjjdsj=null;
String tssfxhf=request.getParameter("tssfxhf");
java.sql.Date hfsj=null;

ls=request.getParameter("sjjdsj");
try{
	if (!(ls.equals("")))  sjjdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际解冻时间]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[投诉报修回访日期]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hfdjbz=null;
try {
	conn=cf.getConnection();

	ls_sql="select hfdjbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdjbz=rs.getString("hfdjbz");
	}
	rs.close();
	ps.close();

	if (hfdjbz.equals("3"))//0：未冻结；1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结；
	{
		hfdjbz="1";
	}
	else{
		hfdjbz="0";
	}

	conn.setAutoCommit(false);

	//修改客户信息表
	ls_sql =" update  crm_khxx";
	ls_sql+=" set hfdjbz=?,jdr=?,sjjdsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfdjbz);
	ps.setString(2,jdr);
	ps.setDate(3,sjjdsj);
	ps.executeUpdate();
	ps.close();

	ls_sql =" update  crm_tsjl";
	ls_sql+=" set hfdjbz='N',jdr=?,sjjdsj=?,sfxhf=?,hfsj=?";
	ls_sql+=" where tsjlh in(";
	ls_sql+=" SELECT tsjlh ";
	ls_sql+=" FROM crm_tsjl";
    ls_sql+=" where khbh='"+khbh+"' and crm_tsjl.hfdjbz='Y' and clzt!='3'";
	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdr);
	ps.setDate(2,sjjdsj);
	ps.setString(3,tssfxhf);
	ps.setDate(4,hfsj);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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