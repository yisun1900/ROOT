<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String tzyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
tzyy=cf.GB2Uni(request.getParameter("tzyy"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));


double ztsfbl=0;
ls=request.getParameter("ztsfbl");
try{
	if (!(ls.equals("")))  ztsfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ztsfbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ϸ��ٷֱ�]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt="2";//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��

	conn.setAutoCommit(false);

/*
	ls_sql="insert into crm_tzzkjl ( khbh,tzyy,gcfqdzk,gczxzk,glfzk,sjzk,sjfzk,hdzsjz,lrr,lrsj,lrbm,clzt,tzhmll ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,tzyy);
	ps.setDouble(3,0);
	ps.setDouble(4,0);
	ps.setDouble(5,0);
	ps.setDouble(6,0);
	ps.setDouble(7,0);
	ps.setDouble(8,0);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,clzt);
	ps.executeUpdate();
	ps.close();
*/

	ls_sql="update bj_bjxmmx set zqdj=zqdj*(100+"+ztsfbl+")/100,cldj=cldj*(100+"+ztsfbl+")/100,rgdj=rgdj*(100+"+ztsfbl+")/100,jxdj=jxdj*(100+"+ztsfbl+")/100,zcf=zcf*(100+"+ztsfbl+")/100,shf=shf*(100+"+ztsfbl+")/100,ysf=ysf*(100+"+ztsfbl+")/100,qtf=qtf*(100+"+ztsfbl+")/100,dj=dj*(100+"+ztsfbl+")/100";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();




	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//�����˹����������¿ͻ��ۿ�
	dzbj.updateTzZkl(conn,khbh,"yz");

	//���±����ۿ�
	dzbj.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"yz");

	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>����ʧ��,��������: " + e);
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