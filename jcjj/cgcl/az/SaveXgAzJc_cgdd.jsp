<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ycyybm=cf.GB2Uni(request.getParameter("ycyybm"));
String clzt=cf.GB2Uni(request.getParameter("clzt"));

String azsm=cf.GB2Uni(request.getParameter("azsm"));
String azr=cf.GB2Uni(request.getParameter("azr"));
java.sql.Date ksazsj=null;
ls=request.getParameter("ksazsj");
try{
	if (!(ls.equals("")))  ksazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ksazsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ��ʼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date sazrq=null;
ls=request.getParameter("sazrq");
try{
	if (!(ls.equals("")))  sazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sazrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ���ʱ��]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

String ycclzt=null;
if (!ycyybm.equals(""))
{
	ycclzt="1";
}
else{
	ycclzt="0";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String oldclzt=null;
	String oldycclzt=null;
	ls_sql="select clzt,ycclzt";
	ls_sql+=" from  jc_cgdd";
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
	if (!oldclzt.equals("33") && !oldclzt.equals("31"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}

	if (oldycclzt.equals("2") || oldycclzt.equals("3"))//0��δ�ӳ٣�1���ӳ�δ��ʵ��2���ӳ�ԭ����ʵ��3���ӳ�ԭ����ʵ
	{
		out.println("�������ӳ��Ѵ����������޸�");
		return;
	}


	ls_sql="update jc_cgdd set ksazsj=?,sazrq=?,azr=?,azsm=?,ycyybm=?,clzt=?,ycclzt=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt in('33','31')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,ksazsj);
	ps.setDate(2,sazrq);
	ps.setString(3,azr);
	ps.setString(4,azsm);
	ps.setString(5,ycyybm);
	ps.setString(6,clzt);
	ps.setString(7,ycclzt);
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