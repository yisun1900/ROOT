<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
long ygbh=0;
java.sql.Date bdsxrq=null;
String bdxz=null;
String bdyy=null;
String fgsbh=null;
String tcf=null;
String dwbh=null;
String dwbh2=null;
String zwbm=null;
String zwbm2=null;
double bdqgwgz=0;
double bdhgwgz=0;
double bdqjbgz=0;
double bdhjbgz=0;
double bdqkhgz=0;
double bdhkhgz=0;
double bdqbuzhu=0;
double bdhbuzhu=0;
double bdqjtbt=0;
double bdhjtbt=0;
double bdqcb=0;
double bdhcb=0;
double bdqdhbt=0;
double bdhdhbt=0;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;

//bdxh=cf.GB2Uni(request.getParameter("bdxh"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ygbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ա�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdsxrq");
try{
	if (!(ls.equals("")))  bdsxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdsxrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯��Чʱ��]����ת����������:"+e);
	return;
}
bdxz=cf.GB2Uni(request.getParameter("bdxz"));
bdyy=cf.GB2Uni(request.getParameter("bdyy"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
tcf=cf.GB2Uni(request.getParameter("tcf"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
dwbh2=cf.GB2Uni(request.getParameter("dwbh2"));
zwbm=cf.GB2Uni(request.getParameter("zwbm"));
zwbm2=cf.GB2Uni(request.getParameter("zwbm2"));
ls=request.getParameter("bdqgwgz");
try{
	if (!(ls.equals("")))  bdqgwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqgwgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ��λ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhgwgz");
try{
	if (!(ls.equals("")))  bdhgwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhgwgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯���λ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdqjbgz");
try{
	if (!(ls.equals("")))  bdqjbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqjbgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhjbgz");
try{
	if (!(ls.equals("")))  bdhjbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhjbgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdqkhgz");
try{
	if (!(ls.equals("")))  bdqkhgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqkhgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ���˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhkhgz");
try{
	if (!(ls.equals("")))  bdhkhgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhkhgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯�󿼺˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdqbuzhu");
try{
	if (!(ls.equals("")))  bdqbuzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqbuzhu������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhbuzhu");
try{
	if (!(ls.equals("")))  bdhbuzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhbuzhu������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdqjtbt");
try{
	if (!(ls.equals("")))  bdqjtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqjtbt������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ��ͨ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhjtbt");
try{
	if (!(ls.equals("")))  bdhjtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhjtbt������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯��ͨ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdqcb");
try{
	if (!(ls.equals("")))  bdqcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ�Ͳ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhcb");
try{
	if (!(ls.equals("")))  bdhcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯��Ͳ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdqdhbt");
try{
	if (!(ls.equals("")))  bdqdhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdqdhbt������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯ǰ�绰����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bdhdhbt");
try{
	if (!(ls.equals("")))  bdhdhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bdhdhbt������");
	return;
}
catch (Exception e){
	out.println("<BR>[�䶯��绰����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}

String bdxh=cf.GB2Uni(request.getParameter("bdxh"));
String clzt=cf.GB2Uni(request.getParameter("clzt"));
String[] ztbm=request.getParameterValues("ztbm");

String bdqsfzszg=null;
String bdhsfzszg=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String gzbm=null;
	ls_sql="select gzbm";
	ls_sql+=" from  dm_xzzwbm";
	ls_sql+=" where xzzwmc='"+zwbm2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gzbm=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (gzbm==null)
	{
		out.println("���󣡹��ֲ����ڣ�"+ls_sql);
		return;
	}

	String ssfgs=null;
	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();
	if (ssfgs==null)
	{
		out.println("����ʧ�ܣ��ޡ������ֹ�˾��");
		return;
	}

	String ybdxh=null;
	ls_sql="select bdxh,sfzszg";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybdxh=rs.getString("bdxh");
		bdqsfzszg=rs.getString("sfzszg");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	String shztbm="";
	if (ztbm!=null)
	{
		for (int i=0;i<ztbm.length ;i++ )
		{
			ls_sql="insert into rs_ygbdsplc ( bdxh,ztbm,xh)";
			ls_sql+=" values ( ?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,bdxh);
			ps.setString(2,ztbm[i]);
			ps.setInt(3,(i+1));
			ps.executeUpdate();
			ps.close();
		}

		shztbm=ztbm[0];
	}

	bdhsfzszg=bdqsfzszg;

	if (clzt.equals("00"))//00������������01���ȴ�������02������������03������ͨ����04������ȡ��
	{
		ls_sql="update sq_yhxx set ssfgs=?,dwbh=?,xzzwbm=?,zwbm=?,bdxh=? ";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,dwbh2);
		ps.setString(3,zwbm2);
		ps.setString(4,gzbm);
		ps.setString(5,bdxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update rs_ygjbgzb set gwgz=?,jbgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=? ";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,bdhgwgz);
		ps.setDouble(2,bdhjbgz);
		ps.setDouble(3,bdhkhgz);
		ps.setDouble(4,bdhbuzhu);
		ps.setDouble(5,bdhjtbt);
		ps.setDouble(6,bdhcb);
		ps.setDouble(7,bdhdhbt);
		ps.executeUpdate();
		ps.close();


		if (bdxz.equals("01"))//01:ת����02:��н��03:��ְ��04:��ְ��05:��ְ��06:������07:������08:������99:����
		{
			bdhsfzszg="Y";
			ls_sql="update sq_yhxx set zzxh=?,zzrq=?,zzpzbm=?,sfzszg=?";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,bdxh);
			ps.setDate(2,bdsxrq);
			ps.setString(3,lrbm);
			ps.setString(4,bdhsfzszg);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{
		ls_sql="update sq_yhxx set bdxh=? ";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,bdxh);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="insert into rs_ygbdsqb ( bdxh,ygbh,bdsxrq,bdxz,bdyy,fgsbh,tcf,dwbh,dwbh2,zwbm,zwbm2,bdqgwgz,bdhgwgz,bdqjbgz,bdhjbgz,bdqkhgz,bdhkhgz,bdqbuzhu,bdhbuzhu,bdqjtbt,bdhjtbt,bdqcb,bdhcb,bdqdhbt,bdhdhbt,bz,lrr,lrsj,lrbm,clzt,ztbm,bdqsfzszg,bdhsfzszg,ybdxh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bdxh);
	ps.setLong(2,ygbh);
	ps.setDate(3,bdsxrq);
	ps.setString(4,bdxz);
	ps.setString(5,bdyy);
	ps.setString(6,fgsbh);
	ps.setString(7,tcf);
	ps.setString(8,dwbh);
	ps.setString(9,dwbh2);
	ps.setString(10,zwbm);
	ps.setString(11,zwbm2);
	ps.setDouble(12,bdqgwgz);
	ps.setDouble(13,bdhgwgz);
	ps.setDouble(14,bdqjbgz);
	ps.setDouble(15,bdhjbgz);
	ps.setDouble(16,bdqkhgz);
	ps.setDouble(17,bdhkhgz);
	ps.setDouble(18,bdqbuzhu);
	ps.setDouble(19,bdhbuzhu);
	ps.setDouble(20,bdqjtbt);
	ps.setDouble(21,bdhjtbt);
	ps.setDouble(22,bdqcb);
	ps.setDouble(23,bdhcb);
	ps.setDouble(24,bdqdhbt);
	ps.setDouble(25,bdhdhbt);
	ps.setString(26,bz);
	ps.setString(27,lrr);
	ps.setDate(28,lrsj);
	ps.setString(29,lrbm);
	ps.setString(30,clzt);
	ps.setString(31,shztbm);
	ps.setString(32,bdqsfzszg);
	ps.setString(33,bdhsfzszg);
	ps.setString(34,ybdxh);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>