<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<% 
String ls=null;
String[] yy_cx_fgs=request.getParameterValues("yy_cx_fgs");
String[] dwmc=request.getParameterValues("dwmc");
String[] yy_cxzjzk_qnpjStr=request.getParameterValues("yy_cxzjzk_qnpj");
String[] yy_cxzjzk_bzzsStr=request.getParameterValues("yy_cxzjzk_bzzs");
String[] yy_cxzpzq_qnpjStr=request.getParameterValues("yy_cxzpzq_qnpj");
String[] yy_cxzpzq_bzzsStr=request.getParameterValues("yy_cxzpzq_bzzs");
String[] yy_cxgcfx_qnpjStr=request.getParameterValues("yy_cxgcfx_qnpj");
String[] yy_cxgcfx_bzzsStr=request.getParameterValues("yy_cxgcfx_bzzs");
String[] yy_cxrlhj_qnpjStr=request.getParameterValues("yy_cxrlhj_qnpj");
String[] yy_cxrlhj_bzzsStr=request.getParameterValues("yy_cxrlhj_bzzs");
int zqs=0;
String lrr=null;
ls=request.getParameter("zqs");
try{
	if (!(ls.equals("")))  zqs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[周期数]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try
{	
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for(int i=0;i<yy_cx_fgs.length;i++)
	{
		double yy_cxzjzk_qnpj=0;
		double yy_cxzjzk_bzzs=0;
		double yy_cxzpzq_qnpj=0;
		double yy_cxzpzq_bzzs=0;
		double yy_cxgcfx_qnpj=0;
		double yy_cxgcfx_bzzs=0;
		double yy_cxrlhj_qnpj=0;
		double yy_cxrlhj_bzzs=0;


		try{
			yy_cxzjzk_qnpj=Double.parseDouble(yy_cxzjzk_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[直接折扣去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxzjzk_bzzs=Double.parseDouble(yy_cxzjzk_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[直接折扣本周指数(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxzpzq_qnpj=Double.parseDouble(yy_cxzpzq_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[赠品赠券去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxzpzq_bzzs=Double.parseDouble(yy_cxzpzq_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[赠品赠券本周指数(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxgcfx_qnpj=Double.parseDouble(yy_cxgcfx_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[工程返现去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxgcfx_bzzs=Double.parseDouble(yy_cxgcfx_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[工程返现本周指数(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxrlhj_qnpj=Double.parseDouble(yy_cxrlhj_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[让利合计去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxrlhj_bzzs=Double.parseDouble(yy_cxrlhj_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[让利合计本周指数(%)]不是数字:"+e);
			return;
		}

		
		
		ls_sql="insert into yy_cx ( zqs,yy_cx_fgs,yy_cxzjzk_qnpj,yy_cxzjzk_bzzs,yy_cxzpzq_qnpj,yy_cxzpzq_bzzs,yy_cxgcfx_qnpj,yy_cxgcfx_bzzs,yy_cxrlhj_qnpj,yy_cxrlhj_bzzs,lrr,yy_cx_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,zqs);
		ps.setString(2,yy_cx_fgs[i]);
		ps.setDouble(3,yy_cxzjzk_qnpj);
		ps.setDouble(4,yy_cxzjzk_bzzs);
		ps.setDouble(5,yy_cxzpzq_qnpj);
		ps.setDouble(6,yy_cxzpzq_bzzs);
		ps.setDouble(7,yy_cxgcfx_qnpj);
		ps.setDouble(8,yy_cxgcfx_bzzs);
		ps.setDouble(9,yy_cxrlhj_qnpj);
		ps.setDouble(10,yy_cxrlhj_bzzs);
		ps.setString(11,lrr);
		ps.executeUpdate();
		ps.close();
	}
	
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
	
		
	
	
<html>
<head>
<title>促销折扣指标录入表</title>
</head>

<body>
</body>
</html>
