<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmbm=null;
String kpdlbm=null;
String kpjg=null;
String kpcfbm=null;
xmbm=cf.GB2Uni(request.getParameter("xmbm"));
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
kpjg=cf.GB2Uni(request.getParameter("kpjg"));
kpcfbm=cf.GB2Uni(request.getParameter("kpcfbm"));
double sgdfk=0;
ls=request.getParameter("sgdfk");
try{
	if (!(ls.equals("")))  sgdfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdfk������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
double kf=0;
ls=request.getParameter("kf");
try{
	if (!(ls.equals("")))  kf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۷�]����ת����������:"+e);
	return;
}
double kcjdebl=0;
ls=request.getParameter("kcjdebl");
try{
	if (!(ls.equals("")))  kcjdebl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kcjdebl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۳��ӵ���ٷֱ�]����ת����������:"+e);
	return;
}
int wzcs=0;
ls=request.getParameter("wzcs");
try{
	if (!(ls.equals("")))  wzcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wzcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[Υ�´���]����ת����������:"+e);
	return;
}

String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

String wherejcjlh=null;
String wherexmbm=null;
wherejcjlh=cf.GB2Uni(request.getParameter("wherejcjlh"));
wherexmbm=cf.GB2Uni(request.getParameter("wherexmbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+wherejcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	rs.close();
	ps.close();
	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1������������2��δ������3������ͨ����4������δͨ��
	{
		out.println("����ʧ�ܣ���ʩ���Ӽ���¼������");
		return;
	}

	int count=0;
	if (!wherexmbm.equals(xmbm))//�ı�����Ŀ
	{
		ls_sql="select count(*)";
		ls_sql+=" from  gdm_jcjlmx";
		ls_sql+=" where jcjlh='"+wherejcjlh+"' and xmbm='"+xmbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			out.println("����ʧ�ܣ��ü����Ŀ��¼��");
			return;
		}
	}

	String kpxmmc=null;
	String kpjgdy=null;
	String cfbz=null;
	ls_sql="select kpxmmc,kpjgdy,cfbz";
	ls_sql+=" from  gdm_gcxm";
	ls_sql+=" where xmbm='"+xmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kpxmmc=rs.getString("kpxmmc");
		kpjgdy=rs.getString("kpjgdy");
		cfbz=rs.getString("cfbz");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);
	
	ls_sql="update gdm_jcjlmx set xmbm=?,kpdlbm=?,kpjg=?,kpcfbm=?,kf=?,sgdfk=?,kcjdebl=?,bz=?,wzcs=?,kpxmmc=?,kpjgdy=?,cfbz=? ";
	ls_sql+=" where  (jcjlh='"+wherejcjlh+"') and  (xmbm='"+wherexmbm+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmbm);
	ps.setString(2,kpdlbm);
	ps.setString(3,kpjg);
	ps.setString(4,kpcfbm);
	ps.setDouble(5,kf);
	ps.setDouble(6,sgdfk);
	ps.setDouble(7,kcjdebl);
	ps.setString(8,bz);
	ps.setInt(9,wzcs);
	ps.setString(10,kpxmmc);
	ps.setString(11,kpjgdy);
	ps.setString(12,cfbz);
	ps.executeUpdate();
	ps.close();

	double allkf=0;
	double allsgdfk=0;
	double allkcjdebl=0;
	ls_sql="select sum(kf*wzcs),sum(sgdfk*wzcs),sum(kcjdebl*wzcs)";
	ls_sql+=" from  gdm_jcjlmx";
	ls_sql+=" where  jcjlh='"+wherejcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allkf=rs.getDouble(1);
		allsgdfk=rs.getDouble(2);
		allkcjdebl=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	if (allsgdfk>0 || allkcjdebl>0)
	{
		cfspbz="2";
	}
	else{
		cfspbz="1";
	}

	ls_sql="update gdm_gdjcjl set fkze="+allsgdfk+",kfzs="+allkf+",kcjdebl="+allkcjdebl+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  jcjlh='"+wherejcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	parent.window.close();
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