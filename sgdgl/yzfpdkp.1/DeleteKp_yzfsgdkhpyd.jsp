<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>��ĩ��ת</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 
int count=0;

String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));

//�������ݿ�
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

String ls_sql=null;


try {
	conn=cf.getConnection();




	ls_sql="delete from kp_yzfsgdkhpyd ";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	out.print("���ݿ����ʧ��"+e);
	out.print("<BR>ls_sql="+ls_sql);
}
finally{
	try{
		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("�ر����ӷ�������,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




