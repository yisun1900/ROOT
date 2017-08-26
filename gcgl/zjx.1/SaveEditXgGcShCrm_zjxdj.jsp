<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String shbz=cf.GB2Uni(request.getParameter("shbz"));

String shyj=cf.GB2Uni(request.getParameter("shyj"));
String shr=cf.GB2Uni(request.getParameter("shr"));
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}

String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String getshbz="";

	ls_sql="select shbz,sfwc ";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getshbz=cf.fillNull(rs.getString("shbz"));
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N"))
	{
		out.println("错误！增减项未完成");
		return;
	}
	if (!getshbz.equals("1") && !getshbz.equals("2"))//M：不需审核；N：未审核；Y：审核通过；S：审核未通过；1：工程部审核通过；2：工程部审核未通过；3：监理部审核通过；4：监理部审核未通过；5：财务部审核通过6：财务部审核未通过
	{
		out.println("错误！状态不正确");
		return;
	}


	ls_sql="update crm_zjxdj set shbz=?,shr=?,shsj=?,shyj=?";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shbz);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shyj);
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