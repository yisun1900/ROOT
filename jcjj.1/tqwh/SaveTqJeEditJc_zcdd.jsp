<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String ls=null;
String khbh=null;
String clgw=null;
String ddshbz=null;
double hkze=0;
double htcxhdje=0;
java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
java.sql.Date htshsj=null;
String xmzy=null;
java.sql.Date qhtsj=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hkze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htcxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}

ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhtzshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�֪ͨ�ͻ�ʱ��]����ת����������:"+e);
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
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qhtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ��ͬʱ��]����ת����������:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zczkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
double jmje=0;
ls=request.getParameter("jmje");
try{
	if (!(ls.equals("")))  jmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}

double zqclf=0;
ls=request.getParameter("zqclf");
try{
	if (!(ls.equals("")))  zqclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
double qtf=0;
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ���Ϸ�]����ת����������:"+e);
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

/*
String jkxz=cf.GB2Uni(request.getParameter("jkxz"));
String jkdd=cf.GB2Uni(request.getParameter("jkdd"));
*/

String dgkh=cf.GB2Uni(request.getParameter("dgkh"));
String xshth=cf.GB2Uni(request.getParameter("xshth"));
double zcpclf=0;
ls=request.getParameter("zcpclf");
try{
	if (!(ls.equals("")))  zcpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcpclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ-���Ϸ�]����ת����������:"+e);
	return;
}
double tjpclf=0;
ls=request.getParameter("tjpclf");
try{
	if (!(ls.equals("")))  tjpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjpclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ؼ�Ʒ-���Ϸ�]����ת����������:"+e);
	return;
}


