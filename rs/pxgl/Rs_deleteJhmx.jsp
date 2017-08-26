<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] pxmxbh = request.getParameterValues("pxmxbh");
//String[] pxjhbh = request.getParameterValues("pxjhbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	for(int i=0;i<pxmxbh.length;i++){
		long zpxrs=0;//�ƻ�������
		double zpxfy=0;//�ƻ��ܷ���
		long pxrs=0;//��ϸ����
		double pxfy=0;//��ϸ����
		String pxjhbh=null;
		long zrs=0;
		double zfy=0;

//ȡ��Ҫ��ԭ������
		ls_sql="select pxfy,pxrs,pxjhbh";
		ls_sql+=" from  rs_pxjhmx";
		ls_sql+=" where  pxmxbh='"+pxmxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pxfy=rs.getDouble("pxfy");
			pxrs=rs.getLong("pxrs");
			pxjhbh=rs.getString("pxjhbh");
		}
		else{
			out.println("����������¼������");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="select pxfy,pxrs";
		ls_sql+=" from  rs_pxjh";
		ls_sql+=" where  pxjhbh='"+pxjhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zpxfy=rs.getDouble("pxfy");
			zpxrs=rs.getLong("pxrs");
		}
		else{
			out.println("����������¼������");
			return;
		}
		rs.close();
		ps.close();
		
		zrs=zpxrs-pxrs;
		zfy=zpxfy-pxfy;

//��ԭ��ѵ�ƻ�
		conn.setAutoCommit(false);

		ls_sql="update rs_pxjh set pxfy=?,pxrs=? ";
		ls_sql+=" where pxjhbh='"+pxjhbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,zfy);
		ps.setLong(2,zrs);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from rs_pxjhmx where pxmxbh='"+pxmxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		conn.commit();
	}
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ�����ˢ���б���ʾɾ��������");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
