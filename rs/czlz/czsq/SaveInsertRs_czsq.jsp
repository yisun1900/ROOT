<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqxh=null;
String fgsbh=null;
String dwbh=null;
long ygbh=0;
String yhmc=null;
String xzzwbm=null;

String yysm=null;

String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date sqrq=null;
String lrbm=null;
String bz=null;
sqxh=cf.GB2Uni(request.getParameter("sqxh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));


yysm=cf.GB2Uni(request.getParameter("yysm"));


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
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));


String lzyyflbm=cf.GB2Uni(request.getParameter("lzyyflbm"));
String bianhao=cf.GB2Uni(request.getParameter("bianhao"));
String sfzh=cf.GB2Uni(request.getParameter("sfzh"));
java.sql.Date rzsj=null;
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职日期]类型转换发生意外:"+e);
	return;
}
String clzt=cf.GB2Uni(request.getParameter("clzt"));
String[] ztbm=request.getParameterValues("ztbm");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  rs_czsq";
	ls_sql+=" where ygbh="+ygbh+" and clzt not in('04','05')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已录入『辞职申请』");
		return;
	}

	String sfzszg="";
	ls_sql="select sfzszg";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfzszg=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (sfzszg.equals("S") || sfzszg.equals("T"))
	{
		out.println("错误！员工已离职");
		return;
	}

	conn.setAutoCommit(false);

	String shztbm="";
	if (ztbm!=null)
	{
		for (int i=0;i<ztbm.length ;i++ )
		{
			ls_sql="insert into rs_czsqsplc ( sqxh,ztbm,xh)";
			ls_sql+=" values ( ?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sqxh);
			ps.setString(2,ztbm[i]);
			ps.setInt(3,(i+1));
			ps.executeUpdate();
			ps.close();
		}

		shztbm=ztbm[0];
	}

	ls_sql="insert into rs_czsq ( sqxh,fgsbh,dwbh,ygbh,yhmc,bianhao,sfzh,xzzwbm,rzsj,lzyyflbm   ,yysm,sqrq,lrr,lrsj,lrbm,bz,clzt,ztbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,fgsbh);
	ps.setString(3,dwbh);
	ps.setLong(4,ygbh);
	ps.setString(5,yhmc);
	ps.setString(6,bianhao);
	ps.setString(7,sfzh);
	ps.setString(8,xzzwbm);
	ps.setDate(9,rzsj);
	ps.setString(10,lzyyflbm);

	ps.setString(11,yysm);
	ps.setDate(12,sqrq);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,bz);
	ps.setString(17,clzt);
	ps.setString(18,shztbm);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>