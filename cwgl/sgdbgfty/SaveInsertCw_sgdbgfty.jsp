<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
java.sql.Date jsrq=null;
double jsbl=0;
double jsje=0;
double clf=0;
double gdyp=0;
double sjbk=0;
String gdjsjd=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
String jsjs=null;
double htje=0;
double zjxje=0;
double jsjsze=0;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gdyp");
try{
	if (!(ls.equals("")))  gdyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gdyp]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ʒ]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjbk");
try{
	if (!(ls.equals("")))  sjbk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjbk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʲ���]����ת����������:"+e);
	return;
}
gdjsjd=cf.GB2Uni(request.getParameter("gdjsjd"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
jsjs=cf.GB2Uni(request.getParameter("jsjs"));
ls=request.getParameter("htje");
try{
	if (!(ls.equals("")))  htje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsjsze");
try{
	if (!(ls.equals("")))  jsjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsjsze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ܶ�]����ת����������:"+e);
	return;
}

String sfkclk=request.getParameter("sfkclk");
String sfkgdyp=request.getParameter("sfkgdyp");
String sfkyfgf=request.getParameter("sfkyfgf");

double jzssk=0;
ls=request.getParameter("jzssk");
try{
	if (!(ls.equals("")))  jzssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jzssk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װʵ�տ�]����ת����������:"+e);
	return;
}
double yfgf=0;
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѹ�����]����ת����������:"+e);
	return;
}
double lkhjbfb=0;
ls=request.getParameter("lkhjbfb");
try{
	if (!(ls.equals("")))  lkhjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lkhjbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ϼưٷֱ�]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_sgdjssqjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and zt='1'";//1��δ�����ѣ�2���Ѳ�����
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
		out.println("������Ȩ��¼�Ѳ���");
		return;
	}

	String ygdjsjd="";
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql =" update  cw_sgdjssqjl set zt='2',jsjlh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and zt='1'";//1��δ�����ѣ�2���Ѳ�����
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?,sgdfbj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gdjsjd);
	ps.setString(2,jsjlh);
	ps.setDouble(3,jsjsze);//ʩ���ӷ�����
	ps.executeUpdate();
	ps.close();
	
	ls_sql="insert into cw_sgdbgfty ( jsjlh,khbh,sgd,sgbz,jsrq,jsbl,jsje,clf,gdyp,sjbk,gdjsjd,lrr,lrsj,lrbm,bz,jsjs,htje,zjxje,jsjsze,sfkclk,sfkgdyp,sfkyfgf,jzssk,yfgf,lkhjbfb,ygdjsjd,spzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1' ) ";//1��δ������2������ͬ�⣻3��������ͬ��
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDate(5,jsrq);
	ps.setDouble(6,jsbl);
	ps.setDouble(7,jsje);
	ps.setDouble(8,clf);
	ps.setDouble(9,gdyp);
	ps.setDouble(10,sjbk);
	ps.setString(11,gdjsjd);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,lrbm);
	ps.setString(15,bz);
	ps.setString(16,jsjs);
	ps.setDouble(17,htje);
	ps.setDouble(18,zjxje);
	ps.setDouble(19,jsjsze);
	ps.setString(20,sfkclk);
	ps.setString(21,sfkgdyp);
	ps.setString(22,sfkyfgf);
	ps.setDouble(23,jzssk);
	ps.setDouble(24,yfgf);
	ps.setDouble(25,lkhjbfb);
	ps.setString(26,ygdjsjd);
	ps.executeUpdate();
	ps.close();

	if (sfkgdyp.equals("Y"))//�Ƿ�۹�����Ʒ  Y���ǣ�N����
	{
		ls_sql="update cw_gdyplyjl set jsbz='1',jsjlh=?";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jsbz='0'";//0��δ���㣻1���ѽ���
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.executeUpdate();
		ps.close();
	}


	//������ϼƲ��ܴ���lkhjbfb������������������������������ʼ

	if (sjbk>0)
	{
		double bgfhj=cf.round(yfgf+sjbk,2);//������
		double sgdlkhj=cf.round(bgfhj+clf+gdyp,2);

		if (sgdlkhj>cf.round(jsjsze*lkhjbfb/100+1,2))
		{
			conn.rollback();
			out.println("����<P>�ͻ����ϼơ����Ͽ�("+clf+")��������Ʒ("+gdyp+")��������("+bgfhj+")��"+sgdlkhj+"�� ���� ����������"+lkhjbfb+"%��"+jsjsze+"��"+lkhjbfb+"����"+cf.round(jsjsze*lkhjbfb/100,2)+"��");
			return;
		}
	}
	//������ϼƲ��ܴ���lkhjbfb����������������������������������������


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