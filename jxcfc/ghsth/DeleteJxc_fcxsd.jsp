<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xsphs = request.getParameterValues("xsph");
if (xsphs.length>1)
{
	out.println("����ÿ��ֻ��ɾ��һ��");
	return;
}

String xsph=xsphs[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String xsdzt=null;
	String dqbm=null;
	ls_sql=" SELECT xsdzt,dqbm ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	else{
		rs.close();
		ps.close();
		out.print("������������["+xsph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("0"))//0��δ�ύ��2���ύ��3���ѳ��� 
	{
		out.print("������������["+xsph+"]���ύ��������ɾ����");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="delete from jxc_fcxsmx ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
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