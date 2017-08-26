<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjjdqk=null;
String jdjglrr=null;
java.sql.Date jdjglrsj=null;
sjjdqk=cf.GB2Uni(request.getParameter("sjjdqk"));
jdjglrr=cf.GB2Uni(request.getParameter("jdjglrr"));
ls=request.getParameter("jdjglrsj");
try{
	if (!(ls.equals("")))  jdjglrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jdjglrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接待结果录入时间]类型转换发生意外:"+e);
	return;
}

String jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where  (jlh='"+jlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!zt.equals("1"))//1：未录结果；2：已录结果；3：已审核
	{
		out.println("错误！状态不正确，已录结果");
		return;
	}

	ls_sql="update crm_khsmjl set sjjdqk=?,jdjglrr=?,jdjglrsj=SYSDATE,zt='2' ";
	ls_sql+=" where  (jlh='"+jlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjjdqk);
	ps.setString(2,jdjglrr);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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