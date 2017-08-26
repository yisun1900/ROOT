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

String jyr=null;
String jyrssbm=null;
String jyrssgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

jyr=cf.GB2Uni(request.getParameter("jyr"));
jyrssbm=cf.GB2Uni(request.getParameter("jyrssbm"));
jyrssgs=cf.GB2Uni(request.getParameter("jyrssgs"));
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

java.sql.Date jysj=null;
ls=request.getParameter("jysj");
try{
	if (!(ls.equals("")))  jysj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jysj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[借阅时间]类型转换发生意外:"+e);
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

		ls_sql="insert into crm_gcdayjjl ( jlh,khbh,damxbm,sl,jyr,jysj,jyrssbm,jyrssgs,lrr,lrsj,lrrdw,bz,zt) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jlh);
		ps.setString(2,khbh);
		ps.setString(3,damxbm[i]);
		ps.setInt(4,sl);
		ps.setString(5,jyr);
		ps.setDate(6,jysj);
		ps.setString(7,jyrssbm);
		ps.setString(8,jyrssgs);
		ps.setString(9,lrr);
		ps.setDate(10,lrsj);
		ps.setString(11,dwbh);
		ps.setString(12,bz);
		ps.setString(13,"1");//1：借出；2：归返
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_gcdagl set bgr='"+jyr+"', bgrdw='"+jyrssbm+"',bgrfgs='"+jyrssgs+"',bgsj=TO_DATE('"+jysj+"','yyyy-mm-dd'),gdbz='N'";//Y：归档；N：未归档
		ls_sql+=" where khbh='"+khbh+"' and damxbm='"+damxbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set dalqbz='4'";//1：未建档案；2：已建档案；3：已归档；4：借出
		ls_sql+=" where khbh='"+khbh+"'";
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