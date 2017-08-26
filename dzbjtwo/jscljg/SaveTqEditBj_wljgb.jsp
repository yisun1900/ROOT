<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String dqbm=null;
String cldlbm=null;
String wlbm=null;
String glmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String wlllbz=null;
double dj=0;

dqbm=cf.GB2Uni(request.getParameter("dqbm"));
cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
wlbm=cf.GB2Uni(request.getParameter("wlbm"));
glmc=cf.GB2Uni(request.getParameter("glmc"));
pp=cf.GB2Uni(request.getParameter("pp"));
xhgg=cf.GB2Uni(request.getParameter("xhgg"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
wlllbz=cf.GB2Uni(request.getParameter("wlllbz"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
String wheredqbm=request.getParameter("wheredqbm");
String wherewlbm=request.getParameter("wherewlbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
   
	int count=0;
   
    if (!wherewlbm.equals(wlbm))
	{
	   ls_sql="select count(*)";
	   ls_sql+=" from  bj_jscljgb";
	   ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+wlbm+"' ";
	   ps= conn.prepareStatement(ls_sql);
	   rs =ps.executeQuery(ls_sql);
	   if (rs.next())
	   {
		   count=rs.getInt(1);
	   }
	   rs.close();
	   ps.close();
	   if (count>0)
	   {
		  out.println("错误！物料编号已存在。物料编号："+wlbm);
		  return;
	   }
    }
	conn.setAutoCommit(false);
   
	ls_sql="update bj_jzglfxb set dqbm=?,wlbm=?,glmc=?,pp=?,xhgg=?,dj=?,wlllbz=?,jldwbm=?,lrr='"+yhmc+"',lrsj=trunc(SYSDATE)";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+wherewlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	//out.print(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,wlbm);
	ps.setString(3,glmc);
	ps.setString(4,pp);
	ps.setString(5,xhgg);
	ps.setDouble(6,dj);
	ps.setString(7,wlllbz);
	ps.setString(8,jldwbm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_jscljgb set dqbm=?,cldlbm=?,wlbm=?,glmc=?,pp=?,xhgg=?,jldwbm=?,dj=?,wlllbz=?,lrr='"+yhmc+"',lrsj=trunc(SYSDATE)";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+wherewlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,cldlbm);
	ps.setString(3,wlbm);
	ps.setString(4,glmc);
	ps.setString(5,pp);
	ps.setString(6,xhgg);
	ps.setString(7,jldwbm);
	ps.setDouble(8,dj);
	ps.setString(9,wlllbz);
	
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