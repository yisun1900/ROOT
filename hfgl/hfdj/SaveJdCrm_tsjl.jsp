<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String tsjlh=request.getParameter("tsjlh");
String sfxhf=request.getParameter("sfxhf");
java.sql.Date hfsj=null;

ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�����]����ת����������:"+e);
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
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdjbz=rs.getString("hfdjbz");
	}
	else{
		out.println("�������������");
		return;
	}
	rs.close();
	ps.close();

	if (hfdjbz.equals("Y"))//Y���طö��᣻N��δ����
	{
		out.println("���󣡻ط��Ѷ���");
		return;
	}
	
	//�޸Ŀͻ�Ͷ�߼�¼
	ls_sql =" update  crm_tsjl";
	ls_sql+=" set sfxhf=?,hfsj=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and hfdjbz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxhf);
	ps.setDate(2,hfsj);
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