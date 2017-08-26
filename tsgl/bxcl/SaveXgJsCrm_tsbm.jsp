<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String zrbm=cf.GB2Uni(request.getParameter("zrbm"));

String clzt=cf.GB2Uni(request.getParameter("clzt"));


String jsr=cf.GB2Uni(request.getParameter("jsr"));
String jssm=cf.GB2Uni(request.getParameter("jssm"));
java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接收时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhcxcsj=null;
ls=request.getParameter("jhcxcsj");
try{
	if (!(ls.equals("")))  jhcxcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhcxcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出现场时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhcfasj=null;
ls=request.getParameter("jhcfasj");
try{
	if (!(ls.equals("")))  jhcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhcfasj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出方案时]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhjjsj=null;
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划解决时间]类型转换发生意外:"+e);
	return;
}

String sfhsgd=request.getParameter("sfhsgd");
String pdsgd=request.getParameter("pdsgd");
String hsgdyy =cf.GB2Uni(request.getParameter("hsgdyy"));
String ysgd =cf.GB2Uni(request.getParameter("ysgd"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("2") && !getclzt.equals("4") && !getclzt.equals("D"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	String wxsgd="";
	ls_sql="select sgdmc";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+pdsgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxsgd=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	if (sfhsgd.equals("Y"))//Y：换施工队；N：原施工队；T：不需施工队
	{
		if (wxsgd.equals(ysgd))
		{
			out.println("错误！选择【换施工队】，请不要选择【原施工队】");
			return;
		}
	}
	else if (sfhsgd.equals("Y"))//Y：换施工队；N：原施工队；T：不需施工队
	{
		if (!wxsgd.equals(ysgd))
		{
			out.println("错误！选择【不换施工队】，【维修施工队】不是原施工队");
			return;
		}
	}
	else{
		wxsgd="";
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_tsjl set zrbmclzt=?,sfhsgd=?,hsgdyy=?,pdsgd=?,wxsgd=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,sfhsgd);
	ps.setString(3,hsgdyy);
	ps.setString(4,pdsgd);
	ps.setString(5,wxsgd);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set jssm=?,jsr=?,jssj=?,jhcxcsj=?,jhcfasj=?,jhjjsj=?,clzt=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jssm);
	ps.setString(2,jsr);
	ps.setDate(3,jssj);
	ps.setDate(4,jhcxcsj);
	ps.setDate(5,jhcfasj);
	ps.setDate(6,jhjjsj);
	ps.setString(7,clzt);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

