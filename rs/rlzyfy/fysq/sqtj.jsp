<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sjfw=null;
String fgs=null;
String sfkg="N";
String yshz=null;
String nian=null;
String yue=null;

sjfw=cf.GB2Uni(request.getParameter("sjfw"));
fgs=cf.GB2Uni(request.getParameter("fgs"));
yshz=cf.GB2Uni(request.getParameter("yshz"));
//out.print(yshz);
String hzbh=null;
nian=sjfw.substring(0,4);
yue=sjfw.substring(5,7);
hzbh=fgs+nian+yue;
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	ls_sql="update rs_fysq set sfkg=? ";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfkg);
	ps.executeUpdate();
	ps.close();

	if (!(yshz.equals("04"))){
	ls_sql="insert into rs_fysh ( hzbh,yshz,fgs,nian,yue ) ";
	ls_sql+=" values ( ?,'01',?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hzbh);
	ps.setString(2,fgs);
	ps.setString(3,nian);
	ps.setString(4,yue);
	out.print(yshz);
	ps.executeUpdate();
	ps.close();
	}

	if (yshz.equals("04")){
	ls_sql="update rs_fysh set yshz='01' ";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e+ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>