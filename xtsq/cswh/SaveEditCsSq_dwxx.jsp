<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String ls=null;
String jcppbz=cf.GB2Uni(request.getParameter("jcppbz"));
String zcmmbz=cf.GB2Uni(request.getParameter("zcmmbz"));
String mmbz=cf.GB2Uni(request.getParameter("mmbz"));
String cgjjbz=cf.GB2Uni(request.getParameter("cgjjbz"));
String jjbz=cf.GB2Uni(request.getParameter("jjbz"));
String zxkhlrjc=cf.GB2Uni(request.getParameter("zxkhlrjc"));
int zxkhlrts=0;
ls=request.getParameter("zxkhlrts");
try{
	if (!(ls.equals("")))  zxkhlrts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxkhlrts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[咨询客户提前录入天数]类型转换发生意外:"+e);
	return;
}
String qdkhbljc=cf.GB2Uni(request.getParameter("qdkhbljc"));
int qdkhblts=0;
ls=request.getParameter("qdkhblts");
try{
	if (!(ls.equals("")))  qdkhblts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qdkhblts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单客户补录允许天数]类型转换发生意外:"+e);
	return;
}
String dzbjjc=cf.GB2Uni(request.getParameter("dzbjjc"));
String hfsjzdsz=cf.GB2Uni(request.getParameter("hfsjzdsz"));
String xmzyglbz=cf.GB2Uni(request.getParameter("xmzyglbz"));
String jjgwglbz=cf.GB2Uni(request.getParameter("jjgwglbz"));
String jcddblxs=cf.GB2Uni(request.getParameter("jcddblxs"));
String jcddmxblxs=cf.GB2Uni(request.getParameter("jcddmxblxs"));

String kfdh=cf.GB2Uni(request.getParameter("kfdh"));
String jjsjsglbz=cf.GB2Uni(request.getParameter("jjsjsglbz"));

String djlrfs=cf.GB2Uni(request.getParameter("djlrfs"));
String kgcxhdbl=cf.GB2Uni(request.getParameter("kgcxhdbl"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="update sq_dwxx set jcppbz=?,zxkhlrjc=?,zxkhlrts=?,qdkhbljc=?,qdkhblts=?,dzbjjc=?,hfsjzdsz=?,xmzyglbz=?,jjgwglbz=?,jcddblxs=?  ,jjsjsglbz=?,jcddmxblxs=?,zcmmbz=?,mmbz=?,cgjjbz=?,jjbz=?,djlrfs=?,kgcxhdbl=? ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcppbz);
	ps.setString(2,zxkhlrjc);
	ps.setInt(3,zxkhlrts);
	ps.setString(4,qdkhbljc);
	ps.setInt(5,qdkhblts);
	ps.setString(6,dzbjjc);
	ps.setString(7,hfsjzdsz);
	ps.setString(8,xmzyglbz);
	ps.setString(9,jjgwglbz);
	ps.setString(10,jcddblxs);

	ps.setString(11,jjsjsglbz);
	ps.setString(12,jcddmxblxs);
	ps.setString(13,zcmmbz);
	ps.setString(14,mmbz);
	ps.setString(15,cgjjbz);
	ps.setString(16,jjbz);
	ps.setString(17,djlrfs);
	ps.setString(18,kgcxhdbl);

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
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






