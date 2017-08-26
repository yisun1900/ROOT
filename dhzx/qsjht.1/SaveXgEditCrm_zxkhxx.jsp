<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String sjs=null;
String clgw=null;
String hth=null;
java.sql.Date qsjhtsj=null;
double pms=0;
double dj=0;
double sjhtje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
sjs=cf.GB2Uni(request.getParameter("sjs"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
hth=cf.GB2Uni(request.getParameter("hth"));
ls=request.getParameter("qsjhtsj");
try{
	if (!(ls.equals("")))  qsjhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qsjhtsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ��ƺ�ͬʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("pms");
try{
	if (!(ls.equals("")))  pms=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[pms]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ����]����ת����������:"+e);
	return;
}
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
ls=request.getParameter("sjhtje");
try{
	if (!(ls.equals("")))  sjhtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjhtje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ƺ�ͬ���]����ת����������:"+e);
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
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String hyh=cf.GB2Uni(request.getParameter("hyh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String qsjhtbz=null;
	ls_sql="select qsjhtbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qsjhtbz=cf.fillNull(rs.getString("qsjhtbz"));
	}
	rs.close();
	ps.close();

	if (!qsjhtbz.equals("Y"))
	{
		out.println("����δǩ��ƺ�ͬ");
		return;
	}

	if (!hth.equals(""))
	{
		int count=0;

		//��ͬ�ż��
		String sykhbh="";
		ls_sql="select khbh";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sykhbh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (!sykhbh.equals(""))
		{
			out.println("���󣡺�ͬ���ѱ��ͻ�["+sykhbh+"]ʹ��");
			return;
		}

		ls_sql="select khbh";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sykhbh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (!sykhbh.equals(""))
		{
			out.println("���󣡺�ͬ���ѱ��ͻ�["+sykhbh+"]ʹ��");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_sjhtxx set sjs=?,sjhth=?,qsjhtsj=?,pms=?,dj=?,sjhtje=?,lrr=?,lrsj=?,lrbm=?,bz=?,clgw=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjs);
	ps.setString(2,hth);
	ps.setDate(3,qsjhtsj);
	ps.setDouble(4,pms);
	ps.setDouble(5,dj);
	ps.setDouble(6,sjhtje);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.setString(11,clgw);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set qsjhtbz='Y',qsjhtsj=?,sjhtje=?,hth=?,sfzhm=?,hyh=?,fwmj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qsjhtsj);
	ps.setDouble(2,sjhtje);
	ps.setString(3,hth);
	ps.setString(4,sfzhm);
	ps.setString(5,hyh);
	ps.setDouble(6,pms);
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
	out.print("Exception: " + e);
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