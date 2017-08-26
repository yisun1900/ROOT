<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
String sftzk=null;
String sfyfq=null;
String sfydjfx=null;
String sfydyq=null;
String sfydxpzc=null;
String sfydgzc=null;
String sfyzcfk=null;
String sfykhpc=null;
String sfyjsgcyh=null;
String sfyyqf=null;
String sfxmbm1=null;
String sfxmbm2=null;
String sfxmbm3=null;
String sfyqtx1=null;
String qtx1mc=null;
String sfyqtx2=null;
String qtx2mc=null;
String sfyqtx3=null;
String qtx3mc=null;
String sfxsp=null;
String sfxsq=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
sftzk=cf.GB2Uni(request.getParameter("sftzk"));
sfyfq=cf.GB2Uni(request.getParameter("sfyfq"));
sfydjfx=cf.GB2Uni(request.getParameter("sfydjfx"));
sfydyq=cf.GB2Uni(request.getParameter("sfydyq"));
sfydxpzc=cf.GB2Uni(request.getParameter("sfydxpzc"));
sfydgzc=cf.GB2Uni(request.getParameter("sfydgzc"));
sfyzcfk=cf.GB2Uni(request.getParameter("sfyzcfk"));
sfykhpc=cf.GB2Uni(request.getParameter("sfykhpc"));
sfyjsgcyh=cf.GB2Uni(request.getParameter("sfyjsgcyh"));
sfyyqf=cf.GB2Uni(request.getParameter("sfyyqf"));
sfxmbm1=cf.GB2Uni(request.getParameter("sfxmbm1"));
sfxmbm2=cf.GB2Uni(request.getParameter("sfxmbm2"));
sfxmbm3=cf.GB2Uni(request.getParameter("sfxmbm3"));
sfyqtx1=cf.GB2Uni(request.getParameter("sfyqtx1"));
qtx1mc=cf.GB2Uni(request.getParameter("qtx1mc"));
sfyqtx2=cf.GB2Uni(request.getParameter("sfyqtx2"));
qtx2mc=cf.GB2Uni(request.getParameter("qtx2mc"));
sfyqtx3=cf.GB2Uni(request.getParameter("sfyqtx3"));
qtx3mc=cf.GB2Uni(request.getParameter("qtx3mc"));
sfxsp=cf.GB2Uni(request.getParameter("sfxsp"));
sfxsq=cf.GB2Uni(request.getParameter("sfxsq"));
String sfydxpzcyh=cf.GB2Uni(request.getParameter("sfydxpzcyh"));
String sfydgzcyh=cf.GB2Uni(request.getParameter("sfydgzcyh"));
String sfyjszcyh=cf.GB2Uni(request.getParameter("sfyjszcyh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="insert into dm_khjscsb ( fgsbh,sftzk,sfyfq,sfydjfx,sfydyq,sfydxpzc,sfydgzc,sfyzcfk,sfykhpc,sfyyqf,sfxmbm1,sfxmbm2,sfxmbm3,sfyqtx1,sfyqtx2,sfyqtx3,sfxsp,sfxsq,dqbm,sfyjsgcyh,sfydxpzcyh,sfydgzcyh,sfyjszcyh,qtx1mc,qtx2mc,qtx3mc ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,sftzk);
	ps.setString(3,sfyfq);
	ps.setString(4,sfydjfx);
	ps.setString(5,sfydyq);
	ps.setString(6,sfydxpzc);
	ps.setString(7,sfydgzc);
	ps.setString(8,sfyzcfk);
	ps.setString(9,sfykhpc);
	ps.setString(10,sfyyqf);
	ps.setString(11,sfxmbm1);
	ps.setString(12,sfxmbm2);
	ps.setString(13,sfxmbm3);
	ps.setString(14,sfyqtx1);
	ps.setString(15,sfyqtx2);
	ps.setString(16,sfyqtx3);
	ps.setString(17,sfxsp);
	ps.setString(18,sfxsq);
	ps.setString(19,dqbm);
	ps.setString(20,sfyjsgcyh);
	ps.setString(21,sfydxpzcyh);
	ps.setString(22,sfydgzcyh);
	ps.setString(23,sfyjszcyh);
	ps.setString(24,qtx1mc);
	ps.setString(25,qtx2mc);
	ps.setString(26,qtx3mc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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