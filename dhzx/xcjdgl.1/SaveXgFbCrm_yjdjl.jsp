<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zzqrjdrq=null;
String zzqrjdsj=null;
String fbr=null;
java.sql.Date fbsj=null;
ls=request.getParameter("zzqrjdrq");
try{
	if (!(ls.equals("")))  zzqrjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zzqrjdrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȷ��Ԥ��������]����ת����������:"+e);
	return;
}

fbr=cf.GB2Uni(request.getParameter("fbr"));
zzqrjdsj=cf.GB2Uni(request.getParameter("zzqrjdsj"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fbsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɵ�ʱ��]����ת����������:"+e);
	return;
}
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	ls_sql=" SELECT clzt,khbh";
	ls_sql+=" FROM crm_yjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("2"))//1�����룻2��������3����Ԥ����
	{
		out.print("���󣡴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_yjdjl set zzqrjdrq=?,zzqrjdsj=?,fbr=?,fbsj=?,sgd=?,sgbz=?,zjxm=? ";
	ls_sql+=" where  jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zzqrjdrq);
	ps.setString(2,zzqrjdsj);
	ps.setString(3,fbr);
	ps.setDate(4,fbsj);
	ps.setString(5,sgd);
	ps.setString(6,sgbz);
	ps.setString(7,zjxm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_zxkhxx set sgd=?,sgbz=?,zjxm=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,sgbz);
	ps.setString(3,zjxm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>