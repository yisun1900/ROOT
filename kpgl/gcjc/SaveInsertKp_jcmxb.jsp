<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpxh=request.getParameter("kpxh");
String kpxmbm=null;
String kpjg=null;
kpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
kpjg=cf.GB2Uni(request.getParameter("kpjg"));
String[] kpcfbm=request.getParameterValues("kpcfbm");
if (kpcfbm.length<1)
{
	out.println("错误！请选择考评处罚");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  kp_jcmxb";
	ls_sql+=" where kpxh='"+kpxh+"' and kpxmbm='"+kpxmbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("存盘失败！该考评项目已录入");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<kpcfbm.length ;i++ )
	{
		ls_sql="insert into kp_jcmxb ( kpxh,kpxmbm,kpjg,kpcfbm ) ";
		ls_sql+=" values ( ?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,kpxh);
		ps.setString(2,kpxmbm);
		ps.setString(3,kpjg);
		ps.setString(4,kpcfbm[i]);
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
	out.print("存盘失败,发生意外: " + e);
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