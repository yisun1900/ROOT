<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jssj=null;
java.sql.Date jhjjsj=null;
String jssm=null;
String jsr=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接收时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhjjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划解决时间]类型转换发生意外:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
jssm=cf.GB2Uni(request.getParameter("jssm"));

String ysjlh=request.getParameter("ysjlh");
String zgcljlh=request.getParameter("zgcljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclbz=null;
	ls_sql="select clbz";
	ls_sql+=" from crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!getclbz.equals("1") && !getclbz.equals("6"))//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！整改已接收");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_yszgcljl (zgcljlh,ysjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,ysjlh);
	ps.setString(3,"接收");
	ps.setString(4,"");
	ps.setString(5,jsr);
	ps.setString(6,jssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_heysjl set zgcljlh=?,jssj=?,jsr=?,jhjjsj=?,jssm=?,clbz='2' ";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setDate(2,jssj);
	ps.setString(3,jsr);
	ps.setDate(4,jhjjsj);
	ps.setString(5,jssm);
	ps.executeUpdate();
	ps.close();

	rwjh.Rwjh rwjh=new rwjh.Rwjh();
	//更新验收状态
	rwjh.updateYsxmZt(conn,ysjlh);
	
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