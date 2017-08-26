<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sdks=cf.GB2Uni(request.getParameter("sdks"));
String cghs=cf.GB2Uni(request.getParameter("cghs"));
String tmpp=cf.GB2Uni(request.getParameter("tmpp"));
String tmhs=cf.GB2Uni(request.getParameter("tmhs"));
String xtbc=cf.GB2Uni(request.getParameter("xtbc"));
String blcz=cf.GB2Uni(request.getParameter("blcz"));
String jiaolian=cf.GB2Uni(request.getParameter("jiaolian"));

String htbz=cf.GB2Uni(request.getParameter("htbz"));
String qhtr=cf.GB2Uni(request.getParameter("qhtr"));
java.sql.Date qhtsj=null;
java.sql.Date kjxsj=null;
java.sql.Date jhazrq=null;
ls=request.getParameter("jhazrq");
try{
	if (!(ls.equals("")))  jhazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhazrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ����]����ת����������:"+e);
	return;
}

ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qhtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɼ����ֹʱ��]����ת����������:"+e);
	return;
}

double tmbfje=0;
double gtbfje=0;
ls=request.getParameter("tmbfje");
try{
	if (!(ls.equals("")))  tmbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tmbfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[̨�沿�ֽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gtbfje");
try{
	if (!(ls.equals("")))  gtbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gtbfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���岿�ֽ��]����ת����������:"+e);
	return;
}

double wjhtze=0;
ls=request.getParameter("wjhtze");
try{
	if (!(ls.equals("")))  wjhtze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wjhtze������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ͬ�ܶ�]����ת����������:"+e);
	return;
}
double dqhtze=0;
ls=request.getParameter("dqhtze");
try{
	if (!(ls.equals("")))  dqhtze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dqhtze������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ͬ�ܶ�]����ת����������:"+e);
	return;
}
double htze=0;
ls=request.getParameter("htze");
try{
	if (!(ls.equals("")))  htze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ܶ�]����ת����������:"+e);
	return;
}
double wdzje=0;
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdzje������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ���۽��]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}

	ls_sql="update jc_cgdd set qhtsj=?,jhazrq=?,kjxsj=?,qhtr=?,htbz=?,sdks=?,tmpp=?,xtbc=?,blcz=?,jiaolian=? ";
	ls_sql+=" ,gtbfje=?,tmbfje=?,wjhtze=?,dqhtze=?,wdzje=?,htze=?,gtzjje=?,tmzjje=?,wjzjje=?,dqzjje=?,zjhze=?,cghs=?,tmhs=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='13' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.setDate(2,jhazrq);
	ps.setDate(3,kjxsj);
	ps.setString(4,qhtr);
	ps.setString(5,htbz);
	ps.setString(6,sdks);
	ps.setString(7,tmpp);
	ps.setString(8,xtbc);
	ps.setString(9,blcz);
	ps.setString(10,jiaolian);

	ps.setDouble(11,gtbfje);
	ps.setDouble(12,tmbfje);
	ps.setDouble(13,wjhtze);
	ps.setDouble(14,dqhtze);
	ps.setDouble(15,wdzje);
	ps.setDouble(16,htze);

	ps.setDouble(17,gtbfje);
	ps.setDouble(18,tmbfje);
	ps.setDouble(19,wjhtze);
	ps.setDouble(20,dqhtze);
	ps.setDouble(21,htze);
	ps.setString(22,cghs);
	ps.setString(23,tmhs);

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