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
String psfs=cf.GB2Uni(request.getParameter("psfs"));
String shfgs=cf.GB2Uni(request.getParameter("shfgs"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sj=cf.GB2Uni(request.getParameter("yqdhsj"));
java.sql.Date yqdhsj=null;
try{
	if (!(sj.equals("")))  yqdhsj=java.sql.Date.valueOf(sj.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yqdhsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ҫ�󵽻�ʱ��]����ת����������:"+e);
	return;
}
String clbm=null;
double dhsl=0;
String dqbm=null;
String gysmc=null;
String ddzt=null;//0���ȴ��µ���1�����µ���2���ѽ��գ�3���ѷ�����4������⣻5���ѽ��� 
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
try { 
	conn=cf.getConnection();
	conn.setAutoCommit(false);//�ر����ﴦ��
	//��鶩��״̬�Ƿ���ϳ����׼
	ls_sql="select ddzt,dqbm ";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ddzt=cf.fillNull(rs.getString("ddzt"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	else
	{
		out.print("<font color=red>���󣡲����ڵĶ�����["+gysddph+"]</font>");
		conn.rollback();return;
	}
	rs.close();
	ps.close();
	if (ddzt.equals("0"))//0���ȴ��µ���1�����µ���2���ѽ��գ�3���ѷ�����4������⣻5���ѽ��� 
	{
//		out.print("����״̬��ȷ��");
	}
	else if (ddzt.equals("1"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�Ѿ��µ���</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("2"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�ѽ��գ�</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("3"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�ѷ�����</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("4"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]����⣡</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("5"))
	{
		out.print("<font color=red>���󣡶���["+gysddph+"]�ѽ��㣡</font>");
		conn.rollback();return;
	}
	//�����������ϼ۸���еĶ�������
	ls_sql="select clbm,dhsl ";
	ls_sql+=" from  jxc_gysddmx ";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		dhsl=rs.getDouble("dhsl");
		//�����Ѳɹ�����
		ls_sql="update jxc_cljgb set ycgsl=ycgsl+"+dhsl+" ";
		ls_sql+=" where  clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps2= conn.prepareStatement(ls_sql);
		ps2.executeUpdate();
		ps2.close();
	}
	rs.close();
	ps.close();
	//���¶���״̬
	ls_sql="update jxc_gysdd set ddzt='1',xdr=?,xdrq=SYSDATE,psfs=?,yqdhsj=?,bz=?,shfgs=? ";
	ls_sql+=" where  gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhmc);
	ps.setString(2,psfs);
	ps.setDate(3,yqdhsj);
	ps.setString(4,bz);
	ps.setString(5,shfgs);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
		conn.rollback();return;
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�µ��ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<center><BR>�µ��ɹ�����֪ͨ���ҽ��գ�</center>
		<!-- <center><BR><a href="printgysdd.jsp?gysddph=<%=gysddph%>" target="_back">��ӡ����</a></center> -->
		<center><BR><a href="/jxcdy/printgysdd.jsp?gysddph=<%=gysddph%>" target="_back">��ӡ����</a></center>
		<%
	}
		conn.commit();//�ύ����
}
catch (Exception e) {
	conn.rollback();//����ع�
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);//�����ﴦ��
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
