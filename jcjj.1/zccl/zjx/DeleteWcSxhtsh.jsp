<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxbh=request.getParameterValues("zjxbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<zjxbh.length ;i++ )
	{

		String sxhtsfysh="";
		String sfjs="";
		ls_sql =" select sxhtsfysh,sfjs";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
			sfjs=cf.fillNull(rs.getString("sfjs"));
		}
		rs.close();
		ps.close();

		if (!sxhtsfysh.equals("Y"))
		{
			conn.rollback();
			out.println("<BR>������д��ͬδ���:"+zjxbh[i]);
			return;
		}

		if (!sfjs.equals("N") && !sfjs.equals("C"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
		{
			conn.rollback();
			out.println("<BR>�����ѽ��㲻�����޸�:"+zjxbh[i]);
			return;
		}


		ls_sql="update jc_zczjx set sxhtsfysh='N',sxhtshr=null,sxhtshsj=null";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}



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