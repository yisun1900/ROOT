<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String nian=null;
String lrr=null;
java.sql.Date lrsj=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
nian=cf.GB2Uni(request.getParameter("nian"));
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

String[] yue=request.getParameterValues("yue");
String[] khczstr=request.getParameterValues("khcz");
String[] mbyue=request.getParameterValues("mbyue");
String[] mbczstr=request.getParameterValues("mbcz");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yue.length ;i++ )
	{
		double khcz=0;

		try{
			khcz=Double.parseDouble(khczstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+yue[i]+"月[考核产值]非数字:"+khczstr[i].trim());
			return;
		}

		if (khcz==0)
		{
			conn.rollback();
			out.println("<BR>"+yue[i]+"月[考核产值]不能为0");
			return;
		}

		double mbcz=0;

		try{
			mbcz=Double.parseDouble(mbczstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+yue[i]+"月[目标产值]非数字:"+mbczstr[i].trim());
			return;
		}
		if (mbcz==0)
		{
			conn.rollback();
			out.println("<BR>"+yue[i]+"月[目标产值]不能为0");
			return;
		}

		ls_sql="delete from cw_dmkhcz ";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='"+yue[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into cw_dmkhcz ( dwbh,nian,yue,khcz,mbcz,lrr,lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dwbh);
		ps.setString(2,nian);
		ps.setString(3,yue[i]);
		ps.setDouble(4,khcz);
		ps.setDouble(5,mbcz);
		ps.setString(6,lrr);
		ps.setDate(7,lrsj);
		ps.executeUpdate();
		ps.close();
	}

	
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>