<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<% 
String ls=null;
String[] dwmc=request.getParameterValues("dwmc");
String[] yy_lr_fgs=request.getParameterValues("yy_lr_fgs");
String[] yy_lrglf_ysblStr=request.getParameterValues("yy_lrglf_ysbl");
String[] yy_lrglf_sjsqStr=request.getParameterValues("yy_lrglf_sjsq");
String[] yy_lrsj_ysblStr=request.getParameterValues("yy_lrsj_ysbl");
String[] yy_lrsj_sjsqStr=request.getParameterValues("yy_lrsj_sjsq");
String[] yy_lrgc_qnpjStr=request.getParameterValues("yy_lrgc_qnpj");
String[] yy_lrgc_bzzsStr=request.getParameterValues("yy_lrgc_bzzs");
String[] yy_lrzc_qnpjStr=request.getParameterValues("yy_lrzc_qnpj");
String[] yy_lrzc_bzzsStr=request.getParameterValues("yy_lrzc_bzzs");
int zqs=0;
String lrr=null;
ls=request.getParameter("zqs");
try{
	if (!(ls.equals("")))  zqs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqs������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try
{	
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	for(int i=0;i<yy_lr_fgs.length;i++)
	{
		double yy_lrglf_ysbl=0;
		double yy_lrglf_sjsq=0;
		double yy_lrsj_ysbl=0;
		double yy_lrsj_sjsq=0;
		double yy_lrgc_qnpj=0;
		double yy_lrgc_bzzs=0;
		double yy_lrzc_qnpj=0;
		double yy_lrzc_bzzs=0;


		try{
			yy_lrglf_ysbl=Double.parseDouble(yy_lrglf_ysblStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[�ͻ�����ѱ���Ӧ�ձ���(%)]��������:"+e);
			return;
		}

		try{
			yy_lrglf_sjsq=Double.parseDouble(yy_lrglf_sjsqStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[�ͻ�����ѱ���ʵ����ȡ(%)]��������:"+e);
			return;
		}

		try{
			yy_lrsj_ysbl=Double.parseDouble(yy_lrsj_ysblStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[˰����������Ӧ�ձ���(%)]��������:"+e);
			return;
		}

		try{
			yy_lrsj_sjsq=Double.parseDouble(yy_lrsj_sjsqStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[˰����������ʵ����ȡ(%)]��������:"+e);
			return;
		}

		try{
			yy_lrgc_qnpj=Double.parseDouble(yy_lrgc_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[����ë����ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrgc_bzzs=Double.parseDouble(yy_lrgc_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[����ë���ʱ���ָ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrzc_qnpj=Double.parseDouble(yy_lrzc_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[����ë����ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrzc_bzzs=Double.parseDouble(yy_lrzc_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(dwmc[i])+"[����ë���ʱ���ָ��(%)]��������:"+e);
			return;
		}
		
		
		ls_sql="insert into yy_lr ( zqs,yy_lr_fgs,yy_lrglf_ysbl,yy_lrglf_sjsq,yy_lrsj_ysbl,yy_lrsj_sjsq,yy_lrgc_qnpj,yy_lrgc_bzzs,yy_lrzc_qnpj,yy_lrzc_bzzs,lrr,yy_lr_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,SYSDATE) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,zqs);
		ps.setString(2,yy_lr_fgs[i]);
		ps.setDouble(3,yy_lrglf_ysbl);
		ps.setDouble(4,yy_lrglf_sjsq);
		ps.setDouble(5,yy_lrsj_ysbl);
		ps.setDouble(6,yy_lrsj_sjsq);
		ps.setDouble(7,yy_lrgc_qnpj);
		ps.setDouble(8,yy_lrgc_bzzs);
		ps.setDouble(9,yy_lrzc_qnpj);
		ps.setDouble(10,yy_lrzc_bzzs);
		ps.setString(11,lrr);
		ps.executeUpdate();
		ps.close();
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
	
		
	
	
<html>
<head>
<title>�ؼ�����ָ��¼���</title>
</head>

<body>
</body>
</html>
