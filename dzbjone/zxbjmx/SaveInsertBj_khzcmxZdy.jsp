<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String zcmc=cf.GB2Uni(request.getParameter("zcmc"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String ppmc=cf.GB2Uni(request.getParameter("ppmc"));
String zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
String jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
String xinghao=cf.GB2Uni(request.getParameter("xinghao"));
String gg=cf.GB2Uni(request.getParameter("gg"));

double zqdj=0;
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰʵ������]����ת����������:"+e);
	return;
}
double dpzk=0;
ls=request.getParameter("dpzk");
try{
	if (!(ls.equals("")))  dpzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dpzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�ۿ�]����ת����������:"+e);
	return;
}
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�ʵ������]����ת����������:"+e);
	return;
}



String zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
String zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
double zqje=0;
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ͬ���Ϸ�]����ת����������:"+e);
	return;
}
double je=0;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����je������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ��ͬ���Ϸ�]����ת����������:"+e);
	return;
}
double ycf=0;
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}
String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
if (qtfy.equals("W"))
{
	qtfy="";
}
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtfyje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ѽ��]����ת����������:"+e);
	return;
}

String cxhdbz=null;
String bz=null;
cxhdbz=cf.GB2Uni(request.getParameter("cxhdbz"));
bz=cf.GB2Uni(request.getParameter("bz"));

double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
double cxhdje=0;
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}

String sfycx=null;
sfycx=request.getParameter("sfycx");

String sxhtyy=cf.GB2Uni(request.getParameter("sxhtyy"));
String sftjcp=request.getParameter("sftjcp");
String sfzp=request.getParameter("sfzp");
double zsdj=0;
ls=request.getParameter("zsdj");
try{
	if (!(ls.equals("")))  zsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zsdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���͵���]����ת����������:"+e);
	return;
}

String sftjp=request.getParameter("sftjp");



String khbh=request.getParameter("khbh");
String ssfgs=request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1��δ��ɣ�2����ɣ�3��ҵ����ת
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("���󣡿ͻ���ǩ�����������޸ı���");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("���󣡿ͻ�ǩ��ʧ�ܣ��������޸ı���");
		return;
	}

	String dxpzcsq="";//����Ʒ������Ȩ
	ls_sql="select dxpzcsq";
	ls_sql+=" from sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dxpzcsq=cf.fillNull(rs.getString("dxpzcsq"));
	}
	rs.close();
	ps.close();

	
	String scsmc=null;
	String gys=null;
	ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc";
	ls_sql+=" from jxc_ppgysdzb,jxc_ppxx  ";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
	ls_sql+=" and jxc_ppgysdzb.ppmc='"+ppmc+"'";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scsmc = rs.getString("scsmc");			    
		gys = rs.getString("gysmc");			    
	}
	rs.close();
	ps.close();





	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_khzcmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	xh++;

	String jsfs="1";//1������ۣ�2�����������3����Ӧ��ͳһ����
	double cbj=0;
	double jsbl=0;
	String xzjg="0";//0:��д��Ŀ��1:���ۼۣ�2:�����ۣ�3: �г���ۣ�4: �ײͼ�

	ls_sql ="insert into bj_khzcmx (xh,fjddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc   ,zclbbm,xinghao,gg,zcysbm,jldwbm,jsfs,cbj,jsbl,zdxsj,xzjg     ,zqdj,dpzk,dj,sl,zqje,je,cxhdbz,cxhdbl,cxhdje,yjjrbl    ,yjjrje,zcpzwzbm,ycf,qtfy,qtfyje,sfzp,zsdj,sxbz,sxhtyy,sftjp   ,lrr,lrsj) ";
	ls_sql+=" values( ?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?     ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE)";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,"");
	ps.setString(3,khbh);
	ps.setString(4,"000000");
	ps.setString(5,zcmc);
	ps.setString(6,zcdlbm);
	ps.setString(7,zcxlbm);
	ps.setString(8,ppmc);
	ps.setString(9,gys);
	ps.setString(10,scsmc);

	ps.setString(11,zclbbm);
	ps.setString(12,xinghao);
	ps.setString(13,gg);
	ps.setString(14,zcysbm);
	ps.setString(15,jldwbm);
	ps.setString(16,jsfs);
	ps.setDouble(17,cbj);
	ps.setDouble(18,jsbl);
	ps.setDouble(19,0);
	ps.setString(20,xzjg);

	ps.setDouble(21,zqdj);
	ps.setDouble(22,dpzk);
	ps.setDouble(23,dj);
	ps.setDouble(24,sl);
	ps.setDouble(25,zqje);
	ps.setDouble(26,je);
	ps.setString(27,cxhdbz);
	ps.setDouble(28,cxhdbl);
	ps.setDouble(29,cxhdje);
	ps.setDouble(30,100);

	ps.setDouble(31,je);
	ps.setString(32,zcpzwzbm);
	ps.setDouble(33,ycf);
	ps.setString(34,qtfy);
	ps.setDouble(35,qtfyje);
	ps.setString(36,sfzp);
	ps.setDouble(37,zsdj);
	ps.setString(38,"2");//1������д��2����д
	ps.setString(39,sxhtyy);
	ps.setString(40,sftjp);

	ps.setString(41,yhmc);

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