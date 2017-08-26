<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjbbh=null;
java.sql.Date qysj=null;
java.sql.Date yxq=null;
String sfzybb=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
ls=request.getParameter("qysj");
try{
	if (!(ls.equals("")))  qysj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qysj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[启用时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxq");
try{
	if (!(ls.equals("")))  yxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效期]类型转换发生意外:"+e);
	return;
}
sfzybb=cf.GB2Uni(request.getParameter("sfzybb"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into bj_dzbjbb ( dqbm,bjbbh,qysj,yxq,sfzybb,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjbbh);
	ps.setDate(3,qysj);
	ps.setDate(4,yxq);
	ps.setString(5,sfzybb);
	ps.setString(6,bz);
	ps.executeUpdate();
	ps.close();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where  dqbm='"+dqbm+"' and sfzybb='2'";//1：未启用；2：当前版；3：可用版；4：已停用
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>1)
	{
		conn.rollback();
		out.println("错误！有多个[当前版]");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where  dqbm='"+dqbm+"' and sfzybb in('2','3') and qysj>SYSDATE";
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
		conn.rollback();
		out.println("错误！未到启用时间，不能选择启用");
		return;
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>