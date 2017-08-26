<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String wtmc=null;
String yxbz=null;
String sfkdx=null;
String fbr=null;
java.sql.Date fbsj=null;

wtmc=cf.GB2Uni(request.getParameter("wtmc"));
yxbz=cf.GB2Uni(request.getParameter("yxbz"));
sfkdx=cf.GB2Uni(request.getParameter("sfkdx"));
fbr=cf.GB2Uni(request.getParameter("fbr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fbsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发布时间]类型转换发生意外:"+e);
	return;
}
String sftxsm=cf.GB2Uni(request.getParameter("sftxsm"));
String txsmts=cf.GB2Uni(request.getParameter("txsmts"));

String wtbh=cf.GB2Uni(request.getParameter("wtbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update hdm_hfwt set wtmc=?,sfkdx=?,yxbz=?,fbr=?,fbsj=?,sftxsm=?,txsmts=? ";
	ls_sql+=" where  wtbh="+wtbh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wtmc);
	ps.setString(2,sfkdx);
	ps.setString(3,yxbz);
	ps.setString(4,fbr);
	ps.setDate(5,fbsj);
	ps.setString(6,sftxsm);
	ps.setString(7,txsmts);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from hdm_hfwtda";
	ls_sql+=" where  wtbh="+wtbh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

	String dabh=null;
	String damc=null;
	String sfyxsm=null;

	dabh=cf.GB2Uni(request.getParameter("dabh1"));
	damc=cf.GB2Uni(request.getParameter("damc1"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm1"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh2"));
	damc=cf.GB2Uni(request.getParameter("damc2"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm2"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh3"));
	damc=cf.GB2Uni(request.getParameter("damc3"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm3"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh4"));
	damc=cf.GB2Uni(request.getParameter("damc4"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm4"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh5"));
	damc=cf.GB2Uni(request.getParameter("damc5"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm5"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh6"));
	damc=cf.GB2Uni(request.getParameter("damc6"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm6"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh7"));
	damc=cf.GB2Uni(request.getParameter("damc7"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm7"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh8"));
	damc=cf.GB2Uni(request.getParameter("damc8"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm8"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh9"));
	damc=cf.GB2Uni(request.getParameter("damc9"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm9"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	dabh=cf.GB2Uni(request.getParameter("dabh10"));
	damc=cf.GB2Uni(request.getParameter("damc10"));
	sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm10"));
	if (!damc.equals(""))
	{
		ls_sql=" insert into hdm_hfwtda (wtbh,wtmc,dabh,damc,sfyxsm)";
		ls_sql+=" values ( ?,?,?,?,?) ";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,wtbh);
		ps.setString(2,wtmc);
		ps.setString(3,dabh);
		ps.setString(4,damc);
		ps.setString(5,sfyxsm);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<script language="javascript" >
	<!--
	alert("存盘成功!");
	window.close();
	//-->
	</script>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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