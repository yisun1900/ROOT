<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbhbox=request.getParameterValues("khbhbox");
String[] khbh=request.getParameterValues("khbh");
String[] sjjgrqstr=request.getParameterValues("sjjgrq");
String[] xh=request.getParameterValues("xh");

java.sql.Date sjjgrq=null;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jgcjdbm=null;
String jgcjdmc=null;
String tgbz=null;
java.sql.Date jsjjgrq=null;

try {
	conn=cf.getConnection();

	int count=0;
	int ii=0;
	String oldxh="";
	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}
		if (oldxh.equals(xh[i]))
		{
			out.println("<BR>�������������Ϊ��"+xh[i]+"���Ŀͻ����ѡ���˶��");
			ii++;
		}
		else{
			oldxh=xh[i];
		}

	}
	if (ii>0)
	{
		out.println("<BR>����ʧ�ܣ���");
		return;
	}


	conn.setAutoCommit(false);

	int js=0;
	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}

		try{
			sjjgrq=java.sql.Date.valueOf(sjjgrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>���Ϊ["+xh[i]+"]��[ͣ����ʼʱ�� ]��ʽ���벻��ȷ:"+sjjgrqstr[i]);
			return;
		}
		js++;


		ls_sql="SELECT crm_khxx.gcjdbm,gcjdmc,sjjgrq,tgbz";
		ls_sql+=" FROM crm_khxx,dm_gcjdbm ";
		ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			jgcjdmc=cf.fillNull(rs.getString("gcjdmc"));
			tgbz=cf.fillNull(rs.getString("tgbz"));
			jsjjgrq=rs.getDate("sjjgrq");
		}
		else{
			conn.rollback();
			out.println("<BR>�������������Ϊ��"+xh[i]+"�Ŀͻ����["+khbh[i]+"]������");
			return;
		}
		ps.close();
		rs.close();

		if (jgcjdbm.equals("1"))
		{
			conn.rollback();
			out.println("<BR>�������������Ϊ��"+xh[i]+"���Ŀͻ���š�"+khbh[i]+"��δ����");
			return;
		}
		if (jgcjdbm.equals("5"))
		{
			conn.rollback();
			out.println("<BR>�������������Ϊ��"+xh[i]+"���Ŀͻ���š�"+khbh[i]+"�����깤");
			return;
		}
/*
		if (tgbz.equals("Y"))
		{
			conn.rollback();
			out.println("<BR>�������������Ϊ��"+xh[i]+"���Ŀͻ���š�"+khbh[i]+"����ͣ��");
			return;
		}
*/
		ls_sql="update crm_khxx set tgbz='Y',tgkssj=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sjjgrq);
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