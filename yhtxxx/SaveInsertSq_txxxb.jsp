<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String txfs=null;
String txlx=null;
String txgjz=null;
String txnr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
txfs=cf.GB2Uni(request.getParameter("txfs"));
txlx=cf.GB2Uni(request.getParameter("txlx"));
txgjz=cf.GB2Uni(request.getParameter("txgjz"));
txnr=cf.GB2Uni(request.getParameter("txnr"));

String kstxsj=cf.GB2Uni(request.getParameter("kstxsj"));
String kstxsj1=cf.GB2Uni(request.getParameter("kstxsj1"));


lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

int txcs=0;
ls=request.getParameter("txcs");
try{
	if (!(ls.equals("")))  txcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[txcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提醒次数]类型转换发生意外:"+e);
	return;
}
int txjg=0;
ls=request.getParameter("txjg");
try{
	if (!(ls.equals("")))  txjg=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[txjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[两次提醒间隔]类型转换发生意外:"+e);
	return;
}

String[] ygbh=request.getParameterValues("ygbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  sq_txxxb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		xh++;

		ls_sql="insert into sq_txxxb ( xh,yhdlm,ygbh,yhmc,ssfgs,dwbh,txfs,txlx,txgjz,txnr,kstxsj,txcs,txjg,xctxsj,xtxcs,lrr,lrsj,lrbm,txzt ) ";
		ls_sql+=" select ?,yhdlm,ygbh,yhmc,ssfgs,dwbh,?,?,?,?,TO_DATE('"+kstxsj+" "+kstxsj1+":00','YYYY-MM-DD hh24:mi:ss'),?,?,TO_DATE('"+kstxsj+" "+kstxsj1+":00','YYYY-MM-DD hh24:mi:ss'),?,?,SYSDATE,?,'1' ";
		ls_sql+=" from sq_yhxx  ";
		ls_sql+=" where ygbh="+ygbh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,txfs);
		ps.setString(3,txlx);
		ps.setString(4,txgjz);
		ps.setString(5,txnr);
		ps.setInt(6,txcs);
		ps.setInt(7,txjg);
		ps.setInt(8,txcs);
		ps.setString(9,lrr);
		ps.setString(10,lrbm);
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