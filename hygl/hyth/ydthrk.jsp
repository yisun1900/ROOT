<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="sthh" scope="page" class="mybean.sqlbean.SaveToHy_Hyxxb"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ύ������</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<%
  String thjlh =request.getParameter("thjlh");    //����λ���
  String cpbm =request.getParameter("cpbm");  //���û���¼��

Connection conn=null;
PreparedStatement ps=null;
String sql=new String();

try{
    conn=cf.getConnection();
	conn.setAutoCommit(false);

   //�����˻���¼����˱�־Ϊ0����˲�ͨ�����������Ϊyhdlm���������Ϊshrq
	sql="update dm_thjl set shbz='3'";
	sql+="  where  cpbm='"+cpbm+"' and thjlh='"+thjlh+"' and shbz='1'";
	ps=conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();
	
	sql="update cp_cpxx set wlzt='00'";
	sql+="  where  cpbm='"+cpbm+"' and wlzt='13' ";
	ps=conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
	out.println("���̳ɹ���");
}
catch (Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ�ܣ�" + e);
}
finally{
	conn.setAutoCommit(true);  
   try{
     if (ps!=null) ps.close();
     if (conn != null) cf.close(conn);
   }catch (Exception e){
      out.println("���ݿ����ʧ�ܣ�"+e.getMessage());
   }
}
%>
</body>
</html>
