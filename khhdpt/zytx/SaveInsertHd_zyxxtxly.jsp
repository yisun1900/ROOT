<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String txxh=null;
String khbh=null;
String lynr=null;
txxh=cf.GB2Uni(request.getParameter("txxh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
lynr=cf.GB2Uni(request.getParameter("lynr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lyxh=null;
	int count=0;
	ls_sql="select NVL(max(substr(lyxh,8,3)),0)";
	ls_sql+=" from  hd_zyxxtxly";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	lyxh=khbh+cf.addZero(count+1,3);

	ls_sql="insert into hd_zyxxtxly ( lyxh,txxh,khbh,lysj,lynr,lysfyck) ";
	ls_sql+=" values ( ?,?,?,SYSDATE,?,'N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lyxh);
	ps.setString(2,txxh);
	ps.setString(3,khbh);
	ps.setString(4,lynr);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�����������ύ��");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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