<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%

String yhmc=(String)session.getAttribute("yhmc");
String gysddph=cf.GB2Uni(request.getParameter("gysddph"));
String gysmc=null;
String ddzt=null;//0���ȴ��µ���1�����µ���2���ѽ��գ�3���ѷ�����4������⣻5���ѽ��� 
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	//��鶩��״̬�Ƿ���ϳ����׼
	ls_sql="select ddzt ";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ddzt=cf.fillNull(rs.getString("ddzt"));
	}
	else
	{
		out.print("<font color=red>���󣡲����ڵĶ�����["+gysddph+"]</font>");
		return;
	}
	rs.close();
	ps.close();
	if (ddzt.equals("0"))//0���ȴ��µ���1�����µ���2���ѽ��գ�3���ѷ�����4������⣻5���ѽ��� 
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]δ�µ���</font>");
		return;
	}
	else if (ddzt.equals("1"))
	{
//		out.print("<font color=red>���󣡶���["+gysddph+"]�Ѿ��µ���</font>");
//		return;
	}
	else if (ddzt.equals("2"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�ѽ��գ�</font>");
		return;
	}
	else if (ddzt.equals("3"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�ѷ�����</font>");
		return;
	}
	else if (ddzt.equals("4"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]����⣡</font>");
		return;
	}
	else if (ddzt.equals("5"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�ѽ��㣡</font>");
		return;
	}
	//���¶���״̬
	ls_sql="update jxc_gysdd set ddzt='0',xdr='',xdrq='',psfs='',yqdhsj='',bz='' ";
	ls_sql+=" where  gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("ɾ���µ���־�ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
		out.println("<BR>������־��ɾ�����������µ���");
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%>
