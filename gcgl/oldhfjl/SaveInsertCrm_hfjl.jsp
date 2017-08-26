<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hflxbm=null;
String khbh=null;
String sjfa=null;
String hqfw=null;
String jdqk=null;
String zjyfw=null;
String zjydw=null;
String zjyjz=null;
String fwsz=null;
String sgzl=null;
String grsz=null;
String sjshfnr=null;
String zjyhfnr=null;
String sgdhfnr=null;
String hfr=null;
String hfjlh=request.getParameter("hfjlh");
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sjfa=cf.GB2Uni(request.getParameter("sjfa"));
hqfw=cf.GB2Uni(request.getParameter("hqfw"));
jdqk=cf.GB2Uni(request.getParameter("jdqk"));
zjyfw=cf.GB2Uni(request.getParameter("zjyfw"));
zjydw=cf.GB2Uni(request.getParameter("zjydw"));
zjyjz=cf.GB2Uni(request.getParameter("zjyjz"));
fwsz=cf.GB2Uni(request.getParameter("fwsz"));
sgzl=cf.GB2Uni(request.getParameter("sgzl"));
grsz=cf.GB2Uni(request.getParameter("grsz"));
sjshfnr=cf.GB2Uni(request.getParameter("sjshfnr"));
zjyhfnr=cf.GB2Uni(request.getParameter("zjyhfnr"));
sgdhfnr=cf.GB2Uni(request.getParameter("sgdhfnr"));
hfr=cf.GB2Uni(request.getParameter("hfr"));
java.sql.Date hfsj=null;
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

java.sql.Date yzxhfsj=null;
String yhfjlh=null;
String ysfxhf=null;
java.sql.Date yhfrq=null;
String yhflxbm=null;
String ygcjdbm=null;
String ywgbz=null;

try {
	conn=cf.getConnection();

	ls_sql="select sfxhf,hfrq,hflxbm,zxhfsj,hfjlh,gcjdbm,wgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysfxhf=rs.getString("sfxhf");
		yhfrq=rs.getDate("hfrq");
		yhflxbm=rs.getString("hflxbm");
		yzxhfsj=rs.getDate("zxhfsj");
		yhfjlh=rs.getString("hfjlh");
		ygcjdbm=rs.getString("gcjdbm");
		ywgbz=rs.getString("wgbz");
	}
	ps.close();
	rs.close();
	

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set sfxhf=?,hfrq=null,hflxbm=null,zxhfsj=?,hfjlh=? where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"N");
	ps.setDate(2,hfsj);
	ps.setString(3,hfjlh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_hfjl ( hflxbm,khbh,sjfa,hqfw,jdqk,sjshfnr,zjyfw,zjydw,zjyjz,zjyhfnr,fwsz,sgzl,grsz,sgdhfnr,hfsj,hfr,hfjlh,gcjdbm,sfjxhf,clfs,yzxhfsj,yhfjlh,ysfxhf,yhfrq,yhflxbm,ygcjdbm,ywgbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'4','N','0',?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hflxbm);
	ps.setString(2,khbh);
	ps.setString(3,sjfa);
	ps.setString(4,hqfw);
	ps.setString(5,jdqk);
	ps.setString(6,sjshfnr);
	ps.setString(7,zjyfw);
	ps.setString(8,zjydw);
	ps.setString(9,zjyjz);
	ps.setString(10,zjyhfnr);
	ps.setString(11,fwsz);
	ps.setString(12,sgzl);
	ps.setString(13,grsz);
	ps.setString(14,sgdhfnr);
	ps.setDate(15,hfsj);
	ps.setString(16,hfr);
	ps.setString(17,hfjlh);

	ps.setDate(18,yzxhfsj);
	ps.setString(19,yhfjlh);
	ps.setString(20,ysfxhf);
	ps.setDate(21,yhfrq);
	ps.setString(22,yhflxbm);
	ps.setString(23,ygcjdbm);
	ps.setString(24,ywgbz);

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