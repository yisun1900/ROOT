<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qrjg=cf.GB2Uni(request.getParameter("qrjg"));
String qrr=null;
java.sql.Date qrsj=null;
String qrsm=null;
qrr=cf.GB2Uni(request.getParameter("qrr"));
ls=request.getParameter("qrsj");
try{
	if (!(ls.equals("")))  qrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ȷ��ʱ��]����ת����������:"+e);
	return;
}
qrsm=cf.GB2Uni(request.getParameter("qrsm"));

String lfjlh=request.getParameter("lfjlh");

Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;
String zt=null;
if (qrjg.equals("Y"))
{
	zt="2";//1��¼��ƻ���2���ƻ�ȷ�ϣ�3���ƻ�ȡ����4����������
}
else{
	zt="3";
}

try {
	conn=cf.getConnection();


	ls_sql="update crm_lfjl set qrjg=?,qrr=?,qrsj=?,zt=?,qrsm=?";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
 	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qrjg);
	ps.setString(2,qrr);
	ps.setDate(3,qrsj);
	ps.setString(4,zt);
	ps.setString(5,qrsm);
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