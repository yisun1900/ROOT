<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%


String ls=null;
String fccbj=cf.GB2Uni(request.getParameter("fccbj"));

double cbj=0;
double jqpjcbj=0;

if (fccbj.equals("2"))//1�����ۣ�2����Ȩƽ����
{
	ls=request.getParameter("jqpjcbj");
	try{
		if (!(ls.equals("")))  jqpjcbj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����jqpjcbj������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[�ɱ���]����ת����������:"+e);
		return;
	}
}
else{
	ls=request.getParameter("cbj");
	try{
		if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����cbj������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[�ɱ���]����ת����������:"+e);
		return;
	}
}



String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String nbbm=null;
	ls_sql="select nbbm";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nbbm=rs.getString("nbbm");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (fccbj.equals("2"))//1�����ۣ�2����Ȩƽ����
	{
		ls_sql="update jxc_cljgb set jqpjcbj=?,lrr=?,lrsj=SYSDATE,lrbm=?,ssfgs=?,bz=? ";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,jqpjcbj);
		ps.setString(2,lrr);
		ps.setString(3,lrbm);
		ps.setString(4,ssfgs);
		ps.setString(5,bz);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_cljgb set cbj=?,lrr=?,lrsj=SYSDATE,lrbm=?,ssfgs=?,bz=? ";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.setString(2,lrr);
		ps.setString(3,lrbm);
		ps.setString(4,ssfgs);
		ps.setString(5,bz);
		ps.executeUpdate();
		ps.close();


		//���¹��Ϸ����ɱ�������������������������������������ʼ
		ls_sql="update bj_jzglfxb set dj=? ";
		ls_sql+=" where glfxclbm='"+nbbm+"' and dqbm='"+dqbm+"'";
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
		ls_sql+=" where glfxclbm='"+nbbm+"' and dqbm='"+dqbm+"'";
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