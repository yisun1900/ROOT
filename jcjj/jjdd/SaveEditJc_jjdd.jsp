<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double dj=0;
String clgw=null;
String xmzy=null;
String bz=null;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金]类型转换发生意外:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
bz=cf.GB2Uni(request.getParameter("bz"));
java.sql.Date jhccsj=null;
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测时间]类型转换发生意外:"+e);
	return;
}
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String xcmgc=cf.GB2Uni(request.getParameter("xcmgc"));
String sfpsjs=cf.GB2Uni(request.getParameter("sfpsjs"));

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String clzt=null;
try {
	conn=cf.getConnection();


	String pdgcmc=null;
	String jjppmc=null;
	String jjgys=null;
	if (!pdgc.equals(""))
	{
		ls_sql="select gysmc,ppmc,gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+pdgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pdgcmc=rs.getString("gysmc");
			jjppmc=rs.getString("ppmc");
			jjgys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (pdgcmc==null)
		{
			out.println("！存盘失败，[家具工厂名称]为空。");
			return;
		}
		if (jjppmc==null)
		{
			out.println("！存盘失败，[家具品牌]为空。");
			return;
		}
		if (jjgys==null)
		{
			out.println("！存盘失败，[家具供应商]为空。");
			return;
		}
	}

	String xcmgcmc=null;
	String xcmppmc=null;
	String xcmgys=null;
	if (!xcmgc.equals(""))
	{
		ls_sql="select gysmc,ppmc,gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+xcmgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xcmgcmc=rs.getString("gysmc");
			xcmppmc=rs.getString("ppmc");
			xcmgys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (xcmgcmc==null)
		{
			out.println("！存盘失败，[型材门工厂名称]为空。");
			return;
		}
		if (xcmppmc==null)
		{
			out.println("！存盘失败，[型材门品牌]为空。");
			return;
		}
		if (xcmgys==null)
		{
			out.println("！存盘失败，[型材门供应商]为空。");
			return;
		}
	}

	ls_sql="update jc_jjdd set dj=?,clgw=?,ztjjgw=?,xmzy=?,bz=?,jhccsj=?,pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?,xcmgc=?,xcmgcmc=?,xcmgys=?,xcmppmc=?,sfpsjs=?";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dj);
	ps.setString(2,clgw);
	ps.setString(3,ztjjgw);
	ps.setString(4,xmzy);
	ps.setString(5,bz);
	ps.setDate(6,jhccsj);
	ps.setString(7,pdgc);
	ps.setString(8,pdgcmc);
	ps.setString(9,jjgys);
	ps.setString(10,jjppmc);
	ps.setString(11,xcmgc);
	ps.setString(12,xcmgcmc);
	ps.setString(13,xcmgys);
	ps.setString(14,xcmppmc);
	ps.setString(15,sfpsjs);
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