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
java.sql.Date sjjjsj=null;
ls=request.getParameter("sjjjsj");
try{
	if (!(ls.equals("")))  sjjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʽ��ʱ��]����ת����������:"+e);
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


String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String cljlh=cf.GB2Uni(request.getParameter("cljlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String yddclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	String getclzt="";
	String ycljlh="";
	ls_sql="select clzt,cljlh";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ycljlh=cf.fillNull(rs.getString("cljlh"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("3") && !getclzt.equals("B"))//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���6���ѳ��ֳ��ȴ���������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�9���������ͨ����A���������δͨ����3���ѽ����B:�ط�δ�����5���᰸
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


	ls_sql="update crm_tsbxcljl set clr=?,clsj=?,clqk=?,clzt=?,lrr=?,lrsj=?,lrbm=?,sjjjsj=? ";
	ls_sql+=" where cljlh='"+cljlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clr);
	ps.setDate(2,clsj);
	ps.setString(3,clqk);
	ps.setString(4,clzt);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setDate(8,sjjjsj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsbm set clqk=?,clr=?,clsj=?,clzt=?,sjjjsj=? ";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clqk);
	ps.setString(2,clr);
	ps.setDate(3,clsj);
	ps.setString(4,zrbmclzt);
	ps.setDate(5,sjjjsj);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and clzt not in('3','5')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		zrbmclzt="3";//3���ѽ��
	}
	else{
		zrbmclzt="B";//B���ڴ���
	}

	ls_sql="update crm_tsjl set zrbmclzt=?";//0��δ����1��������4���ѽ��գ�5���ѳ��ֳ���6���ѳ�������7���������ͨ����2���ڴ���3���᰸��9:������
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zrbmclzt);
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