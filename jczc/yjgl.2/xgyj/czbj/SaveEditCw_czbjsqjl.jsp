<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date wcsj=null;
String wcr=null;

double gxhwdzgce=0;
double gxhzkl=0;
double gxhqye=0;
double gxhsuijin=0;
double gxhsuijinbfb=0;
double gxhsjf=0;
double gxhglf=0;
double gxhzqguanlif=0;
double gxhguanlif=0;

String smhtbh=cf.GB2Uni(request.getParameter("smhtbh"));

String bz=null;
ls=request.getParameter("wcsj");
try{
	if (!(ls.equals("")))  wcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
wcr=cf.GB2Uni(request.getParameter("wcr"));

ls=request.getParameter("gxhwdzgce");
try{
	if (!(ls.equals("")))  gxhwdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhwdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º󹤳�ԭ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhzkl");
try{
	if (!(ls.equals("")))  gxhzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º��ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhqye");
try{
	if (!(ls.equals("")))  gxhqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhqye������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º�ǩԼ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhsuijin");
try{
	if (!(ls.equals("")))  gxhsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º�˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhsuijinbfb");
try{
	if (!(ls.equals("")))  gxhsuijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhsuijinbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º�˰��ٷֱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhsjf");
try{
	if (!(ls.equals("")))  gxhsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhsjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º���Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhglf");
try{
	if (!(ls.equals("")))  gxhglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhglf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhzqguanlif");
try{
	if (!(ls.equals("")))  gxhzqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhzqguanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º���ǰ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhguanlif");
try{
	if (!(ls.equals("")))  gxhguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhguanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º��ۺ�����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

String khbh=request.getParameter("khbh");
String sqsj=request.getParameter("sqsj");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String wcbz="";
	ls_sql="select wcbz";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where khbh='"+khbh+"' and  sqsj=TO_DATE('"+sqsj+"','yyyy-mm-dd') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wcbz=rs.getString("wcbz");
	}
	rs.close();
	ps.close();

	if (!wcbz.equals("1"))
	{
		out.println("���󣡡���ɱ�־������ȷ");
		return;
	}

	String jzbz="";
	ls_sql="select jzbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jzbz=rs.getString("jzbz");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//���£�����������Ȩ��¼
	ls_sql="update cw_czbjsqjl set wcbz='2',wcsj=?,wcr=?,gxhwdzgce=?,gxhzkl=?,gxhqye=?,gxhsuijin=?,gxhsuijinbfb=?,gxhsjf=?,gxhglf=?,gxhzqguanlif=?,gxhguanlif=?,bz=? ";
	ls_sql+=" where khbh='"+khbh+"' and  sqsj=TO_DATE('"+sqsj+"','yyyy-mm-dd') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,wcsj);
	ps.setString(2,wcr);
	ps.setDouble(3,gxhwdzgce);
	ps.setDouble(4,gxhzkl);
	ps.setDouble(5,gxhqye);
	ps.setDouble(6,gxhsuijin);
	ps.setDouble(7,gxhsuijinbfb);
	ps.setDouble(8,gxhsjf);
	ps.setDouble(9,gxhglf);
	ps.setDouble(10,gxhzqguanlif);
	ps.setDouble(11,gxhguanlif);

	ps.setString(12,bz);
	ps.executeUpdate();
	ps.close();

	//���£��ͻ���Ϣ
	ls_sql="update crm_khxx ";
	ls_sql+=" set wdzgce=?,zkl=?,qye=?,suijin=?,suijinbfb=?,sjf=?,glf=?,zqguanlif=?,guanlif=?,smhtbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhwdzgce);
	ps.setDouble(2,gxhzkl);
	ps.setDouble(3,gxhqye);
	ps.setDouble(4,gxhsuijin);
	ps.setDouble(5,gxhsuijinbfb);
	ps.setDouble(6,gxhsjf);
	ps.setDouble(7,gxhglf);
	ps.setDouble(8,gxhzqguanlif);
	ps.setDouble(9,gxhguanlif);
	ps.setString(10,smhtbh);
	ps.executeUpdate();
	ps.close();

	
	ls_sql=" update cw_qmjzmx ";
	ls_sql+=" set wdzgce=?,zkl=?,qye=?,suijin=?,suijinbfb=?,sjf=?,glf=?,zqguanlif=?,guanlif=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhwdzgce);
	ps.setDouble(2,gxhzkl);
	ps.setDouble(3,gxhqye);
	ps.setDouble(4,gxhsuijin);
	ps.setDouble(5,gxhsuijinbfb);
	ps.setDouble(6,gxhsjf);
	ps.setDouble(7,gxhglf);
	ps.setDouble(8,gxhzqguanlif);
	ps.setDouble(9,gxhguanlif);
	ps.executeUpdate();
	ps.close();

	//���£��ͻ����Ϸ�����bj_khglfxb��
	String dqbm=null;
	String xmbh=null;
	String bjjbbm=null;
	String ckxm=null;
	String bjlx=null;

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select dqbm,xmbh,bjjb,ckxm,bjlx";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dqbm=rs1.getString("dqbm");
		xmbh=rs1.getString("xmbh");
		bjjbbm=rs1.getString("bjjb");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");


		//�ͻ����Ϸ�����bj_khglfxb��
		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,glbxh,?,?,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,dqbm);
			ps.setString(3,xmbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	rs1.close();
	ps1.close();
		

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>