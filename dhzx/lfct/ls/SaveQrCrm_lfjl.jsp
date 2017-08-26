<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qrjg=cf.GB2Uni(request.getParameter("qrjg"));
String qrr=null;
java.sql.Date qrsj=null;
String qrsm=null;
qrr=cf.GB2Uni(request.getParameter("qrr"));
ls=request.getParameter("qrsj");
try{
	if (!(ls.equals("")))  qrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[确认时间]类型转换发生意外:"+e);
	return;
}
qrsm=cf.GB2Uni(request.getParameter("qrsm"));

String lfjlh=request.getParameter("lfjlh");

Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;
String zt=null;
if (qrjg.equals("Y"))
{
	zt="2";//1：录入计划；2：计划确认；3：计划取消；4：上门量房
}
else{
	zt="3";
}

try {
	conn=cf.getConnection();


	ls_sql="update crm_lfjl set qrjg=?,qrr=?,qrsj=?,zt=?,qrsm=?";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
 	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qrjg);
	ps.setString(2,qrr);
	ps.setDate(3,qrsj);
	ps.setString(4,zt);
	ps.setString(5,qrsm);
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