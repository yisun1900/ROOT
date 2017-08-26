<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gzsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
gzsm=cf.GB2Uni(request.getParameter("gzsm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String sfxhf=null;
java.sql.Date xchfsj=null;
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("xchfsj");
try{
	if (!(ls.equals("")))  xchfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xchfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次回访时间]类型转换发生意外:"+e);
	return;
}

String sckhyxbm=cf.GB2Uni(request.getParameter("sckhyxbm"));
java.sql.Date yyddsj=null;
ls=request.getParameter("yyddsj");
try{
	if (!(ls.equals("")))  yyddsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yyddsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预约客户到店时间]类型转换发生意外:"+e);
	return;
}

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));

String wherejlh=null;
wherejlh=cf.GB2Uni(request.getParameter("wherejlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getzt=null;
	ls_sql="select zt ";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();

	//1：跟踪；2：失败；3：移交；4：已接收；5：准备移交；6：准备失败；7：移交过期
	if (!getzt.equals("1") && !getzt.equals("2") && !getzt.equals("5") && !getzt.equals("6"))
	{
		out.println("错误！状态已改变，不能修改");
		return;
	}

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  dm_sckhyxbm";
	ls_sql+=" where sckhyxbm='"+sckhyxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_scbkhgzjl set gzsm=?,sckhyxbm=?,yyddsj=?,sfxhf=?,xchfsj=?,zt=? ,lrr=?,lrsj=?,lrbm=?";
	ls_sql+=" where  (jlh='"+wherejlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gzsm);
	ps.setString(2,sckhyxbm);
	ps.setDate(3,yyddsj);
	ps.setString(4,sfxhf);
	ps.setDate(5,xchfsj);
	ps.setString(6,zt);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_scbkhxx set sfxhf=?,xchfsj=?,zt=? ";
	ls_sql+=" where scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxhf);
	ps.setDate(2,xchfsj);
	ps.setString(3,zt);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_scbkhxx set sfxhf=?,xchfsj=?,zt=?,sckhyxbm=?,yyddsj=? ";
	ls_sql+=" where scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxhf);
	ps.setDate(2,xchfsj);
	ps.setString(3,zt);
	ps.setString(4,sckhyxbm);
	ps.setDate(5,yyddsj);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>