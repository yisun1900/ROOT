<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] tsjlhbox=request.getParameterValues("khbhbox");
String[] tsjlh=request.getParameterValues("tsjlh");
String[] hfsjstr=request.getParameterValues("hfsj");

java.sql.Date hfsj=null;
String ls=null;

String hfdjbz=null;
int jdsj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<tsjlh.length ;i++ )
	{
		if (!cf.searchArray(tsjlhbox,tsjlh[i]))
		{
			continue;
		}
		if (hfsjstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>�����������Ϊ["+tsjlh[i]+"]��[�ط�����]Ϊ��");
			return;
		}
		

		try{
			hfsj=java.sql.Date.valueOf(hfsjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�����������Ϊ["+tsjlh[i]+"]��[�ط�����]��ʽ���벻��ȷ:"+hfsjstr[i]);
			return;
		}

		ls_sql="select hfdjbz,NVL(jhjdsj-TRUNC(SYSDATE),1)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
			jdsj=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (jdsj>0)
		{
			if (hfdjbz.equals("Y"))//1�����̻طö��᣻2��Ͷ�߱��޻طö��᣻3��ȫ������
			{
				conn.rollback();
				out.println("<BR>�����������Ϊ["+tsjlh[i]+"]�ļ�¼�ط��Ѷ���");
				return;
			}
		}
/*
*/
		ls_sql="update crm_tsjl set sfxhf='Y',hfsj=?";
		ls_sql+=" where  tsjlh='"+tsjlh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,hfsj);
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