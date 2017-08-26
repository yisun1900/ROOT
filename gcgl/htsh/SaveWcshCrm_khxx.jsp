<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String htshr=cf.GB2Uni(request.getParameter("htshr"));
String htshyj=cf.GB2Uni(request.getParameter("htshyj"));

String ls=null;
java.sql.Date htshsj=null;
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同审核时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int htshdf=0;

try {
	conn=cf.getConnection();

	ls_sql="select sum(bhgsl*kf)";
	ls_sql+=" from  crm_htshmx";
	ls_sql+=" where  khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htshdf=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set htshr=?,htshsj=?,htshyj=?,htshdf=?,htshbz='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htshr);
	ps.setDate(2,htshsj);
	ps.setString(3,htshyj);
	ps.setInt(4,htshdf);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>