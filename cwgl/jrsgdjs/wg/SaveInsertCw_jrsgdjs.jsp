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
double ysglk=0;
double zjsge=0;
double cfje=0;
double jsglk=0;
double rgfbfb=0;
double yfrgf=0;
double kjflk=0;
double bcrgf=0;
double flkbfb=0;
double ycflk=0;
double bcflk=0;
double gsfl=0;
double psfl=0;
double kzbjbl=0;
double kzbj=0;
double fk=0;
double bx=0;
double rybx=0;
double pck=0;
double kqtk=0;
String kqtksm=null;
double bcfkhj=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
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
ls=request.getParameter("ysglk");
try{
	if (!(ls.equals("")))  ysglk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ysglk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ�㹤�Ͽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjsge");
try{
	if (!(ls.equals("")))  zjsge=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjsge]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʩ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("cfje");
try{
	if (!(ls.equals("")))  cfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsglk");
try{
	if (!(ls.equals("")))  jsglk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsglk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���㹤�Ͽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("rgfbfb");
try{
	if (!(ls.equals("")))  rgfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rgfbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˹��Ѱٷֱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfrgf");
try{
	if (!(ls.equals("")))  yfrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfrgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѹ��˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bcrgf");
try{
	if (!(ls.equals("")))  bcrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bcrgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӧ���˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("flkbfb");
try{
	if (!(ls.equals("")))  flkbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[flkbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ͽ�ٷֱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycflk");
try{
	if (!(ls.equals("")))  ycflk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycflk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѳ帨�Ͽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjflk");
try{
	if (!(ls.equals("")))  kjflk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kjflk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼ����Ͽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("bcflk");
try{
	if (!(ls.equals("")))  bcflk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bcflk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӧ���˸��Ͽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gsfl");
try{
	if (!(ls.equals("")))  gsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gsfl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾����]����ת����������:"+e);
	return;
}
ls=request.getParameter("psfl");
try{
	if (!(ls.equals("")))  psfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[psfl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���͸���]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbjbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzbj");
try{
	if (!(ls.equals("")))  kzbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("fk");
try{
	if (!(ls.equals("")))  fk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}

ls=request.getParameter("bx");
try{
	if (!(ls.equals("")))  bx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ر���]����ת����������:"+e);
	return;
}
ls=request.getParameter("rybx");
try{
	if (!(ls.equals("")))  rybx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rybx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ա����]����ת����������:"+e);
	return;
}
ls=request.getParameter("pck");
try{
	if (!(ls.equals("")))  pck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[pck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�⳥��]����ת����������:"+e);
	return;
}


ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kqtk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
kqtksm=cf.GB2Uni(request.getParameter("kqtksm"));
ls=request.getParameter("bcfkhj");
try{
	if (!(ls.equals("")))  bcfkhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bcfkhj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���θ���ϼ�]����ת����������:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
double czbh=0;
ls=request.getParameter("czbh");
try{
	if (!(ls.equals("")))  czbh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[czbh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ש����]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getgdjsjd="";
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getgdjsjd=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (getgdjsjd.equals("8"))//A:���Ե�һ�β�����
	{
		out.println("<BR>�����������ѽ���");
		return;
	}

	conn.setAutoCommit(false);

	String lx="8";//8���깤����

	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lx);
	ps.setString(2,jsjlh);
	ps.executeUpdate();
	ps.close();
	
	
	ls_sql="insert into cw_jrsgdjs ( jsjlh,khbh,sgd,sgbz,jsrq,ysglk,zjsge,cfje,jsglk,rgfbfb   ,yfrgf,bcrgf,flkbfb,ycflk,kjflk,bcflk,gsfl,psfl,kzbjbl,kzbj   ,fk,bx,rybx,pck,kqtk,kqtksm,bcfkhj,lrr,lrsj,lrbm   ,czbh,bz,lx,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDate(5,jsrq);
	ps.setDouble(6,ysglk);
	ps.setDouble(7,zjsge);
	ps.setDouble(8,cfje);
	ps.setDouble(9,jsglk);
	ps.setDouble(10,rgfbfb);

	ps.setDouble(11,yfrgf);
	ps.setDouble(12,bcrgf);
	ps.setDouble(13,flkbfb);
	ps.setDouble(14,ycflk);
	ps.setDouble(15,kjflk);
	ps.setDouble(16,bcflk);
	ps.setDouble(17,gsfl);
	ps.setDouble(18,psfl);
	ps.setDouble(19,kzbjbl);
	ps.setDouble(20,kzbj);

	ps.setDouble(21,fk);
	ps.setDouble(22,bx);
	ps.setDouble(23,rybx);
	ps.setDouble(24,pck);
	ps.setDouble(25,kqtk);
	ps.setString(26,kqtksm);
	ps.setDouble(27,bcfkhj);
	ps.setString(28,lrr);
	ps.setDate(29,lrsj);
	ps.setString(30,lrbm);

	ps.setDouble(31,czbh);
	ps.setString(32,bz);
	ps.setString(33,lx);
	ps.executeUpdate();
	ps.close();

	if (kzbj!=0)
	{
		ls_sql="update sq_sgd set zbj=zbj+?";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,kzbj);
		ps.executeUpdate();
		ps.close();

		long xuhao=0;
		//��ȡ��¼��
		ls_sql="select NVL(max(xuhao),0)";
		ls_sql+=" from  cw_zbzjsjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xuhao=rs.getLong(1);
		}
		rs.close();
		ps.close();

		xuhao++;

		ls_sql="insert into cw_zbzjsjl ( xuhao,sgd,je,jsjlh,lrr,lrsj,bz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xuhao);
		ps.setString(2,sgd);
		ps.setDouble(3,kzbj);
		ps.setString(4,jsjlh);
		ps.setString(5,lrr);
		ps.setDate(6,lrsj);
		ps.setString(7,"ʩ���ӽ���");
		ps.executeUpdate();
		ps.close();

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