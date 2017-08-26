<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xsdlx=null;
String sklx=null;
String sfqk=null;
String shfmc=null;
String shrlxfs=null;
String shfdz=null;
String xsy=null;
java.sql.Date xsrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
xsdlx=cf.GB2Uni(request.getParameter("xsdlx"));
sklx=cf.GB2Uni(request.getParameter("sklx"));
sfqk=cf.GB2Uni(request.getParameter("sfqk"));
shfmc=cf.GB2Uni(request.getParameter("shfmc"));
shrlxfs=cf.GB2Uni(request.getParameter("shrlxfs"));
shfdz=cf.GB2Uni(request.getParameter("shfdz"));
xsy=cf.GB2Uni(request.getParameter("xsy"));
ls=request.getParameter("xsrq");
try{
	if (!(ls.equals("")))  xsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xsrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[销售日期]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String shbm=cf.GB2Uni(request.getParameter("shbm"));

String xsph=cf.GB2Uni(request.getParameter("xsph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xsdzt=null;
	ls_sql=" SELECT xsdzt ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("0"))//0：未提交；2：提交；3：已出库 
	{
		out.print("错误！销售批号["+xsph+"]已提交，不能再修改！");
		return;
	}

	ls_sql="update jxc_fcxsd set xsdlx=?,sklx=?,sfqk=?,shfmc=?,shrlxfs=?,shfdz=?,xsy=?,xsrq=?,lrr=?,lrsj=?,lrbm=?,bz=?,shbm=? ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xsdlx);
	ps.setString(2,sklx);
	ps.setString(3,sfqk);
	ps.setString(4,shfmc);
	ps.setString(5,shrlxfs);
	ps.setString(6,shfdz);
	ps.setString(7,xsy);
	ps.setDate(8,xsrq);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,bz);
	ps.setString(13,shbm);
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