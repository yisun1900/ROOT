<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcjdbm=null;
java.sql.Date djsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
String bz=null;
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
	out.println("<BR>[实际竣工验收时间]类型转换发生意外:"+e);
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


String wheredjjlh=null;
wheredjjlh=cf.GB2Uni(request.getParameter("wheredjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldgcjdbm=null;
	String oldsjwjrq=null;
	String khbh=null;
	ls_sql="select gcjdbm,khbh,djsj";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where djjlh='"+wheredjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldgcjdbm=rs.getString("gcjdbm");
		oldsjwjrq=cf.fillNull(rs.getDate("djsj"));
		khbh=rs.getString("khbh");
	}
	else{
		out.println("错误！不存在的登记记录号："+wheredjjlh);
		return;
	}
	rs.close();
	ps.close();
	
	String newgcjdbm=null;
	String newsjwjrq=null;
	ls_sql="select gcjdbm,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newgcjdbm=rs.getString("gcjdbm");
		newsjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
	}
	rs.close();
	ps.close();

	if (!newgcjdbm.equals(oldgcjdbm))
	{
		out.println("错误！[工程进度]不正确，不能修改");
		return;
	}
	if (!newsjwjrq.equals(oldsjwjrq))
	{
		out.println("错误！[实际竣工验收时间]不正确，不能修改");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_gcjddjjl set djsj=?,lrr=?,lrsj=?,lrdw=?,bz=? ";
	ls_sql+=" where  (djjlh='"+wheredjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,djsj);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,lrdw);
	ps.setString(5,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set sjwjrq=?,kbxbz=?,bybxsm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,djsj);
	ps.setString(2,kbxbz);
	ps.setString(3,bybxsm);
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