String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppbm=null;
	String gys=null;
	String fgsbh=null;
	String ddlx="";
	ls_sql="select ppbm,gys,fgsbh,ddlx ";
	ls_sql+=" from jc_zcdd  ";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		fgsbh=rs.getString("fgsbh");
		ddlx=cf.fillNull(rs.getString("ddlx"));
	}
	rs.close();
	ps.close();


	double fdbl=0;
	double cxfdbl=0;
	double tcjrbl=0;
	double tccxjrbl=0;
	double khfdbl=0;
	double khcxfdbl=0;

	if (ddlx.equals("9") || ddlx.equals("E"))//9���������ġ�C:ѡ�����ģ�E��ɢ��
	{
		ls_sql="select jxc_ppgysdzb.fdbl,jxc_ppgysdzb.cxfdbl,jxc_ppgysdzb.tcjrbl,jxc_ppgysdzb.tccxjrbl ";
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
		ls_sql+=" and jxc_ppxx.pplb='1' ";
		ls_sql+=" and jxc_gysxx.cllx='1' ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fdbl=rs.getDouble("fdbl");
			cxfdbl=rs.getDouble("cxfdbl");
			tcjrbl=rs.getDouble("tcjrbl");
			tccxjrbl=rs.getDouble("tccxjrbl");
		}
		rs.close();
		ps.close();
		
		ls_sql="select jxc_khfdbl.khfdbl,jxc_khfdbl.khcxfdbl ";
		ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khfdbl=rs.getDouble("khfdbl");
			khcxfdbl=rs.getDouble("khcxfdbl");
		}
		rs.close();
		ps.close();
		

		if (fdbl==0)
		{
			out.println("<BR>����������δ��ʼ���������");
			return;
		}
	}
	else if (ddlx.equals("C"))//9���������ġ�C:ѡ�����ģ�E��ɢ��
	{
		ls_sql="select jxc_ppgysdzb.xpjsbl,jxc_ppgysdzb.xpcxjsbl,jxc_ppgysdzb.xptcjrbl,jxc_ppgysdzb.xptccxjrbl ";
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
		ls_sql+=" and jxc_ppxx.pplb='1' ";
		ls_sql+=" and jxc_gysxx.cllx='1' ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fdbl=rs.getDouble("xpjsbl");
			cxfdbl=rs.getDouble("xpcxjsbl");
			tcjrbl=rs.getDouble("xptcjrbl");
			tccxjrbl=rs.getDouble("xptccxjrbl");
		}
		rs.close();
		ps.close();


		ls_sql="select jxc_khfdbl.xpkhfdbl,jxc_khfdbl.xpkhcxfdbl ";
		ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khfdbl=rs.getDouble("xpkhfdbl");
			khcxfdbl=rs.getDouble("xpkhcxfdbl");
		}
		rs.close();
		ps.close();

		if (fdbl==0)
		{
			out.println("<BR>����������δ��ʼ���������");
			return;
		}

	}

	double tjpfdbl=cxfdbl;
	double tjpkhfdbl=khcxfdbl;
	double tjptcjrbl=tccxjrbl;

	double cbze=zcpclf*fdbl/100+tjpclf*tjpfdbl/100;
	double zhclf=zqclf;

	double wdzje=zqclf+qtf+ycf;
	hkze=wdzje;
	zczkl=10;

	conn.setAutoCommit(false);

	ls_sql="update jc_zcdd set clgw=?,ztjjgw=?,ddshbz=?,kjxsj=?,htshsj=?,xmzy=?,qhtsj=?,bz=?,jhtzshsj=?,jjsjs=?,zczkl=?,dzyy=?,jhshsj=?,jmje=? ";
	ls_sql+=" ,wdzje=?,hkze=?,cbze=?,htcxhdje=?,xshth=?,zqclf=?,zhclf=?,ycf=?,qtf=? ";
	ls_sql+=" ,zcpclf=?,fdbl=?,khfdbl=?,tcjrbl=?,tjpclf=?,tjpfdbl=?,tjpkhfdbl=?,tjptcjrbl=?,lrr=?,lrsj=SYSDATE";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,ddshbz);
	ps.setDate(4,kjxsj);
	ps.setDate(5,htshsj);
	ps.setString(6,xmzy);
	ps.setDate(7,qhtsj);
	ps.setString(8,bz);
	ps.setDate(9,jhtzshsj);
	ps.setString(10,jjsjs);
	ps.setDouble(11,zczkl);
	ps.setString(12,dzyy);
	ps.setDate(13,htshsj);
	ps.setDouble(14,jmje);

	ps.setDouble(15,wdzje);
	ps.setDouble(16,hkze);
	ps.setDouble(17,cbze);
	ps.setDouble(18,htcxhdje);
	ps.setString(19,xshth);
	ps.setDouble(20,zqclf);
	ps.setDouble(21,zhclf);
	ps.setDouble(22,ycf);
	ps.setDouble(23,qtf);

	ps.setDouble(24,zcpclf);
	ps.setDouble(25,fdbl);
	ps.setDouble(26,khfdbl);
	ps.setDouble(27,tcjrbl);
	ps.setDouble(28,tjpclf);
	ps.setDouble(29,tjpfdbl);
	ps.setDouble(30,tjpkhfdbl);
	ps.setDouble(31,tjptcjrbl);
	ps.setString(32,yhmc);
	
	ps.executeUpdate();
	ps.close();


	//��飺��Ϊ����
	double allwdzje=0;
	double allhkze=0;
	double allzqclf=0;
	double allzhclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allycf=0;
	double allqtf=0;
	ls_sql="select sum(wdzje),sum(hkze),sum(zqclf),sum(zhclf),sum(ycf),sum(qtf),sum(zcpclf),sum(tjpclf)";
	ls_sql+=" from jc_zcdd ";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and ddlx='9'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		allwdzje=rs.getDouble(1);
		allhkze=rs.getDouble(2);
		allzqclf=rs.getDouble(3);
		allzhclf=rs.getDouble(4);
		allycf=rs.getDouble(5);
		allqtf=rs.getDouble(6);
		allzcpclf=rs.getDouble(7);
		alltjpclf=rs.getDouble(8);

		if (allwdzje<0 )
		{
			conn.rollback();
			out.println("����Ʒ�ƶ����ܶ�Ϊ����:"+allwdzje);
			return;
		}
		if ( allhkze<0)
		{
			conn.rollback();
			out.println("����Ʒ�ƶ����ܶ�Ϊ����:"+allhkze);
			return;
		}
		if ( allzqclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[��ǰ���Ϸ�]Ϊ����:"+allzqclf);
			return;
		}
		if ( allzhclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[�ۺ���Ϸ�]Ϊ����:"+allzhclf);
			return;
		}
		if ( allycf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[Զ�̷�]Ϊ����:"+allycf);
			return;
		}
		if ( allqtf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[������]Ϊ����:"+allqtf);
			return;
		}
		if ( allzcpclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[����Ʒ���Ϸ�]Ϊ����:"+allzcpclf);
			return;
		}
		if ( alltjpclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[�ؼ�Ʒ���Ϸ�]Ϊ����:"+alltjpclf);
			return;
		}

	}
	rs.close();
	ps.close();


	//��飺��Ϊ����
	allwdzje=0;
	allhkze=0;
	allzqclf=0;
	allzhclf=0;
	allzcpclf=0;
	alltjpclf=0;
	allycf=0;
	allqtf=0;

	ls_sql="select sum(wdzje),sum(hkze),sum(zqclf),sum(zhclf),sum(ycf),sum(qtf),sum(zcpclf),sum(tjpclf)";
	ls_sql+=" from jc_zcdd ";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and ddlx='C'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		allwdzje=rs.getDouble(1);
		allhkze=rs.getDouble(2);
		allzqclf=rs.getDouble(3);
		allzhclf=rs.getDouble(4);
		allycf=rs.getDouble(5);
		allqtf=rs.getDouble(6);
		allzcpclf=rs.getDouble(7);
		alltjpclf=rs.getDouble(8);

		if (allwdzje<0 )
		{
			conn.rollback();
			out.println("����Ʒ�ƶ����ܶ�Ϊ����:"+allwdzje);
			return;
		}
		if ( allhkze<0)
		{
			conn.rollback();
			out.println("����Ʒ�ƶ����ܶ�Ϊ����:"+allhkze);
			return;
		}
		if ( allzqclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[��ǰ���Ϸ�]Ϊ����:"+allzqclf);
			return;
		}
		if ( allzhclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[�ۺ���Ϸ�]Ϊ����:"+allzhclf);
			return;
		}
		if ( allycf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[Զ�̷�]Ϊ����:"+allycf);
			return;
		}
		if ( allqtf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[������]Ϊ����:"+allqtf);
			return;
		}
		if ( allzcpclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[����Ʒ���Ϸ�]Ϊ����:"+allzcpclf);
			return;
		}
		if ( alltjpclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[�ؼ�Ʒ���Ϸ�]Ϊ����:"+alltjpclf);
			return;
		}

	}
	rs.close();
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
	out.print("Exception: " + e);
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