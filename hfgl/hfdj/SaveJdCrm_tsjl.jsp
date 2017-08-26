<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String tsjlh=request.getParameter("tsjlh");
String sfxhf=request.getParameter("sfxhf");
java.sql.Date hfsj=null;

ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访日期]类型转换发生意外:"+e);
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
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdjbz=rs.getString("hfdjbz");
	}
	else{
		out.println("不存在受理序号");
		return;
	}
	rs.close();
	ps.close();

	if (hfdjbz.equals("Y"))//Y：回访冻结；N：未冻结
	{
		out.println("错误！回访已冻结");
		return;
	}
	
	//修改客户投诉记录
	ls_sql =" update  crm_tsjl";
	ls_sql+=" set sfxhf=?,hfsj=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and hfdjbz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxhf);
	ps.setDate(2,hfsj);
	ps.executeUpdate();
	ps.close();


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
	out.print("存盘失败,发生意外: " + e);
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