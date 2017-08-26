<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xcqk=null;
String kcr=null;
java.sql.Date kcsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
xcqk=cf.GB2Uni(request.getParameter("xcqk"));
kcr=cf.GB2Uni(request.getParameter("kcr"));
ls=request.getParameter("kcsj");
try{
	if (!(ls.equals("")))  kcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
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
bz=cf.GB2Uni(request.getParameter("bz"));

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String kcjlh=cf.GB2Uni(request.getParameter("kcjlh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("7"))//1��δ���գ�2�����պ�ֱ�ӳ�����������ˣ�4�����պ�ֱ�ӳ���������ˣ�6���ѽ��յȴ���������7���ȴ����ֳ����������8���ѳ��ֳ�����������ˣ�9���ѳ��ֳ���������ˣ�3���ѽ����5���᰸
	{
		out.println("���󣡲�����ֳ�");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tsbxxckcjl ( kcjlh,tsjlh,tsyybm,xcqk,kcr,kcsj,lrr,lrsj,lrbm,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kcjlh);
	ps.setString(2,tsjlh);
	ps.setString(3,tsyybm);
	ps.setString(4,xcqk);
	ps.setString(5,kcr);
	ps.setDate(6,kcsj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);

	ls_sql="update crm_tsbm set clzt=?,jsr=?,jssj=?,jhcxcsj=?,jhcfasj=?,jhjjsj=?,fashbm=?,fashr=?,jjfa=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,jsr);
	ps.setDate(3,jssj);
	ps.setDate(4,jhcxcsj);
	ps.setDate(5,jhcfasj);
	ps.setDate(6,jhjjsj);
	ps.setString(7,fashbm);
	ps.setString(8,fashr);
	ps.setString(9,jjfa);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsjl set zrbmclzt=?";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
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