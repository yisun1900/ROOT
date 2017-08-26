<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String fgs=request.getParameter("fgs");
String wheresql=cf.GB2Uni(request.getParameter("wheresql"));

String ls=null;

int mmsyzq=0;
ls=request.getParameter("mmsyzq");
try{
	if (!(ls.equals("")))  mmsyzq=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mmsyzq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[密码使用周期]类型转换发生意外:"+e);
	return;
}
int yxdlsbcs=0;
ls=request.getParameter("yxdlsbcs");
try{
	if (!(ls.equals("")))  yxdlsbcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxdlsbcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许登陆失败次数]类型转换发生意外:"+e);
	return;
}
int bsxtsmmzq=0;
ls=request.getParameter("bsxtsmmzq");
try{
	if (!(ls.equals("")))  bsxtsmmzq=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bsxtsmmzq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[不上系统锁密码周期]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	ls_sql="update sq_yhxx set mmsyzq=?,yxdlsbcs=?,bsxtsmmzq=?";
	ls_sql+=" where ssfgs='"+fgs+"' and sfzszg in('Y','N') and ygbh!=1 "+wheresql;
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,mmsyzq);
	ps.setInt(2,yxdlsbcs);
	ps.setInt(3,bsxtsmmzq);
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
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

