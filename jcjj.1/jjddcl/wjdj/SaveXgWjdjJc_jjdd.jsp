<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjlrr=cf.GB2Uni(request.getParameter("wjlrr"));
java.sql.Date wjsj=null;
ls=request.getParameter("wjsj");
try{
	if (!(ls.equals("")))  wjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String oldclzt=null;
	String oldycclzt=null;
	ls_sql="select clzt,ycclzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
		oldycclzt=cf.fillNull(rs.getString("ycclzt"));
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("35"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}

	if (oldycclzt.equals("1"))//1���ӳ�δ��ʵ��2���ӳ�ԭ����ʵ��3���ӳ�ԭ����ʵ
	{
		out.println("�������ӳ�δ�����������");
		return;
	}


	ls_sql="update jc_jjdd set wjsj=?,wjlrr=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='35'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,wjsj);
	ps.setString(2,wjlrr);
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
	out.print("Exception: " + e);
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