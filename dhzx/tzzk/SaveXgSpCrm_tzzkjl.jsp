<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clzt=null;
String spr=null;
java.sql.Date spsj=null;
String spsm=null;
clzt=cf.GB2Uni(request.getParameter("clzt"));
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[spsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
spsm=cf.GB2Uni(request.getParameter("spsm"));

String tzjlh=request.getParameter("tzjlh");
String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_tzzkjl set clzt=?,spr=?,spsj=?,spsm=? ";
	ls_sql+=" where  tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,spr);
	ps.setDate(3,spsj);
	ps.setString(4,spsm);
	ps.executeUpdate();
	ps.close();

	if (clzt.equals("4"))//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
	{
		dzbj.Tzk tzk=new dzbj.Tzk();
		//�����޸ģ����¿ͻ��ۿ�
		tzk.updateTzZkl(conn,tzjlh,khbh,"yz");
		//���±����ۿ�
		tzk.updateBjZkl(conn,khbh,"yz");

		//���������շ���Ŀ�������շѰٷֱ�
		dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
		newdzbj.updateSfxm(conn,khbh,"yz");

		//��ȡ���ӱ��۽��
		dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
		double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


		//�޸ģ����ӱ����ܶ�
		ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
		ps.executeUpdate();
		ps.close();
	}
	else{
		dzbj.Tzk tzk=new dzbj.Tzk();
		//�����˹����������¿ͻ��ۿ�
		tzk.updateHdZkl(conn,khbh,"yz");
		//���±����ۿ�
		tzk.updateBjZkl(conn,khbh,"yz");

		//���������շ���Ŀ�������շѰٷֱ�
		dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
		newdzbj.updateSfxm(conn,khbh,"yz");

		//��ȡ���ӱ��۽��
		dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
		double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");




		//�޸ģ����ӱ����ܶ�
		ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>