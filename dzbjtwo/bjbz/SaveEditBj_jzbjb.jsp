<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String dqbm=null;
String xmbh=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clcb=0;
double rgcb=0;
double cbenj=0;
double clbj=0;
double rgbj=0;
double bj=0;


double xh=0;
String gycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("clcb");
try{
	if (!(ls.equals("")))  clcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ϳɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("rgcb");
try{
	if (!(ls.equals("")))  rgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rgcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˹��ɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbenj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɱ���]����ת����������:"+e);
	return;
}

ls=request.getParameter("clbj");
try{
	if (!(ls.equals("")))  clbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("rgbj");
try{
	if (!(ls.equals("")))  rgbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rgbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ԥ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}

gycl=cf.GB2Uni(request.getParameter("gycl"));
String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
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

String sfbxx=request.getParameter("sfbxx");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String glxmbh=cf.GB2Uni(request.getParameter("glxmbh"));
String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sfxycl=cf.GB2Uni(request.getParameter("sfxycl"));
String sfxyyjd=cf.GB2Uni(request.getParameter("sfxyyjd"));

String xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
String sfyxdz=cf.GB2Uni(request.getParameter("sfyxdz"));
double sgcbj=0;
ls=request.getParameter("sgcbj");
try{
	if (!(ls.equals("")))  sgcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgcbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӱ���]����ת����������:"+e);
	return;
}
double zdzk=0;
ls=request.getParameter("zdzk");
try{
	if (!(ls.equals("")))  zdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ۿ�]����ת����������:"+e);
	return;
}

