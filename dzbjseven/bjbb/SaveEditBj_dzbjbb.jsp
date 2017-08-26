<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjbbh=null;
java.sql.Date qysj=null;
java.sql.Date yxq=null;
String sfzybb=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
ls=request.getParameter("qysj");
try{
	if (!(ls.equals("")))  qysj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qysj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxq");
try{
	if (!(ls.equals("")))  yxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yxq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч��]����ת����������:"+e);
	return;
}
sfzybb=cf.GB2Uni(request.getParameter("sfzybb"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheredqbm=null;
String wherebjbbh=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjbbh=cf.GB2Uni(request.getParameter("wherebjbbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String oldsfzybb="";
	ls_sql="select sfzybb";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldsfzybb=rs.getString(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update bj_dzbjbb set dqbm=?,bjbbh=?,qysj=?,yxq=?,sfzybb=?,bz=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjbbh);
	ps.setDate(3,qysj);
	ps.setDate(4,yxq);
	ps.setString(5,sfzybb);
	ps.setString(6,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql="update bj_jzbjb set bjbbh=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_glxmb set bjbbh=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_jzglfxb set bjbbh=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_jzbjb1 set bjbbh=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_glxmb1 set bjbbh=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_jzglfxb1 set bjbbh=? ";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and  bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and sfzybb='2'";//1��δ���ã�2����ǰ�棻3�����ð棻4����ͣ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>1)
	{
		conn.rollback();
		out.println("�����ж��[��ǰ��]");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and sfzybb in('2','3') and qysj>SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		conn.rollback();
		out.println("����δ������ʱ�䣬����ѡ������");
		return;
	}

	if (oldsfzybb.equals("4"))//1��δ���ã�2����ǰ�棻3�����ð棻4����ͣ��
	{
		if (!sfzybb.equals("4"))
		{
			//��ͣ�ð汾���ݣ���������������������������ʼ
			ls_sql =" insert into bj_jzbjb (bjbbh,dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,lrr,lrsj,bz) ";
			ls_sql+=" select                bjbbh,dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,lrr,lrsj,bz";
			ls_sql+=" from bj_jzbjb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql =" insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh) ";
			ls_sql+=" select                 bjbbh,dqbm,bjjbbm,xmbh,glxmbh ";
			ls_sql+=" from bj_glxmb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			

			ls_sql =" insert into bj_jzglfxb (glbxh,bjbbh,dqbm,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz) ";
			ls_sql+=" select                  glbxh,bjbbh,dqbm,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz ";
			ls_sql+=" from bj_jzglfxb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql =" delete from bj_jzbjb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql =" delete from bj_glxmb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql =" delete from bj_jzglfxb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//��ͣ�ð汾���ݣ�����������������������������
		}
	}
	else{
		if (sfzybb.equals("4"))
		{
			//��ͣ�ð汾���ݣ���������������������������ʼ
			
			ls_sql =" insert into bj_jzbjb1 (bjbbh,dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,lrr,lrsj,bz) ";
			ls_sql+=" select                 bjbbh,dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,lrr,lrsj,bz";
			ls_sql+=" from bj_jzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql =" insert into bj_glxmb1 (bjbbh,dqbm,bjjbbm,xmbh,glxmbh) ";
			ls_sql+=" select                 bjbbh,dqbm,bjjbbm,xmbh,glxmbh ";
			ls_sql+=" from bj_glxmb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

	
			ls_sql =" insert into bj_jzglfxb1 (glbxh,bjbbh,dqbm,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz) ";
			ls_sql+=" select                   glbxh,bjbbh,dqbm,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz ";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql =" delete from bj_jzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql =" delete from bj_glxmb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql =" delete from bj_jzglfxb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//��ͣ�ð汾���ݣ�����������������������������
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>