<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String gcyszxmbm=null;
String gcjdbm=null;
java.sql.Date yssj=null;
String ysr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
gcyszxmbm=cf.GB2Uni(request.getParameter("gcyszxmbm"));
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收时间]类型转换发生意外:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ysjlh=null;
ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldgcyszxmbm=null;
	ls_sql="select gcyszxmbm";
	ls_sql+=" from  crm_gcyszxmjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldgcyszxmbm=rs.getString("gcyszxmbm");
	}
	else{
		out.println("错误！不存在的验收记录号："+ysjlh);
		return;
	}
	rs.close();
	ps.close();


	ls_sql="update crm_gcyszxmjl set gcyszxmbm=?,gcjdbm=?,yssj=?,ysr=?,lrr=?,lrsj=?,lrdw=?,bz=? ";
	ls_sql+=" where  (ysjlh='"+ysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcyszxmbm);
	ps.setString(2,gcjdbm);
	ps.setDate(3,yssj);
	ps.setString(4,ysr);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrdw);
	ps.setString(8,bz);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>