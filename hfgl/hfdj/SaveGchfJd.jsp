<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=request.getParameter("khbh");
String jdr=request.getParameter("jdr");
java.sql.Date sjjdsj=null;
String sfxhf=request.getParameter("sfxhf");
String hflxbm=request.getParameter("hflxbm");
java.sql.Date hfrq=null;

ls=request.getParameter("sjjdsj");
try{
	if (!(ls.equals("")))  sjjdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʽⶳʱ��]����ת����������:"+e);
	return;
}

ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̻ط�����]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hfdjbz=null;
try {
	conn=cf.getConnection();

	ls_sql="select hfdjbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdjbz=rs.getString("hfdjbz");
	}
	rs.close();
	ps.close();

	if (hfdjbz.equals("3"))//0��δ���᣻1�����̻طö��᣻2��Ͷ�߱��޻طö��᣻3��ȫ�����᣻
	{
		hfdjbz="2";
	}
	else{
		hfdjbz="0";
	}
	
	//�޸Ŀͻ���Ϣ��
	ls_sql =" update  crm_khxx";
	ls_sql+=" set hfdjbz=?,jdr=?,sjjdsj=?,sfxhf=?,hfrq=?,hflxbm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfdjbz);
	ps.setString(2,jdr);
	ps.setDate(3,sjjdsj);
	ps.setString(4,sfxhf);
	ps.setDate(5,hfrq);
	ps.setString(6,hflxbm);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>