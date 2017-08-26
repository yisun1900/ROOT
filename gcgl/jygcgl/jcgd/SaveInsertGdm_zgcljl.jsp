<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clqk=null;
String clr=null;
java.sql.Date clsj=null;


clqk=cf.GB2Uni(request.getParameter("clqk"));
clr=cf.GB2Uni(request.getParameter("clr"));
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}


String clzt=request.getParameter("clzt");

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));


String jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
String cljlh=cf.GB2Uni(request.getParameter("cljlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String getclzt="";
	String ycljlh="";
	ls_sql="select clzt,cljlh";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ycljlh=cf.fillNull(rs.getString("cljlh"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("9") && !getclzt.equals("8") && !getclzt.equals("D") && !getclzt.equals("B") && !getclzt.equals("C"))//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���6���ѳ��ֳ��ȴ���������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�9���������ͨ����A���������δͨ����3���ѽ����B:�ط�δ�����5���᰸
	{
		out.println("���󣡴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	String zrbmclzt="";
	if (clzt.equals("2"))//2��δ�����3���ѽ��
	{
		zrbmclzt="B";//B���ڴ���
	}
	else {
		zrbmclzt="3";//3���ѽ��
	}


	ls_sql="insert into gdm_zgcljl ( cljlh,jcjlh,dwbh,clr,clsj,clqk,clzt,lrr,lrsj,lrbm,yclzt,ycljlh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cljlh);
	ps.setString(2,jcjlh);
	ps.setString(3,dwbh);
	ps.setString(4,clr);
	ps.setDate(5,clsj);
	ps.setString(6,clqk);
	ps.setString(7,clzt);

	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrbm);
	ps.setString(11,getclzt);
	ps.setString(12,ycljlh);
	ps.executeUpdate();
	ps.close();


	
	ls_sql="update gdm_gdjcjl set clqk=?,clr=?,clsj=?,clzt=?,cljlh=? ";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clqk);
	ps.setString(2,clr);
	ps.setDate(3,clsj);
	ps.setString(4,zrbmclzt);
	ps.setString(5,cljlh);
	ps.executeUpdate();
	ps.close();


	conn.commit();

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
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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