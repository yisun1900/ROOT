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
String[] yy_cxzjzk_qnpjStr=request.getParameterValues("yy_cxzjzk_qnpj");
String[] yy_cxzjzk_bzzsStr=request.getParameterValues("yy_cxzjzk_bzzs");
String[] yy_cxzpzq_qnpjStr=request.getParameterValues("yy_cxzpzq_qnpj");
String[] yy_cxzpzq_bzzsStr=request.getParameterValues("yy_cxzpzq_bzzs");
String[] yy_cxgcfx_qnpjStr=request.getParameterValues("yy_cxgcfx_qnpj");
String[] yy_cxgcfx_bzzsStr=request.getParameterValues("yy_cxgcfx_bzzs");
String[] yy_cxrlhj_qnpjStr=request.getParameterValues("yy_cxrlhj_qnpj");
String[] yy_cxrlhj_bzzsStr=request.getParameterValues("yy_cxrlhj_bzzs");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	ls_sql=" delete from yy_cx " ;
	ls_sql+=" where  zqs='"+zqs+"'" ;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<fgsbh.length ;i++ )
	{
		double yy_cxzjzk_qnpj=0;
		double yy_cxzjzk_bzzs=0;
		double yy_cxzpzq_qnpj=0;
		double yy_cxzpzq_bzzs=0;
		double yy_cxgcfx_qnpj=0;
		double yy_cxgcfx_bzzs=0;
		double yy_cxrlhj_qnpj=0;
		double yy_cxrlhj_bzzs=0;


		try{
			yy_cxzjzk_qnpj=Double.parseDouble(yy_cxzjzk_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[ֱ���ۿ�ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxzjzk_bzzs=Double.parseDouble(yy_cxzjzk_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[ֱ���ۿ۱���ָ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxzpzq_qnpj=Double.parseDouble(yy_cxzpzq_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[��Ʒ��ȯȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxzpzq_bzzs=Double.parseDouble(yy_cxzpzq_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[��Ʒ��ȯ����ָ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxgcfx_qnpj=Double.parseDouble(yy_cxgcfx_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[���̷���ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxgcfx_bzzs=Double.parseDouble(yy_cxgcfx_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[���̷��ֱ���ָ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxrlhj_qnpj=Double.parseDouble(yy_cxrlhj_qnpjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[�����ϼ�ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_cxrlhj_bzzs=Double.parseDouble(yy_cxrlhj_bzzsStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(fgsbh[i])+"[�����ϼƱ���ָ��(%)]��������:"+e);
			return;
		}


	
		ls_sql="insert into yy_cx ( zqs,yy_cx_fgs,yy_cxzjzk_qnpj,yy_cxzjzk_bzzs,yy_cxzpzq_qnpj,yy_cxzpzq_bzzs,yy_cxgcfx_qnpj,yy_cxgcfx_bzzs,yy_cxrlhj_qnpj,yy_cxrlhj_bzzs,lrr,yy_cx_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,zqs);
		ps.setString(2,fgsbh[i]);
		ps.setDouble(3,yy_cxzjzk_qnpj);
		ps.setDouble(4,yy_cxzjzk_bzzs);
		ps.setDouble(5,yy_cxzpzq_qnpj);
		ps.setDouble(6,yy_cxzpzq_bzzs);
		ps.setDouble(7,yy_cxgcfx_qnpj);
		ps.setDouble(8,yy_cxgcfx_bzzs);
		ps.setDouble(9,yy_cxrlhj_qnpj);
		ps.setDouble(10,yy_cxrlhj_bzzs);
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
