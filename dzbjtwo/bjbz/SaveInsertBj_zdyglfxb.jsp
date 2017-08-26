<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmlrr=null;
String xmbh=null;
String glfxclmc=null;
String glflbm=null;
double dj=0;
String jldwbm=null;
double xhl=0;
double jqsfl=0;
double bsfl=0;
double tvocsfl=0;
String lx=null;
String wlllbz=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
xmlrr=cf.GB2Uni(request.getParameter("xmlrr"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
glfxclmc=cf.GB2Uni(request.getParameter("glfxclmc"));
glflbm=cf.GB2Uni(request.getParameter("glflbm"));
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
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("xhl");
try{
	if (!(ls.equals("")))  xhl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xhl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jqsfl");
try{
	if (!(ls.equals("")))  jqsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jqsfl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȩ�ͷ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bsfl");
try{
	if (!(ls.equals("")))  bsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bsfl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ͷ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tvocsfl");
try{
	if (!(ls.equals("")))  tvocsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tvocsfl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[TVOC�ͷ���]����ת����������:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
wlllbz=cf.GB2Uni(request.getParameter("wlllbz"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	String glfxclbm="";
	String getjldwbm="";
	double cbj=0;

	if (glflbm.equals("1"))//1:����
	{
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb ";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cllb='1' and jxc_cljgb.sfyh='Y'";
		ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.clmc='"+glfxclmc+"'";
		ls_sql+=" order by jxc_clbm.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			out.println("�����ڡ������С��в��������ظ�");
			return;
		}

		ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.jldwbm,jxc_cljgb.cbj";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb ";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cllb='1' and jxc_cljgb.sfyh='Y'";
		ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.clmc='"+glfxclmc+"'";
		ls_sql+=" order by jxc_clbm.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfxclbm=rs.getString("clbm");
			getjldwbm=rs.getString("jldwbm");
			cbj=rs.getDouble("cbj");
		}
		rs.close();
		ps.close();
		if (glfxclbm.equals(""))
		{
			out.println("���󣡲������Ʋ�����");
			return;
		}
	}


	conn.setAutoCommit(false);

	
	//���ܷ���ѭ�������̫��
	int glbxh=0;
	ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
	ls_sql+=" from  bj_zdyglfxb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		glbxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	glbxh++;

	ls_sql="insert into bj_zdyglfxb ( glbxh,xmlrr,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,glbxh);
	ps.setString(2,xmlrr);
	ps.setString(3,xmbh);
	ps.setString(4,glfxclbm);
	ps.setString(5,glfxclmc);
	ps.setString(6,glflbm);
	ps.setDouble(7,dj);
	ps.setString(8,jldwbm);
	ps.setDouble(9,xhl);
	ps.setDouble(10,jqsfl);
	ps.setDouble(11,bsfl);
	ps.setDouble(12,tvocsfl);
	ps.setString(13,lx);
	ps.setString(14,wlllbz);
	ps.setString(15,lrr);
	ps.setDate(16,lrsj);
	ps.setString(17,bz);
	ps.executeUpdate();
	ps.close();

	//���±��۳ɱ�������������������������������������ʼ
	double clcb=0;//���ϳɱ�
	double rgcb=0;//�˹��ɱ�
	double jxcb=0;//��е�ɱ�
	double cbenj=0;//�ɱ���
	ls_sql="select sum(dj*xhl)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(dj*xhl)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:�˹�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rgcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(dj*xhl)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:��е
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jxcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	cbenj=cf.round(clcb+rgcb+jxcb,2);

	ls_sql="update bj_zdyxmb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
	ls_sql+=" where lrr='"+xmlrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,clcb);
	ps.setDouble(2,rgcb);
	ps.setDouble(3,jxcb);
	ps.setDouble(4,cbenj);
	ps.executeUpdate();
	ps.close();
	//���±��۳ɱ���������������������������������������

	String getglfxclbm=null;
	count=0;
	ls_sql="select glfxclbm,count(*)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glfxclbm is not null";
	ls_sql+=" group by glfxclbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getglfxclbm=rs.getString(1);
		count=rs.getInt(2);

		out.println("<BR>���󣡲��ϱ���["+getglfxclbm+"]�ظ�");
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		conn.rollback();
		out.println("<P>����ʧ�ܣ�");
		return;
	}

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>