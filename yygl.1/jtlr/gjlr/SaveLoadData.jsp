<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
String yhmc=(String)session.getAttribute("yhmc");

int zqs=0;
String ls=null;
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

String[] fgsbh=request.getParameterValues("fgsbh");
String[] yy_lrglf_ysblStr=request.getParameterValues("yy_lrglf_ysbl");
String[] yy_lrglf_sjsqStr=request.getParameterValues("yy_lrglf_sjsq");
String[] yy_lrsj_ysblStr=request.getParameterValues("yy_lrsj_ysbl");
String[] yy_lrsj_sjsqStr=request.getParameterValues("yy_lrsj_sjsq");
String[] yy_lrgc_qnpjStr=request.getParameterValues("yy_lrgc_qnpj");
String[] yy_lrgc_bzzsStr=request.getParameterValues("yy_lrgc_bzzs");
String[] yy_lrzc_qnpjStr=request.getParameterValues("yy_lrzc_qnpj");
String[] yy_lrzc_bzzsStr=request.getParameterValues("yy_lrzc_bzzs");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	ls_sql=" delete from yy_lr " ;
	ls_sql+=" where  zqs='"+zqs+"'" ;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<fgsbh.length ;i++ )
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
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[�ͻ�����ѱ���Ӧ�ձ���(%)]��������:"+e);
			return;
		}

		try{
			yy_lrglf_sjsq=Double.parseDouble(yy_lrglf_sjsqStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[�ͻ�����ѱ���ʵ����ȡ(%)]��������:"+e);
			return;
		}

		try{
			yy_lrsj_ysbl=Double.parseDouble(yy_lrsj_ysblStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[˰����������Ӧ�ձ���(%)]��������:"+e);
			return;
		}

		try{
			yy_lrsj_sjsq=Double.parseDouble(yy_lrsj_sjsqStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[˰����������ʵ����ȡ(%)]��������:"+e);
			return;
		}

		try{
			yy_lrgc_qnpj=Double.parseDouble(yy_lrgc_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[����ë����ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrgc_bzzs=Double.parseDouble(yy_lrgc_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[����ë���ʱ���ָ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrzc_qnpj=Double.parseDouble(yy_lrzc_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[����ë����ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrzc_bzzs=Double.parseDouble(yy_lrzc_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[����ë���ʱ���ָ��(%)]��������:"+e);
			return;
		}


	
		ls_sql="insert into yy_lr ( zqs,yy_lr_fgs,yy_lrglf_ysbl,yy_lrglf_sjsq,yy_lrsj_ysbl,yy_lrsj_sjsq,yy_lrgc_qnpj,yy_lrgc_bzzs,yy_lrzc_qnpj,yy_lrzc_bzzs,lrr,yy_lr_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,zqs);
		ps.setString(2,fgsbh[i]);
		ps.setDouble(3,yy_lrglf_ysbl);
		ps.setDouble(4,yy_lrglf_sjsq);
		ps.setDouble(5,yy_lrsj_ysbl);
		ps.setDouble(6,yy_lrsj_sjsq);
		ps.setDouble(7,yy_lrgc_qnpj);
		ps.setDouble(8,yy_lrgc_bzzs);
		ps.setDouble(9,yy_lrzc_qnpj);
		ps.setDouble(10,yy_lrzc_bzzs);
		ps.setString(11,yhmc);
		ps.executeUpdate();
		ps.close();

	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
