<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lflxbm=null;
lflxbm=request.getParameter("lflxbm");
String khbh=request.getParameter("khbh");
java.sql.Date jhsmsj=null;
ls=request.getParameter("jhsmsj");
try{
	if (!(ls.equals("")))  jhsmsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhsmsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}

String jhsmry=cf.GB2Uni(request.getParameter("jhsmry"));
String smmb=cf.GB2Uni(request.getParameter("smmb"));
String xfxqr=cf.GB2Uni(request.getParameter("xfxqr"));
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bzsm=null;
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
bzsm=cf.GB2Uni(request.getParameter("bzsm"));

String lfjlh=request.getParameter("lfjlh");

Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;
String zt=null;
if (xfxqr.equals("Y"))
{
	zt="1";//1��¼��ƻ���2���ƻ�ȷ�ϣ�3���ƻ�ȡ����4����������
}
else{
	zt="2";
}

try {
	conn=cf.getConnection();


	ls_sql="update crm_lfjl set lflxbm=?,jhsmsj=?,jhsmry=?,smmb=?,xfxqr=?,lrr=?,lrsj=?,lrbm=?,zt=?,bzsm=?";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
 	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lflxbm);
	ps.setDate(2,jhsmsj);
	ps.setString(3,jhsmry);
	ps.setString(4,smmb);
	ps.setString(5,xfxqr);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,zt);
	ps.setString(10,bzsm);
	ps.executeUpdate();
	ps.close();

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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>