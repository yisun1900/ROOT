<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fkfabm=null;
long fkcs=0;
String lx=null;
double yfkbl=0;
double bqfkbl=0;
fkfabm=cf.GB2Uni(request.getParameter("fkfabm"));
ls=request.getParameter("fkcs");
try{
	if (!(ls.equals("")))  fkcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�տ�����]����ת����������:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
ls=request.getParameter("yfkbl");
try{
	if (!(ls.equals("")))  yfkbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yfkbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼ��տ���ʣ�%��]����ת����������:"+e);
	return;
}
ls=request.getParameter("bqfkbl");
try{
	if (!(ls.equals("")))  bqfkbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bqfkbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����տ���ʣ�%��]����ת����������:"+e);
	return;
}
String sfbhglf=cf.GB2Uni(request.getParameter("sfbhglf"));
String sfbhsj=cf.GB2Uni(request.getParameter("sfbhsj"));

String sfbhgcf=cf.GB2Uni(request.getParameter("sfbhgcf"));
String sfbhjrqtf=cf.GB2Uni(request.getParameter("sfbhjrqtf"));
String sfbhbjrqtf=cf.GB2Uni(request.getParameter("sfbhbjrqtf"));
String sfbhsjf=cf.GB2Uni(request.getParameter("sfbhsjf"));
String sfbhzcf=cf.GB2Uni(request.getParameter("sfbhzcf"));
String sfsjfsesk=cf.GB2Uni(request.getParameter("sfsjfsesk"));

String wherefkfabm=null;
String wherefkcs=null;
wherefkfabm=cf.GB2Uni(request.getParameter("wherefkfabm"));
wherefkcs=cf.GB2Uni(request.getParameter("wherefkcs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (sfsjfsesk.equals("Y"))//�Ƿ�ʵ�ʷ����ܶ��տ�  N����Y����
	{
		sfbhglf="";
		sfbhsj="";
		sfbhgcf="";
		sfbhjrqtf="";
		sfbhbjrqtf="";
		sfbhsjf="";
		sfbhzcf="";
	}

	ls_sql="update cw_fkfamx set fkfabm=?,fkcs=?,lx=?,yfkbl=?,bqfkbl=?,sfbhsj=?,sfbhglf=?,sfbhgcf=?,sfbhjrqtf=?,sfbhbjrqtf=?,sfbhsjf=?,sfbhzcf=?,sfsjfsesk=? ";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"') and  (fkcs="+wherefkcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fkfabm);
	ps.setLong(2,fkcs);
	ps.setString(3,lx);
	ps.setDouble(4,yfkbl);
	ps.setDouble(5,bqfkbl);
	ps.setString(6,sfbhsj);
	ps.setString(7,sfbhglf);
	ps.setString(8,sfbhgcf);
	ps.setString(9,sfbhjrqtf);
	ps.setString(10,sfbhbjrqtf);
	ps.setString(11,sfbhsjf);
	ps.setString(12,sfbhzcf);
	ps.setString(13,sfsjfsesk);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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