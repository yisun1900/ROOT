<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<style>
	A:link,A:visited ,A:active {TEXT-DECORATION: none}
	A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
</style>
<%
String yhbh=(String)session.getAttribute("khbh");//�û����
String lrr=(String)session.getAttribute("yhdlm");//�û���¼ʱ������
String zcbm=request.getParameter("zcbm");
Connection conn = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sqlString = null;

try{
	conn = cf.getConnection();

		sqlString = " delete from HY_KHHDPT where zcbm='"+zcbm+"' and khbh='"+yhbh+"' ";
		ps=conn.prepareStatement(sqlString);  
		ps.executeUpdate();
		ps.close();
//	out.print("<BR>���̳ɹ�");
{%>
		<script language="javascript">
		alert("ɾ���ɹ�����л��ѡ�������ڴ");
//	    return;
        window.open('mycart.jsp');
		window.close()
		</script>
		<%}
}
catch(Exception e){
	out.println("Exception : "+e);
}
finally{
	try{
		conn.setAutoCommit(true);
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) cf.close(conn);
	}
	catch(Exception e){
		out.println("EXCEPTION: "+e);
	}
}
%>