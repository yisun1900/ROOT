<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ls=null;
String dqbm=null;
String cldlbm=null;
String wlbm=null;
String jswlbm=null;
String glmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
double dj=0;
double wljsbz=0;

dqbm=cf.GB2Uni(request.getParameter("dqbm"));
cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
wlbm=cf.GB2Uni(request.getParameter("wlbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
glmc=cf.GB2Uni(request.getParameter("glmc"));
pp=cf.GB2Uni(request.getParameter("pp"));
xhgg=cf.GB2Uni(request.getParameter("xhgg"));
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
		ls_sql+=" from  bj_jzcljgb";
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

	String jsjldwbm=null;
	ls_sql="select jldwbm";
	ls_sql+=" from  bj_jscljgb";
	ls_sql+=" where  dqbm='"+dqbm+"' and wlbm='"+jswlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjldwbm=cf.fillNull(rs.getString("jldwbm"));
	}
	rs.close();
	ps.close();
	
	
	ls_sql="update bj_jzcljgb set dqbm=?,cldlbm=?,wlbm=?,jswlbm=?,glmc=?,pp=?,xhgg=?,jldwbm=?,dj=?,lrr='"+yhmc+"',lrsj=trunc(SYSDATE)";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+wherewlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,cldlbm);
	ps.setString(3,wlbm);
	ps.setString(4,jswlbm);
	ps.setString(5,glmc);
	ps.setString(6,pp);
	ps.setString(7,xhgg);
	ps.setString(8,jldwbm);
	ps.setDouble(9,dj);
	
	
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
		parent.close();
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