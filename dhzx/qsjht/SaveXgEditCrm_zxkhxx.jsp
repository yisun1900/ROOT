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
double zqdj=0;
double zkl=0;
double dj=0;
double zqsjhtje=0;
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
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zkl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿ�]����ת����������:"+e);
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
	out.println("<BR>[�ۺ󵥼�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqsjhtje");
try{
	if (!(ls.equals("")))  zqsjhtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqsjhtje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ƺ�ͬ���]����ת����������:"+e);
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
	out.println("<BR>[�ۺ���ƺ�ͬ���]����ת����������:"+e);
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
	String zxdm=null;
	ls_sql="select qsjhtbz,zxdm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qsjhtbz=cf.fillNull(rs.getString("qsjhtbz"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
	}
	rs.close();
	ps.close();

	if (!qsjhtbz.equals("Y"))
	{
		out.println("����δǩ��ƺ�ͬ");
		return;
	}


	double zdsjf=0;
	double zgsjf=0;
	double mrsjf=0;
	ls_sql=" select zdsjf,zgsjf,mrsjf ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zdsjf=rs.getDouble("zdsjf");
		zgsjf=rs.getDouble("zgsjf");
		mrsjf=rs.getDouble("mrsjf");
	}
	rs.close();
	ps.close();

	if (dj<zdsjf)
	{
		out.println("�ۺ󵥼�С�������Ʒѱ�׼:"+zdsjf);
		return;
	}


	if (!hth.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_hthxx";
		ls_sql+=" where  hth='"+hth+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("���󣡲����ں�ͬ�ţ���������ϵͳ�������ͬ��");
			return;
		}

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

	ls_sql="update crm_sjhtxx set sjs=?,sjhth=?,qsjhtsj=?,pms=?,zqdj=?,zkl=?,dj=?,zqsjhtje=?,sjhtje=?,lrr=?    ,lrsj=?,lrbm=?,bz=?,clgw=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjs);
	ps.setString(2,hth);
	ps.setDate(3,qsjhtsj);
	ps.setDouble(4,pms);
	ps.setDouble(5,zqdj);
	ps.setDouble(6,zkl);
	ps.setDouble(7,dj);
	ps.setDouble(8,zqsjhtje);
	ps.setDouble(9,sjhtje);
	ps.setString(10,lrr);


	ps.setDate(11,lrsj);
	ps.setString(12,lrbm);
	ps.setString(13,bz);
	ps.setString(14,clgw);
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