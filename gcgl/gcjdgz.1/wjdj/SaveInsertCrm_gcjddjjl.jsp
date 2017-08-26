<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djjlh=null;
String khbh=null;
String gcjdbm=null;
java.sql.Date djsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
String bz=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
ls=request.getParameter("djsj");
try{
	if (!(ls.equals("")))  djsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际竣工验收日期]类型转换发生意外:"+e);
	return;
}
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
bz=cf.GB2Uni(request.getParameter("bz"));

String kbxbz=null;
String bybxsm=null;
kbxbz=cf.GB2Uni(request.getParameter("kbxbz"));
bybxsm=cf.GB2Uni(request.getParameter("bybxsm"));


if (kbxbz.equals("N"))
{
}
else{
	bybxsm=null;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jjwjbz=null;
String ygcjdbm=null;
java.sql.Date ydjsj=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT sjwjrq,gcjdbm,jjwjbz";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ydjsj=rs.getDate("sjwjrq");
		ygcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
	}
	rs.close();
	ps.close();

	if (ygcjdbm.equals("5"))
	{
		out.println("<BR>！！！错误，客户已竣工验收");
		return;
	}



	conn.setAutoCommit(false);


	ls_sql="insert into crm_gcjddjjl ( djjlh,khbh,gcjdbm,djsj,ygcjdbm,lrr,lrsj,lrdw,bz,zpsl,sfszhf ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,0,'N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djjlh);
	ps.setString(2,khbh);
	ps.setString(3,gcjdbm);
	ps.setDate(4,djsj);
	ps.setString(5,ygcjdbm);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrdw);
	ps.setString(9,bz);
	ps.executeUpdate();
	ps.close();



	ls_sql="update crm_khxx set sjwjrq=?,gcjdbm=?,kbxbz=?,bybxsm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,djsj);
	ps.setString(2,gcjdbm);
	ps.setString(3,kbxbz);
	ps.setString(4,bybxsm);
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
	out.print("存盘失败,发生意外: " + e);
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
