<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sjsfsl=0;
double sjcj=0;
double sjsfje=0;


ls=request.getParameter("sjsfsl");
try{
	if (!(ls.equals("")))  sjsfsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsfsl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjcj");
try{
	if (!(ls.equals("")))  sjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjcj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsfje");
try{
	if (!(ls.equals("")))  sjsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շѽ��]����ת����������:"+e);
	return;
}


String khbh=null;
String wherejgwzbm=null;
String wheretccplbbm=null;
String whereppmc=null;
khbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherejgwzbm=cf.GB2Uni(request.getParameter("wherejgwzbm"));
wheretccplbbm=cf.GB2Uni(request.getParameter("wheretccplbbm"));
whereppmc=cf.GB2Uni(request.getParameter("whereppmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="update bj_khppsjcjb set sjcj=?,sjsfje=? ";
	ls_sql+=" where  (khbh='"+khbh+"') and  (jgwzbm='"+wherejgwzbm+"') and  (ppmc='"+whereppmc+"') and  (tccplbbm="+wheretccplbbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sjcj);
	ps.setDouble(2,sjsfje);
	ps.executeUpdate();
	ps.close();


	//��ʼ��
	dzbj.Tzk tzk=new dzbj.Tzk();
	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

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