<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

double zqsfje=0;
double dxzkl=0;
double sfje=0;
String bz=null;

ls=request.getParameter("zqsfje");
try{
	if (!(ls.equals("")))  zqsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqsfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ�շѽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dxzkl");
try{
	if (!(ls.equals("")))  dxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dxzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sfje");
try{
	if (!(ls.equals("")))  sfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ��շѽ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));


String wherekhbh=null;
String wheresfxmbm=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wheresfxmbm=cf.GB2Uni(request.getParameter("wheresfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update bj_sfxmmx set zqsfje=?,dxzkl=?,sfje=?,bz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sfxmbm='"+wheresfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqsfje);
	ps.setDouble(2,dxzkl);
	ps.setDouble(3,sfje);
	ps.setString(4,bz);
	ps.executeUpdate();
	ps.close();


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,wherekhbh,"hmy");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,wherekhbh,"hmy");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	parent.window.close();
	//-->
	</SCRIPT>
	<%

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