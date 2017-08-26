<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjjlh=request.getParameter("xjjlh");
String kpxmbm=null;
String kpdlbm=null;
String bz=null;
String kpjg=null;
String kpcfbm=null;
kpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
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
	ls_sql="select count(*)";
	ls_sql+=" from  kp_xjgdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"' and kpxmbm='"+kpxmbm+"' ";
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
		out.println("����ʧ�ܣ��ÿ�����Ŀ��¼��");
		return;
	}

	String kpxmmc=null;
	String kpjgdy=null;
	String cfbz=null;
	ls_sql="select kpxmmc,kpjgdy,cfbz";
	ls_sql+=" from  kp_gckpxm";
	ls_sql+=" where kpxmbm='"+kpxmbm+"'";
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

	ls_sql="insert into kp_xjgdmx ( xjjlh,kpxmbm,kpdlbm,kpjg,kpcfbm,bz,kf,sgdfk,kcjdebl,wzcs,kpxmmc,kpjgdy,cfbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjjlh);
	ps.setString(2,kpxmbm);
	ps.setString(3,kpdlbm);
	ps.setString(4,kpjg);
	ps.setString(5,kpcfbm);
	ps.setString(6,bz);
	ps.setDouble(7,kf);
	ps.setDouble(8,sgdfk);
	ps.setDouble(9,kcjdebl);
	ps.setInt(10,wzcs);
	ps.setString(11,kpxmmc);
	ps.setString(12,kpjgdy);
	ps.setString(13,cfbz);
	ps.executeUpdate();
	ps.close();

	double allkf=0;
	double allsgdfk=0;
	double allkcjdebl=0;
	ls_sql="select sum(kf*wzcs),sum(sgdfk*wzcs),sum(kcjdebl*wzcs)";
	ls_sql+=" from  kp_xjgdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
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

	ls_sql="update kp_xjgdjl set fkze="+allsgdfk+",kfzs="+allkf+",kcjdebl="+allkcjdebl+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
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
	out.print("����ʧ��,��������: " + e);
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