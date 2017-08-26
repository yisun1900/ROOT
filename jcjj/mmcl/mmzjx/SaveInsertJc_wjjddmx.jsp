<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String zjxxh=request.getParameter("zjxxh");
long xh=0;
double dj=0;
double zjhsl=0;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xh������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjhsl");
try{
	if (!(ls.equals("")))  zjhsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjhsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

String mmsbsbm=cf.GB2Uni(request.getParameter("mmsbsbm"));
String xinghao=cf.GB2Uni(request.getParameter("xinghao"));
String wjjbm=cf.GB2Uni(request.getParameter("wjjbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double wjzjxje=0;
double zjxze=0;
try {
	conn=cf.getConnection();

	String clzt=null;
	String dqbm=null;
	double mmzkl=10;
	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql="select jc_mmzjx.clzt,jc_mmzjx.mmzkl,sq_dwxx.dqbm,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmzjx,sq_dwxx";
	ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh and jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		dqbm=rs.getString("dqbm");
		mmzkl=rs.getDouble("mmzkl");
		jcddblxs=rs.getInt("jcddblxs");
		jcddmxblxs=rs.getInt("jcddmxblxs");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))//00��¼��δ���
	{
		out.println("��������������ɣ�������¼��");
		return;
	}

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������

	String wjmc=null;
	String jldw=null;
	ls_sql="select wjmc,jldw";
	ls_sql+=" from  jc_wjjbj";
	ls_sql+=" where xh="+xh+" and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjmc=rs.getString("wjmc");
		jldw=rs.getString("jldw");
	}
	rs.close();
	ps.close();

	int lrxh=0;
	ls_sql="select NVL(max(lrxh),0)";
	ls_sql+=" from  jc_wjjddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lrxh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	lrxh++;

	conn.setAutoCommit(false);

	ls_sql="insert into jc_wjjddmx ( yddbh,xh,bzdj,dj,sl,zjhsl,lx,bz,lrxh,wjjbm,mmsbsbm,xinghao,wjmc,jldw ) ";
	ls_sql+=" values ( ?,?,?,ROUND(?,"+jcddmxblxs+"),0,?,'2',?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setLong(2,xh);
	ps.setDouble(3,dj);
	ps.setDouble(4,dj*mmzkl/10);
	ps.setDouble(5,zjhsl);
	ps.setString(6,bz);
	ps.setInt(7,lrxh);
	ps.setString(8,wjjbm);
	ps.setString(9,mmsbsbm);
	ps.setString(10,xinghao);
	ps.setString(11,wjmc);
	ps.setString(12,jldw);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_wjzjxmx ( lrxh,yddbh,zjxxh,lx,ysl,xsl) ";
	ls_sql+=" values ( ?,?,?,'2',0,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,lrxh);
	ps.setString(2,yddbh);
	ps.setString(3,zjxxh);
	ps.setDouble(4,zjhsl);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	parent.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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