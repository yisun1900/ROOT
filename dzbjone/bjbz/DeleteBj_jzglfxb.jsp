<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String glbxh=request.getParameter("glbxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	String bjbbh=null;
	String dqbm=null;
	String bjjbbm=null;
	String xmbh=null;
	ls_sql="select bjbbh,dqbm,bjjbbm,xmbh";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where glbxh="+glbxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		dqbm=rs.getString("dqbm");
		bjjbbm=rs.getString("bjjbbm");
		xmbh=rs.getString("xmbh");
	}
	rs.close();
	ps.close();

	//��װ���Ϸ�����
	ls_sql="delete from bj_jzglfxb ";
	ls_sql+=" where glbxh="+glbxh;
	ps= conn.prepareStatement(ls_sql);
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
	//���±��۳ɱ���������������������������������������



	conn.commit();

	response.sendRedirect("InsertBj_jzglfxb.jsp?xmbh="+xmbh+"&dqbm="+dqbm+"&bjjbbm="+bjjbbm+"&bjbbh="+java.net.URLEncoder.encode(bjbbh,"UTF-8")+"&save=D");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>