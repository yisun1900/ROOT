<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date tgshsj=null;
String tgshr=null;
String tgshsm=null;

ls=request.getParameter("tgshsj");
try{
	if (!(ls.equals("")))  tgshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tgshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ͣ������ʱ��]����ת����������:"+e);
	return;
}
tgshr=cf.GB2Uni(request.getParameter("tgshr"));
tgshsm=cf.GB2Uni(request.getParameter("tgshsm"));
String tgshjg=cf.GB2Uni(request.getParameter("tgshjg"));
String tgyybm=null;
tgyybm=cf.GB2Uni(request.getParameter("tgyybm"));
java.sql.Date tgkssj=null;
java.sql.Date gjfgsj=null;
ls=request.getParameter("tgkssj");
try{
	if (!(ls.equals("")))  tgkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tgkssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ͣ����ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gjfgsj");
try{
	if (!(ls.equals("")))  gjfgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gjfgsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ƹ�������]����ת����������:"+e);
	return;
}

String djbh=cf.GB2Uni(request.getParameter("djbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql=" select zt";
	ls_sql+=" from  crm_tggl";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();

	if (!zt.equals("6"))//5��ͣ�����룻6��ͣ��������7������ͣ����8��������
	{
		out.println("<BR>����������״̬����ȷ:"+zt);
		return;
	}

	if (tgshjg.equals("Y"))
	{
		String gcjdbm=null;
		ls_sql=" select gcjdbm";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";//
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		}
		rs.close();
		ps.close();

		if (gcjdbm.equals("1"))
		{
			out.println("<BR>���������󣬿ͻ�δ����");
			return;
		}
		if (gcjdbm.equals("4") || gcjdbm.equals("5"))
		{
			out.println("<BR>���������󣬿ͻ����깤");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_tggl set tgshsj=?,tgshr=?,tgshjg=?,tgshsm=?,tgyybm=?,tgkssj=?,gjfgsj=? ";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tgshsj);
	ps.setString(2,tgshr);
	ps.setString(3,tgshjg);
	ps.setString(4,tgshsm);
	ps.setString(5,tgyybm);
	ps.setDate(6,tgkssj);
	ps.setDate(7,gjfgsj);
	ps.executeUpdate();
	ps.close();

	if (tgshjg.equals("Y"))
	{
		ls_sql="update crm_khxx set tgbz='Y',tgkssj=?,gjfgsj=?,tgyybm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,tgkssj);
		ps.setDate(2,gjfgsj);
		ps.setString(3,tgyybm);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_khxx set tgbz='W',tgkssj=null,gjfgsj=null,tgyybm=null";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>