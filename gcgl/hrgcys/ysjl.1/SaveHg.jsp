<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ysjlh=request.getParameter("ysjlh");
String gcysxmbm=request.getParameter("gcysxmbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sjysjg="0";//0���ϸ�1��������

	String clbz=null;
	ls_sql="select clbz";
	ls_sql+=" from  crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!clbz.equals("9"))//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
	{
		out.println("����¼������ɣ��������޸�");
		return;
	}

	ls_sql="update crm_heysjl set sjysjg='0'";//0���ϸ�1�����ϸ�
	ls_sql+=" where ysjlh='"+ysjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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