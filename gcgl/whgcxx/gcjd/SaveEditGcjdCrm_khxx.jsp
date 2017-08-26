<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String ls=null;

String gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));

java.sql.Date sjkgrq=null;
ls=request.getParameter("sjkgrq");
try{
	if (!(ls.equals("")))  sjkgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjkgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际开工日期]类型转换发生意外:"+e);
	return;
}
java.sql.Date sybgcrq=null;
ls=request.getParameter("sybgcrq");
try{
	if (!(ls.equals("")))  sybgcrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sybgcrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[隐蔽工程实验收日期]类型转换发生意外:"+e);
	return;
}
java.sql.Date szqsj=null;
ls=request.getParameter("szqsj");
try{
	if (!(ls.equals("")))  szqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量szqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际中期验收时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date sjjgrq=null;
ls=request.getParameter("sjjgrq");
try{
	if (!(ls.equals("")))  sjjgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际竣工日期]类型转换发生意外:"+e);
	return;
}
java.sql.Date sjwjrq=null;
ls=request.getParameter("sjwjrq");
try{
	if (!(ls.equals("")))  sjwjrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjwjrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际完结日期]类型转换发生意外:"+e);
	return;
}



String khbh=cf.GB2Uni(request.getParameter("khbh"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xgjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  crm_khxxxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	conn.setAutoCommit(false);


	ls_sql="update crm_khxx set sjkgrq=?,sybgcrq=?,szqsj=?,sjjgrq=?,sjwjrq=?,gcjdbm=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjkgrq);
	ps.setDate(2,sybgcrq);
	ps.setDate(3,szqsj);
	ps.setDate(4,sjjgrq);
	ps.setDate(5,sjwjrq);
	ps.setString(6,gcjdbm);
	ps.executeUpdate();
	ps.close();

	ls_sql ="insert into crm_khxxxgjl (xgjlh,khbh,xgqnr,xghnr,czlx,lrr,lrsj,lrbm) ";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,"");
	ps.setString(4,sjkgrq+";"+sybgcrq+";"+szqsj+";"+sjjgrq+";"+sjwjrq+";"+gcjdbm);
	ps.setString(5,"修改工程进度");
	ps.setString(6,yhmc);
	ps.setString(7,lrbm);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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