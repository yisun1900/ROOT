<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cgzjxyybm=null;
java.sql.Date jhazsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
cgzjxyybm=cf.GB2Uni(request.getParameter("cgzjxyybm"));
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划安装时间]类型转换发生意外:"+e);
	return;
}
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
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date zjxfssj=null;
ls=request.getParameter("zjxfssj");
try{
	if (!(ls.equals("")))  zjxfssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxfssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}

double cgzkl=0;
ls=request.getParameter("cgzkl");
try{
	if (!(ls.equals("")))  cgzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cgzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体折扣率]类型转换发生意外:"+e);
	return;
}
double tmzkl=0;
ls=request.getParameter("tmzkl");
try{
	if (!(ls.equals("")))  tmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tmzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面折扣率]类型转换发生意外:"+e);
	return;
}
double wjzkl=0;
ls=request.getParameter("wjzkl");
try{
	if (!(ls.equals("")))  wjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金折扣率]类型转换发生意外:"+e);
	return;
}
double dqzkl=0;
ls=request.getParameter("dqzkl");
try{
	if (!(ls.equals("")))  dqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dqzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电器折扣率]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_cgzjx set cgzjxyybm=?,jhazsj=?,lrr=?,lrsj=?,bz=?,zjxfssj=?,cgzkl=?,tmzkl=?,wjzkl=?,dqzkl=?,dzyy=? ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgzjxyybm);
	ps.setDate(2,jhazsj);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,bz);
	ps.setDate(6,zjxfssj);
	ps.setDouble(7,cgzkl);
	ps.setDouble(8,tmzkl);
	ps.setDouble(9,wjzkl);
	ps.setDouble(10,dqzkl);
	ps.setString(11,dzyy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjxmx set dj=zqdj/10*"+cgzkl+",zjje=zqdj/10*"+cgzkl+"*zjsl ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lx='1'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjxmx set dj=zqdj/10*"+tmzkl+",zjje=zqdj/10*"+tmzkl+"*zjsl ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lx='2'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjxmx set dj=zqdj/10*"+wjzkl+",zjje=zqdj/10*"+wjzkl+"*zjsl ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lx='3'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjxmx set dj=zqdj/10*"+dqzkl+",zjje=zqdj/10*"+dqzkl+"*zjsl ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lx='4'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>