<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] cldlbm =request.getParameterValues("cldlbm");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] nbbm =request.getParameterValues("nbbm");
String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] cbj =request.getParameterValues("cbj");
String[] dfgsjg =request.getParameterValues("dfgsjg");
String[] dgzjg =request.getParameterValues("dgzjg");
String[] xsfs =request.getParameterValues("xsfs");
String[] zxqdl =request.getParameterValues("zxqdl");
String[] sfcy =request.getParameterValues("sfcy");
String[] gysmc =request.getParameterValues("gysmc");

String dqbm=request.getParameter("dqbm");//��������


//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

try {
	conn=cf.getConnection();    //�õ�����


	//���ϵͳ��ʼ������
	String nbbmsfwy=null;
	ls_sql=" select nbbmsfwy " ;
	ls_sql+=" from jxc_xtcsh " ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		nbbmsfwy=cf.fillNull(rs.getString("nbbmsfwy"));
	}
	else
	{
		rs.close();
		ps.close();
		out.println("<BR>��������������û�ж�ϵͳ���г�ʼ�������ȳ�ʼ��ϵͳ��");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	for (int i=0;i<nbbm.length ;i++ )
	{

		String clbm=null;
		ls_sql=" select jxc_cljgb.clbm" ;
		ls_sql+=" from jxc_clbm,jxc_cljgb " ;
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.nbbm='"+nbbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cllb='1'" ;//0�����ģ�1������
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clbm = rs.getString(1);			    
		}
		else{
			conn.rollback();
			rs.close();
			ps.close();
			out.println("<BR>����������[�ڲ�����"+nbbm[i]+"]��������");
			return;
		}
		rs.close();
		ps.close();


		ls_sql=" update jxc_cljgb set cbj=?,dfgsjg=?,dgzjg=?,xsfs=?,zxqdl=?,sfcy=?,gysmc=?";
		ls_sql+=" where clbm='"+clbm+"' and jxc_cljgb.dqbm='"+dqbm+"'" ;//0�����ģ�1������
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cbj[i]);
		ps.setString(2,dfgsjg[i]);
		ps.setString(3,dgzjg[i]);
		ps.setString(4,xsfs[i]);
		ps.setString(5,zxqdl[i]);
		ps.setString(6,sfcy[i]);
		ps.setString(7,cf.GB2Uni(gysmc[i]));
		ps.executeUpdate();
		ps.close();



/*
		//���¹��Ϸ����ɱ�������������������������������������ʼ
		ls_sql="update bj_jzglfxb set dj=? ";
		ls_sql+=" where glfxclbm='"+nbbm[i]+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.executeUpdate();
		ps.close();

		String bjbbh=null;
		dqbm=null;
		String bjjbbm=null;
		String xmbh=null;
		ls_sql="select distinct bjbbh,dqbm,bjjbbm,xmbh";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where glfxclbm='"+nbbm[i]+"' and dqbm='"+dqbm+"'";
		ls_sql+=" order by bjbbh,dqbm,bjjbbm,xmbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			bjbbh=rs1.getString("bjbbh");
			dqbm=rs1.getString("dqbm");
			bjjbbm=rs1.getString("bjjbbm");
			xmbh=rs1.getString("xmbh");


			double clcb=0;//���ϳɱ�
			double rgcb=0;//�˹��ɱ�
			double jxcb=0;//��е�ɱ�
			double cbenj=0;//�ɱ���
			ls_sql="select ROUND(sum(dj*xhl),2)";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				clcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="select ROUND(sum(dj*xhl),2)";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:�˹�
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				rgcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="select ROUND(sum(dj*xhl),2)";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:��е
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				jxcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			cbenj=cf.round(clcb+rgcb+jxcb,2);

			ls_sql="update bj_jzbjb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,clcb);
			ps.setDouble(2,rgcb);
			ps.setDouble(3,jxcb);
			ps.setDouble(4,cbenj);
			ps.executeUpdate();
			ps.close();

			ls_sql="update bj_jzbjb1 set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,clcb);
			ps.setDouble(2,rgcb);
			ps.setDouble(3,jxcb);
			ps.setDouble(4,cbenj);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

		//���¹��Ϸ����ɱ���������������������������������������
*/
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){}
 }
%>              
