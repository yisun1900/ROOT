<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String glfxclmc=cf.GB2Uni(request.getParameter("glfxclmc"));

String ls=null;
double dj=0;

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
	ls_sql+=" where dqbm='"+dqbm+"' and glfxclmc='"+glfxclmc+"' and glflbm='2'";
	ls_sql+=" order by dqbm,bjbbh,bjjbbm,xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		glbxh=rs1.getString("glbxh");
		bjbbh=rs1.getString("bjbbh");
		bjjbbm=rs1.getString("bjjbbm");
		xmbh=rs1.getString("xmbh");


		ls_sql="update bj_jzglfxb set dj=?";
		ls_sql+=" where glbxh='"+glbxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dj);
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
	alert("�޸ĳɹ���");
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