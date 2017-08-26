<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String tgsm=cf.GB2Uni(request.getParameter("tgsm"));
String tgyybm=cf.GB2Uni(request.getParameter("tgyybm"));
java.sql.Date tgkssj=null;
java.sql.Date gjfgsj=null;
ls=request.getParameter("tgkssj");
try{
	if (!(ls.equals("")))  tgkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tgkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gjfgsj");
try{
	if (!(ls.equals("")))  gjfgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gjfgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[估计复工日期]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String gcjdbm=null;

	ls_sql=" select gcjdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";//
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("1"))
	{
		out.println("<BR>！！！错误，客户未开工");
		return;
	}
	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
		out.println("<BR>！！！错误，客户已完工");
		return;
	}

	ls_sql="update crm_khxx set tgbz='Y',tgkssj=?,gjfgsj=?,tgyybm=?,tgsm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tgkssj);
	ps.setDate(2,gjfgsj);
	ps.setString(3,tgyybm);
	ps.setString(4,tgsm);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("停工成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
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