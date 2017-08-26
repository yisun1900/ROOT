<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] djjlh = request.getParameterValues("djjlh");
if (djjlh.length>1)
{
	out.println("����ÿ��ֻ��ɾ��һ����¼");
	return;
}

String ygcjdbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldgcjdbm=null;
	String oldsjwjrq=null;
	String khbh=null;
	ls_sql="select gcjdbm,djsj,khbh,ygcjdbm";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where djjlh='"+djjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldgcjdbm=rs.getString("gcjdbm");
		oldsjwjrq=cf.fillNull(rs.getDate("djsj"));
		khbh=rs.getString("khbh");
		ygcjdbm=rs.getString("ygcjdbm");
	}
	else{
		out.println("���󣡲����ڵĵǼǼ�¼�ţ�"+djjlh[0]);
		return;
	}
	rs.close();
	ps.close();
	
	String newgcjdbm=null;
	String newsjwjrq=null;
	ls_sql="select gcjdbm,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newgcjdbm=rs.getString("gcjdbm");
		newsjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
	}
	rs.close();
	ps.close();

	if (!newgcjdbm.equals(oldgcjdbm))
	{
		out.println("����[���̽���]����ȷ������ɾ��");
		return;
	}
	if (!newsjwjrq.equals(oldsjwjrq))
	{
		out.println("����[ʵ�����ʱ��]����ȷ������ɾ��");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from  crm_gcjddjjl ";
	ls_sql+=" where djjlh='"+djjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set sjwjrq=null,gcjdbm=?,kbxbz=null,bybxsm=null,bxkssj=null,bxjzsj=null";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ygcjdbm);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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