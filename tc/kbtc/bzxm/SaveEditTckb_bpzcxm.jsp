<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String kbcpbm=null;
double sl=0;
String lrr=null;
java.sql.Date lrsj=null;

kbcpbm=cf.GB2Uni(request.getParameter("kbcpbm"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}

String jldw=cf.GB2Uni(request.getParameter("jldw"));
String kbwlbm=cf.GB2Uni(request.getParameter("kbwlbm"));
String bz=cf.GB2Uni(request.getParameter("bz"));
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
String sfksc=request.getParameter("sfksc");
String sfkth=request.getParameter("sfkth");


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String wherekbwlbm=cf.GB2Uni(request.getParameter("wherekbwlbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tckb_zck";
	ls_sql+=" where kbwlbm='"+kbwlbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("����û�д�[�Ʊ����ϱ���]");
		return;
	}

	String getkbcpbm="";
	ls_sql="select kbcpbm";
	ls_sql+=" from  tckb_zck";
	ls_sql+=" where kbwlbm='"+kbwlbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkbcpbm=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (!getkbcpbm.equals(kbcpbm))
	{
		out.println("����[�Ʊ���Ʒ����]����ȷ��ӦΪ��"+getkbcpbm);
		return;
	}


	ls_sql="update tckb_bpzcxm set kbcpbm=?,jldw=?,sl=?,dj=?,sfksc=?,sfkth=?,kbwlbm=?,bz=?,lrr=?,lrsj=?";
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (bjjbbm='"+bjjbbm+"') and  (bjbbh='"+bjbbh+"') and  (hxbm='"+hxbm+"') and  (jgwzbm='"+jgwzbm+"') and  (kbwlbm='"+wherekbwlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbcpbm);
	ps.setString(2,jldw);
	ps.setDouble(3,sl);
	ps.setDouble(4,dj);
	ps.setString(5,sfksc);
	ps.setString(6,sfkth);
	ps.setString(7,kbwlbm);
	ps.setString(8,bz);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
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
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>