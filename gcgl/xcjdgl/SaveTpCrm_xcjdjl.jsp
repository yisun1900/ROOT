<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String tpshr=null;
tpshr=cf.GB2Uni(request.getParameter("tpshr"));
java.sql.Date tpshsj=null;
ls=request.getParameter("tpshsj");
try{
	if (!(ls.equals("")))  tpshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tpshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʱ��]����ת����������:"+e);
	return;
}
String tpsftg=cf.GB2Uni(request.getParameter("tpsftg"));
String tpsm=cf.GB2Uni(request.getParameter("tpsm"));

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String sfxtp=null;
	ls_sql=" SELECT khbh,clzt,sfxtp";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clzt=cf.fillNull(rs.getString("clzt"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("1"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	{
		out.print("����������");
		return;
	}
	if (!sfxtp.equals("Y"))
	{
		out.print("���󣡲�������");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set tpsftg=?,tpsm=?,tpshr=?,tpshsj=?,clzt='4' ";
	ls_sql+=" where  jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tpsftg);
	ps.setString(2,tpsm);
	ps.setString(3,tpshr);
	ps.setDate(4,tpshsj);
	ps.executeUpdate();
	ps.close();

	String setxcjdbz="";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
	if (tpsftg.equals("Y"))//Y���ǣ�N����
	{
		setxcjdbz="6";
	}
	else{
		setxcjdbz="7";
	}

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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