<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String sshr=cf.GB2Uni(request.getParameter("sshr"));
String shqk=cf.GB2Uni(request.getParameter("shqk"));

java.sql.Date sshsj=null;
ls=request.getParameter("sshsj");
try{
	if (!(ls.equals("")))  sshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ͻ�ʱ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt="";
	String ddshbz="";
	ls_sql =" select clzt,ddshbz";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
	}
	rs.close();
	ps.close();

	if (ddshbz.equals("1"))////�ȴ��ͻ�֪ͨ��־  1��������磻2������δ֪ͨ��3��������֪ͨ
	{
		if (!clzt.equals("13") && !clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))
		{
			out.println("<BR>���󣬴���ʧ�ܣ�����״̬����ȷ");
			return;
		}
	}
	else{
		if (!clzt.equals("13") && !clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))
		{
			out.println("<BR>���󣬴���ʧ�ܣ�����״̬����ȷ");
			return;
		}
	}


	ls_sql="update jc_zcdd set sshr=?,sshsj=?,lsclzt='"+clzt+"',clzt='19',shqk=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sshr);
	ps.setDate(2,sshsj);
	ps.setString(3,shqk);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
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