String wheredqbm=request.getParameter("wheredqbm");
String wherexmbh=cf.GB2Uni(request.getParameter("wherexmbh"));
String wherebjjbbm=request.getParameter("wherebjjbbm");
String wherebjbbh=cf.GB2Uni(request.getParameter("wherebjbbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	if (!wherexmbh.equals(xmbh) || !wherebjjbbm.equals(bjjbbm))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_jzbjb";
		ls_sql+=" where bjbbh='"+bjbbh+"'  and xmbh='"+xmbh+"'  and dqbm='"+dqbm+"'  and bjjbbm='"+bjjbbm+"'";
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
			out.println("����[��Ŀ���]�ڸñ��ۼ����Ѵ���");
			return;
		}
	}

	glxmbh=cf.replace(glxmbh,"��",",");
	glxmbh=cf.replace(glxmbh," ","");

	conn.setAutoCommit(false);

	ls_sql="update bj_jzbjb set dqbm=?,xmbh=?,bjjbbm=?,xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=?    ,clbj=?,rgbj=?,bj=?,gycl=?,xh=?,lrr=?   ,lrsj=?,sfbxx=?,bjbbh=?,glxmbh=?,flmcgg=?,bz=?,sfxycl=?,sfxyyjd=?,xmflbm=?,sgcbj=?,sfyxdz=?,zdzk=? ";
	ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,bjjbbm);
	ps.setString(4,xmmc);
	ps.setString(5,xmdlbm);
	ps.setString(6,xmxlbm);
	ps.setString(7,smbm);
	ps.setString(8,jldwbm);

	ps.setDouble(9,clbj);
	ps.setDouble(10,rgbj);
	ps.setDouble(11,bj);
	ps.setString(12,gycl);
	ps.setDouble(13,xh);
	ps.setString(14,lrr);

	ps.setDate(15,lrsj);
	ps.setString(16,sfbxx);
	ps.setString(17,bjbbh);
	ps.setString(18,glxmbh);
	ps.setString(19,flmcgg);
	ps.setString(20,bz);
	ps.setString(21,sfxycl);
	ps.setString(22,sfxyyjd);
	ps.setString(23,xmflbm);
	ps.setDouble(24,sgcbj);
	ps.setString(25,sfyxdz);
	ps.setDouble(26,zdzk);
	ps.executeUpdate();
	ps.close();

	//ɾ����ǰ������Ŀ��������������������������������ʼ
	String getglxmbh=null;
	ls_sql="SELECT glxmbh";
	ls_sql+=" FROM bj_glxmb";
	ls_sql+=" where dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"' and bjbbh='"+wherebjbbh+"'" ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getglxmbh=rs.getString(1).trim();


		ls_sql ="update bj_jzbjb set glxmbh=null";
		ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and xmbh='"+getglxmbh+"' and bjjbbm='"+wherebjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql=" delete from bj_glxmb " ;
		ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and xmbh='"+getglxmbh+"' and bjjbbm='"+wherebjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	if (getglxmbh!=null)
	{
		ls_sql=" delete from bj_glxmb " ;
		ls_sql+=" where dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"' and bjbbh='"+wherebjbbh+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	//ɾ����ǰ������Ŀ����������������������������������


	//�����¹�����Ŀ��������������������������������ʼ
	if (!glxmbh.equals(""))//�й�����Ŀ
	{
		ls_sql=" delete from bj_glxmb " ;
		ls_sql+=" where dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"' and bjbbh='"+wherebjbbh+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String[] strArray=cf.tokenToArray(glxmbh,",");

		for (int j=0;j<strArray.length ;j++ )
		{
			ls_sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh )";
			ls_sql+=" values('"+wherebjbbh+"','"+wheredqbm+"','"+wherebjjbbm+"','"+wherexmbh+"','"+strArray[j]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String lsGlxmbh=cf.replace(glxmbh,strArray[j],wherexmbh);

			ls_sql ="update bj_jzbjb set glxmbh='"+lsGlxmbh+"'";
			ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and xmbh='"+strArray[j]+"' and bjjbbm='"+wherebjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql=" delete from bj_glxmb " ;
			ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and xmbh='"+strArray[j]+"' and bjjbbm='"+wherebjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String[] lsstrArray=cf.tokenToArray(lsGlxmbh,",");
			for (int j1=0;j1<lsstrArray.length ;j1++ )
			{
				ls_sql=" delete from bj_glxmb " ;
				ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and xmbh='"+strArray[j]+"' and glxmbh='"+lsstrArray[j1]+"' and bjjbbm='"+wherebjjbbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh )";
				ls_sql+=" values('"+wherebjbbh+"','"+wheredqbm+"','"+wherebjjbbm+"','"+strArray[j]+"','"+lsstrArray[j1]+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

		}

		//��������Ŀ����Ƿ���ڣ�������������������������������ʼ
		ls_sql="SELECT glxmbh";
		ls_sql+=" FROM bj_glxmb";
		ls_sql+=" where dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"' and bjbbh='"+wherebjbbh+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getglxmbh=rs.getString(1).trim();

			int glMark=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_jzbjb";
			ls_sql+=" where dqbm='"+wheredqbm+"' and xmbh='"+getglxmbh+"' and bjjbbm='"+wherebjjbbm+"' and bjbbh='"+wherebjbbh+"'" ;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				glMark=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (glMark<1)
			{
				conn.rollback();
				out.println("���󣡹�����Ŀ��š�"+getglxmbh+"��������");
				return;
			}
		}
		rs.close();
		ps.close();
		//��������Ŀ����Ƿ���ڣ���������������������������������
	}
	//�����¹�����Ŀ����������������������������������


	conn.commit();

	//�������
	int pxxh=0;
	String getxmbh=null;
	ls_sql="SELECT xmbh";
	ls_sql+=" FROM bj_jzbjb";
	ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and bjjbbm='"+wherebjjbbm+"'";
	ls_sql+=" order by xh,xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxmbh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_jzbjb set xh="+pxxh;
		ls_sql+=" where  bjbbh='"+wherebjbbh+"' and dqbm='"+wheredqbm+"' and bjjbbm='"+wherebjjbbm+"' and xmbh='"+getxmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>