<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML><HEAD>
<TITLE>��ת��ĩ���</TITLE>
<BODY bgColor=#ffffff>

<% //����ǰ�洫�����Ĳ���
String[] jzph=request.getParameterValues("jzph");


//�������ݿ�
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jzph.length ;i++ )
	{
		String dwbh=null;
		ls_sql="select dwbh";
		ls_sql+=" from cl_ydjz ";
		ls_sql+=" where jzph='"+jzph[i]+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString(1);
		} 
		rs.close();
		ps.close();

		//��ѯ�����ڽ�ת���ڡ����ڿ������
		String sqjzrq=null;
		ls_sql="select max(jzrq)";
		ls_sql+=" from cl_ydjz ";
		ls_sql+=" where dwbh='"+dwbh+"' ";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			sqjzrq=cf.fillNull(rs.getDate(1));
		} 
		rs.close();
		ps.close();

		String sqjzph=dwbh+sqjzrq.substring(0,4)+sqjzrq.substring(5,7);

		if (!sqjzph.equals(jzph[i]))
		{
			conn.rollback();
			out.println("ɾ��ʧ�ܣ�ֻ��ɾ�����½�ת��¼��"+sqjzph);
			return;
		}

		ls_sql="delete from cl_ydjzmx ";
		ls_sql+=" where jzph='"+jzph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cl_ydjz ";
		ls_sql+=" where jzph='"+jzph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
		ls_sql="update cl_rkd set jzph=null";
		ls_sql+=" where jzph='"+jzph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
		ls_sql="update cl_ckd set jzph=null";
		ls_sql+=" where jzph='"+jzph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ����ת�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ��"+e);
	out.print("ls_sql="+ls_sql);
}
finally{
	try{
		conn.setAutoCommit(true);

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




