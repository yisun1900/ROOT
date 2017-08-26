<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String oldglfxclbm=request.getParameter("oldglfxclbm");

String ls=null;
String glfxclbm=null;
String glfxclmc=null;
double dj=0;
String jldwbm=null;

glfxclbm=cf.GB2Uni(request.getParameter("glfxclbm"));
glfxclmc=cf.GB2Uni(request.getParameter("glfxclmc"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String glbxh=null;
	String bjbbh=null;
	String bjjbbm=null;
	String xmbh=null;
	ls_sql="select glbxh,bjbbh,bjjbbm,xmbh";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glfxclbm='"+oldglfxclbm+"'";
	ls_sql+=" order by dqbm,bjbbh,bjjbbm,xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		glbxh=rs1.getString("glbxh");
		bjbbh=rs1.getString("bjbbh");
		bjjbbm=rs1.getString("bjjbbm");
		xmbh=rs1.getString("xmbh");

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glfxclbm='"+glfxclbm+"'";
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
			conn.rollback();
			out.println("������Ŀ["+xmbh+"]���ϱ���["+glfxclbm+"]�Ѵ���");
			return;
		}

		ls_sql="update bj_jzglfxb set glfxclbm=?,glfxclmc=?,dj=?,jldwbm=? ";
		ls_sql+=" where glbxh='"+glbxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,glfxclbm);
		ps.setString(2,glfxclmc);
		ps.setDouble(3,dj);
		ps.setString(4,jldwbm);
		ps.executeUpdate();
		ps.close();

		//���±��۳ɱ�������������������������������������ʼ
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
		//���±��۳ɱ���������������������������������������
	}
	rs1.close();
	ps1.close();


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("�滻�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
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