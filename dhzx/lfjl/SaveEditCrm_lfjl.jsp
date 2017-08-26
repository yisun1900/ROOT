<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lflxbm=null;
lflxbm=request.getParameter("lflxbm");
String khbh=request.getParameter("khbh");
java.sql.Date jhsmsj=null;
ls=request.getParameter("jhsmsj");
try{
	if (!(ls.equals("")))  jhsmsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhsmsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划上门时间]类型转换发生意外:"+e);
	return;
}

String jhsmry=cf.GB2Uni(request.getParameter("jhsmry"));
String smmb=cf.GB2Uni(request.getParameter("smmb"));
String xfxqr=cf.GB2Uni(request.getParameter("xfxqr"));
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bzsm=null;
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
bzsm=cf.GB2Uni(request.getParameter("bzsm"));

String lfjlh=request.getParameter("lfjlh");

Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;
String zt=null;
if (xfxqr.equals("Y"))
{
	zt="1";//1：录入计划；2：计划确认；3：计划取消；4：上门量房
}
else{
	zt="2";
}

try {
	conn=cf.getConnection();


	ls_sql="update crm_lfjl set lflxbm=?,jhsmsj=?,jhsmry=?,smmb=?,xfxqr=?,lrr=?,lrsj=?,lrbm=?,zt=?,bzsm=?";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
 	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lflxbm);
	ps.setDate(2,jhsmsj);
	ps.setString(3,jhsmry);
	ps.setString(4,smmb);
	ps.setString(5,xfxqr);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,zt);
	ps.setString(10,bzsm);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>