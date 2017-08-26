<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");


String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] damxbm=request.getParameterValues("damxbm");

String ls=null;

String jsr=null;
String jsrdw=null;
String jsrfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

jsr=cf.GB2Uni(request.getParameter("jsr"));
jsrdw=cf.GB2Uni(request.getParameter("jsrdw"));
jsrfgs=cf.GB2Uni(request.getParameter("jsrfgs"));
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

java.sql.Date yjsj=null;
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[移交时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<damxbm.length ;i++ )
	{
		int sl=0;
		String yjr=null;
		java.sql.Date oldyjsj=null;
		String yjrdw=null;
		String yjrfgs=null;

		ls_sql="select bgr,bgsj,bgrdw,bgrfgs,sl";
		ls_sql+=" from crm_gcdagl";
		ls_sql+=" where khbh='"+khbh+"' and damxbm='"+damxbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			yjr=rs.getString("bgr");
			oldyjsj=rs.getDate("bgsj");
			yjrdw=cf.fillNull(rs.getString("bgrdw"));
			yjrfgs=rs.getString("bgrfgs");
			sl=rs.getInt("sl");
		}
		rs.close();
		ps.close();

		int jlh=0;
		ls_sql="select NVL(MAX(jlh)+1,1) from crm_gcdayjjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jlh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="insert into crm_gcdayjjl ( jlh,khbh,damxbm,yjr,yjsj,oldyjsj,yjrdw,yjrfgs,jsr,jsrdw,jsrfgs,lrr,lrsj,lrrdw,bz,czlx,sl) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jlh);
		ps.setString(2,khbh);
		ps.setString(3,damxbm[i]);
		ps.setString(4,yjr);
		ps.setDate(5,yjsj);
		ps.setDate(6,oldyjsj);
		ps.setString(7,yjrdw);
		ps.setString(8,yjrfgs);
		ps.setString(9,jsr);
		ps.setString(10,jsrdw);
		ps.setString(11,jsrfgs);
		ps.setString(12,lrr);
		ps.setDate(13,lrsj);
		ps.setString(14,dwbh);
		ps.setString(15,bz);
		ps.setString(16,"I");//O：借出；I：归返
		ps.setInt(17,sl);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_gcdagl set bgr='"+jsr+"', bgrdw='"+jsrdw+"',bgrfgs='"+jsrfgs+"',bgsj=TO_DATE('"+yjsj+"','yyyy-mm-dd'),gdbz='Y'";//Y：归档；N：未归档
		ls_sql+=" where khbh='"+khbh+"' and damxbm='"+damxbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("存盘失败,发生意外: " + e );
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