<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khzq=null;
long yjzczfj=0;
long dqsjcz=0;
long dqkfhs=0;
long pjde=0;
String dqhd=null;
double xqzyl=0;
String jzds1=null;
double jzds1zyl=0;
String jzds2=null;
double jzds2zyl=0;
String jzds3=null;
double jzds3zyl=0;
String kfjd=null;
String sjfylx=null;
long dqsjfy=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khzq=cf.GB2Uni(request.getParameter("khzq"));
ls=request.getParameter("yjzczfj");
try{
	if (!(ls.equals("")))  yjzczfj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjzczfj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ���ܲ�ֵ�ֽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("dqsjcz");
try{
	if (!(ls.equals("")))  dqsjcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dqsjcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�ʲ�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("dqkfhs");
try{
	if (!(ls.equals("")))  dqkfhs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dqkfhs������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("pjde");
try{
	if (!(ls.equals("")))  pjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ������]����ת����������:"+e);
	return;
}
dqhd=cf.GB2Uni(request.getParameter("dqhd"));
ls=request.getParameter("xqzyl");
try{
	if (!(ls.equals("")))  xqzyl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xqzyl������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��ռ����]����ת����������:"+e);
	return;
}
jzds1=cf.GB2Uni(request.getParameter("jzds1"));
ls=request.getParameter("jzds1zyl");
try{
	if (!(ls.equals("")))  jzds1zyl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzds1zyl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������1ռ����]����ת����������:"+e);
	return;
}
jzds2=cf.GB2Uni(request.getParameter("jzds2"));
ls=request.getParameter("jzds2zyl");
try{
	if (!(ls.equals("")))  jzds2zyl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzds2zyl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������2ռ����]����ת����������:"+e);
	return;
}
jzds3=cf.GB2Uni(request.getParameter("jzds3"));
ls=request.getParameter("jzds3zyl");
try{
	if (!(ls.equals("")))  jzds3zyl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzds3zyl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������3ռ����]����ת����������:"+e);
	return;
}
kfjd=cf.GB2Uni(request.getParameter("kfjd"));
sjfylx=cf.GB2Uni(request.getParameter("sjfylx"));
ls=request.getParameter("dqsjfy");
try{
	if (!(ls.equals("")))  dqsjfy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dqsjfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�ʷ���]����ת����������:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));

String fasfwc=cf.GB2Uni(request.getParameter("fasfwc"));
String fysysm=cf.GB2Uni(request.getParameter("fysysm"));

String wherefgsbh=null;
String wherexqmc=null;
String wherekhzq=null;
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
wherexqmc=cf.GB2Uni(request.getParameter("wherexqmc"));
wherekhzq=cf.GB2Uni(request.getParameter("wherekhzq"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update yx_xqhdfygl set khzq=?,yjzczfj=?,dqsjcz=?,dqkfhs=?,pjde=?,dqhd=?,xqzyl=?,jzds1=?,jzds1zyl=?,jzds2=?,jzds2zyl=?,jzds3=?,jzds3zyl=?,kfjd=?,sjfylx=?,dqsjfy=?,lrr=?,lrsj=?,bz=?,fasfwc=?,fysysm=? ";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (xqmc='"+wherexqmc+"') and  (khzq='"+wherekhzq+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setLong(2,yjzczfj);
	ps.setLong(3,dqsjcz);
	ps.setLong(4,dqkfhs);
	ps.setLong(5,pjde);
	ps.setString(6,dqhd);
	ps.setDouble(7,xqzyl);
	ps.setString(8,jzds1);
	ps.setDouble(9,jzds1zyl);
	ps.setString(10,jzds2);
	ps.setDouble(11,jzds2zyl);
	ps.setString(12,jzds3);
	ps.setDouble(13,jzds3zyl);
	ps.setString(14,kfjd);
	ps.setString(15,sjfylx);
	ps.setLong(16,dqsjfy);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,bz);
	ps.setString(20,fasfwc);
	ps.setString(21,fysysm);
	ps.executeUpdate();
	ps.close();

	double sjcc=0;
	double sjfy=0;
	ls_sql="select sum(dqsjcz),sum(dqsjfy)";
	ls_sql+=" from  yx_xqhdfygl";
	ls_sql+=" where xqmc='"+wherexqmc+"' and fgsbh='"+wherefgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjcc=rs.getDouble(1);
		sjfy=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update yx_xqcxhdgl set sjfy=?,sjcc=?,fasfwc=? ";
	ls_sql+=" where xqmc='"+wherexqmc+"' and fgsbh='"+wherefgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sjfy);
	ps.setDouble(2,sjcc);
	ps.setString(3,fasfwc);
	ps.executeUpdate();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+wherefgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	String kfjdbm=null;
	if (fasfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		kfjdbm="5";//1��δ������2�������룻3������׼��4��δ��׼��5�������
	}
	else{
		kfjdbm="3";
	}

	ls_sql="update yx_lsdcb set kfjd='"+kfjdbm+"'";
	ls_sql+=" where xqmc='"+wherexqmc+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>����:" + e);
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