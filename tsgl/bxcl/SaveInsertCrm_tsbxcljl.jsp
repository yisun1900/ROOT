<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clqk=null;
String clr=null;
java.sql.Date clsj=null;


clqk=cf.GB2Uni(request.getParameter("clqk"));
clr=cf.GB2Uni(request.getParameter("clr"));
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}

java.sql.Date sjjjsj=null;
ls=request.getParameter("sjjjsj");
try{
	if (!(ls.equals("")))  sjjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际解决时间]类型转换发生意外:"+e);
	return;
}

String clzt=request.getParameter("clzt");

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));


String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String cljlh=cf.GB2Uni(request.getParameter("cljlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String yddclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	String getclzt="";
	String ycljlh="";
	ls_sql="select clzt,cljlh";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ycljlh=cf.fillNull(rs.getString("cljlh"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("9") && !getclzt.equals("8") && !getclzt.equals("D") && !getclzt.equals("B") && !getclzt.equals("C"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	String zrbmclzt="";
	if (clzt.equals("2"))//2：未解决；3：已解决
	{
		zrbmclzt="B";//B：在处理
	}
	else {
		zrbmclzt="3";//3：已解决
	}


	ls_sql="insert into crm_tsbxcljl ( cljlh,tsjlh,tsyybm,dwbh,clr,clsj,clqk,clzt,lrr,lrsj,lrbm,yddclzt,yzrbmclzt,ycljlh,sjjjsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cljlh);
	ps.setString(2,tsjlh);
	ps.setString(3,tsyybm);
	ps.setString(4,dwbh);
	ps.setString(5,clr);
	ps.setDate(6,clsj);
	ps.setString(7,clqk);
	ps.setString(8,clzt);

	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,yddclzt);
	ps.setString(13,getclzt);
	ps.setString(14,ycljlh);
	ps.setDate(15,sjjjsj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsjl set clzt='2',zrbmclzt=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zrbmclzt);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set clqk=?,clr=?,clsj=?,clzt=?,cljlh=?,sjjjsj=? ";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clqk);
	ps.setString(2,clr);
	ps.setDate(3,clsj);
	ps.setString(4,zrbmclzt);
	ps.setString(5,cljlh);
	ps.setDate(6,sjjjsj);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and clzt not in('3','5')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		zrbmclzt="3";//3：已解决
	}
	else{
		zrbmclzt="B";//B：在处理
	}

	ls_sql="update crm_tsjl set zrbmclzt=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zrbmclzt);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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