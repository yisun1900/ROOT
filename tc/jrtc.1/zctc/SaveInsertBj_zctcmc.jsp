<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String tcmc=null;
double yj=0;
double tcj=0;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
ls=request.getParameter("yj");
try{
	if (!(ls.equals("")))  yj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcj");
try{
	if (!(ls.equals("")))  tcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײͼ�]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String lx=request.getParameter("lx");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//���ɲ��ϱ���
	long tcbm=0;
	ls_sql="select NVL(max(tcbm),0)";
	ls_sql+=" from  bj_zctcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcbm=rs.getLong(1);
	}
	rs.close();
	ps.close();

	tcbm++;



	ls_sql="insert into bj_zctcmc ( tcbm,dqbm,tcmc,yj,tcj,bz,lx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,tcbm);
	ps.setString(2,dqbm);
	ps.setString(3,tcmc);
	ps.setDouble(4,yj);
	ps.setDouble(5,tcj);
	ps.setString(6,bz);
	ps.setString(7,lx);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		//-->
		</SCRIPT>
		<%

		response.sendRedirect("EditBj_zctcmc.jsp?tcbm="+tcbm);

	}
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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