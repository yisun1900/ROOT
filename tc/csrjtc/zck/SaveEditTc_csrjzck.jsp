<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpbm=null;
String dqbm=null;
String bjjbbm=null;
String nbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double sh=0;
String sfxclxs=null;
double yjsj=0;
double ykhxsdj=0;
double ysgddj=0;
double jsj=0;
double khxsdj=0;
double sgddj=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
nbbm=cf.GB2Uni(request.getParameter("nbbm"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
xdjldw=cf.GB2Uni(request.getParameter("xdjldw"));
ls=request.getParameter("xdb");
try{
	if (!(ls.equals("")))  xdb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xdb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�µ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sh");
try{
	if (!(ls.equals("")))  sh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("ykhxsdj");
try{
	if (!(ls.equals("")))  ykhxsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ykhxsdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ�ͻ����۵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("ysgddj");
try{
	if (!(ls.equals("")))  ysgddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ysgddj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭʩ���ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsj");
try{
	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khxsdj");
try{
	if (!(ls.equals("")))  khxsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khxsdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ����۵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgddj");
try{
	if (!(ls.equals("")))  sgddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgddj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӵ���]����ת����������:"+e);
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


bz=cf.GB2Uni(request.getParameter("bz"));
String bzmc=cf.GB2Uni(request.getParameter("bzmc"));
String zp=cf.GB2Uni(request.getParameter("zp"));


String[] getbjjbbm=request.getParameterValues("getbjjbbm");
String[] ysjsfjStr=request.getParameterValues("ysjsfj");
String[] sjsfjStr=request.getParameterValues("sjsfj");
String[] sfdz=request.getParameterValues("sfdz");
String[] dzkssjStr=request.getParameterValues("dzkssj");
String[] dzjzsjStr=request.getParameterValues("dzjzsj");
String[] dzsjsfjStr=request.getParameterValues("dzsjsfj");

String wherecpbm=null;
wherecpbm=cf.GB2Uni(request.getParameter("wherecpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update tc_csrjzck set nbbm=?,tccpdlbm=?,tccplbbm=?,cpmc=?,xh=?,gg=?,ppmc=?,gysmc=?,jldw=?,xdjldw=?,xdb=?,sh=?,sfxclxs=?,yjsj=?,ykhxsdj=?,ysgddj=?,jsj=?,khxsdj=?,sgddj=?,lrr=?,lrsj=?,bz=?,bzmc=?,zp=? ";
	ls_sql+=" where  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,nbbm);
	ps.setString(2,tccpdlbm);
	ps.setString(3,tccplbbm);
	ps.setString(4,cpmc);
	ps.setString(5,xh);
	ps.setString(6,gg);
	ps.setString(7,ppmc);
	ps.setString(8,gysmc);
	ps.setString(9,jldw);
	ps.setString(10,xdjldw);
	ps.setDouble(11,xdb);
	ps.setDouble(12,sh);
	ps.setString(13,sfxclxs);
	ps.setDouble(14,yjsj);
	ps.setDouble(15,ykhxsdj);
	ps.setDouble(16,ysgddj);
	ps.setDouble(17,jsj);
	ps.setDouble(18,khxsdj);
	ps.setDouble(19,sgddj);
	ps.setString(20,lrr);
	ps.setDate(21,lrsj);
	ps.setString(22,bz);
	ps.setString(23,bzmc);
	ps.setString(24,zp);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<getbjjbbm.length ;i++ )
	{
		ls_sql="delete from tc_csrjzcsjcjb ";
		ls_sql+=" where cpbm='"+wherecpbm+"' and bjjbbm='"+getbjjbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double ysjsfj=0;
		if (!ysjsfjStr[i].trim().equals(""))
		{
			try{
				ysjsfj=Double.parseDouble(ysjsfjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[ԭ�����շѼ�]��������:"+ysjsfjStr[i]);
				return;
			}
		}

		double sjsfj=0;
		if (!sjsfjStr[i].trim().equals(""))
		{
			try{
				sjsfj=Double.parseDouble(sjsfjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[�����շѼ�]��������:"+sjsfjStr[i]);
				return;
			}
		}

		double dzsjsfj=0;
		if (!dzsjsfjStr[i].trim().equals(""))
		{
			try{
				dzsjsfj=Double.parseDouble(dzsjsfjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[���������շѼ�]��������:"+sjsfjStr[i]);
				return;
			}
		}

		java.sql.Date dzkssj=null;
		try{
			if (!(dzkssjStr[i].equals(""))) dzkssj=java.sql.Date.valueOf(dzkssjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[���ۿ�ʼʱ��]�������ڸ�ʽ:"+dzkssjStr[i]);
			return;
		}

		java.sql.Date dzjzsj=null;
		try{
			if (!(dzjzsjStr[i].equals(""))) dzjzsj=java.sql.Date.valueOf(dzjzsjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[���۽���ʱ��]�������ڸ�ʽ:"+dzjzsjStr[i]);
			return;
		}

		if (sfdz[i].equals("1"))//1�����ۿۣ�2������
		{
			dzkssj=null;
			dzjzsj=null;
			dzsjsfj=0;
		}
		else{
			if (dzkssj==null)
			{
				conn.rollback();
				out.println("<BR>����δ¼��[���ۿ�ʼʱ��]");
				return;
			}
			if (dzjzsj==null)
			{
				conn.rollback();
				out.println("<BR>����δ¼��[���۽���ʱ��]");
				return;
			}
		}

		if (sjsfj>0)
		{
			ls_sql="insert into tc_csrjzcsjcjb ( cpbm,bjjbbm,ysjsfj,sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj) ";
			ls_sql+=" values (?,?,?,?,?,?,?,? )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,wherecpbm);
			ps.setString(2,getbjjbbm[i]);
			ps.setDouble(3,ysjsfj);
			ps.setDouble(4,sjsfj);
			ps.setString(5,sfdz[i]);
			ps.setDate(6,dzkssj);
			ps.setDate(7,dzjzsj);
			ps.setDouble(8,dzsjsfj);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>