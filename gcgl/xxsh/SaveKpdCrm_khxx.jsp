<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

String xxshr=cf.GB2Uni(request.getParameter("xxshr"));
String xxshyj=cf.GB2Uni(request.getParameter("xxshyj"));
String ls=null;
java.sql.Date xxshsj=null;
ls=request.getParameter("xxshsj");
try{
	if (!(ls.equals("")))  xxshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xxshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

int htshdf=0;

try {
	conn=cf.getConnection();

	ls_sql="update crm_khxx set xxshbz='Y',xxshr=?,xxshsj=?,xxshyj=?,khxm=?,lxfs=?,fwdz=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xxshr);
	ps.setDate(2,xxshsj);
	ps.setString(3,xxshyj);
	ps.setString(4,khxm);
	ps.setString(5,lxfs);
	ps.setString(6,fwdz);
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